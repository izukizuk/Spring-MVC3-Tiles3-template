package com.company.project.mvc;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/contact")
public class ContactController {

	@RequestMapping
	public String init(Model model) {
		model.addAttribute("para", "para");
		return "contact";
	}

}
