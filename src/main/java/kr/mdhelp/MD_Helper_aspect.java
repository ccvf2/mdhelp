package kr.mdhelp;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;


@Component
@Aspect
public class MD_Helper_aspect {
	private static final Logger logger = LoggerFactory.getLogger(MD_Helper_aspect.class);
	
	@Around("within(ke.co.mdh..*)")
	public Object advice(ProceedingJoinPoint joinPoint) {
		Object obj=null;
		try {
			logger.debug("ASPECT CLASS:[{}]",joinPoint.getTarget().getClass().getName());
			logger.debug("ASPECT METHOD:[{}]",joinPoint.getSignature().getName());
			obj=new Object(); 
			if(obj!=null){
				obj=joinPoint.proceed();
			}
		} catch (Throwable e) {
			//logger.info("Advice Throwable Message");
			e.printStackTrace();
		}
		return obj;
	}
}
