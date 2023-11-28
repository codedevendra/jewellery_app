package com.app.jewellery.services;

import java.io.IOException;
import java.util.Base64;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.app.jewellery.dao.CategoryRepository;
import com.app.jewellery.dao.ProductRepository;
import com.app.jewellery.dao.UserRepository;
import com.app.jewellery.dao.UserRoleRepository;
import com.app.jewellery.entities.CategoryEntity;
import com.app.jewellery.entities.ProductEntity;
import com.app.jewellery.entities.UserEntity;
import com.app.jewellery.entities.UserRoleEntity;

@Service
public class ProductService {
	
	 private final UserRepository userRepository;
	 private final UserRoleRepository userRoleRepository;
	 private final ProductRepository goldProductRepository;
	 private final CategoryRepository categoryRepository;

	    @Autowired
	    public ProductService(UserRepository userRepository,UserRoleRepository userRepository2,ProductRepository goldProductRepository,CategoryRepository categoryRepository1) {
	        this.userRepository = userRepository;
			this.userRoleRepository = userRepository2;
			this.goldProductRepository=goldProductRepository;
			this.categoryRepository=categoryRepository1;
	    }

		public List<ProductEntity> getDataByCategory(long categoryId) {
			return goldProductRepository.findByCategory(categoryId);
		}
	    
	    
	    
	    
}