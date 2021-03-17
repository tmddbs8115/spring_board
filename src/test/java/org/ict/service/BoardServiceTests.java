package org.ict.service;

import java.util.List;

import org.ict.domain.BoardVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardServiceTests {

	@Autowired
	private BoardService service;
	
//	@Test
	public void testRegister() {
		// BoardVO를 생성하고 service의 register메서드를 사용
		//어렵다면 BoardMapperTest를 참고해서 완성시켜주세요
		
		BoardVO board = new BoardVO();
		board.setTitle("서비스제목");
		board.setContent("서비스본문");
		board.setWriter("서비스글쓴이");
		
		service.register(board);
		
	}
	
//	@Test
	public void testGet() {
		BoardVO board = service.get(4L);
		log.info(board);
	}
	
//	@Test
	public void testModify() {
		
		BoardVO board = service.get(7L);
		
		if(board == null) {
			return;
		}
		board.setTitle("modi제목");
		board.setContent("modi반영본문");
		
		service.modify(board);
		
		
//		BoardVO board = new BoardVO();
//		
//		board.setBno(1L);
//		board.setTitle("수정된 서비스제목");
//		board.setContent("수정된 서비스본문");
//		
//		boolean count = service.modify(board);
//		log.info(board);
	}
	
//	@Test
	public void testRemove() {
		service.remove(4L);
	}
	
	@Test
	public void testGetList() {
		
		List<BoardVO> board = service.getList();

		board.forEach(a -> {
			log.info(a);
			
		});
	}
	
	
}
