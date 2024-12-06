package com.isteer.module;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class DoctorsOnboarding{

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

}
