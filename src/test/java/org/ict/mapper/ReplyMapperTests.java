package org.ict.mapper;

import java.util.List;

import org.ict.domain.ReplyVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

// 테스트 코드 작성을 위한 어노테이션들
// 어노테이션이 적용된 클래스가 테스트 목적으로 작성되었음을 명시
@RunWith(SpringJUnit4ClassRunner.class)
//root context를 읽어와야 내부의 mapper객체를 사용할 수 있다.
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")

// 로그를 찍기위해 필요한 어노테이션
@Log4j
public class ReplyMapperTests {

	//테스트 대상이 replymapper의 동작여부이므로 선언 및 주입
	@Autowired
	private ReplyMapper mapper;
	
	
	//기능 테스트
	@Test
	public void testGetList() {
		
		log.info(mapper.getList(1));
		
		
	}
//	@Test
	public void testCreate() {
		ReplyVO re = new ReplyVO();
		
		re.setBno(1);
		re.setRno(1);
		
		re.setReplyer("yun");
		re.setReplytext("답글");
		
		mapper.create(re);
		log.info(re);
	}
	
//	@Test
	public void testUpdate() {
		ReplyVO re = new ReplyVO();
		
		re.setBno(1);
		re.setReplyer("new yun");
		re.setReplytext("new 답글");
		
		mapper.update(re);
		
	}
//	@Test
	public void testDelete() {
		mapper.delete(4);
	}

}