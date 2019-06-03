package com.cafe24.springex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HelloController {
	
	@RequestMapping("/hello")
	public String hello() {
		System.out.println("ff");
		return "/WEB-INF/views/hello.jsp";
	}
	
	@RequestMapping("/hello2")
	public ModelAndView hello2() {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("email","salem@pokemon.com"); // model 안에 hashmap으로 저장된다?
		mav.setViewName("/WEB-INF/views/hello.jsp");
		
		return mav;
	}
	
	@RequestMapping("/hello3")
	public String hello3(Model model) {
		
		model.addAttribute("email", "chuchu@pokemon.com");
		
		return "/WEB-INF/views/hello.jsp";
	}
	
	@RequestMapping("/hello4")
	public String hello4(Model model, @RequestParam("email") String email) {
		
		model.addAttribute("email", email);
		
		return "/WEB-INF/views/hello.jsp";
	}
	
	/* 비추비추 
	@RequestMapping("/hello5")
	public String hello5(Model model, HttpServletRequest request) {
		String name = request.getParameter("name");
		System.out.println(name);
		
		return "/WEB-INF/views/hello.jsp";
	}
	*/
	
	
}
