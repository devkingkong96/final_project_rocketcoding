package com.rocket.seoj.meeting;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
@Slf4j
public class MeetingController {

    @GetMapping("/meeting")
    public String zoom_showForm() {
        return "meeting/meeting"; // JSP 파일 이름 (zoomForm.jsp)
    }

}
