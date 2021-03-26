package org.ict.mapper;

import java.util.List;

import org.ict.domain.BoardVO;
import org.ict.domain.Criteria;
import org.ict.domain.SearchCriteria;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {

	@Autowired
	private BoardMapper mapper;
	
//	@Test
	public void testGetList() {
		List<BoardVO> boards = mapper.getList();

		boards.forEach(a -> {
			System.out.println(a);
			
		});
	}
	
	
//	@Test
	public void testInsert() {
		//하기 BoardVO객체를 다음 조건으로 완성시켜주세요
		//content : "insert본문"
		//title : "insert제목"
		//writer : "insert글쓴이"
		BoardVO board = new BoardVO();
		board.setContent("insert본문");
		board.setTitle("insert제목");
		board.setWriter("insert글쓴이");
		//완성시킨 객체와 .insert() 메서드를 이용햐
		//글을 DB에 집어넣어주세요.
		//코드 작성해주세요
		mapper.insert(board);
		
	}
	
//	@Test
	public void testRead() {
		BoardVO board = mapper.read(3L);
		
		log.info(board);
		
		
	}
	
//	@Test
	public void testDelete() {
		mapper.delete(2L);
	}
	
//	@Test
	public void testUpdate() {
		BoardVO board = new BoardVO();
		
		board.setBno((long) 3);
		board.setTitle("수정된 제목");
		board.setContent("수정된 본문");
		
		int count = mapper.update(board);
		
		log.info("변경된 컬럼수 : " + count);
		
	}
	
	@Test
	public void testListPage() {
		//파라미터로 Criteria 객체를 요구하므로 생성해서 전달
		SearchCriteria cri = new SearchCriteria();
		cri.setPage(1);
		cri.setNumber(5);
		List<BoardVO> board = mapper.listPage(cri);
		board.forEach(a -> {
			System.out.println(a);
		
		});
	}
	
	
}
