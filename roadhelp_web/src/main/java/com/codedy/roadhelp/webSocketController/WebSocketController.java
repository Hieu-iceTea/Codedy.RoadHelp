package com.codedy.roadhelp.webSocketController;

import com.codedy.roadhelp.dto.WebSocketDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class WebSocketController {

    //region - Autowired Service -
    @Autowired
    SimpMessagingTemplate simpMessagingTemplate;
    //endregion


    //region - Base -
    @MessageMapping("/{segment1}/{segment2}/{segment3}") // Nhận từ APP. Thêm tiền tố "/app/"
    @SendTo("/topic/{segment1}/{segment2}/{segment3}")
    public WebSocketDto ThreeSegments(@DestinationVariable("segment1") int segment1, WebSocketDto webSocketDto) {
        return webSocketDto;
    }
    //endregion


    //region - Test -
    // TODO: Chỉ phục vụ mục đích test, cần xóa khi xuất bản dự án.
    @PostMapping("/sendTestThreeSegments/{segment1}/{segment2}/{segment3}")
    public ResponseEntity<String> sendMessage(@RequestBody WebSocketDto webSocketDto, @PathVariable String segment1, @PathVariable String segment2, @PathVariable String segment3) {
        String destination = "/topic/" + segment1 + "/" + segment2 + "/" + segment3;
        simpMessagingTemplate.convertAndSend(destination, webSocketDto);
        return new ResponseEntity<>("Success!", HttpStatus.OK);
    }
    //endregion

}
