package com.app.jewellery.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.app.jewellery.services.GoldAPIService;

@RestController
@RequestMapping("/gold-api")
public class GoldAPIController {

    private final GoldAPIService goldAPIService;
    
    @Value("${isTesting}")
	  private boolean isTesting;
    
    @Autowired
    public GoldAPIController(GoldAPIService goldAPIService) {
        this.goldAPIService = goldAPIService;
    }

    @GetMapping("/data")
    public String getGoldData() {
    	  if (isTesting) {
    		  System.out.print("calling ISTesting");
              // Return dummy JSON for testing purposes
              return "{\"timestamp\":1701180685,\"metal\":\"XAU\",\"currency\":\"USD\",\"exchange\":\"FOREXCOM\",\"symbol\":\"FOREXCOM:XAUUSD\",\"prev_close_price\":2014.02,\"open_price\":2014.02,\"low_price\":2011.76,\"high_price\":2023.26,\"open_time\":1701129600,\"price\":2022.18,\"ch\":8.16,\"chp\":0.41,\"ask\":2022.53,\"bid\":2021.83,\"price_gram_24k\":65.0146,\"price_gram_22k\":59.5967,\"price_gram_21k\":56.8878,\"price_gram_20k\":54.1788,\"price_gram_18k\":48.7609,\"price_gram_16k\":43.3431,\"price_gram_14k\":37.9252,\"price_gram_10k\":27.0894}";
          } else {
              return goldAPIService.getGoldData();
          }
    	
    }
}
