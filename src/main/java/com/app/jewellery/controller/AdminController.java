package com.app.jewellery.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClients;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.nio.file.Files;

import com.app.jewellery.DTO.AdminLoginDTO;
import com.app.jewellery.DTO.AdminVerifyOtpDTO;
import com.app.jewellery.dao.ProductRepository;
import com.app.jewellery.dao.UserRepository;
import com.app.jewellery.dao.UserRoleRepository;
import com.app.jewellery.entities.ProductEntity;
import com.app.jewellery.entities.UserEntity;
import com.app.jewellery.entities.UserRoleEntity;
import com.app.jewellery.services.AdminService;
import com.app.jewellery.util.Authentication;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Value;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;


@Controller
public class AdminController {
	
	@Autowired
	UserRepository userRepository;
	
	@Autowired
	ProductRepository productRepository;
	
	@Autowired
	AdminService adminService;
	
	 @Value("${upload-dir}")
	  private String uploadDir;
	 @Value("${isTesting}")
	  private boolean isTesting;
	
	@Autowired
	UserRoleRepository userRoleRepository;
	
	@Autowired
	Authentication authentication;
	
	 
	
	 
	 @RequestMapping("/admin/home")
		public ModelAndView getAdminHome(HttpSession session,HttpServletRequest request) {
			ModelAndView mv=new ModelAndView("/AdminHome");
			return mv;
		}
	 
	
	@RequestMapping("/admin/login")
	public ModelAndView getAdminLogin() {
		ModelAndView mv=new ModelAndView("/AdminLogin");
		return mv;
	}
	
	  @PostMapping("/admin/add-admin")
	    public ResponseEntity<UserEntity> addAdmin(@RequestBody UserEntity admin) {
		  UserEntity createdAdmin = adminService.addAdmin(admin.getName(), admin.getMobile(), admin.getEmail());
	        return new ResponseEntity<>(createdAdmin, HttpStatus.CREATED);
	       
	    }

	    @PostMapping("/admin/add-role")
	    public ResponseEntity<UserRoleEntity> addRole(@RequestBody UserRoleEntity role) {
	    	UserRoleEntity createdAdmin = adminService.addRole(role.getRoleName(),role.getUserId());
	        return new ResponseEntity<>(createdAdmin, HttpStatus.CREATED);
	       
	    }
	 
	
	
	@RequestMapping("/admin/verifyOtp")
	public ModelAndView verifyOtp() {
		ModelAndView mv=new ModelAndView("/VerifyOTP");
		return mv;
	}
	
	@RequestMapping("/admin/verify/otp")
	public String verifyAdminOtp(@ModelAttribute("verifyOTP") AdminVerifyOtpDTO data,HttpSession session) {
		if(isTesting) {
			try {
			return verifyAdminOtpDummy(data, session);
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
			return "redirect:/admin/home";
		}else {
			return "redirect:/admin/verifyOtp?message=Invalid otp !";
		}
	
	}
	
	@PostMapping("/admin/sendOTP")
	public String sendOTP(@ModelAttribute("login") AdminLoginDTO  data,HttpSession session){
		if(isTesting) {
			System.out.println("sent dommy otp and redirect");
			return sendDommyOTP(data, session);
		}
		
		Map<String, Object>response=new HashMap<String, Object>();
		UserEntity user= userRepository.findByMobile(String.valueOf(data.getMobile()));
		 ObjectMapper objectMapper=new ObjectMapper();
		if(user!=null) {
			UserRoleEntity userRole= userRoleRepository.findByUserId(user.getUserId());
			if(userRole!=null&&userRole.getRoleName().equals("ADMIN")) {
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
						return "redirect:/admin/verifyOtp";
					}else {
						response.put("message", "User Not Found !");
						return "redirect:/admin/login?error=User Not Found !";
					}
					
				} catch (IOException e) {
					response.put("message", "User Not Found !");
					return "redirect:/admin/login?error=User Not Found !";
				}
				
		       
			}else {
				response.put("message", "User Not Found !");
				return "redirect:/admin/login?error=User Not Found !";
			}
			
		}else {
			response.put("message", "User Not Found !");
			return "redirect:/admin/login?error=User Not Found !";
		}
	}
			
		
		
	
		public String  verifyAdminOtpDummy(AdminVerifyOtpDTO data,HttpSession session) throws JsonProcessingException {
			if(String.valueOf(data.getOtp()).equals("1234")) {
				String token=authentication.generateToken(String.valueOf(session.getAttribute("user")));
				session.setAttribute("token", token);
				return "redirect:/admin/home";
			}else {
				Map<String,Object> response=new HashMap<String, Object>();
				response.put("error","Invalid otp!");
				return "redirect:/admin/verifyOtp?message=Invalid otp !";
			}
		
		}
		
//	    @PostMapping("/admin/sendOTP")
//		@ResponseBody
		public String sendDommyOTP(AdminLoginDTO data, HttpSession session) {
			Map<String, Object>response=new HashMap<String, Object>();
			UserEntity user= userRepository.findByMobile(String.valueOf(data.getMobile()));
			 ObjectMapper objectMapper=new ObjectMapper();
			if(user!=null) {
				UserRoleEntity userRole= userRoleRepository.findByUserId(user.getUserId());
				if(userRole!=null&&userRole.getRoleName().equals("ADMIN")) {
//					String F2SUrl = "https://www.fast2sms.com/dev/bulkV2";
//					HttpClient httpClient = HttpClients.createDefault();
//					
//					HttpPost request=new HttpPost(F2SUrl);
//					
//					request.addHeader("authorization","e5GOnctWzR9ZUHphmgslv8AK2IYMduN0BFbXS3Ly4kT1QEfraPumRb2BsFTzYWOwZ1IUJqdKixMp8H3G");
//					Map<String, Object> requestBody = new HashMap<>();
//					requestBody.put("numbers",user.getMobile());
//					requestBody.put("route", "q");
					String otp="1234";
//					
//					requestBody.put("message", "Your OTP for Jewellery APP is : "+otp);
					try {
						Map<String,Object>userData=new HashMap<String, Object>();
						userData.put("user", user);
						userData.put("userRole", userRole);
						session.setAttribute("otp", otp);
						session.setAttribute("user", objectMapper.writeValueAsString(userData));
//						String jsonRequestBody = objectMapper.writeValueAsString(requestBody);
//						StringEntity stringEntity = new StringEntity(jsonRequestBody);
//						stringEntity.setContentType("application/json");
//				        request.setEntity(stringEntity);
//					HttpResponse resp = httpClient.execute(request);
			        // Read the response
//			        BufferedReader reader = new BufferedReader(
//			                new InputStreamReader(resp.getEntity().getContent())
//			        );
//			        StringBuilder result = new StringBuilder();
//			        String line;
//			        while ((line = reader.readLine()) != null) {
//			            result.append(line);
//			        }
			       
			        // Parse JSON into Map<String, Object>
			        
//						Map<String,Object> respData= objectMapper.readValue(result.toString(), Map.class);
//						
//						if((Boolean) respData.get("return"))
//						{
							response.put("message", "otp sent successfully !");
							return "redirect:/admin/verifyOtp";
//						}else {
//							response.put("message", "User Not Found !");
//							return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(response);
//						}
						
					} catch (IOException e) {
						response.put("message", "User Not Found !");
						return "redirect:/admin/login?error=User Not Found !";
					}
					
			       
				}else {
					response.put("message", "User Not Found !");
					return "redirect:/admin/login?error=User Not Found !";
				}
				
			}else {
				response.put("message", "User Not Found !");
				return "redirect:/admin/login?error=User Not Found !";
			}
		}
		
		/*
		 * @GetMapping("/logout") public String logout(HttpSession session) { if
		 * (session != null) { // Retrieve the token attribute from the session
		 * 
		 * String token = (String) session.getAttribute("token");
		 * System.out.println("token"+token); }
		 * 
		 * 
		 * session.removeAttribute("token");
		 * 
		 * return "redirect:/admin/home"; // Redirect to a different page after logout }
		 */
		 
		 
		 @PostMapping("/admin/logout")
		    public String logout(HttpServletRequest request) {
		        HttpSession session = request.getSession(false); // Get the session, 'false' means don't create if it doesn't exist

		        if (session != null) {
		        	session.removeAttribute("token");
		            session.invalidate(); // Invalidate the session (remove all attributes and end the session)
		            return "redirect:/admin/login";
		        }

		        return "redirect:/admin/login";
		    }
}
