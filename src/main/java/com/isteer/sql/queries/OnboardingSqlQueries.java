package com.isteer.sql.queries;

public class OnboardingSqlQueries{

	private OnboardingSqlQueries() {

	}

	public static final String ADD_USER = "INSERT INTO USER (USERNAME,USERFULLNAME,USEREMAIL,USERPASSWORD) VALUES(?,?,?,?)";

	public static final String SAVE_DATA = "INSERT INTO DoctorsOnboarding (" +
			"recordId, doctorName, mobileNumber, emailId, panNumber, " +
			"salary, tdsPercentage, accountNumber, updatedBy) " +
			"VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

	public static final String UPDATE_DATA = "UPDATE DoctorsOnboarding\n" +
			"SET\n" +
			"    doctorName = ?,\n" +
			"    mobileNumber = ?,\n" +
			"    emailId = ?,\n" +
			"    panNumber = ?,\n" +
			"    salary = ?,\n" +
			"    tdsPercentage = ?,\n" +
			"    accountNumber = ?,\n" +
			"    updatedBy = ?,\n" +
			"    updatedOn = CURRENT_TIMESTAMP\n" +
			"WHERE recordId = ?;\n";

}
