package com.app.jewellery.controller;

import java.io.IOException;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.app.jewellery.dao.CategoryRepository;
import com.app.jewellery.entities.CategoryEntity;
import com.app.jewellery.entities.ProductEntity;
import com.app.jewellery.services.AdminService;
import com.app.jewellery.services.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	AdminService adminService;
	@Autowired
	ProductService productService;
	
	@Autowired
	CategoryRepository categoryRepository;
	
	 @RequestMapping("/admin/add-product")
		public ModelAndView getAddProduct(HttpSession session,HttpServletRequest request) {
			ModelAndView mv=new ModelAndView("/AddProduct");
			return mv;
		}
	 
	 
	 
	 @PostMapping("/admin/products/add")
	 @ResponseBody
	    public String addGoldProduct(@ModelAttribute ProductEntity productEntity) throws IOException {
	        adminService.addGoldProduct(productEntity);
	        System.out.println("Product saved:");

	        return "Product added successfully!";
	    }
	 
	 
	 @PostMapping("/admin/products/edit")
	 @ResponseBody
	    public String editProduct(@ModelAttribute ProductEntity productEntity) throws IOException {
	        adminService.addGoldProduct(productEntity);
	        System.out.println("Product edit");

	        return "Product Edit successfully!";
	    }
	 
	 
	 @DeleteMapping("/admin/delete/{productId}")
	    public ResponseEntity<String> deleteProductById(@PathVariable Long productId) {
	        // Call the service method to delete the product by ID
	        boolean deleted = adminService.deleteProductById(productId);

	        if (deleted) {
	            return ResponseEntity.ok("Product with ID " + productId + " deleted successfully");
	        } else {
	            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Product with ID " + productId + " not found");
	        }

	 }
	 
	 
	 @GetMapping("/admin/gold-products")
	 @ResponseBody
	    public List<ProductEntity> getAllGoldProducts() {
		 System.out.print("URL HIT");
	        return adminService.getAllGoldProducts();
	    }
	 
	 @GetMapping("/admin/product/{productId}")

	    public ModelAndView getProductById(@PathVariable Long productId) {
	        ProductEntity product = adminService.getProductById(productId);
	        
	        System.out.print("productId"+product.getProductId());
	        
	      
	        
	        ModelAndView mv=new ModelAndView("EditProduct");
	       
	        
	        if (product != null) {
	        	 mv.addObject("produuct",product);
		 	        return mv;
	        } else {
	        	  mv=new ModelAndView("Error");
	        	  mv.addObject("errorMessage","Product not found");
	        	  return mv;
	        	  
	        }
	    }
	 
	 
	 @PostMapping("/add/category")
	    public ResponseEntity<String> addCategory(@ModelAttribute CategoryEntity category) {
		 
		 try {
	            CategoryEntity savedCategory = categoryRepository.save(category);
	            return ResponseEntity.ok("Category added successfully with ID: " + savedCategory.getCategoryId());
	        } catch (Exception e) {
	            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
	                    .body("Failed to add category: " + e.getMessage());
	        }
	       
	    }
	 
	 @GetMapping("/all/category")
	 public ResponseEntity<List<CategoryEntity>> getAllCategories() {
	     try {
	         List<CategoryEntity> categories = categoryRepository.findAll();
	         return ResponseEntity.ok(categories);
	     } catch (Exception e) {
	         // Log the exception or return a custom error message
	         return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
	                 .body(Collections.emptyList()); // Return an empty list or handle differently
	     }
	 }

	 @GetMapping("/byCategory/{categoryId}")
	    public ResponseEntity<List<ProductEntity>> getProductsByCategoryId(@PathVariable long categoryId) {
		 try {
	            List<ProductEntity> products = productService.getDataByCategory(categoryId);
	            return ResponseEntity.ok(products);
	        }  catch (Exception e) {
	            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	        }
	    }
	 
	 
	

}
