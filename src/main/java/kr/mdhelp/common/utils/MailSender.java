package kr.mdhelp.common.utils;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Date;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.mail.internet.MimeMultipart;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.mdhelp.common.model.MailDTO;

public class MailSender {
	private static final Logger logger = LoggerFactory.getLogger(MailSender.class);
	private static Message message = null;
	private static int totalSender=0;
	
	private static boolean serverInfoRoad =false; 
	private static String smtpHost;
	private static String smtpPort;
	private static String smtpAuth;
	private static String smtpSslTrust;
	private static String smtpStarttlsEnable;
	private static String serverLoginID;
	private static String serverLoginPWD;
	
	public boolean serverInfoInit(){
		boolean result = false;
		if(serverInfoRoad) {
			result=true;
		}else {
			Properties properties = new Properties();
			try {
				properties.load(new FileReader("C:\\MDH\\workspace\\MDHelp\\src\\main\\java\\kr\\mdhelp\\config\\mail_info.properties"));
				for (Object object: properties.keySet()) {
					String p_key=StringUtils.trimToEmpty( String.valueOf(object) );
					String p_value=StringUtils.trimToEmpty( String.valueOf(properties.get(object)) );
					logger.debug("=============================properties [{}]:[{}]",p_key,p_value);
					if(StringUtils.equals(p_key, "mailServer.info.smtp.host")) {
						this.smtpHost = p_value;
					}else if(StringUtils.equals(p_key, "mailServer.info.smtp.port")) {
						this.smtpPort = p_value;
					}else if(StringUtils.equals(p_key, "mailServer.info.smtp.auth")) {
						this.smtpAuth = p_value;
					}else if(StringUtils.equals(p_key, "mailServer.info.smtp.ssl.trust")) {
						this.smtpSslTrust = p_value;
					}else if(StringUtils.equals(p_key, "mailServer.info.smtp.starttls.enable")) {
						this.smtpStarttlsEnable = p_value;
					}else if(StringUtils.equals(p_key, "mailServer.info.auth.id")) {
						this.serverLoginID = p_value;
					}else if(StringUtils.equals(p_key, "mailServer.info.auth.password")) {
						this.serverLoginPWD = p_value;
					}else {
						
					}
				}
				result=true;
			} catch (FileNotFoundException e) {
				result = false;
				logger.error(e.getMessage());
			} catch (IOException e) {
				result = false;
				logger.error(e.getMessage());
			}
		}
		return result;
	}
	
	
	/**
	 * @author 배성욱
	 * @createDate 2022. 01. 26.
	 * @described 메일 전송을 위한 메소드 입니다.
	 *  반환 값이 -2 이면 메일서버 접속에러 입니다.
	 *  반환 값이 -1 이면 mailVo의 값이 잘못 설정된 것입니다.
	 *  반환 값이 1 이상이면 메일 전송건수 입니다.
	 * @param mailVo
	 * @return int
	 */
	public int mailSender(MailDTO mailDto) {
		boolean initOk = serverInfoInit();
		int result = -2;
		if(initOk) {
			logger.debug("=============================connectSMTP S");
			//logger.debug("=============================connect get mailHost :[{}]",mailHost);
			boolean connection = connectSMTP();
			logger.debug("=============================connectSMTP E");
			//서버연결이 잘되면 실행되면 메일을 작성함
			if(connection){
				logger.debug("=============================mail writer");
				boolean mailCreate = createMail(mailDto);
				if(mailCreate){
					logger.debug("=============================mail create success");
					//메일을 전송함.
					sendMail();
					result=totalSender;
				}else{
					result=-1;
				}
			}
		}else {
			logger.debug("=============================메일서버 정보를 초기화 하지 못하였음.");
		}
		return result;
	}
	
	private boolean connectSMTP(){
		boolean connectionResult=false;
		Properties prop = new Properties();
		logger.error("========== get propertise 데이터 smtpHost :[{}]",smtpHost);
		logger.error("========== get propertise 데이터 smtpPort :[{}]",smtpPort);
		logger.error("========== get propertise 데이터 smtpAuth :[{}]",smtpAuth);
		logger.error("========== get propertise 데이터 smtpSslTrust :[{}]",smtpSslTrust);
		logger.error("========== get propertise 데이터 smtpStarttlsEnable :[{}]",smtpStarttlsEnable);
		logger.error("========== get propertise 데이터 serverLoginID :[{}]",serverLoginID);
		logger.error("========== get propertise 데이터 serverLoginPWD :[{}]",serverLoginPWD);
		
		
		////사내 메일 망일 경우 smtp host 만 설정해도 됨 (특정 포트가 아닐경우)
		prop.put("mail.smtp.host", smtpHost);
		prop.put("mail.smtp.port", smtpPort);
		prop.put("mail.smtp.auth", smtpAuth);
		prop.put("mail.smtp.ssl.trust", smtpSslTrust);
		prop.put("mail.smtp.starttls.enable",smtpStarttlsEnable);
		//prop.put("mail.smtp.ssl.enable", "true");
		//prop.put("mail.smtp.ssl.enable", "true");
		//prop.put("mail.transport.protocol", "smtp");
		//prop.setProperty("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
		
		//SMTP 서버 계정 인증정보
		MyAuthenticator authenticator = new MyAuthenticator(serverLoginID, serverLoginPWD);
		try{
		logger.error("========== Mail Server getDefaultInstance S");
		Session session = Session.getDefaultInstance(prop, authenticator);
		logger.error("========== Mail Server getDefaultInstance E");
			message = new MimeMessage(session);
			connectionResult=true;
		} catch (Exception e) {
			logger.error("========== Mail Server Connection Failed");
			e.printStackTrace();
		}
		return connectionResult;
	}
	
	private static boolean createMail(MailDTO mailDto){
		MimeBodyPart mbp = new MimeBodyPart();
		boolean createResult=false;
		try{
			//메일 제목 넣기
			message.setSubject(mailDto.getMail_title());
			
			//메일 본문 작성
			//message 객체에 본문을 넣기 위하여 Multipart 객체 생성
			Multipart mp = new MimeMultipart();
			mp.addBodyPart(mbp);
				
				if(StringUtils.equals(mailDto.getMail_content_type(), Constant.MAIL_CONTENT_TYPE_TEXT)){
					//일반텍스트
					mbp.setText(mailDto.getMail_content());
				}else if(StringUtils.equals(mailDto.getMail_content_type(), Constant.MAIL_CONTENT_TYPE_HTML)){
					//html일 경우
					//MimeBodyPart mbp_html = new MimeBodyPart();
					//mbp_html.setDataHandler(new DataHandler(new ByteArrayDataSource(new FileInputStream(new File("[보낼 HTML 경로]")), "text/html")));
					//mp.addBodyPart(mbp_html);
				}else{
					//에러처리
				}
				
				
			//메일 본문을 넣기
			message.setContent(mp);
			
			
			if(StringUtils.equals(mailDto.getMail_attach_name(), Constant.SYNB_NULL)==false &&
					StringUtils.equals(mailDto.getMail_attach_path(), Constant.SYNB_NULL)==false){
				//파일 첨부일 경우
				MimeBodyPart mbp_file = new MimeBodyPart();
				mbp_file.setDataHandler(new DataHandler(new FileDataSource(
						mailDto.getMail_attach_path()+mailDto.getMail_attach_name())
						));
				mbp_file.setFileName(mailDto.getMail_attach_name());
				mp.addBodyPart(mbp_file);
			}
			

			//보내는 날짜
			message.setSentDate(new Date());
			//보내는 메일 주소
			String sendMailAddress = StringUtils.trimToEmpty( mailDto.getMail_sender_email() );
			if(StringUtils.equals(sendMailAddress, "")) {
				sendMailAddress = serverLoginID+"@"+smtpSslTrust;
			}
			message.setFrom(new InternetAddress(mailDto.getMail_sender_email()));
			
			
				//다중건 인지 단일건 인지 확인.
				
				//","포함여부확인.
				int count=StringUtils.countMatches(mailDto.getMail_receiver_email(), Constant.SYNB_COMMA);
				//메일주소가 완전히 공란인지 확인.
				boolean emptyEmailAddress=StringUtils.equals(mailDto.getMail_receiver_email(), Constant.SYNB_NULL);
				
				//다중건 일경우.
				if(count>0 && emptyEmailAddress==false){
					//복수 건 전송일 때는 사용 start 
					InternetAddress[] receive_address = {new InternetAddress(mailDto.getMail_receiver_email())};
					message.setRecipients(RecipientType.TO, receive_address);
					totalSender=count+1;
					//복수 건 전송일 때는 사용 end
				}else if(count==0&&emptyEmailAddress==false){
					//단건 전송일 때는 사용 start
					message.setRecipient(RecipientType.TO, new InternetAddress(mailDto.getMail_receiver_email()));
					totalSender=1;
					//단건 전송일 때는 사용 end
				}else{
					Exception excpt=new Exception("메일주소가 비어 있습니다.");
					throw excpt;
				}
			createResult=true;
		} catch (Exception e){
			e.printStackTrace();
		}
		return createResult;
	}
	
	
	private static boolean sendMail(){
		boolean success=false;
		try {
			Transport.send(message);
			success=true;
		} catch (MessagingException e) {
			success=false;
			e.printStackTrace();
		}
		return success;
	}

}
class MyAuthenticator extends Authenticator {
	private String id;
	private String pw;
	public MyAuthenticator(String id, String pw) {
		this.id = id;
		this.pw = pw;
	}

	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication(id, pw);
	}
}