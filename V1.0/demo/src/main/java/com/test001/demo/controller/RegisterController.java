package com.test001.demo.controller;

import com.test001.demo.entity.User;
import com.test001.demo.service.RegisterService;
import com.test001.demo.service.UserService;
import com.test001.demo.util.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class RegisterController {
    @Autowired
    private RegisterService registerService;

    @PostMapping("/register")
    public Result register(@RequestBody User user){
        System.out.println(user);
        return registerService.userRegister(user);
    }
}
