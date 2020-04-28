package bit.team.eepp.Mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import bit.team.eepp.VO.EatingVO;

@Repository
public interface EatingMapper {
	
		// 맛집 총 갯수
		public abstract int eatingListCount(Map<String, Object> map);

		// 맛집 리스트 + paging, 정렬 : 시간순
		public abstract List<EatingVO> eatingList(Map<String, Object> map);
		
		// 테마 리스트 + paging, 정렬 : 시간순
		public abstract List<EatingVO> themaList(Map<String, Object> map);
		
		// 맛집 인포 게시글 확인
		public abstract EatingVO selectOne(@Param("eId") int eId);

		// 맛집 등록
		public abstract int write(@Param("eatingVO") EatingVO eatingVO);

		// 맛집 삭제
		public abstract void delete(@Param("eId") int eId);

		// 맛집 수정 페이지
		public abstract EatingVO modifyView(@Param("eId") int eId);

		// 맛집 수정
		public abstract void modify(@Param("eatingVO") EatingVO eatingVO);
		
		// 조회수 : 수정부분
		public abstract void hitUp(@Param("eId") int eId);

}
