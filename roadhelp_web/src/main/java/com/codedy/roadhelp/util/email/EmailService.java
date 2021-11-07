package com.codedy.roadhelp.util.email;

import java.io.File;
import java.util.List;
import java.util.Map;


public interface EmailService {

    void sendSimpleMessage(String to, String subject, String text);

    void sendSimpleMessageUsingTemplate(String to, String subject, String ...templateModel);

    void sendMessageWithAttachment(String to, String subject, String text, String pathToAttachment);

    void sendMessageUsingThymeleafTemplate(String to, String subject, String templateFile, Map<String, Object> templateModel, List<File> inLineFiles, List<File> attachmentFiles);

}
