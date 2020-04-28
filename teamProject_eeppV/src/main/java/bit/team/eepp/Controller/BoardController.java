package bit.team.eepp.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import bit.team.eepp.Page.PageMaker;
import bit.team.eepp.Search.SearchCriteria;
import bit.team.eepp.Service.BoardService;
import bit.team.eepp.VO.BoardVO;
import bit.team.eepp.VO.UserVO;

@RequestMapping("/board")
@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;

	@RequestMapping("/boardList")
	public String boardList(Model model, @ModelAttribute("scri") SearchCriteria scri, @RequestParam(value = "sortType", required = false, defaultValue = "bWrittenDate") String sortType, @RequestParam(value = "bCategory", required = false, defaultValue = "") String bCategory) {
		
		if(bCategory.equals("")) {
			bCategory = "all";
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("scri", scri);
		map.put("sortType", sortType);
		map.put("bCategory", bCategory);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(boardService.listCount(map));
		
		//최신글 검사
		String isNew = null;
		Date date = new Date();
		SimpleDateFormat sdformat = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.DATE, -1);
		isNew = sdformat.format(cal.getTime());
		Timestamp newArticle = Timestamp.valueOf(isNew);

		model.addAttribute("notice", boardService.noticeList());
		model.addAttribute("hotArticle", boardService.hotList());
		model.addAttribute("newArticle", newArticle);
		model.addAttribute("boardList", boardService.boardList(map));
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("sortType", sortType);
		model.addAttribute("bCategory", bCategory);
		return "/board/boardList";
	}

	@RequestMapping("/writeView")
	public String writeView(Model model, @ModelAttribute("scri") SearchCriteria scri, @RequestParam(value = "sortType") String sortType, @RequestParam(value = "bCategory") String bCategory) {
		System.out.println("writeView() method");
		model.addAttribute("scri", scri);
		model.addAttribute("sortType", sortType);
		model.addAttribute("bCategory", bCategory);
		return "/board/write_view";
	}

	@RequestMapping("/writeContent")
	public String writeContent(BoardVO boardVO, Model model, @ModelAttribute("scri") SearchCriteria scri,
			@RequestParam(value = "sortType") String sortType, @RequestParam(value = "bCategory") String bCategory) {
		System.out.println("writeContent() method");
		
		int result = boardService.write(boardVO);
		System.out.println("result : " + result);
		return "redirect:/board/contentView?bId=" + boardVO.getbId() + "&page=" + scri.getPage() + "&perPageNum="
				+ scri.getPerPageNum() + "&sortType=" + sortType + "&bCategory=" + bCategory;
	}

	@RequestMapping("/contentView")
	public String contentView(HttpServletResponse response, BoardVO boardVO, Model model,HttpSession session, @ModelAttribute("scri") SearchCriteria scri,
			@RequestParam(value = "sortType") String sortType, @RequestParam(value = "bCategory") String bCategory) throws IOException {
		System.out.println("contentView() method");
		
		String flag = boardService.getDeleteInfo(boardVO.getbId());
		
		if(flag.equals("yes")) {	
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('삭제된 게시물입니다.'); location.href='/eepp/board/boardList';</script>");
			out.close();
			return "";
		} else {
			model.addAttribute("content", boardService.selectOne(boardVO));
			model.addAttribute("scri", scri);
			model.addAttribute("sortType", sortType);
			model.addAttribute("bCategory", bCategory);
			return "/board/content_view";
		}
	}

	@RequestMapping("/deleteContent")
	public String deleteContent(BoardVO boardVO) {
		System.out.println("/deleteContent() method");
		boardService.delete(boardVO);
		return "redirect:/board/boardList";
	}

	@RequestMapping("/modifyView")
	public String modifyView(HttpServletResponse response, BoardVO boardVO, Model model, @ModelAttribute("scri") SearchCriteria scri,
			@RequestParam(value = "sortType") String sortType, @RequestParam(value = "bCategory") String bCategory) throws IOException {
		System.out.println("/modifyView() method");
		
		String flag = boardService.getDeleteInfo(boardVO.getbId());
		
		if(flag.equals("yes")) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('삭제된 게시물입니다.'); location.href='/eepp/board/boardList';</script>");
			out.close();
			return "";
		} else {
			model.addAttribute("modify", boardService.modifyView(boardVO));
			model.addAttribute("scri", scri);
			model.addAttribute("sortType", sortType);
			model.addAttribute("bCategory", bCategory);
			return "/board/modify_view";
		}
	}

	@RequestMapping("/modifyContent")
	public String modifyContent(BoardVO boardVO, Model model, @ModelAttribute("scri") SearchCriteria scri,
			@RequestParam(value = "sortType") String sortType, @RequestParam(value = "bCategory") String bCategory) {
		System.out.println("/modifyContent() method");
		boardService.modify(boardVO);
		model.addAttribute("scri", scri);
		model.addAttribute("sortType", sortType);
		model.addAttribute("bCategory", bCategory);
		return "redirect:/board/contentView?bId=" + boardVO.getbId() + "&page=" + scri.getPage() + "&perPageNum="
				+ scri.getPerPageNum();
	}

}
