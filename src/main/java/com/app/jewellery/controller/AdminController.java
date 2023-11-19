package com.app.jewellery.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Date;
import java.util.HashMap;
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
import com.app.jewellery.dao.ProductRepository;
import com.app.jewellery.dao.UserRepository;
import com.app.jewellery.dao.UserRoleRepository;
import com.app.jewellery.entities.ProductEntity;
import com.app.jewellery.entities.UserEntity;
import com.app.jewellery.entities.UserRoleEntity;
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
	
	 @Value("${upload-dir}")
	  private String uploadDir;
	
	@Autowired
	UserRoleRepository userRoleRepository;
	 private static final String SECRET_KEY = "kjdnfgjngngngkjgkjfgnkjfbnkjnkjfgnkbjgfbkjugfjhdhfjdfgjdjkdfjhjhfdjhjhjhgfhjghjdf";
	
	 @RequestMapping("/admin/home")
		public ModelAndView getAdminHome(HttpSession session,HttpServletRequest request) {
			ModelAndView mv=new ModelAndView("/AdminHome");
			return mv;
		}
	 
	 @RequestMapping("/admin/add-product")
		public ModelAndView getAddProduct(HttpSession session,HttpServletRequest request) {
			ModelAndView mv=new ModelAndView("/AddProduct");
			return mv;
		}
	 
	 
	@RequestMapping("/admin/login")
	public ModelAndView getAdminLogin() {
		ModelAndView mv=new ModelAndView("/AdminLogin");
		return mv;
	}
	
	@RequestMapping("/admin/verifyOtp")
	public ModelAndView verifyOtp() {
		ModelAndView mv=new ModelAndView("/VerifyOTP");
		return mv;
	}
	
	@RequestMapping("/admin/verify/otp")
	public ResponseEntity<Map<String,Object>>  verifyAdminOtp(@RequestBody Map<String,Object> data,HttpSession session) {
		if(session.getAttribute("otp")!=null&&session.getAttribute("otp").equals(data.get("otp"))) {
			String token=generateToken(String.valueOf(session.getAttribute("user")));
			Map<String,Object> response=new HashMap<String, Object>();
			response.put("token", token);
			return ResponseEntity.ok(response);
		}else {
			Map<String,Object> response=new HashMap<String, Object>();
			response.put("error","Invalid otp!");
			return ResponseEntity.status(401).body(response);
		}
	
	}
	
	@PostMapping("/admin/sendOTP")
	@ResponseBody
	public ResponseEntity<Map<String,Object>> sendOTP(@RequestBody Map<String,Object>  data,HttpSession session){
		Map<String, Object>response=new HashMap<String, Object>();
		UserEntity user= userRepository.findByMobile(String.valueOf(data.get("mobile")));
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
				String otp=generateOTP();
				
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
						return ResponseEntity.ok(response);
					}else {
						response.put("message", "User Not Found !");
						return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(response);
					}
					
				} catch (IOException e) {
					response.put("message", "User Not Found !");
					return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(response);
				}
				
		       
			}else {
				response.put("message", "User Not Found !");
				return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(response);
			}
			
		}else {
			response.put("message", "User Not Found !");
			return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(response);
		}
	}
	
	public  String generateOTP() {
        // Specify the length of the OTP
        int otpLength = 4;

        // Define the range of characters allowed in the OTP
        String allowedCharacters = "0123456789";

        // Create a StringBuilder to store the OTP
        StringBuilder otp = new StringBuilder(otpLength);

        // Create an instance of Random
        Random random = new Random();

        // Generate the OTP by randomly selecting characters from the allowed set
        for (int i = 0; i < otpLength; i++) {
            int index = random.nextInt(allowedCharacters.length());
            char digit = allowedCharacters.charAt(index);
            otp.append(digit);
        }

        return otp.toString();
    }
	
	  public String generateToken(String username) {
		  long EXPIRATION_TIME = 864_000_000;
	        Date now = new Date();
	        Date expirationDate = new Date(now.getTime() + EXPIRATION_TIME);

	        return Jwts.builder()
	                .setSubject(username)
	                .setIssuedAt(now)
	                .setExpiration(expirationDate)
	                .signWith(SignatureAlgorithm.HS256, SECRET_KEY)
	                .compact();
	    }
	  
	  
	  @PostMapping(value="/admin/add/product",consumes = "multipart/form-data")
	    public ResponseEntity<Map<String,Object>> addProduct(@RequestPart("file") MultipartFile file,
	            @RequestPart("product") ProductEntity product) {
	      
		  Map<String,Object> response=new HashMap<String, Object>();
		  
		  try {
	            // Save product details
	        	ProductEntity savedProduct = productRepository.save(product);

	            // Save image
	            String fileName = file.getOriginalFilename();
	            Path filePath = Path.of(uploadDir, fileName);
	            Files.copy(file.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);

	            // Update the product entity with the image filename
	            

	            // Build the image URL
	            String imageUrl = ServletUriComponentsBuilder.fromCurrentContextPath()
	                    .path("/static/images/")
	                    .path(fileName)
	                    .toUriString();
	            savedProduct.setImagePath(imageUrl);
	            productRepository.save(savedProduct);

	            response.put("Message", "Product Added successfully !" );
	            return ResponseEntity.ok(response);
	        } catch (IOException e) {
	            e.printStackTrace();
	            response.put("Error", "Something went wrong !" );
	            return ResponseEntity.status(500).body(response);
	        }
	    }
}
