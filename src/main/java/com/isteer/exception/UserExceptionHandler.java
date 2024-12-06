package com.isteer.exception;

import java.util.ArrayList;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import com.isteer.statuscode.StatusCode;

@ControllerAdvice
public class UserExceptionHandler {

	@ExceptionHandler(value = { UserIdNotFoundException.class })
	public ResponseEntity<UserError> userIdNOtFoundException(UserIdNotFoundException idNotFoundException) {
		UserError userException = new UserError(idNotFoundException.getStatusCode(),
				idNotFoundException.getErrorMsg(), idNotFoundException.getException());
		return new ResponseEntity<>(userException, HttpStatus.NOT_FOUND);
	}

	@ExceptionHandler(value = { SqlQueryException.class })
	public ResponseEntity<UserError> sqlQueryExcepton(SqlQueryException queryException) {
		UserError userException = new UserError(queryException.getStatusCode(), queryException.getErrorMsg(),
				queryException.getReasons());
		return new ResponseEntity<>(userException, HttpStatus.BAD_REQUEST);
	}


	@ExceptionHandler(value = { DataAccessException.class })
	public ResponseEntity<UserError> sqlQueryExcepton(DataAccessException queryException) {
		UserError userException = new UserError(-1,"Something went wrong",
				List.of(queryException.getLocalizedMessage()));
		return new ResponseEntity<>(userException, HttpStatus.INTERNAL_SERVER_ERROR);
	}


	@ExceptionHandler(value = { Exception.class })
	public ResponseEntity<UserError> handleCommonException(Exception exp) {
		List<String> exception = new ArrayList<>();
		exception.add(exp.getMessage());
		UserError userException = new UserError(StatusCode.ACCOUNTCREATEDFAILED.getCode(), "Cannot Do Process", exception);
		return new ResponseEntity<>(userException, HttpStatus.BAD_REQUEST);
	}
}
