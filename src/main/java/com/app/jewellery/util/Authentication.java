package com.app.jewellery.util;

import java.util.Date;
import java.util.Random;

import org.springframework.stereotype.Service;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
@Service
public class Authentication {

	
	 private static final String SECRET_KEY = "kjdnfgjngngngkjgkjfgnkjfbnkjnkjfgnkbjgfbkjugfjhdhfjdfgjdjkdfjhjhfdjhjhjhgfhjghjdf";

	
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
		  long EXPIRATION_TIME = 21600000;
	        Date now = new Date();
	        Date expirationDate = new Date(now.getTime() + EXPIRATION_TIME);

	        return Jwts.builder()
	                .setSubject(username)
	                .setIssuedAt(now)
	                .setExpiration(expirationDate)
	                .signWith(SignatureAlgorithm.HS256, SECRET_KEY)
	                .compact();
	    }
	  
	  public String getUserFromToken(String token) {
		  try {
	        Claims claims = Jwts.parser()
	                .setSigningKey(SECRET_KEY)
	                .parseClaimsJws(token)
	                .getBody();

	        return claims.getSubject();}
	        catch (ExpiredJwtException ex) {
	        	ex.printStackTrace();
	            // Token has expired, handle it accordingly
	            return null; // Or throw an exception or return a special value
	        }
	    }
	
}
