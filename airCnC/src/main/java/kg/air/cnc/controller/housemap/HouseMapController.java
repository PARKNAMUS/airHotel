package kg.air.cnc.controller.housemap;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kg.air.cnc.service.housemap.HouseMapServiceImpl;

@Controller
public class HouseMapController {
	@Autowired
	private HouseMapServiceImpl houseMapService;
	
	@RequestMapping(value="/getHouseList.do")
	public ModelAndView getHouseList(String location, ModelAndView mav) {
		mav.addObject("houseList",houseMapService.getHouseList(location));
		mav.addObject("location", location);
		mav.addObject("price", houseMapService.getPrice(location));
		mav.setViewName("houseMap");
		return mav;
	}
	
	@RequestMapping(value="/getDetail.do", produces="application/text; charset=utf-8")
	public ModelAndView getHouse(@RequestParam Map<String, String> info, ModelAndView mav) {
		//System.out.println(info.get("star1")+ " type >"+info.get("star1").getClass().getName());
		System.out.println(info.toString());
		System.out.println(info.size());
		mav.addObject("houseList",houseMapService.getDetail(info));
		mav.addObject("location", info.get("location"));
		mav.addObject("price", houseMapService.getPrice(info));
		mav.addObject("checkInDate", info.get("checkIn"));
		mav.addObject("checkOutDate", info.get("checkOut"));
		mav.addObject("person", info.get("people"));
		mav.setViewName("houseMap");
		return mav;
	}

	@RequestMapping(value="/searchIndex.do", produces="application/text; charset=utf-8")
	public ModelAndView searchIndex(@RequestParam Map<String, String> info, ModelAndView mav) {
		mav.addObject("houseList", houseMapService.searchIndex(info));
		mav.addObject("location", info.get("location"));
		mav.addObject("price", houseMapService.searchIndexPrice(info));
		mav.addObject("checkInDate", info.get("checkIn"));
		mav.addObject("checkOutDate", info.get("checkOut"));
		mav.addObject("person", info.get("people"));
		mav.setViewName("houseMap");
		return mav;
	}
}
