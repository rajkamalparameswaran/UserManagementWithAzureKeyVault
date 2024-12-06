package com.isteer.controller;

import com.isteer.module.DoctorsOnboarding;
import com.isteer.module.DoctorsOnboardingWithUser;
import com.isteer.module.User;
import com.isteer.service.impl.UserResponse;
import com.isteer.services.DoctorsOnboardingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping(path = "/doctorsOnboarding")
@CrossOrigin
public class DoctorsOnboardingController{

    @Autowired
    DoctorsOnboardingService doctorsOnboardingService;

    @PostMapping("/SaveAppData")
    public ResponseEntity<Map<String, Object>> saveAppData(@RequestBody DoctorsOnboarding  doctorsOnboarding) {
        return new ResponseEntity<>(doctorsOnboardingService.saveAppData(doctorsOnboarding), HttpStatus.OK);
    }

    @PutMapping ("/updateAppData")
    public ResponseEntity<Map<String, Object>> updateAppData(@RequestBody DoctorsOnboarding  doctorsOnboarding) {
        return new ResponseEntity<>(doctorsOnboardingService.updateAppData(doctorsOnboarding), HttpStatus.OK);
    }

    @PutMapping ("/deleteAppData")
    public ResponseEntity<Map<String, Object>> deleteAppData(@RequestBody DoctorsOnboarding  doctorsOnboarding) {
        return new ResponseEntity<>(doctorsOnboardingService.saveAppData(doctorsOnboarding), HttpStatus.OK);
    }

    @GetMapping("/getAppData/{recordId}")
    public DoctorsOnboarding getAppData(@PathVariable String  recordId) {
        return new ResponseEntity<>(doctorsOnboardingService.getAppData(recordId), HttpStatus.OK).getBody();
    }

    @GetMapping("/getAppDataWithUser/{recordId}")
    public DoctorsOnboardingWithUser getAppDataWithUser(@PathVariable String  recordId) throws SQLException {
        return new ResponseEntity<>(doctorsOnboardingService.getAppDataWithUser(recordId), HttpStatus.OK).getBody();
    }

    @GetMapping("/getAppDataWithUser1/{recordId}")
    public DoctorsOnboardingWithUser getAppDataWithUser1(@PathVariable String  recordId) throws SQLException {
        return new ResponseEntity<>(doctorsOnboardingService.getAppDataWithUser1(recordId), HttpStatus.OK).getBody();
    }

    @GetMapping("/getAllAppData")
    public List<DoctorsOnboarding> getAllAppData() {
        return new ResponseEntity<>(doctorsOnboardingService.getAllAppData(), HttpStatus.OK).getBody();
    }
}
