package ru.itis.websportreboot.service;

import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.Velocity;
import org.apache.velocity.app.VelocityEngine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;

import java.io.StringWriter;

@Service
public class EmailServiceImpl implements EmailService {

    @Autowired
    private JavaMailSender javaMailSender;

    private VelocityEngine velocityEngine;

    @Value("${spring.mail.username}")
    private String userName;

    @Override
    public void sendEmail(String subject, String text, String email) {
        VelocityContext vc = new VelocityContext();
        vc.put("text", text);
        StringWriter sw = new StringWriter();
        Velocity.mergeTemplate("src/main/resources/templates/email_template.ftlh",
                "UTF-8", vc, sw);
        String sendingText = sw.toString();

        MimeMessagePreparator messagePreparator = mimeMessage -> {
            MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage);
            messageHelper.setFrom(userName);
            messageHelper.setTo(email);
            messageHelper.setSubject(subject);
            messageHelper.setText(sendingText, true);
        };

        javaMailSender.send(messagePreparator);
    }
}
