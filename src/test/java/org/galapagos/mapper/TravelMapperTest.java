package org.galapagos.mapper;

import static org.junit.Assert.*;

import java.util.List;

import org.galapagos.config.RootConfig;
import org.galapagos.domain.Criteria;
import org.galapagos.domain.TravelVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { RootConfig.class })
@Log4j
public class TravelMapperTest {
	
	@Autowired
	private TravelMapper mapper;

	//@Test
	public void testGetTotalCount() {
		Criteria cri = new Criteria();
		
		int total = mapper.getTotalCount(cri);
		log.info("total: " + total);
		
		cri.setType("RTD");
		cri.setKeyword("해수욕장");
		total = mapper.getTotalCount(cri);
		log.info("total: " + total);
	}

	//@Test
	public void testGetList() {
		Criteria cri = new Criteria();
		
		List<TravelVO> list = mapper.getList(cri);
		for(TravelVO travel: list) {
			log.info(travel);
		}
			
			// 검색
			cri.setType("RTD");
			cri.setKeyword("해수욕장");
			list = mapper.getList(cri);
			for(TravelVO travel: list) {
				log.info(travel);
			}
	}
	//@Test
	public void testInsert() {
		
		TravelVO board = new TravelVO();
		board.setRegion("우리집");
		board.setTitle("새 제목입니다.");
		board.setDescription("새 장소입니다.");
		board.setAddress("우리집");
		board.setPhone("010-0101-0101");
		
		mapper.insert(board);
	
		log.info(board);
	}
	
//	@Test
	public void testRead() {
		TravelVO board = mapper.read(113L);
		
		log.info(board);
	}

	@Test
	public void testDelete() {
		log.info("DELETE COUNT: " + mapper.delete(113L));
	}

//	@Test
	public void testUpdate() {

		TravelVO board = mapper.read(113L);
		board.setTitle("업데이트");
		board.setRegion("레지온");
		board.setDescription("디스크립션");
		board.setAddress("주소");
		board.setPhone("010-7777-7777");
		
		int count = mapper.update(board);
		
		log.info("업데이트된 내용: " + count);
	}

}
