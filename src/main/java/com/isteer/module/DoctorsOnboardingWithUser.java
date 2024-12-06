package com.isteer.module;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class DoctorsOnboardingWithUser{

    private String recordId;
    private String doctorName;
    private String mobileNumber;
    private String emailId;
    private String panNumber;
    private String salary;
    private String tdsPercentage;
    private String accountNumber;
    private String updatedBy;
    private String updatedOn;
    private User user;

}
