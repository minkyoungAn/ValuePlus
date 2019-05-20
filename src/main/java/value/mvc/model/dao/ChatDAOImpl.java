package value.mvc.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.sql.DataSource;

import org.apache.commons.collections.map.HashedMap;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import value.mvc.model.dto.ChatDTO;

@Repository
public class ChatDAOImpl implements ChatDAO {

	@Resource
	private SqlSession session;

	DataSource dataSource;

	public List<ChatDTO> getChatListByID(String fromID, String toID, String chatID) {
		List<ChatDTO> list = new ArrayList<ChatDTO>();

		Map<String, Object> map = new HashMap<>();
		map.put("fromID", fromID);
		map.put("toID", toID);
		map.put("chatID", 0);

		//System.out.println("is running");
		list = session.selectList("ChatMapper.getChatListByID", map);
		
		/*if (list.size() != 0) {
			//System.out.println("size is " + list.size());
			System.out.println("SELECT * FROM CHAT WHERE ((fromID = '" + fromID + "' and toID ='" + toID
					+ "') OR (fromID = '" + toID + "' and toID = '" + fromID + "')) and "
					+ "chatID >	(select max(chatID) - " + chatID + " from chat)	ORDER BY chatTime");
		}*/
		return list;
	}

	public List<ChatDTO> getChatListByRecent(String fromID, String toID, int number) {

		List<ChatDTO> list = new ArrayList<ChatDTO>();
		list = session.selectList("ChatMapper.getChatListByRecent", new ChatDTO(fromID, toID, number));

		return list;

	}

	public int submit(ChatDTO dto) {
		return session.insert("ChatMapper.chatsubmit", dto);
	}

	@Override
	public List<String> getchaterList(String fromId) {
		return session.selectList("ChatMapper.getchaterList", fromId);
	}
	
	@Override
	public int getUnread(String toID) {
		System.out.println("toID = " + toID);
		int i = session.selectOne("ChatMapper.getUnread", toID);
		System.out.println("result : " + i );
		return i;
	}
	
	@Override
	public int userRead(ChatDTO chatDTO) {
		System.out.println("update chat set chatread=1 WHERE ((fromID = " + chatDTO.getFromID() + 
				" and toID = " + chatDTO.getToID()+ ") OR (fromID = " + chatDTO.getToID()+ 
				" and toID = " + chatDTO.getFromID());
		return session.update("ChatMapper.userRead",chatDTO);
	}
}
