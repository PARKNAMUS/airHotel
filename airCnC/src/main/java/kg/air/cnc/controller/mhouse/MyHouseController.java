package kg.air.cnc.controller.mhouse;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kg.air.cnc.controller.reservation.ReservationDetailController;
import kg.air.cnc.service.mhouse.MyHouseService;
import kg.air.cnc.service.reservation.ReservationService;
import kg.air.cnc.vo.BlameVO;
import kg.air.cnc.vo.Host_sales_chartVO;
import kg.air.cnc.vo.HouseReservationMemberVO;
import kg.air.cnc.vo.ReservationHouseDetailVO;
import kg.air.cnc.vo.ReservationVO;

@Controller
public class MyHouseController {
	
	@Autowired
	MyHouseService myHouseService;
	@Autowired
	ReservationService reservationService;
	
	@RequestMapping("myHouse.do")
	public ModelAndView hostHouseList(HttpSession session,ModelAndView mav) {
		if(session.getAttribute("login_session")!=null) {
			mav.setViewName("hostHouseList");
			List<ReservationHouseDetailVO> resListThisWeek = myHouseService.getReservationListThisWeek((String)session.getAttribute("login_session"));
			if(resListThisWeek.size()>0) {
				mav.addObject("resList",resListThisWeek);
			}
		}else {
			mav.setViewName("Redirect:loginView.do");
		}
		
		return mav;
	}
	@RequestMapping(value = "myHouseList.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String myHouseListController(HttpSession session) throws JsonProcessingException {
		
		String id = (String)session.getAttribute("login_session");
		List<ReservationHouseDetailVO> list = myHouseService.getHostHouseList(id);
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(list);
		return jsonStr;
	}
	@RequestMapping("myHouseResList.do")
	public ModelAndView myHouseResListController(ReservationHouseDetailVO vo,ModelAndView mav) {
		List<HouseReservationMemberVO> list = myHouseService.getHouseResList(vo);
		mav.addObject("resList",list);
		mav.addObject("house_seq",vo.getHouse_seq());
		mav.setViewName("houseResList");
		return mav;
	}
	@RequestMapping("myHouseBeforeResList.do")
	public ModelAndView myHouseBeforeResListController(ReservationHouseDetailVO vo, ModelAndView mav) {
		List<HouseReservationMemberVO> list = myHouseService.getHouseBeforeResList(vo);
		mav.addObject("resList",list);
		mav.addObject("house_seq",vo.getHouse_seq());
		mav.setViewName("houseBeforeResList");
		return mav;
	}
	@RequestMapping("myHouseSales.do")
	public ModelAndView myHouseSalesController(Host_sales_chartVO vo,HttpSession session,ModelAndView mav) {
		List<Host_sales_chartVO> list = null;
		List<Host_sales_chartVO> list2 = null;
		System.out.println(vo.getSearchConditionFirst());
		if(vo.getSearchType() != null) {
			vo.setHost_id((String)session.getAttribute("login_session"));
			if(vo.getSearchType().equals("years")) {
				list = myHouseService.getAdmin_salesForYears(vo);
				list2 = myHouseService.getHost_salesForYearsEachHouse(vo);
			}
			if(vo.getSearchType().equals("year")) {
				list = myHouseService.getAdmin_salesForYear(vo);
				list2= myHouseService.getHost_salesForYearEachHouse(vo);
			}
			if(vo.getSearchType().equals("month")) {
				list = myHouseService.getAdmin_salesForMonth(vo);
				list2 = myHouseService.getHost_salesForMonthEachHouse(vo);
			}
			if(vo.getSearchType().equals("days")) {
				list = myHouseService.getAdmin_salesForDays(vo);
				list2 = myHouseService.getHost_salesForDaysEachHouse(vo);
			}
			if(list.size()>0) {
				mav.addObject("salesList", list);
				mav.addObject("salesList2",list2);
			}
		}
		mav.setViewName("hostSales");
		return mav;
	}
	@RequestMapping(value = "deleteHouse.do",method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String deleteHouseController(String house_seq) {
		int house_sequence = Integer.parseInt(house_seq);
		myHouseService.deleteResHouse(house_sequence);
		return "삭제신청이 완료되었습니다.";
	}
	@RequestMapping("rollbackDelete.do")
	public String rollbackDeleteController(ReservationHouseDetailVO vo) {
		myHouseService.rollbackDeleteHouse(vo.getHouse_seq());
		return "hostHouseList";
	}
	@RequestMapping("hostSales.do")
	public ModelAndView hostSalesController(Host_sales_chartVO vo, ModelAndView mav) {
		if(vo.getSearchConditionFirst() == null) {
			mav.setViewName("hostSales");
		}
		return mav;
	}
	@RequestMapping("blameCustomerPage.do")
	public ModelAndView goToInsertBlame(BlameVO vo,ModelAndView mav) {
		mav.addObject("blameVO",vo);
		mav.setViewName("blameCustomerpopup");
		return mav;
	}
	
}
