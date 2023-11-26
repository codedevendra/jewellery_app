package com.app.jewellery.configurations;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.app.jewellery.util.Authentication;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

public class SecurityConfiguration implements HandlerInterceptor {

	Authentication auth = new Authentication();

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// Perform pre-processing logic based on user role
		System.out.println("request URI " + request.getRequestURI());
		if (request.getRequestURI().equals("/admin/login") || request.getRequestURI().equals("/admin/sendOTP")
				|| request.getRequestURI().equals("/admin/verifyOtp") || request.getRequestURI().equals("/error")
				|| request.getRequestURI().equals("/")||request.getRequestURI().equals("/admin/verify/otp")) {
			return true;
		} else {
			String userRole = getUserRoleFromSession(request);
			String roleName = extractRoleNameFromJsonString(userRole);
			System.out.println("RoleName  " + roleName);
			if (roleName == null) {
				response.sendRedirect("/auth-error?errorMessage=Unauthorized !");
				return false;
			}

			if (request.getRequestURI().startsWith("/admin/") && !roleName.equals("ADMIN")) {
				response.sendRedirect("/auth-error?errorMessage=Unauthorized !");
				return false;
			}

			if (request.getRequestURI().startsWith("/user/") && roleName.equals("USER")) {
				response.sendRedirect("/auth-error?errorMessage=Unauthorized !");
				return false;
			}

			return true;
		}

	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		
	}

	private String getUserRoleFromSession(HttpServletRequest request) {

		String token = (String) request.getSession().getAttribute("token");
		if (token == null) {
			return null;
		} else {
			String user = auth.getUserFromToken(token);
			System.out.println("userData " + user);
			return user;
		}

	}

	public String extractRoleNameFromJsonString(String jsonString) {
		try {
			ObjectMapper objectMapper = new ObjectMapper();
			JsonNode rootNode = objectMapper.readTree(jsonString);

			JsonNode userRoleNode = rootNode.path("userRole");
			if (userRoleNode.isMissingNode()) {
				// "userRole" node is missing
				return null;
			}

			JsonNode roleNameNode = userRoleNode.path("roleName");
			if (roleNameNode.isMissingNode()) {
				// "roleName" node is missing
				return null;
			}

			String roleName = roleNameNode.asText();

			return roleName;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
