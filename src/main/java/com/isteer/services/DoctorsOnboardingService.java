package com.isteer.services;

import com.isteer.module.DoctorsOnboarding;
import com.isteer.module.DoctorsOnboardingWithUser;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface DoctorsOnboardingService{

    public Map<String, Object> saveAppData(DoctorsOnboarding doctorsOnboarding);

    public Map<String, Object> updateAppData(DoctorsOnboarding doctorsOnboarding);

    DoctorsOnboarding getAppData(String recordId);

    List<DoctorsOnboarding> getAllAppData();

    DoctorsOnboardingWithUser getAppDataWithUser(String recordId) throws SQLException;

    DoctorsOnboardingWithUser getAppDataWithUser1(String recordId);
}
