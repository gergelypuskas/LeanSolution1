package com.leansolution.spring.web;

import java.util.Date;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/system")
public class SystemController {

	@RequestMapping(value = "/date", method = RequestMethod.GET)
	public String date() {
		return new Date().toString();
	}
}
