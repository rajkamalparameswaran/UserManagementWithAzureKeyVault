package com.isteer.spring.security;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.isteer.dao.UserDao;
import com.isteer.exception.SqlQueryException;
import com.isteer.exception.UserIdNotFoundException;
import com.isteer.message.properties.FailedMessage;
import com.isteer.module.User;
import com.isteer.statuscode.StatusCode;

@Service
public class UsersDetailsServices implements UserDetailsService {
	
	private static final Logger AUDITLOG=LogManager.getLogger("AuditLogs");

	@Autowired
	UserDao dao;
	
	@Autowired
	private FailedMessage property;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User user;
		try {
			user = dao.getUserByUserName(username);
		}catch (SQLException e) {
			throw new SqlQueryException(StatusCode.SQLEXCEPTIONCODE.getCode(), property.getInvalidSqlQuery(), Arrays.asList(e.getLocalizedMessage()));
		}
		if (user == null) {
			List<String> exception = new ArrayList<>();
			exception.add(property.getInvalidName());
			AUDITLOG.info(property.getInvalidName());
			throw new UserIdNotFoundException(StatusCode.USERIDNOTFOUND.getCode(),property.getProcessFailed(), exception);
		}
		return new Principles(user);
	}
}
