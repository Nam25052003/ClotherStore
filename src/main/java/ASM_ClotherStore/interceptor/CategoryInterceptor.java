package ASM_ClotherStore.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import ASM_ClotherStore.service.CategoryService;

@Component
public class CategoryInterceptor implements HandlerInterceptor{

	@Autowired
	CategoryService categoryService;
	
	@Override
	public void postHandle(HttpServletRequest req, HttpServletResponse resp, Object handler,
			ModelAndView modelAndView) throws Exception {
		req.setAttribute("category", categoryService.findAll());
	}
}
