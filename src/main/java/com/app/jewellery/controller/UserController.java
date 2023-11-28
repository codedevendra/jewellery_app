package com.app.jewellery.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClients;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.app.jewellery.DTO.AdminLoginDTO;
import com.app.jewellery.DTO.AdminVerifyOtpDTO;
import com.app.jewellery.DTO.UserLoginDTO;
import com.app.jewellery.DTO.UserVerifyDTO;
import com.app.jewellery.dao.CategoryRepository;
import com.app.jewellery.dao.UserRepository;
import com.app.jewellery.dao.UserRoleRepository;
import com.app.jewellery.entities.CategoryEntity;
import com.app.jewellery.entities.UserEntity;
import com.app.jewellery.entities.UserRoleEntity;
import com.app.jewellery.util.Authentication;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class UserController {
	
	@Autowired
	UserRepository userRepository;
	
	 @Value("${upload-dir}")
	  private String uploadDir;
	 @Value("${isTesting}")
	  private boolean isTesting;
	 @Autowired
		CategoryRepository categoryRepository;
		
	  @Autowired
	  Authentication authentication;
		
	  @Autowired
		UserRoleRepository userRoleRepository;
		
		
	
	
	 @RequestMapping("/")
		public ModelAndView getUserHomeDefault(HttpSession session,HttpServletRequest request) {
			ModelAndView mv=new ModelAndView("/UserLogin");
			return mv;
		}
	
	@RequestMapping("/user/login")
	public ModelAndView getUserLogin() {
		ModelAndView mv=new ModelAndView("/UserLogin");
		return mv;
	}
	
	@RequestMapping("/user/home")
	public ModelAndView getUserHomePage() {
		ModelAndView mv=new ModelAndView("/UserHome");
		 List<CategoryEntity> categories = categoryRepository.findAll();
		 mv.addObject("category",categories);
		 
		return mv;
	}
	
	
	@RequestMapping("/user/verifyOtp")
	public ModelAndView verifyOtp() {
		ModelAndView mv=new ModelAndView("/UserVerifyOtp");
		return mv;
	}
	
	
	@RequestMapping("/user/welcomeuserForm")
	public ModelAndView UserWelcomeForm() {
		ModelAndView mv=new ModelAndView("/WelcomeUserForm");
		return mv;
	}
	
	
	@RequestMapping("/user/verify/otp")
	public String verifyUserOtp(@ModelAttribute("verifyOTP") UserVerifyDTO data,HttpSession session) {
		if(isTesting) {
			try {
			return verifyUserOtpDummy(data, session);
			}
			catch (IOException e) {
				Map<String,Object> response=new HashMap<String, Object>();
				response.put("message", "User Not Found !");
				return "redirect:/auth-error?errorMessage=Invalid OTP !";
			}
		}
		
		if(session.getAttribute("otp")!=null&&session.getAttribute("otp").equals(String.valueOf(data.getOtp()))) {
			String token=authentication.generateToken(String.valueOf(session.getAttribute("user")));
			session.setAttribute("token", token);
			System.out.print("MOBILE called");
			return "redirect:/user/home";
		}else {
			return "redirect:/user/verifyOtp?message=Invalid otp !";
		}
	
	}
	
	

	public String  verifyUserOtpDummy(UserVerifyDTO data,HttpSession session) throws JsonProcessingException {
		if(String.valueOf(data.getOtp()).equals("1234")) {
			String token=authentication.generateToken(String.valueOf(session.getAttribute("user")));
			session.setAttribute("token", token);
			String mobile=(String) session.getAttribute("mobile");
			
			/*
			 * UserEntity user= userRepository.findByMobile(mobile);
			 * 
			 * if(user!=null) { return "redirect:/user/welcomeuserForm"; }
			 */
			
			System.out.println("mobile45654"+mobile);
			
			
			return "redirect:/user/home";
		}else {
			Map<String,Object> response=new HashMap<String, Object>();
			response.put("error","Invalid otp!");
			return "redirect:/user/verifyOtp?message=Invalid otp !";
		}
	
	}
	
	@PostMapping("/user/sendOTP")
	public String sendOTP(@ModelAttribute("login") UserLoginDTO  data,HttpSession session){
		if(isTesting) {
			System.out.println("sent dommy otp and redirect");
			System.out.print("mobile number"+data.getMobile());
			return sendDommyOTP(data, session);
		}
		
		Map<String, Object>response=new HashMap<String, Object>();
		UserEntity user= userRepository.findByMobile(String.valueOf(data.getMobile()));
		 ObjectMapper objectMapper=new ObjectMapper();
		if(user!=null) {
			UserRoleEntity userRole= userRoleRepository.findByUserId(user.getUserId());
			if(userRole!=null&&userRole.getRoleName().equals("USER")) {
				String F2SUrl = "https://www.fast2sms.com/dev/bulkV2";
				HttpClient httpClient = HttpClients.createDefault();
				
				HttpPost request=new HttpPost(F2SUrl);
				
				request.addHeader("authorization","e5GOnctWzR9ZUHphmgslv8AK2IYMduN0BFbXS3Ly4kT1QEfraPumRb2BsFTzYWOwZ1IUJqdKixMp8H3G");
				Map<String, Object> requestBody = new HashMap<>();
				requestBody.put("numbers",user.getMobile());
				requestBody.put("route", "q");
				String otp=authentication.generateOTP();
				
				requestBody.put("message", "Your OTP for Jewellery APP is : "+otp);
				try {
					Map<String,Object>userData=new HashMap<String, Object>();
					userData.put("user", user);
					userData.put("userRole", userRole);
					session.setAttribute("otp", otp);
					session.setAttribute("user", objectMapper.writeValueAsString(userData));
					String jsonRequestBody = objectMapper.writeValueAsString(requestBody);
					StringEntity stringEntity = new StringEntity(jsonRequestBody);
					stringEntity.setContentType("application/json");
			        request.setEntity(stringEntity);
				HttpResponse resp = httpClient.execute(request);
		        // Read the response
		        BufferedReader reader = new BufferedReader(
		                new InputStreamReader(resp.getEntity().getContent())
		        );
		        StringBuilder result = new StringBuilder();
		        String line;
		        while ((line = reader.readLine()) != null) {
		            result.append(line);
		        }
		       
		        // Parse JSON into Map<String, Object>
		        
					Map<String,Object> respData= objectMapper.readValue(result.toString(), Map.class);
					
					if((Boolean) respData.get("return"))
					{
						response.put("message", "otp sent successfully !");
						return "redirect:/user/verifyOtp";
					}else {
						response.put("message", "User Not Found !");
						return "redirect:/user/login?error=User Not Found !";
					}
					
				} catch (IOException e) {
					response.put("message", "User Not Found !");
					return "redirect:/user/login?error=User Not Found !";
				}
				
		       
			}else {
				response.put("message", "User Not Found !");
				return "redirect:/user/login?error=User Not Found !";
			}
			
		}else {
			response.put("message", "User Not Found !");
			return "redirect:/user/login?error=User Not Found !";
		}
	}
	

	public String sendDommyOTP(UserLoginDTO data, HttpSession session) {
		Map<String, Object>response=new HashMap<String, Object>();
		System.out.print("mobile123"+String.valueOf(data.getMobile()));
		UserEntity user= userRepository.findByMobile(String.valueOf(data.getMobile()));
		 ObjectMapper objectMapper=new ObjectMapper();
		if(user!=null) {
			UserRoleEntity userRole= userRoleRepository.findByUserId(user.getUserId());
			if(userRole!=null&&userRole.getRoleName().equals("USER")) {
				String otp="1234";		
				try {
					Map<String,Object>userData=new HashMap<String, Object>();
					userData.put("user", user);
					userData.put("userRole", userRole);
					session.setAttribute("otp", otp);
					session.setAttribute("mobile", data.getMobile());
					session.setAttribute("user", objectMapper.writeValueAsString(userData));

						response.put("message", "otp sent successfully !");
						return "redirect:/user/verifyOtp";

					
				} catch (IOException e) {
					response.put("message", "User Not Found !");
					return "redirect:/user/login?error=User Not Found !";
				}
				
		       
			}else {
				response.put("message", "User Not Found !");
				return "redirect:/user/login?error=User Not Found !";
			}
			
		}else {
			response.put("message", "User Not Found !");
			return "redirect:/user/login?error=User Not Found !";
		}
	}
	
	@RequestMapping("/user/userDetails")
	public ModelAndView getUserDetails() {
		ModelAndView mv=new ModelAndView("/UserDetails");
		return mv;
	}
	
}
