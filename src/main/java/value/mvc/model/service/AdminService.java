package value.mvc.model.service;

import java.util.List;

import value.mvc.model.dto.NoticeDTO;
import value.mvc.model.dto.ProcessDTO;
import value.mvc.model.dto.QuestionDTO;

public interface AdminService {
	/**
	 * �������� ��Ȳ�� ���� ��ǰ����(������)
	 * @param processState
	 * @return
	 */
	List<ProcessDTO> selectProductByProcess (String processState);

	/**
	 * �亯 ��/���� ���Ǳ��� �ҷ��´�. (������) 
	 * @param QuestionNo
	 * @param state
	 * @return
	 */
	List<QuestionDTO> selectQuestionByState (String QuestionNo, boolean state);

	/**
	 * �������� ����ϱ�(������)
	 * @param noticeDTO
	 * @return
	 */
	int insertNotice (NoticeDTO noticeDTO);
	
	/**
	 * �������� �����ϱ�(������)
	 * @param noticeNo
	 * @return
	 */
	int deleteNotice (String noticeNo);
}
