package ASM_ClotherStore.security;

import java.util.Base64;
import java.util.HashMap;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import ASM_ClotherStore.entity.Accounts;
import ASM_ClotherStore.service.AccountService;
import ASM_ClotherStore.service.CookiesService;

@Configuration
@EnableWebSecurity
public class AuthSpringSecurity extends WebSecurityConfigurerAdapter {

	@Autowired
	AccountService accountService;

	@Autowired
	BCryptPasswordEncoder pe;

	@Autowired
	HttpSession session;

	@Autowired
	CookiesService cookiesService;

	@Bean
	public BCryptPasswordEncoder getBCryptPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(username -> {
			try {
				Accounts user = accountService.findById(username);
				String password = pe.encode(user.getPassword());
				String[] roles = user.getAuthorities().stream().map(er -> er.getRoles().getId())
						.collect(Collectors.toList()).toArray(new String[0]);

				Map<String, Object> authentication = new HashMap<>();
				authentication.put("user", user);
				byte[] token = (username + ":" + user.getPassword()).getBytes();
				authentication.put("token", "Basic " + Base64.getEncoder().encodeToString(token));
				session.setAttribute("authentication", authentication);

				cookiesService.add("username", user.getUsername(), 1);

				return User.withUsername(username).password(password).roles(roles).build();
			} catch (NoSuchElementException e) {
				throw new UsernameNotFoundException(username + " not found!");
			}
		});

//		auth.inMemoryAuthentication()
//		.withUser("user1").password(pe.encode("123")).roles("GUEST")
//		.and()
//		.withUser("user2").password(pe.encode("123")).roles("USER", "GUEST")
//		.and()
//		.withUser("user3").password(pe.encode("123")).roles("ADMIN", "USER", "GUEST");
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		// XSS tranh ddos = validate
		http.csrf().disable(); // CSRF cam truy cap bang yeu cau gia lap
		http.cors().disable(); // CORS cam chia se tai nguyen ben trong

		http.authorizeRequests().antMatchers("/order/**").authenticated()
		.antMatchers("/admin/**").hasAnyRole("DIRE", "STAF")
		.antMatchers("/admin/**").hasAnyRole("DIRE")
		.anyRequest().permitAll();

//		http.authorizeRequests()
//			.anyRequest().permitAll(); //amonymos

		http.exceptionHandling().accessDeniedPage("/security/access/denied");

		http.formLogin().loginPage("/security/login/form").loginProcessingUrl("/security/login")
				.defaultSuccessUrl("/security/login/success", false).failureUrl("/security/login/error")

				.usernameParameter("username").passwordParameter("password");

		http.rememberMe().rememberMeParameter("remember-me").tokenValiditySeconds(86400);

		http.logout().logoutUrl("/logout").logoutSuccessUrl("/security/logout/success");
		// OAuth2-security
//		http.oauth2Login().loginPage("/auth/login/form")
//						.defaultSuccessUrl("/auth/oauth2/login/success",true)
//						.failureUrl("/auth/login/error")
//						.authorizationEndpoint()
//						.baseUri("/login/authorize");
	}
}
