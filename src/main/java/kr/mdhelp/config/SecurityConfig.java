package kr.mdhelp.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;


@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	private static final Logger logger = LoggerFactory.getLogger(SecurityConfig.class);
	private static final String sCPrefix = "▦▩▦▩▦SecurityConfig▩ - ";

	private AuthenticationProvider authenticationProvider;
//	 BCrypt 비밀번호 암호화
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	
	@Bean
	public AuthenticationProvider authenticationProvider() {
		return new CustomAuthenticationProvide();
	}
	
	
	/*
	http.authenticationProvider는 내부적으로
	AuthenticationManagerBuilder.authenticationProvider를 호출한다.
	AuthenticationManagerBuilder.userDetatilsService().passwordEncoder()를 통해
	패스워드 암호화에 사용될 PasswordEncoder 구현체를 지정한다.
	 */
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		this.authenticationProvider = authenticationProvider();
		auth.authenticationProvider(this.authenticationProvider);
	}
	
	/*
	WebSecurity는 FilterChainProxy를 생성하는 필터
	static 디렉터리의 하위 파일(css,img,js 등) 목록 인증 무시 ( = 항상 통과하도록)
	 */
	@Override
	public void configure(WebSecurity web) throws Exception {
		logger.debug(sCPrefix +"configure WEB");
		web.ignoring().antMatchers("/memberAssets/**","/memberResource/**","/adminAssets/**","/adminResource/**","/favicon.ico");
	}

	/*
	configure(HttpSecurity http) 메소드를 통해 인증 메커니즘과
	HTTP 요청에 대한 웹 기반 보안 구성
	 */
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		logger.debug(sCPrefix +"configure HttpSecurity=============================================");
		/*
		HttpSevletRequest에 따라 접근 제한, 페이지 관련 권한 설정
		.andMatechers메소드 = 특정 경로 지정,
		.permitAll()과 .hasRole() 메소드는 역할(Role)에 따른 접근 설정
		https://wondongho.tistory.com/195?category=672069
		 */
			http.headers().httpStrictTransportSecurity().maxAgeInSeconds(31536000);
			//================ csrf 사용안함 처리.================================
			http.csrf().disable();
			
			
			//================ 세션정책.================================
			http.sessionManagement()
			/**
			 * SessionCreationPolicy.Always : 스프링 시큐리티가 항상 세션 생성.
			 * SessionCreationPolicy.If_Required : 스프링 시큐리티가 필요 시 생성(기본값).
			 * SessionCreationPolicy.Never : 스프링 시큐리티가 생성하지 않지만 이미 존재하면 사용.
			 * SessionCreationPolicy.Stateless : 스프링 시큐리티가 생성하지 않고 존재해도 사용하지 않음.
			 */
			.sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED)
			/**공격자가 사용자의 쿠키값을 변경해도 사용자 인증 성공 시 JSESSIONID값을 변경하기 때문에 공격자가 인증된 JSESSIONID값으로 요청해도 인증되지 않는다.
			 * changeSessionId() : 서블릿 3.1이상에서 사용하는 기본 값.
			 * migrationSession : 서블릿 3.1 이하에서 사용하는 기본 값.
			 * newSession() : 세션ID, JSession모두 새로 생성함.
			 * none : 아무것도 설정하지 않음.
			 */
			.sessionFixation().changeSessionId()
			//세션처리 - 최대허용세션수
			.maximumSessions(1)
			//세션처리 - 동시로그인 차단, false : 기존 세션 만료(defualt)
			.maxSessionsPreventsLogin(false)
			//동시로그인 발생시 처리.
			//.expiredSessionStrategy(null)
			//세션처리 - 세션 만료시 이동할 URL
			.expiredUrl("/member/sign/signin");
			
			
			//================ 권한정책 ================================
			http.authorizeRequests()
				// 한없이 접근 가능 페이지
				.antMatchers("/").permitAll()
				.antMatchers("/test/**").permitAll()
				//.antMatchers("/member/sign/**").permitAll()
				.antMatchers("/member/sign/signout").hasAnyAuthority("USERLEV1,USERLEV2")
				.antMatchers("/member/sign/**").hasAuthority("ANONYMOUS")
				
				// /member로 시작하는 모든 경로는 "ROLE_USER"롤을 가진 사용자만 접근 가능
				//.antMatchers("/member/**").hasAnyAuthority("USERLEV1,USERLEV2")
				.antMatchers("/member/**").hasAuthority("USERLEV1")
				//.antMatchers("/member/info").hasRole("USERLEV1")
				//.antMatchers("/member/main").hasRole("USERLEV1")
				
				// /admin으로 시작하는 모든 경로는 "ROLE_ADMIN"롤을 가진 사용자만 접근 가능
				//.antMatchers("/admin/main").hasAuthority("USERLEV2")
				.antMatchers("/admin/**").hasAuthority("USERLEV2")
				// 모든 요청에 대해, 인증된 사용자만 접근하도록 설정(필터)
				.anyRequest().authenticated();
				//.and()
			
			
			//================ 로그인정책 ================================
			/*
			 로그인 페이지 로그인 폼의 아이디, 패스워드를 각각 username, password로
			 기본 인식 하기 때문에 폼에서 저렇게 설정 해줘야하고
			 바꾸고 싶다면 .usernameParameter("파라미터명")으로 바꿔준다.
			 */
			http.formLogin()
			// 로그인 폼의 input태그 아이디 username(기본값)을 email로 바꿔준다.
			.usernameParameter("email")
			.passwordParameter("pwd")
			// SpringSecurity가 제공해주는 폼을 사용안할 거면 .loginPage()로 URL 지정
			.loginPage("/member/sign/signin")
			// form action의 경로와 일치 시켜줘야 한다.
			.loginProcessingUrl("/member/sign/signInProcess.ajax")
			// 로그인 성공시 이동할 페이지
			//.defaultSuccessUrl("/member/main")
			.successHandler(new CustomAuthenticationSuccessHandler("/main"))
			.failureHandler(new CustomAuthenticationFailureHandler("/"))
			.permitAll();
			//.and()
			
			
			//================ 로그아웃정책 ================================
			// 로그아웃
			http.logout()
			// 로그아웃 컨트롤러 매핑
			.logoutRequestMatcher(new AntPathRequestMatcher("/member/sign/signout"))
			// 로그아웃 성공시 경로
			//.logoutSuccessUrl("/member/main")
			.logoutSuccessUrl("/")
			// 로그아웃 하면 Session 초기화 해주기
			.invalidateHttpSession(true);
			//.and()
			
			
			//================ 예외처리 ================================
			/** 권한 없는 대상이 접속 시도 했을때, 403 예외처리 핸들링 */
			http.exceptionHandling().accessDeniedPage("/member/denied");
	}



	/** SuccessHandler bean register
/**
	@Bean
	public AuthenticationSuccessHandler authenticationSuccessHandler() {
		CustomAuthenticationSuccessHandler successHandler = new CustomAuthenticationSuccessHandler();
		successHandler.setDefaultTargetUrl("/index");
		return successHandler; 
	}
*/
	/** FailureHandler bean register */
/**
	@Bean
	public AuthenticationFailureHandler authenticationFailureHandler() {
		CustomAuthenticationFailureHandler failureHandler = new CustomAuthenticationFailureHandler(); 
		failureHandler.setDefaultFailureUrl("/loginPage?error=error");
		return failureHandler; 
	}
*/
	/** LogoutSuccessHandler bean register */
/**
	@Bean
	public LogoutSuccessHandler logoutSuccessHandler() {
		CustomLogoutSuccessHandler logoutSuccessHandler = new CustomLogoutSuccessHandler();
		logoutSuccessHandler.setDefaultTargetUrl("/loginPage?logout=logout");
		return logoutSuccessHandler;
	}
*/
	/** AccessDeniedHandler bean register */
/**
	@Bean
	public AccessDeniedHandler accessDeniedHandler() {
		CustomAccessDeniedHandler accessDeniedHandler = new CustomAccessDeniedHandler();
		accessDeniedHandler.setErrorPage("/error/403");
		return accessDeniedHandler;
	}
*/
	/** AuthenticationEntryPoint bean register */
/**
	@Bean
	public AuthenticationEntryPoint authenticationEntryPoint() {
		return new CustomAuthenticationEntryPoint("/loginPage?error=e"); 
	}
*/
















}//class END Block
