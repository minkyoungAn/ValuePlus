package value.mvc.model.service;

import static org.hamcrest.CoreMatchers.instanceOf;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import value.mvc.model.dao.ChatDAO;
import value.mvc.model.dto.ChatDTO;

@Service
public class ChatServiceImpl implements ChatService {

	@Autowired
	private ChatDAO chatDAO;

	@Override
	public int submit(ChatDTO dto) {
		// TODO Auto-generated method stub
		return chatDAO.submit(dto);
	}

	@Override
	public List<ChatDTO> getChatListByRecent(String fromID, String toID, int number) {
		// TODO Auto-generated method stub
		return chatDAO.getChatListByRecent(fromID, toID, number);
	}

	@Override
	public List<ChatDTO> getChatListByID(String fromID, String toID, String chatID) {
		// TODO Auto-generated method stub
		List<ChatDTO> list = chatDAO.getChatListByID(fromID, toID, chatID);
		
		return list;
	}
	
	@Override
	public List<String> getchaterList(String fromId){
		List<String> list = chatDAO.getchaterList(fromId);

		return list;
	}
	
	@Override
	public int getUnread(String toID) {
		
		return chatDAO.getUnread(toID);
	}
	
	@Override
	public int userRead(ChatDTO chatDTO) {
		return chatDAO.userRead(chatDTO);
	}

	
}
