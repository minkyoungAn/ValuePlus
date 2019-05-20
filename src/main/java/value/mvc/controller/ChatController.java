package value.mvc.controller;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import value.mvc.model.dto.ChatDTO;
import value.mvc.model.dto.CustomerDTO;
import value.mvc.model.service.ChatService;

@Controller
public class ChatController {
	
	String userId;
	
	@Autowired
	private ChatService chatService;

	@RequestMapping("/chat")
	@ResponseBody
	public List<String> startChat(HttpServletRequest request) {
		try {
			CustomerDTO user = (CustomerDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			userId = user.getId();
		} catch (ClassCastException e) {
			// 만약 로그인을 하지않으면 user가 없다는 String을 반환하기 때문에
			// dto로 형변환을 하지못하여 ClassCastException이 발생
			// id를 ""로 초기화
			userId = "";
		}

		//String userId = "test2";
		List<String> userList = chatService.getchaterList(userId);
		int size = userList.size();
		
		return userList;
	}

	@RequestMapping("/chatInsert")
	@ResponseBody
	public void chat(String fromID, String toID, String chatContent, HttpServletResponse response) throws IOException {
		if (fromID == null || fromID.equals("") || toID == null || toID.equals("") || chatContent == null
				|| chatContent.equals("")) {
			response.getWriter().write("0");
		} else {
			fromID = URLDecoder.decode(fromID, "UTF-8");
			toID = URLDecoder.decode(toID, "UTF-8");
			chatContent = URLDecoder.decode(chatContent, "UTF-8");
			response.getWriter().write(chatService.submit(new ChatDTO(fromID, toID, chatContent)));
		}
	}

	@RequestMapping("/chatList")
	@ResponseBody
	public List<ChatDTO> chatList(String fromID, String toID, String listType, HttpServletResponse response)
			throws IOException {
		if (fromID == null || fromID.equals("") || toID == null || toID.equals("") || listType == null
				|| listType.equals("")) {
			response.getWriter().write("");
		} else if (listType.equals("ten")) {

			return getTen(URLDecoder.decode(fromID, "UTF-8"), URLDecoder.decode(toID, "UTF-8"));

		} else {
			try {
				List<ChatDTO> list = getID(URLDecoder.decode(fromID, "UTF-8"), URLDecoder.decode(toID, "UTF-8"),
						listType);
				return list;
			} catch (Exception e) {
				response.getWriter().write("");
			}
		}
		return null;
	}

	public List<ChatDTO> getTen(String fromID, String toID) {
		List<ChatDTO> list = chatService.getChatListByRecent(fromID, toID, 10);
		if (list.size() == 0)
			return null;

		return list;
	}

	@Transactional
	public List<ChatDTO> getID(String fromID, String toID, String chatID) {
		List<ChatDTO> list = chatService.getChatListByID(fromID, toID, chatID);
		ChatDTO chatDTO = new ChatDTO();
		if (list.size() == 0)
			return null;
		chatDTO.setFromID(fromID);
		chatDTO.setToID(toID);
		chatService.userRead(chatDTO);
		return list;
	}
	
	/*@RequestMapping("getUnread")
	//@ResponseBody
	public List<Integer> getUnread(String toID) {
		System.out.println("=heejung===========ttt==========");
		int i =chatService.getUnread(toID);
		List<Integer> list = new ArrayList<>();
		list.add(i);
		return list;
	}*/
	
	@RequestMapping("getUnread")
	@ResponseBody
	public int getUnread(String toID) {
		System.out.println("=hee222jung===========ttt==========");
		int i =chatService.getUnread(toID);
		
		return i;
	}
}
