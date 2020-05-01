package ru.itis.websportreboot.aspects;

import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.reflect.CodeSignature;
import org.springframework.stereotype.Component;

import java.util.Date;

@Component
@Aspect
@Slf4j
public class LoggerAspect {

    @Before(value = "execution(* ru.itis.websportreboot.service.*.*(*))")
    public void logging(JoinPoint joinPoint) {
        CodeSignature signature = (CodeSignature) joinPoint.getSignature();
        String methodName = signature.getName();
        String methodClass = signature.getDeclaringTypeName();
        Date date = new Date();
        StringBuilder args = new StringBuilder();
        for(Object arg : joinPoint.getArgs()) {
            String argClassName = arg.getClass().getSimpleName();
            args.append(argClassName).append(": ").append(joinPoint.getArgs()[0]);
        }
        log.info("\n" + date + ": method {" + methodName + "} from {" + methodClass + "}, args {" + args.toString() + "}");
    }

}
