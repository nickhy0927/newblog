package com.iss.index;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {

	@RequestMapping(value = "/test")
	public String test() {
		
		return "friends/friends-add";
	}
}
