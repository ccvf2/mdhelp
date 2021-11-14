package kr.mdhelp.member.controller;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

@Controller
public class APIController {
	private static final Logger logger = LoggerFactory.getLogger(APIController.class);
	
	@ResponseBody
	@PostMapping(value = "member/getdata_test.ajax")
	public String naverAPIRequest(HttpServletRequest request, HttpServletResponse response
			,@RequestParam(name = "searchWord[]",required = true)List<String> searchWord
			) {
		
		logger.debug("========== searchWord[{}]",searchWord);
		
		//TO-DO : DB에서 해당값을 불러와 아래의 변수에 셋팅한다.
		String clientId = "n5dVvdI7k3nRnPJ_M3Er"; // 애플리케이션 클라이언트 아이디
		String clientSecret = "8qQjOxaoNz"; // 애플리케이션 클라이언트 시크릿

		
		
		
		
		
		StringBuffer aprURL_Buffer = new StringBuffer();
		aprURL_Buffer.append("https://openapi.naver.com/v1/search/shop.json");
		aprURL_Buffer.append("?");
		aprURL_Buffer.append("query");
		aprURL_Buffer.append("=");
		
		String aprURL_UTF8 = "";
		try {
			aprURL_UTF8 = URLEncoder.encode(searchWord.get(0), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException("검색어 인코딩 실패",e);
		}
		aprURL_Buffer.append(aprURL_UTF8);
		
		
		
		
		
		
		
		
		Map<String, String> requestHeaders = new HashMap<>();
		requestHeaders.put("X-Naver-Client-Id", clientId);
		requestHeaders.put("X-Naver-Client-Secret", clientSecret);
		requestHeaders.put("Content-Type", "application/x-www-form-urlencoded");
		requestHeaders.put("charset", "utf-8");
		logger.debug("========== request URL [{}]",aprURL_Buffer.toString());
		
		RestTemplate restreQuest = new RestTemplate();
		ResponseEntity<?> res = restreQuest.getForEntity(aprURL_UTF8, null, requestHeaders);
		
		return null;
	}
	@ResponseBody
	@PostMapping(value = "member/getdata.ajax", produces = "application/json;charset=UTF-8")
	public String naverAPIRequest_OLD(HttpServletRequest request, HttpServletResponse response
			,@RequestParam(name = "searchWord[]",required = true)List<String> searchWord
			) {
		logger.debug("========== searchWord[{}]",searchWord);
		//TO-DO : DB에서 해당값을 불러와 아래의 변수에 셋팅한다.
		String clientId = "n5dVvdI7k3nRnPJ_M3Er"; // 애플리케이션 클라이언트 아이디
		String clientSecret = "8qQjOxaoNz"; // 애플리케이션 클라이언트 시크릿
		StringBuffer aprURL_Buffer = new StringBuffer();
		aprURL_Buffer.append("https://openapi.naver.com/v1/search/shop.json");
		aprURL_Buffer.append("?");
		aprURL_Buffer.append("query");
		aprURL_Buffer.append("=");
		
		String aprURL_UTF8 = "";
		try {
			aprURL_UTF8 = URLEncoder.encode(searchWord.get(0), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException("검색어 인코딩 실패",e);
		}
		aprURL_Buffer.append(aprURL_UTF8);
		//aprURL_Buffer.append(searchWord.get(0));
		aprURL_Buffer.append("&sort=asc&display=1");
		

		
		Map<String, String> requestHeaders = new HashMap<>();
		requestHeaders.put("X-Naver-Client-Id", clientId);
		requestHeaders.put("X-Naver-Client-Secret", clientSecret);
		logger.debug("========== request URL [{}]",aprURL_Buffer.toString());
		
		
		
		
		
		
		
		String responseBody = get(aprURL_Buffer.toString(),requestHeaders);
		logger.debug("========== result_XXXXX3[{}]",responseBody);
		
		return responseBody;
	}
	
	
	
	 private static String get(String apiUrl, Map<String, String> requestHeaders){
			HttpURLConnection con = connect(apiUrl);
			try {
				con.setRequestMethod("GET");
				for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
					logger.debug("========== header.getKey:[{}] / header.getValue:[{}]",header.getKey(), header.getValue());
					con.setRequestProperty(header.getKey(), header.getValue());
				}

				logger.debug("========== responseCode 전");

				logger.debug("========== responseCode : [{}]",con.getResponseCode());
				int responseCode = con.getResponseCode();
				if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
					logger.debug("========== HttpURLConnection.HTTP_OK");
					return readBody(con.getInputStream());
				} else { // 에러 발생
					logger.debug("========== HttpURLConnection.HTTP_FAIL");
					return readBody(con.getErrorStream());
				}
			} catch (IOException e) {
				e.printStackTrace();
				throw new RuntimeException("API 요청과 응답 실패 -GET0", e);
			} finally {
				con.disconnect();
			}
		}
	
	
	/**
	 private static String post(String apiUrl, Map<String, String> requestHeaders, String requestBody) {
		HttpURLConnection con = connect(apiUrl);

		try {
			con.setRequestMethod("POST");
			for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
				con.setRequestProperty(header.getKey(), header.getValue());
			}

			con.setDoOutput(true);
			try (DataOutputStream wr = new DataOutputStream(con.getOutputStream())) {
				wr.write(requestBody.getBytes());
				wr.flush();
			}

			int responseCode = con.getResponseCode();
			if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 응답
				return readBody(con.getInputStream());
			} else {  // 에러 응답
				return readBody(con.getErrorStream());
			}
		} catch (IOException e) {
			throw new RuntimeException("API 요청과 응답 실패-POST", e);
		} finally {
			con.disconnect(); // Connection을 재활용할 필요가 없는 프로세스일 경우
		}
	}
*/
	private static HttpURLConnection connect(String apiUrl) {
		logger.debug("========== connect FUNCTION");
		try {
			URL url = new URL(apiUrl);
			logger.debug("========== openConnection 시도55");

			
			HttpURLConnection conn =  (HttpURLConnection) url.openConnection();
			//HttpsURLConnection conn =  (HttpsURLConnection) url.openConnection();

			logger.debug("========== openConnection 완료55");
			return conn;
		} catch (MalformedURLException e) {
			throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
		} catch (IOException e) {
			throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
		}
	}
	
	private static String readBody(InputStream body) {
		logger.debug("========== readBody FUNCTION");
		InputStreamReader streamReader = new InputStreamReader(body, StandardCharsets.UTF_8);

		try (BufferedReader lineReader = new BufferedReader(streamReader)) {
			StringBuilder responseBody = new StringBuilder();

			String line;
			while ((line = lineReader.readLine()) != null) {
				responseBody.append(line);
			}

			return responseBody.toString();
		} catch (IOException e) {
			throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
		}
	}

	
}
