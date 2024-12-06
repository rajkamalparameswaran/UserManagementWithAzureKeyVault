package com.isteer.service.impl;

import com.isteer.dao.DoctorsOnboardingDao;
import com.isteer.module.DoctorsOnboarding;
import com.isteer.module.DoctorsOnboardingWithUser;
import com.isteer.services.DoctorsOnboardingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@Service
public class DoctorsOnboardingServiceImpl implements DoctorsOnboardingService{

    @Autowired
    DoctorsOnboardingDao doctorsOnboardingDao;

    @Override
    public Map<String, Object> saveAppData(DoctorsOnboarding doctorsOnboarding) {
        return doctorsOnboardingDao.saveAppData(doctorsOnboarding);
    }

    @Override
    public Map<String, Object> updateAppData(DoctorsOnboarding doctorsOnboarding) {
        return doctorsOnboardingDao.updateAppData(doctorsOnboarding);
    }

    @Override
    public DoctorsOnboarding getAppData(String recordId) {
        return doctorsOnboardingDao.getAppData(recordId);
    }

    @Override
    public List<DoctorsOnboarding> getAllAppData() {
        return doctorsOnboardingDao.getAllAppData();
    }

    @Override
    public DoctorsOnboardingWithUser getAppDataWithUser(String recordId) throws SQLException {
          return doctorsOnboardingDao.getAppDataWithUser(recordId);
    }

    @Override
    public DoctorsOnboardingWithUser getAppDataWithUser1(String recordId) {
        return doctorsOnboardingDao.getAppDataWithUser1(recordId);
    }
}
