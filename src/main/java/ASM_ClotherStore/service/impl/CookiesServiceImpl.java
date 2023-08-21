package ASM_ClotherStore.service.impl;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;

import ASM_ClotherStore.service.CookiesService;

@Configuration
public class CookiesServiceImpl implements CookiesService {

	@Autowired
	HttpServletRequest request;
	@Autowired
	HttpServletResponse response;

	@Override
	public String getValue(String name) {
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cke : cookies) {
				if (cke.getName().equalsIgnoreCase(name))
					return cke.getValue();
			}
		}
		return "";
	}

	@Override
	public Cookie add(String name, String value, int hours) {
		Cookie cookie = new Cookie(name, value);
		cookie.setMaxAge(hours * 60 * 60);
		cookie.setPath("/");
		response.addCookie(cookie);
		return cookie;
	}

	@Override
	public Cookie remove(String name) {
		Cookie[] cookies = request.getCookies();

		if (cookies != null) {
			for (Cookie cke : cookies) {
				if (cke.getName().equalsIgnoreCase(name)) {
					cke.setMaxAge(0);
					response.addCookie(cke);
					return cke;
				}

			}
		}
		return null;
	}

}
