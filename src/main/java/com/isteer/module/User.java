package com.isteer.module;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;
import java.util.Objects;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int userId;
	private String userName;
	private String userFullName;
	private String userEmail;
	private String userPassword;
	private List<String> userAddresses;
	private List<String> userRoles;
	private List<String> privileges;
	private boolean isAccountNonExpired;
	private boolean isAccountNonLocked;
	private boolean isCredentialsNonExpired;
	private boolean isEnabled;
	private int invalidAttempt;

//	public User(int userId, String userName, String userFullName, String userEmail, String userPassword,
//			List<String> userAddresses, List<String> userRoles, List<String> privileges, boolean isAccountNonExpired,
//			boolean isAccountNonLocked, boolean isCredentialsNonExpired, boolean isEnabled,int invalidAttempt) {
//		super();
//		this.userId = userId;
//		this.userName = userName;
//		this.userFullName = userFullName;
//		this.userEmail = userEmail;
//		this.userPassword = userPassword;
//		this.userAddresses = userAddresses;
//		this.userRoles = userRoles;
//		this.privileges = privileges;
//		this.isAccountNonExpired = isAccountNonExpired;
//		this.isAccountNonLocked = isAccountNonLocked;
//		this.isCredentialsNonExpired = isCredentialsNonExpired;
//		this.isEnabled = isEnabled;
//		this.invalidAttempt=invalidAttempt;
//	}
//
//	public User() {
//		super();
//	}
//
//	public int getUserId() {
//		return userId;
//	}
//
//	public void setUserId(int userId) {
//		this.userId = userId;
//	}
//
//	public String getUserName() {
//		return userName;
//	}
//
//	public void setUserName(String userName) {
//		this.userName = userName;
//	}
//
//	public String getUserFullName() {
//		return userFullName;
//	}
//
//	public void setUserFullName(String userFullName) {
//		this.userFullName = userFullName;
//	}
//
//	public String getUserEmail() {
//		return userEmail;
//	}
//
//	public void setUserEmail(String userEmail) {
//		this.userEmail = userEmail;
//	}
//
//	public String getUserPassword() {
//		return userPassword;
//	}
//
//	public void setUserPassword(String userPassword) {
//		this.userPassword = userPassword;
//	}
//
//	public List<String> getUserAddresses() {
//		return userAddresses;
//	}
//
//	public void setUserAddresses(List<String> userAddresses) {
//		this.userAddresses = userAddresses;
//	}
//
//	public List<String> getUserRoles() {
//		return userRoles;
//	}
//
//	public void setUserRoles(List<String> userRoles) {
//		this.userRoles = userRoles;
//	}
//
//	public List<String> getPrivileges() {
//		return privileges;
//	}
//
//	public void setPrivileges(List<String> privileges) {
//		this.privileges = privileges;
//	}
//
//	public boolean isAccountNonExpired() {
//		return isAccountNonExpired;
//	}
//
//	public void setAccountNonExpired(boolean isAccountNonExpired) {
//		this.isAccountNonExpired = isAccountNonExpired;
//	}
//
//	public boolean isAccountNonLocked() {
//		return isAccountNonLocked;
//	}
//
//	public void setAccountNonLocked(boolean isAccountNonLocked) {
//		this.isAccountNonLocked = isAccountNonLocked;
//	}
//
//	public boolean isCredentialsNonExpired() {
//		return isCredentialsNonExpired;
//	}
//
//	public void setCredentialsNonExpired(boolean isCredentialsNonExpired) {
//		this.isCredentialsNonExpired = isCredentialsNonExpired;
//	}
//
//	public boolean isEnabled() {
//		return isEnabled;
//	}
//
//	public void setEnabled(boolean isEnabled) {
//		this.isEnabled = isEnabled;
//	}
//
//	@Override
//	public int hashCode() {
//		return Objects.hash(isAccountNonExpired, isAccountNonLocked, isCredentialsNonExpired, isEnabled, privileges,
//				userAddresses, userEmail, userFullName, userId, userName, userPassword, userRoles);
//	}
//
//	public int getInvalidAttempt() {
//		return invalidAttempt;
//	}
//
//	public void setInvalidAttempt(int invalidAttempt) {
//		this.invalidAttempt = invalidAttempt;
//	}
//
//	@Override
//	public boolean equals(Object obj) {
//		if (this == obj)
//			return true;
//		if (obj == null)
//			return false;
//		if (getClass() != obj.getClass())
//			return false;
//		User other = (User) obj;
//		return isAccountNonExpired == other.isAccountNonExpired && isAccountNonLocked == other.isAccountNonLocked
//				&& isCredentialsNonExpired == other.isCredentialsNonExpired && isEnabled == other.isEnabled
//				&& Objects.equals(privileges, other.privileges) && Objects.equals(userAddresses, other.userAddresses)
//				&& Objects.equals(userEmail, other.userEmail) && Objects.equals(userFullName, other.userFullName)
//				&& Objects.equals(userName, other.userName) && Objects.equals(userPassword, other.userPassword)
//				&& Objects.equals(userRoles, other.userRoles);
//	}
}
