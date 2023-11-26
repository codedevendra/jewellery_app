package com.app.jewellery.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class JewelleryErrorController {

	@RequestMapping("/auth-error")
	public ModelAndView error(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView mv=new ModelAndView("/Error");
		return mv;
	}
}
