package com.isteer.jwt.token;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import java.util.function.Function;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

@Service
public class JwtUtil {

	private String secretKey = "secret_key";

	public String generateToken(UserDetails userDetails) throws UnknownHostException {
		Map<String, Object> claims = new HashMap<>();
		claims.put("ip", getIpAddress());
		return createNewToken(claims, userDetails.getUsername());
	}

	public String getIpAddress() throws UnknownHostException {
		InetAddress inetAddress = InetAddress.getLocalHost();
		return inetAddress.getHostAddress();
	}

	public String extractIpAddress(String token) {
		return extractClaims(token, claims -> claims.get("ip", String.class));
	}

	private String createNewToken(Map<String, Object> claims, String subject) {

		return Jwts.builder().setClaims(claims).setSubject(subject).setIssuedAt(new Date(System.currentTimeMillis()))
				.setExpiration(new Date(System.currentTimeMillis() + 1000 * 60 * 60 * 5))
				.setId(UUID.randomUUID().toString()).signWith(SignatureAlgorithm.HS256, secretKey).compact();
	}

	public String extractName(String token) {
		return extractClaims(token, Claims::getSubject);
	}

	public Date extractExpiration(String token) {
		return extractClaims(token, Claims::getExpiration);
	}

	public Date extractIssuedAt(String token) {
		return extractClaims(token, Claims::getIssuedAt);
	}

	public <T> T extractClaims(String token, Function<Claims, T> claimResolver) {
		final Claims claim = extractAllClaims(token);
		return claimResolver.apply(claim);
	}

	private Claims extractAllClaims(String token) {
		return Jwts.parser().setSigningKey(secretKey).parseClaimsJws(token).getBody();
	}

	public boolean tokenExpired(String token) {
		return extractExpiration(token).before(new Date());
	}

	public boolean validToken(String token, UserDetails userDetails,String ipAddress) {
		final String userName = extractName(token);
		final String ip=extractIpAddress(token);
		return userName.equals(userDetails.getUsername()) && ip.equals(ipAddress)&& !tokenExpired(token);
	}

}
