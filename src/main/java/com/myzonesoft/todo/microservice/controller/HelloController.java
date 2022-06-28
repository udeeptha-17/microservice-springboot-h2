package com.myzonesoft.todo.microservice.controller;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@CrossOrigin(origins = { "http://localhost:3000", "http://localhost:4200" })
@RequestMapping("/hello")
@RestController
public class HelloController {

    @GetMapping
    public String getAllTasks() {
        return "Hello World AND Galaxy!!!";
    }

}
