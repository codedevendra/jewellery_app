package com.app.jewellery.controller;

import java.io.IOException;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.app.jewellery.entities.ProductEntity;
import com.app.jewellery.services.AdminService;

@Controller
public class ProductController {
	
	@Autowired
	AdminService adminService;
	
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

}
