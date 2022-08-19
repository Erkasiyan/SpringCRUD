package kr.co.controller;

import javax.inject.*;

import org.slf4j.*;
import org.springframework.stereotype.*;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;
import org.springframework.web.servlet.view.*;

import kr.co.service.*;
import kr.co.vo.*;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Inject
	BoardService service;
	
	// 게시판 글 작성 화면
	@RequestMapping(value = "/board/writeView", method = RequestMethod.GET)
	public void writeView() throws Exception{
		logger.info("writeView");
	}
	
	// 게시판 글 작성
	@RequestMapping("/write")
	public ModelAndView write(BoardVO bVO, ModelAndView mv, RedirectView rv) throws Exception{
		logger.info("write");
		service.write(bVO);
		rv.setUrl("/board/list");
		mv.setView(rv);
		
		return mv;
	}
	
	// 게시판 목록 조회
	@RequestMapping("/list")
	public ModelAndView list(ModelAndView mv,  SearchCriteria scri, PageMaker pm) throws Exception{
		logger.info("list");
		
		mv.addObject("list", service.list(scri));
		
		pm.setCri(scri);
		pm.setTotalCount(service.listCount(scri));
		
		mv.addObject("scri", scri);
		mv.addObject("pageMaker", pm);
		mv.setViewName("board/list");
		return mv;
	}
	
	// 게시물 조회
	@RequestMapping(value = "/readView", method = RequestMethod.POST)
	public String read(BoardVO bVO, Model model) throws Exception{
		logger.info("read");
		
		model.addAttribute("read", service.read(bVO.getBno()));
		return "board/readView";
	}
	
	// 게시판 수정뷰
	@RequestMapping("/updateView")
	public ModelAndView updateView(BoardVO bVO, ModelAndView mv) throws Exception{
		logger.info("updateView");
		mv.addObject("update", service.read(bVO.getBno()));
		
		mv.setViewName("board/updateView");
		return mv;
	}
	
	// 게시물 수정
	@RequestMapping("/update")
	public ModelAndView update(BoardVO bVO, ModelAndView mv, RedirectView rv) throws Exception {
		logger.info("update");
		
		service.update(bVO);
		rv.setUrl("/board/list");
		mv.setView(rv);
		return mv;
	}
	
	@RequestMapping("/delete")
	public ModelAndView delete(BoardVO bVO, ModelAndView mv, RedirectView rv) throws Exception {
		logger.info("delete");
		
		service.delete(bVO.getBno());
		rv.setUrl("/board/list");
		
		mv.setView(rv);
		return mv;
	}
	
}
