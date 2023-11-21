package com.app.jewellery.services;

import java.io.IOException;
import java.util.Base64;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.app.jewellery.dao.ProductRepository;
import com.app.jewellery.dao.UserRepository;
import com.app.jewellery.dao.UserRoleRepository;
import com.app.jewellery.entities.ProductEntity;
import com.app.jewellery.entities.UserEntity;
import com.app.jewellery.entities.UserRoleEntity;

@Service
public class AdminService {
	
	 private final UserRepository userRepository;
	 private final UserRoleRepository userRoleRepository;
	 private final ProductRepository goldProductRepository;

	    @Autowired
	    public AdminService(UserRepository userRepository,UserRoleRepository userRepository2,ProductRepository goldProductRepository) {
	        this.userRepository = userRepository;
			this.userRoleRepository = userRepository2;
			this.goldProductRepository=goldProductRepository;
	    }

	public UserEntity addAdmin(String name, String mobile, String email) {
		 UserEntity newAdmin = new UserEntity();
	        newAdmin.setName(name);
	        newAdmin.setMobile(mobile);
	        newAdmin.setEmail(email);

	        // Save the new admin user to your database using UserRepository
	        return userRepository.save(newAdmin);
	}

	public UserRoleEntity addRole(String roleName, Long userId) {
		UserRoleEntity userRoleEntity=new UserRoleEntity();
		userRoleEntity.setRoleName(roleName);
		userRoleEntity.setUserId(userId);
		
		return userRoleRepository.save(userRoleEntity);
		
		
	}
	
	
	  

	    public ProductEntity addGoldProduct(ProductEntity goldProduct) throws IOException {
	        goldProduct.setCreatedAt(LocalDateTime.now());
	        goldProduct.setUpdatedAt(LocalDateTime.now());
	       // goldProduct.setImage(imageFile.getBytes().toString());

	        // Save product details to the database
	        ProductEntity savedProduct = goldProductRepository.save(goldProduct);

	        // Handle image file upload and storage logic here
	        // Example: File storage or database BLOB storage
	        
	        // For illustration, just printing the details
	        //System.out.println("Product saved: " + savedProduct.getProductName());
	        
	        return savedProduct;
	    }

		public List<ProductEntity> getAllGoldProducts() {
			 return goldProductRepository.findAll();
		}

		public ProductEntity getProductById(Long productId) {
			 return goldProductRepository.findById(productId).orElse(null);
		}

		 public boolean deleteProductById(Long productId) {
		      Optional<ProductEntity> optionalProduct = goldProductRepository.findById(productId);
		        if (optionalProduct.isPresent()) {
		        	goldProductRepository.deleteById(productId);
		            return true;
		        }
		        return false;
		    }

}
