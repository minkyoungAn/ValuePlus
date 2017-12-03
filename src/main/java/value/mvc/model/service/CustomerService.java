package value.mvc.model.service;

import java.util.List;

import value.mvc.model.dto.AccountDTO;
import value.mvc.model.dto.CustomerDTO;
import value.mvc.model.dto.NoticeDTO;
import value.mvc.model.dto.ProductDTO;
import value.mvc.model.dto.QuestionDTO;


public interface CustomerService {

	/**
	 * �����ϱ�
	 * @param customerDTO
	 * @return
	 */
	int joinCustomer (CustomerDTO customerDTO);
	
	/**
	 * ���������� ������ ����
	 * @param id
	 * @return
	 */
	CustomerDTO selectCustomerById (String id);
	
	/**
	 * Ż���ϱ�(Ż��/����Ż��)
	 * @param id
	 * @return
	 */
	int deleteCustomer (String id);
	
	/**
	 * ȸ�����������ϱ�
	 * @param customerDTO
	 * @return
	 */
	int updateCustomer (CustomerDTO customerDTO);
	
	/**
	 * �α���
	 * @param id
	 * @param password
	 * @return
	 */
	String loginCustomer (String id, String password);
	
	/**
	 * �α׾ƿ�
	 * @param id
	 * @return
	 */
	int logoutCustomer (String id);
	
	/**
	 * �����º���
	 * @param accountDTO
	 * @return
	 */
	AccountDTO selectAccount (String id);
	
	/**
	 * �����µ��
	 * @param accountDTO
	 * @return
	 */
	int insertAccount (AccountDTO accountDTO);
	
	/**
	 * �����¼���
	 * @param accountDTO
	 * @return
	 */
	int updateAccount (AccountDTO accountDTO);
	
	/**
	 * �����»���
	 * @param accountDTO
	 * @return
	 */
	int deleteAccount (String id);
	
	
	/**
	 * ���ɸ�� �˻�
	 * @param id
	 * @return
	 */
	ProductDTO selectInterest (String id);
	
	/**
	 * ���ɸ�� �߰�
	 * @param productNo, id
	 * @return
	 */
	int insertInterest (String productNo, String id);
	
	/**
	 * ���ɸ�� ����
	 * @param id
	 * @return
	 */
	int deleteInterest (String productNo, String id);
	
	/**
	 * �Ǹų�������
	 * @param id
	 * @return
	 */
	List<ProductDTO> selectSelling (String id);
	
	/**
	 * ���ų������� (���� ������ ����)
	 * @param id
	 * @return
	 */
	List<ProductDTO> selectBuying (String id);

	/**
	 * �������� �˻�
	 * @return
	 */
	List<NoticeDTO> selectAllNotice ();
	
	/**
	 * �������� �󼼺���
	 * @param id
	 * @return
	 */
	NoticeDTO selectOneNotice (String noticeNo);
	
	
	/**
	 * ��ü���ǳ���
	 * @param id
	 * @return
	 */
	List<QuestionDTO> selectQuestion ();
	
	/**
	 * ���� ���ǳ���
	 * @param id
	 * @return
	 */
	List<QuestionDTO> selectQuestionById (String id);
	
	/**
	 * ���ǻ󼼺���
	 * @param QuestionNo
	 * @return
	 */
	QuestionDTO selectOneQuestion (String QuestionNo);
	
	/**
	 * ���ǵ��
	 * @param questionDTO
	 * @return
	 */
	int insertQuestion (QuestionDTO questionDTO);
	
	/**
	 * ���Ǽ���
	 * @param questionDTO
	 * @return
	 */
	int updateQuestion (QuestionDTO questionDTO);
	
	/**
	 * ���ǻ���
	 * @param questionNo
	 * @return
	 */
	int deleteQuestion (String questionNo);

}
