package com.codedy.roadhelp.util.email.implement;

import com.codedy.roadhelp.util.email.EmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.thymeleaf.context.Context;
import org.thymeleaf.spring5.SpringTemplateEngine;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.io.File;
import java.util.List;
import java.util.Map;


//https://baeldung.com/spring-email
//https://baeldung.com/spring-email-templates
@Service()
public class EmailServiceImplement_SpringMail implements EmailService {

    //region - Fields -
    private static final String NOREPLY_ADDRESS = "noreply@baeldung.com";
    private static final String templatesPath = "mail/";
    //endregion


    //region - Autowired -
    @Autowired
    private JavaMailSender emailSender; // Cấu hình thêm ở 'application.properties'

    @Autowired
    private SimpleMailMessage template; // Cấu hình Bean ở 'config/EmailConfig'

    @Autowired
    private SpringTemplateEngine thymeleafTemplateEngine;
    //endregion


    //region - Resource -
    /*@Value("classpath:/static/favicon-front.png")
    private Resource resourceFile;*/
    //endregion


    //region - Public Method - @Override -
    @Override
    public void sendSimpleMessage(String to, String subject, String text) {
        try {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setFrom(NOREPLY_ADDRESS);
            message.setTo(to);
            message.setSubject(subject);
            message.setText(text);

            emailSender.send(message);
        } catch (MailException exception) {
            exception.printStackTrace();
        }
    }

    @Override
    public void sendSimpleMessageUsingTemplate(String to, String subject, String... templateModel) {
        String text = String.format(template.getText(), templateModel);
        sendSimpleMessage(to, subject, text);
    }

    @Override
    public void sendMessageWithAttachment(String to, String subject, String text, String pathToAttachment) {
        try {
            MimeMessage message = emailSender.createMimeMessage();
            // pass 'true' to the constructor to create a multipart message
            MimeMessageHelper helper = new MimeMessageHelper(message, true);

            helper.setFrom(NOREPLY_ADDRESS);
            helper.setTo(to);
            helper.setSubject(subject);
            helper.setText(text);

            FileSystemResource file = new FileSystemResource(new File(pathToAttachment));
            String attachmentFilename = file.getFilename();
            helper.addAttachment(attachmentFilename, file); //Invoice

            emailSender.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void sendMessageUsingThymeleafTemplate(String to, String subject, String templateFile,
                                                  Map<String, Object> templateModel,
                                                  List<File> inLineFiles, List<File> attachmentFiles) {

        Context context = new Context();
        context.setVariables(templateModel);

        String htmlBody = thymeleafTemplateEngine.process(templatesPath + templateFile, context);

        sendHtmlMessage(to, subject, htmlBody, inLineFiles, attachmentFiles);
    }
    //endregion


    //region - Private Method -
    private void sendHtmlMessage(String to, String subject, String htmlBody,
                                 List<File> inLineFiles, List<File> attachmentFiles) {

        try {

            MimeMessage message = emailSender.createMimeMessage();

            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

            helper.setFrom(NOREPLY_ADDRESS);
            helper.setTo(to);
            helper.setSubject(subject);
            helper.setText(htmlBody, true);

            //helper.addInline("attachment_resourceFile.png", resourceFile);

            if (inLineFiles != null && !inLineFiles.isEmpty()) {
                for (File file : inLineFiles) {
                    helper.addInline(file.getName(), file);
                }
            }

            if (attachmentFiles != null && !attachmentFiles.isEmpty()) {
                for (File file : attachmentFiles) {
                    helper.addAttachment(file.getName(), file);
                }
            }

            emailSender.send(message);

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
    //endregion

}
