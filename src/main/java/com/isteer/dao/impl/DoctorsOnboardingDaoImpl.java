package com.isteer.dao.impl;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.isteer.dao.DoctorsOnboardingDao;
import com.isteer.dao.UserDao;
import com.isteer.module.DoctorsOnboarding;
import com.isteer.module.DoctorsOnboardingWithUser;
import com.isteer.module.User;
import com.isteer.services.DoctorsOnboardingService;
import com.isteer.sql.queries.OnboardingSqlQueries;
import com.isteer.utils.AkvUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class DoctorsOnboardingDaoImpl implements DoctorsOnboardingDao{

    @Autowired
    AkvUtils akvUtils;

    @Autowired
    JdbcTemplate jdbcTemplate;

    @Autowired
    UserDao userDao;

    private static final Logger AUDITLOG = LogManager.getLogger("AuditLogs");


    String getLogedInUserName() {
        return SecurityContextHolder.getContext().getAuthentication().getName();
    }

    @Override
    public Map<String, Object> saveAppData(DoctorsOnboarding doctorsOnboarding) {

        try {
            KeyHolder keyHolder = new GeneratedKeyHolder();

            jdbcTemplate.update(connection -> {
                PreparedStatement ps = connection.prepareStatement(OnboardingSqlQueries.SAVE_DATA, new String[]{"id"});
                ps.setString(1, doctorsOnboarding.getRecordId());
                ps.setString(2, doctorsOnboarding.getDoctorName());
                ps.setString(3,akvUtils.encryptData( doctorsOnboarding.getMobileNumber()));
                ps.setString(4, akvUtils.encryptData(doctorsOnboarding.getEmailId()));
                ps.setString(5,akvUtils.encryptData( doctorsOnboarding.getPanNumber()));
                ps.setString(6, akvUtils.encryptData(doctorsOnboarding.getSalary()));
                ps.setString(7, akvUtils.encryptData(doctorsOnboarding.getTdsPercentage()));
                ps.setString(8, akvUtils.encryptData(doctorsOnboarding.getAccountNumber()));
                ps.setString(9, getLogedInUserName());
                return ps;
            }, keyHolder);

            // Retrieve the generated id
            Integer id = keyHolder.getKey().intValue();

            if (id > 0) {
                Map<String, Object> map = new HashMap<>();
                map.put("status", "success");
                map.put("statusCode", 1);
                return map;
            } else {
                Map<String, Object> map = new HashMap<>();
                map.put("status", "failure");
                map.put("statusCode", -1);
                return map;
            }
        } catch (DataAccessException e) {
            AUDITLOG.error(e.getLocalizedMessage());
            throw new RuntimeException(e);
        }


    }

    @Override
    public Map<String, Object> updateAppData(DoctorsOnboarding doctorsOnboarding) {

        try {
            int update = jdbcTemplate.update(OnboardingSqlQueries.UPDATE_DATA,
                    doctorsOnboarding.getDoctorName(),
                    akvUtils.encryptData(doctorsOnboarding.getMobileNumber()),
                    akvUtils.encryptData(doctorsOnboarding.getEmailId()),
                    akvUtils.encryptData( doctorsOnboarding.getPanNumber()),
                    akvUtils.encryptData(doctorsOnboarding.getSalary()),
                    akvUtils.encryptData(doctorsOnboarding.getTdsPercentage()),
                    akvUtils.encryptData(doctorsOnboarding.getAccountNumber()),
                    getLogedInUserName(),
                    doctorsOnboarding.getRecordId()
            );

            if (update > 0) {
                Map<String, Object> map = new HashMap<>();
                map.put("status", "success");
                map.put("statusCode", 1);
                return map;
            } else {
                Map<String, Object> map = new HashMap<>();
                map.put("status", "failure");
                map.put("statusCode", -1);
                return map;
            }
        } catch (DataAccessException e) {
            AUDITLOG.error(e.getLocalizedMessage());
            throw new RuntimeException(e);
        }

    }

    public DoctorsOnboarding getAppData(String recordId) {
        try {
            String sql = "SELECT recordId, doctorName, mobileNumber, emailId, panNumber, salary, tdsPercentage, " +
                    "accountNumber,updatedBy,updatedOn " +
                    "FROM DoctorsOnboarding WHERE recordId = ?";

            return jdbcTemplate.queryForObject(sql, new Object[]{recordId}, new RowMapper<DoctorsOnboarding>(){
                @Override
                public DoctorsOnboarding mapRow(ResultSet rs, int rowNum) throws SQLException {
                    DoctorsOnboarding doctor = new DoctorsOnboarding();
                    doctor.setRecordId(rs.getString("recordId"));
                    doctor.setDoctorName(rs.getString("doctorName"));
                    doctor.setMobileNumber(akvUtils.decryptData(rs.getString("mobileNumber")));
                    doctor.setEmailId(akvUtils.decryptData(rs.getString("emailId")));
                    doctor.setPanNumber(akvUtils.decryptData(rs.getString("panNumber")));
                    doctor.setSalary(akvUtils.decryptData(rs.getString("salary")));
                    doctor.setTdsPercentage(akvUtils.decryptData(rs.getString("tdsPercentage")));
                    doctor.setAccountNumber(akvUtils.decryptData(rs.getString("accountNumber")));
                    doctor.setUpdatedBy(rs.getString("updatedBy"));
                    doctor.setUpdatedOn(rs.getString("updatedOn"));
                    return doctor;
                }
            });
        } catch (DataAccessException e) {
            AUDITLOG.error(e.getLocalizedMessage());
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<DoctorsOnboarding> getAllAppData() {
        try {
            String sql = "SELECT recordId, doctorName, mobileNumber, emailId, panNumber, salary, tdsPercentage, " +
                    "accountNumber,updatedBy,updatedOn " +
                    "FROM DoctorsOnboarding ";

            return jdbcTemplate.query(sql, new Object[]{}, new RowMapper<DoctorsOnboarding>(){
                @Override
                public DoctorsOnboarding mapRow(ResultSet rs, int rowNum) throws SQLException {
                    DoctorsOnboarding doctor = new DoctorsOnboarding();
                    doctor.setRecordId(rs.getString("recordId"));
                    doctor.setDoctorName(rs.getString("doctorName"));
                    doctor.setMobileNumber(rs.getString("mobileNumber"));
                    doctor.setEmailId(rs.getString("emailId"));
                    doctor.setPanNumber(rs.getString("panNumber"));
                    doctor.setSalary(rs.getString("salary"));
                    doctor.setTdsPercentage(rs.getString("tdsPercentage"));
                    doctor.setAccountNumber(rs.getString("accountNumber"));
                    doctor.setUpdatedBy(rs.getString("updatedBy"));
                    doctor.setUpdatedOn(rs.getString("updatedOn"));
                    return doctor;
                }
            });
        } catch (DataAccessException e) {
            AUDITLOG.error(e.getLocalizedMessage());
            throw new RuntimeException(e);
        }
    }

    @Override
    public DoctorsOnboardingWithUser getAppDataWithUser(String recordId) {
        try {
            DoctorsOnboarding appData = getAppData(recordId);
            User userByUserName = userDao.getUserByUserName(appData.getUpdatedBy());
            DoctorsOnboardingWithUser userWithAppData = new DoctorsOnboardingWithUser();
            userWithAppData.setUser(userByUserName);
            userWithAppData.setDoctorName(appData.getDoctorName());
            userWithAppData.setMobileNumber(appData.getMobileNumber());
            userWithAppData.setEmailId(appData.getEmailId());
            userWithAppData.setPanNumber(appData.getPanNumber());
            userWithAppData.setSalary(appData.getSalary());
            userWithAppData.setTdsPercentage(appData.getTdsPercentage());
            userWithAppData.setAccountNumber(appData.getAccountNumber());
            userWithAppData.setRecordId(appData.getRecordId());
            userWithAppData.setUpdatedBy(appData.getUpdatedBy());
            userWithAppData.setUpdatedOn(appData.getUpdatedOn());
            return userWithAppData;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public DoctorsOnboardingWithUser getAppDataWithUser1(String recordId) {

        String sql="SELECT \n" +
                "    d.recordId,\n" +
                "    d.doctorName,\n" +
                "    d.mobileNumber,\n" +
                "    d.emailId,\n" +
                "    d.panNumber,\n" +
                "    d.salary,\n" +
                "    d.tdsPercentage,\n" +
                "    d.accountNumber,\n" +
                "    d.updatedBy,\n" +
                "    d.updatedOn,\n" +
                "    JSON_OBJECT(\n" +
                "        'userId', u.userId,\n" +
                "        'userName', u.userName,\n" +
                "        'userFullName', u.userFullName,\n" +
                "        'userEmail', u.userEmail,\n" +
                "        'userPassword', u.userPassword,\n" +
                "        'accountNonExpired', u.isAccountNonExpired,\n" +
                "        'accountNonLocked', u.isAccountNonLocked,\n" +
                "        'credentialsNonExpired', u.isCredentialsNonExpired,\n" +
                "        'enabled', u.isEnabled,\n" +
                "        'userAddresses', jsonAddresses.addresses,\n" +
                "        'userRoles', jsonRoles.roles,\n" +
                "        'privileges', jsonPrivileges.privileges\n" +
                "    ) AS userDetails\n" +
                "FROM DoctorsOnboarding d\n" +
                "LEFT JOIN `user` u ON u.userName = d.updatedBy\n" +
                "LEFT JOIN (\n" +
                "    SELECT fk_address_userId, JSON_ARRAYAGG(address) AS addresses\n" +
                "    FROM address\n" +
                "    GROUP BY fk_address_userId\n" +
                ") AS jsonAddresses ON u.userId = jsonAddresses.fk_address_userId\n" +
                "LEFT JOIN (\n" +
                "    SELECT fk_authority_userId, JSON_ARRAYAGG(role) AS roles\n" +
                "    FROM authority\n" +
                "    GROUP BY fk_authority_userId\n" +
                ") AS jsonRoles ON u.userId = jsonRoles.fk_authority_userId\n" +
                "LEFT JOIN (\n" +
                "    SELECT fk_privileges_userId, JSON_ARRAYAGG(privilege) AS privileges\n" +
                "    FROM privileges\n" +
                "    GROUP BY fk_privileges_userId\n" +
                ") AS jsonPrivileges ON u.userId = jsonPrivileges.fk_privileges_userId\n" +
                "WHERE d.recordId = ?;\n";

        try {
            return jdbcTemplate.queryForObject(sql, new Object[]{ recordId}, (rs, rowNum) -> {
               DoctorsOnboardingWithUser doctor = new DoctorsOnboardingWithUser();
               doctor.setRecordId(rs.getString("recordId"));
               doctor.setDoctorName(rs.getString("doctorName"));
               doctor.setMobileNumber(akvUtils.decryptData(rs.getString("mobileNumber")));
               doctor.setEmailId(akvUtils.decryptData(rs.getString("emailId")));
               doctor.setPanNumber(akvUtils.decryptData(rs.getString("panNumber")));
               doctor.setSalary(akvUtils.decryptData(rs.getString("salary")));
               doctor.setTdsPercentage(akvUtils.decryptData(rs.getString("tdsPercentage")));
               doctor.setAccountNumber(akvUtils.decryptData(rs.getString("accountNumber")));
               doctor.setUpdatedBy(rs.getString("updatedBy"));
               doctor.setUpdatedOn(rs.getString("updatedOn"));
                String userDetails = rs.getString("userDetails");

                if (userDetails != null) {
                    ObjectMapper mapper = new ObjectMapper();
                    User user = null;
                    try {
                        user = mapper.readValue(userDetails, User.class);
                    } catch (JsonProcessingException e) {
                        throw new RuntimeException(e);
                    }
                    user.setUserEmail(  akvUtils.decryptData(user.getUserEmail()));
                    doctor.setUser(user);
                }
               return doctor;
           });
        } catch (DataAccessException e) {
            throw new RuntimeException(e);
        }
    }

}
