package value.mvc.model.service;

import java.util.List;

import value.mvc.model.dto.NoticeDTO;
import value.mvc.model.dto.ProcessDTO;
import value.mvc.model.dto.QuestionDTO;

public interface AdminService {
	/**
	 * 진행중인 상황에 따른 상품보기(관리자)
	 * @param processState
	 * @return
	 */
	List<ProcessDTO> selectProductByProcess (String processState);

	/**
	 * 답변 유/무로 문의글을 불러온다. (관리자) 
	 * @param QuestionNo
	 * @param state
	 * @return
	 */
	List<QuestionDTO> selectQuestionByState (String QuestionNo, boolean state);

	/**
	 * 공지사항 등록하기(관리자)
	 * @param noticeDTO
	 * @return
	 */
	int insertNotice (NoticeDTO noticeDTO);
	
	/**
	 * 공지사항 삭제하기(관리자)
	 * @param noticeNo
	 * @return
	 */
	int deleteNotice (String noticeNo);
}
