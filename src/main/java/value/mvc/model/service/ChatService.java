package value.mvc.model.service;

import java.util.List;

import value.mvc.model.dto.ChatDTO;

public interface ChatService {
	int submit(ChatDTO dto);

	List<ChatDTO> getChatListByRecent(String fromID, String toID, int number);

	List<ChatDTO> getChatListByID(String fromID, String toID, String chatID);

	List<String> getchaterList(String fromId);

	int getUnread(String toID);
	
	int userRead(ChatDTO chatDTO);
}
