package com.leansolution.spring.web;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.leansolution.model.Story;

@RestController
public class StoryListController {

    @RequestMapping(value = "/story", method = RequestMethod.GET)
    public List<Story> stoty() {
	List<Story> stories = new ArrayList<Story>();
	stories.add(new Story("We were hiking", false));
	stories.add(new Story("Samanta is having a new boyfriend", false));
	return stories;
    }
}
