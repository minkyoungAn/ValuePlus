package value.mvc.model.dao;

import java.util.List;

import value.mvc.model.dto.ChatDTO;

public interface ChatDAO {
	List<ChatDTO> getChatListByID(String fromID, String toID, String chatID);

	List<ChatDTO> getChatListByRecent(String fromID, String toID, int number);

	int submit(ChatDTO dto);

	List<String> getchaterList(String fromId);

	int getUnread(String toID);
	
	int userRead(ChatDTO chatDTO);
}
