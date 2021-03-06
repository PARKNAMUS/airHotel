package kg.air.cnc.controller.customer;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.io.IOUtils;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.fasterxml.jackson.databind.JsonNode;
import com.github.scribejava.core.model.OAuth2AccessToken;
import kg.air.cnc.common.KakaoController;
import kg.air.cnc.common.MediaUtils;
import kg.air.cnc.common.NaverController;
import kg.air.cnc.common.uploadFileUtils;
import kg.air.cnc.service.customer.CustomerService;
import kg.air.cnc.service.mail.MailService;
import kg.air.cnc.service.message.MessageService;
import kg.air.cnc.vo.CustomerVO;
import kg.air.cnc.vo.HostVO;
import kg.air.cnc.vo.MessageVO;

@Controller
public class CustomerController {

	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);
	
	private NaverController naverController;
	private KakaoController kakaoController = new KakaoController();
	private String apiResult = null;
	
//	@Resource(name = "uploadPath") 
//	private String uploadPath;
	
	@Autowired
	private void setNaverController(NaverController naverController) {
		this.naverController = naverController;
	}
	
	@Autowired
	MessageService messageService;

	@Inject
	CustomerService service;

	@Inject
	BCryptPasswordEncoder passwordEncoder;

	@Inject
	JavaMailSender javaMailSender;

	@Inject
	private MailService mailService;

	@RequestMapping(value = "/indexView.do", method = RequestMethod.GET)
	public String indexView() {
		return "index";
	}

	@RequestMapping(value = "/registerView.do", method = RequestMethod.GET)
	public String registerView(MultipartFile multipartFile, Model model) throws Exception{
		return "SignUp";
	}
	
	@RequestMapping(value = "/hostRegisterView.do", method = RequestMethod.GET)
	public ModelAndView hostRegisterView(HttpSession session,CustomerVO customerVO, ModelAndView mav, HttpServletRequest request) throws Exception{
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/images/profile/");
		String sessionId = (String)session.getAttribute("login_session");
		customerVO = service.getCustomerInfo(sessionId);	
		String filePath = customerVO.getCustomer_image();
		Map<String, String> fdata = new HashMap<String, String>();
		File file = new File(uploadPath + filePath);
		fdata.put("filePath", filePath);
		mav.addObject("customerPassword", customerVO.getCustomer_password());
		mav.addObject("customerName", customerVO.getCustomer_name());
		mav.addObject("customerPhone", customerVO.getCustomer_phone());
		mav.addObject("customerEmail", customerVO.getCustomer_email());
		mav.addObject("customerBank", customerVO.getCustomer_refund_bank());
		mav.addObject("customerAccount", customerVO.getCustomer_refund_account());
		mav.addObject("customerImage", filePath);
		session.setAttribute("my_image", filePath);
		mav.setViewName("hostRegister");
		return mav;
	}

	@RequestMapping(value = "/loginView.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView loginView(ModelAndView mav, HttpSession session, HttpServletRequest request)throws Exception{
		String naverUrl = naverController.getAuthorizationUrl(session, request);
		String kakaoUrl = kakaoController.getAuthorizationUrl(session, request);
		session.setAttribute("my_image", "profile.png"); 
		mav.addObject("naverUrl", naverUrl);
		mav.addObject("kakaoUrl", kakaoUrl);
		mav.setViewName("login");
		return mav;
	}
	
	@RequestMapping(value = "/mypage.do")
	public ModelAndView mypageView(HttpSession session, CustomerVO customerVO, ModelAndView mav, HttpServletResponse response, HttpServletRequest request)throws Exception{
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/images/profile/");
		String sessionId = (String)session.getAttribute("login_session");
		System.out.println("세션 아이디 : " + sessionId);
		customerVO = service.getCustomerInfo(sessionId);
		System.out.println("db에 저장된 이미지 : " + customerVO.getCustomer_image());
		String filePath = customerVO.getCustomer_image();
		if (filePath.equals("profile.png")) {
			mav.addObject("customerName", customerVO.getCustomer_name());
			mav.addObject("customerPhone", customerVO.getCustomer_phone());
			mav.addObject("customerEmail", customerVO.getCustomer_email());
			mav.addObject("customerBank", customerVO.getCustomer_refund_bank());
			mav.addObject("customerAccount", customerVO.getCustomer_refund_account());
			mav.addObject("customerImage", filePath);
			session.setAttribute("my_image", filePath);
			mav.setViewName("mypage");
			return mav;
		}else {
			Map<String, String> fdata = new HashMap<String, String>();
			File file = new File(uploadPath + filePath);
			fdata.put("filePath", filePath);
			mav.addObject("customerName", customerVO.getCustomer_name());
			mav.addObject("customerPhone", customerVO.getCustomer_phone());
			mav.addObject("customerEmail", customerVO.getCustomer_email());
			mav.addObject("customerBank", customerVO.getCustomer_refund_bank());
			mav.addObject("customerAccount", customerVO.getCustomer_refund_account());
			mav.addObject("customerImage", filePath);
			session.setAttribute("my_image", filePath);
			mav.setViewName("mypage");
			mav.addObject("fdata", fdata);
			return mav;
		}
	}
	
	@RequestMapping(value = "/display.do", method = RequestMethod.GET)
	public ResponseEntity<byte[]> displayFile(@RequestParam("name")String fileName, HttpServletRequest request)throws Exception{
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/images/profile/");
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		logger.info("File Name : " + fileName);
		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
			MediaType mType = MediaUtils.getMediaType(formatName);
			HttpHeaders headers = new HttpHeaders();
			try {
				in = new FileInputStream(uploadPath + fileName);
			} catch (FileNotFoundException e) {}
			in = new FileInputStream(uploadPath + fileName);
			if (mType != null) {
				headers.setContentType(mType);
			}else {
				fileName = fileName.substring(fileName.indexOf("_") + 1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", "attachment; filename=\"" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1")+"\"");
			}
			try {
				entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
			} catch (NullPointerException e) {}
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			try {
				in.close();				
			} catch (NullPointerException e2) {}
		}
		return entity;
	}
	
	// 비밀번호 찾기.
	@RequestMapping(value = "/forgotPasswordView.do", method = RequestMethod.GET)
	public String forgotPasswordView()throws Exception{
		return "forgotpassword";
	}
	
	@RequestMapping(value = "/passwordChangeView.do", method = RequestMethod.GET)
	public String passwordChangeView()throws Exception{
		return "passwordChange";
	}
	
	@RequestMapping(value = "/customerWithdrawalView.do", method = RequestMethod.GET)
	public String customerWithdrawalView()throws Exception{
		return "customerWithdrawal";
	}

	// 비밀번호 찾기 이메일 전송.
	@RequestMapping(value = "/sendPassword.do",  method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView sendPassword(@RequestParam String customer_email, CustomerVO customerVO, HttpServletResponse response, ModelAndView mav)throws Exception{
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		int resultCnt = 0; // // 0 : 회원가입하지 않은 이메일, 1 : 회원가입이 되어 있는 이메일.
		resultCnt = service.createEmailCheck(customer_email); // 이메일 존재 유무 체크. 
		if (resultCnt == 0) { // 회원가입한 이메일이 아닌 경우. 이메일이 DB에 존재하지 않을 때.
			mav.addObject("sendMessage", "fail");
		}else if(resultCnt == 1) { // 회원가입한 이메일 계정일 경우.
			char[] keySet = new char[] { 
					'0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
					'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',
					'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T',
					'U', 'V', 'W', 'X', 'Y', 'Z',
					'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j',
					'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't',
					'u', 'v', 'w', 'x', 'y', 'z'};
			StringBuffer sb = new StringBuffer();
			for (int i = 0 ; i < 11 ; i++) {
				int idx = (int) (keySet.length * Math.random()); // 62 * 생성된 난수를 Int로 추출 (소숫점제거)
				sb.append(keySet[idx]);
			}
			String newPwd = String.valueOf(sb); // 임시 비밀번호.
			String subject = "[AirCnC] 임시 비밀번호 발급 안내.";
			String text = "회원님, 안녕하세요.\n";
			text += "임시 비밀번호입니다.\n로그인 후 반드시 비밀번호를 변경하여 사용하세요.\n";
			text += "임시 비밀번호 : " + newPwd;	
			mailService.send(subject, text, "ljh160791@gmail.com", customer_email);
			String newPassword = passwordEncoder.encode(newPwd); // 임시 비밀번호 암호화.
			customerVO.setCustomer_password(newPassword); // vo의 비밀번호에 임시 비밀번호로 세팅.
			service.changePassword(customerVO); // 비밀번호를 임시 비밀번호로 변경해놓기.
			System.out.println("비밀번호 변경 완료");
			mav.addObject("sendMessage", "success");
		} else {
			mav.addObject("sendMessage", "error");
		}
		mav.setViewName("forgotpassword");
		return mav;
	}

	// 아이디 중복 여부 검사.
	@RequestMapping(value = "/idCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public String idCheck(CustomerVO vo)throws Exception{
		int result = service.idCheck(vo);
		return String.valueOf(result);
	}

	@RequestMapping(value = "/kakaologin.do", produces = "application/json", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView kakaoLogin(@RequestParam("code")String code, HttpSession session, CustomerVO vo, ModelAndView mav, HttpServletRequest httpServletRequest)throws Exception {
		// 결과값을 node에 보여줌.
		JsonNode node = kakaoController.getAccessToken(code, httpServletRequest);
		// accessToken에 사용자의 로그인한 모든 정보가 들어있음.
		JsonNode accessToken = node.get("access_token");
		// 사용자 정보를 카카오에서 가져오기.
		JsonNode userInfo = kakaoController.getKakaoUserInfo(accessToken);
		JsonNode properties = userInfo.path("properties");
		JsonNode kakaoAccount = userInfo.path("kakao_account");
		String kid = userInfo.path("id").asText();
		String kemail = kakaoAccount.path("email").asText();
		String kname = properties.path("nickname").asText();
		String kimage = properties.path("profile_image").asText();
	
		// 일단 이메일을 아이디로 저장하고, DB에 존재하는지부터 확인한다.
		vo.setCustomer_id(kemail);
		
		// 로그인 하기 전 id와 email이 DB에 있는지 확인. 있으면 1, 없으면 0이 리턴.
		int idCheckResult = service.idCheck(vo);
		int emailCheckResult = service.createEmailCheck(kid);
		
		if (idCheckResult == 0 || emailCheckResult == 0) {
			vo.setCustomer_password("none");
			String inputPass = vo.getCustomer_password();
			String pwd = passwordEncoder.encode(inputPass);
			vo.setCustomer_password(pwd);
			vo.setCustomer_name(kname);
			if (kemail.substring(0, 3).trim().equals("010")) {
				vo.setCustomer_phone(kemail);
			}else {
				vo.setCustomer_phone("none");
			}
			vo.setCustomer_email(kid);
			if (kimage == null || kimage == "") {
				vo.setCustomer_image("profile.png");
			}else {
				vo.setCustomer_image(kimage);				
			}
			vo.setCustomer_image(kimage);
			vo.setCustomer_key("kakao");
			vo.setCustomer_refund_bank("none");
			vo.setCustomer_refund_account("none");
		}
		session.setAttribute("login_session", vo.getCustomer_id());
		session.setAttribute("kakao_login_session", vo.getCustomer_id());
		mav.setViewName("index");
		return mav;
	}
	
	// 네이버 로그인 성공시 callback메서드 호출.
	@RequestMapping(value = "/naverlogin.do", produces = "application/json", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView naverLogin(@RequestParam String code, @RequestParam String state, HttpSession session, CustomerVO vo, ModelAndView mav, HttpServletRequest httpServletRequest)throws Exception, IOException, ParseException{
		OAuth2AccessToken oauthToken = naverController.getAccessToken(session, code, state, httpServletRequest);
		// 로그인한 사용자의 모든 정보가 JSON 타입으로 저장되어 있음.
		apiResult = naverController.getUserProfile(oauthToken, httpServletRequest);

		// 내가 원하는 정보만 JSON타입에서 String타입으로 바꿔 가져오기.
		JSONParser parser = new JSONParser(); 
		Object obj = null; 
		try{
			obj = parser.parse(apiResult); 
		} catch (ParseException e) {
			e.printStackTrace(); 
		} 
		JSONObject jsonobj = (JSONObject)obj; 

		// 데이터 파싱.
		JSONObject response = (JSONObject) jsonobj.get("response"); 
		String naverId = (String) response.get("id");
		String naverName = (String) response.get("name"); 
		String naverEmail = (String) response.get("email");
//		String naverProfileImage = (String) response.get("profile_image");
		
		// DB에 네이버 사용자 정보를 저장하기 위한 VO 세팅.
		vo.setCustomer_id(naverEmail);
		int idCheckResult = service.idCheck(vo);
		int emailCheckResult = service.createEmailCheck(naverId);
		if (idCheckResult == 0 || emailCheckResult == 0) {
			vo.setCustomer_password("none");
			String inputPass = vo.getCustomer_password();
			String pwd = passwordEncoder.encode(inputPass);
			vo.setCustomer_password(pwd);
			vo.setCustomer_name(naverName);
			vo.setCustomer_email(naverId);
			vo.setCustomer_image("profile.png");
			vo.setCustomer_phone("none");
			vo.setCustomer_key("naver");
			vo.setCustomer_refund_bank("none");
			vo.setCustomer_refund_account("none");
			service.register(vo);			
		}
		session.setAttribute("login_session", vo.getCustomer_id());
		session.setAttribute("naver_login_session", vo.getCustomer_id());
		mav.setViewName("index"); 
		return mav;
	}

	@RequestMapping(value = "/createEmailCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public String createEmailCheck(@RequestParam(value = "customer_email" ,required = false)String customer_email, CustomerVO vo, HttpServletRequest request)throws Exception {
		int cnt = -1;
		cnt = service.createEmailCheck(customer_email); // 이메일 중복 체크.
		
		if (service.blacklistEmailCheck(vo) == 1) {
			return "blacklist";
		}else if(service.blacklistEmailCheck(vo) == 0){
			// 이메일 인증.
			char[] keySet = new char[] { 
					'0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
					'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',
					'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T',
					'U', 'V', 'W', 'X', 'Y', 'Z',
					'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j',
					'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't',
					'u', 'v', 'w', 'x', 'y', 'z'};
			StringBuffer sb = new StringBuffer();
			for (int i = 0 ; i < 6 ; i++) {
				int idx = (int) (keySet.length * Math.random()); // 62 * 생성된 난수를 Int로 추출 (소숫점제거)
				sb.append(keySet[idx]);
			}
			HttpSession session = request.getSession(true);
			String authCode = String.valueOf(sb); // 랜덤 인증 코드.
			session.setAttribute("authCode", authCode);
			String subject = "[AirCnC] 회원가입 인증 코드 발급 안내 입니다.";
			String text = "귀하의 인증 코드는 " + authCode + " 입니다.";
			//		if(cnt == 0) {
			mailService.send(subject, text, "ljh160791@gmail.com", customer_email);
			return "complate";
			//		}
			//		else {
			//			return false;
			//		}
		}else {
			return "fail";
		}
	}

	@RequestMapping(value = "/emailAuth.do", method = RequestMethod.POST)
	@ResponseBody
	public String emailAuth(@RequestParam String customer_key, HttpSession session)throws Exception{
		String authCode = (String)session.getAttribute("authCode"); // 랜덤 생성한 인증번호.
		System.out.println("랜덤으로 생성된 인증코드 : " + authCode); // 랜덤 생성한 인증번호.
		System.out.println("사용자가 입력한 인증코드 : " + customer_key); // 사용자가 입력한 인증번호.
		if (authCode.equals(customer_key)) {
			return "complate";
		}else {
			return "false";
		}
	}

	// 회원가입 컨트롤러.
	@RequestMapping(value = "/registerCheck.do", method = RequestMethod.POST)
	public String regist(CustomerVO vo, MultipartFile multipartFile, HttpServletRequest request)throws Exception{
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/images/profile/");
		multipartFile = vo.getCustomer_photo();
		if (multipartFile != null && multipartFile.isEmpty() == false) {
			String originalName = multipartFile.getOriginalFilename();
			String path = uploadFileUtils.uploadFile(uploadPath, originalName, multipartFile.getBytes());
			vo.setCustomer_image(path);
		}else {
			vo.setCustomer_image("profile.png");
		}
		MessageVO messageVO = new MessageVO();
		int result = service.blacklistEmailCheck(vo);
		try {
			if (result == 1) {
				return "SignUp"; 
			}else if (result == 0) {
				String inputPass = vo.getCustomer_password();
				String pwd = passwordEncoder.encode(inputPass);
				vo.setCustomer_password(pwd);
				vo.setCustomer_key("Y"); 
				service.register(vo);
				messageVO.setMessage_from_id("admin");
				messageVO.setMessage_to_id(vo.getCustomer_id());
				messageVO.setMessage_type("nomal");
				messageVO.setMessage_content("회원가입을 축하합니다.");
				messageService.insertMessage(messageVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "login";		
	}

	// 로그인 처리.
	@RequestMapping(value = "/loginProcess.do", method = RequestMethod.POST)
	public ModelAndView loginProcess(HttpSession session, CustomerVO customerVO, HttpServletResponse response, ModelAndView mav)throws Exception{

		String returnURL = "";
		if (session.getAttribute("login_session") != null) {
			session.removeAttribute("login_session"); // login이란 세션값이 존재하면, 기존의 세션을 지움.
		}

		String inputId = customerVO.getCustomer_id();

		// DB에서 아이디 및 비밀번호를 가져온다.
		CustomerVO customerDbVO = service.customerCheck(inputId);
		if (customerDbVO == null) {
			response.setContentType("text/html; charset=UTF-8");
			mav.addObject("sendMessage", "idFail");
			mav.setViewName("login");
		}else {
			String dbPassword = customerDbVO.getCustomer_password();
			String inputPassword = customerVO.getCustomer_password();

			// 인증 진행.
			if (!passwordEncoder.matches(inputPassword, dbPassword)) {
				response.setContentType("text/html; charset=UTF-8");
				mav.addObject("sendMessage", "pwFail");
				mav.setViewName("login");
			}else {
				boolean passwordResult = passwordEncoder.matches(inputPassword, dbPassword);
				System.out.println("비밀번호 일치 결과 : " + passwordResult);
				// 로그인이 성공하면 CustomerVO객체를 반환.
				CustomerVO vo = service.login(customerVO);
				if (vo != null) { // 로그인 성공.
					session.setAttribute("login_session", vo.getCustomer_id());
					if(vo.getCustomer_image().equals("profile.png")) {
						session.setAttribute("my_image", "profile.png");
					}else{	
						session.setAttribute("my_image", vo.getCustomer_image());
					}
					mav.setViewName("index");
				}else {
					mav.setViewName("login");
				}
			}
		}
		return mav;
	}
	
	@RequestMapping(value = "/customerInfoUpdate.do", method = RequestMethod.POST)
	public ModelAndView customerInfoUpdate(CustomerVO vo, ModelAndView mav, HttpSession session, MultipartFile multipartFile, HttpServletRequest request)throws Exception{
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/images/profile/");
		String customer_email = vo.getCustomer_email(); // 사용자가 입력한 이메일을 가져온다.
		// 블랙리스트에 존재하는 이메일인지 확인.
		if (service.createEmailCheck(customer_email) == 1 && service.blacklistEmailCheck(vo) == 0) {
			String sessionId = (String)session.getAttribute("login_session");
			CustomerVO cvo = service.getCustomerInfo(sessionId); // 먼저 세션아이디를 이용해 디비에서 사용자 정보를 가져온다.
			String dbImage = cvo.getCustomer_image(); // 디비에 있는 사용자 프로필 이미지 주소를 가져온다.
			multipartFile = vo.getCustomer_photo();
			if (multipartFile != null && multipartFile.isEmpty() == false) { // 새로 첨부한 사진 파일이 있다면,
				String originalName = multipartFile.getOriginalFilename();
				String path = uploadFileUtils.uploadFile(uploadPath, originalName, multipartFile.getBytes());
				vo.setCustomer_image(path);
			}else { // 기존의 사진 파일을 그대로 저장하는 거면,
				vo.setCustomer_image(dbImage);
			}
			int result = service.customerInfoUpdate(vo);
			if (result == 1) {
				if (cvo.getCustomer_type().equals("host")) {
					HostVO hostVO = new HostVO();
					hostVO.setHost_id(sessionId);
					hostVO.setHost_name(vo.getCustomer_name());
					hostVO.setHost_phone(vo.getCustomer_phone());
					hostVO.setHost_email(vo.getCustomer_email());
					hostVO.setHost_account_name(vo.getCustomer_refund_bank());
					hostVO.setHost_account(vo.getCustomer_refund_account());
					hostVO.setHost_image(vo.getCustomer_image());
					service.hostInfoUpdate(hostVO);
				}
				CustomerVO customerVO = new CustomerVO();
				customerVO = service.getCustomerInfo(sessionId);	
				String filePath = customerVO.getCustomer_image();
				Map<String, String> fdata = new HashMap<String, String>();
				File file = new File(uploadPath + filePath);
				fdata.put("filePath", filePath);
				mav.addObject("customerName", customerVO.getCustomer_name());
				mav.addObject("customerPhone", customerVO.getCustomer_phone());
				mav.addObject("customerEmail", customerVO.getCustomer_email());
				mav.addObject("customerBank", customerVO.getCustomer_refund_bank());
				mav.addObject("customerAccount", customerVO.getCustomer_refund_account());
				mav.addObject("customerImage", filePath);
				session.setAttribute("my_image", filePath);
				mav.setViewName("mypage");
				mav.addObject("fdata", fdata);
				mav.addObject("resultMessage", "회원 정보가 수정되었습니다.");
			}else {
				CustomerVO customerVO = new CustomerVO();
				customerVO = service.getCustomerInfo(sessionId);	
				String filePath = customerVO.getCustomer_image();
				Map<String, String> fdata = new HashMap<String, String>();
				File file = new File(uploadPath + filePath);
				fdata.put("filePath", filePath);
				mav.addObject("customerName", customerVO.getCustomer_name());
				mav.addObject("customerPhone", customerVO.getCustomer_phone());
				mav.addObject("customerEmail", customerVO.getCustomer_email());
				mav.addObject("customerBank", customerVO.getCustomer_refund_bank());
				mav.addObject("customerAccount", customerVO.getCustomer_refund_account());
				mav.addObject("customerImage", filePath);
				session.setAttribute("my_image", filePath);
				mav.setViewName("mypage");
				mav.addObject("fdata", fdata);
				mav.addObject("resultMessage","회원 정보 수정에 실패하였습니다.");
			}
		}else {
			String sessionId = (String)session.getAttribute("login_session");
			CustomerVO customerVO = new CustomerVO();
			customerVO = service.getCustomerInfo(sessionId);	
			String filePath = customerVO.getCustomer_image();
			Map<String, String> fdata = new HashMap<String, String>();
			File file = new File(uploadPath + filePath);
			fdata.put("filePath", filePath);
			mav.addObject("customerName", customerVO.getCustomer_name());
			mav.addObject("customerPhone", customerVO.getCustomer_phone());
			mav.addObject("customerEmail", customerVO.getCustomer_email());
			mav.addObject("customerBank", customerVO.getCustomer_refund_bank());
			mav.addObject("customerAccount", customerVO.getCustomer_refund_account());
			mav.addObject("customerImage", filePath);
			session.setAttribute("my_image", filePath);
			mav.setViewName("mypage");
			mav.addObject("fdata", fdata);
			mav.addObject("resultMessage","사용할 수 없는 이메일입니다.");
		}
		mav.setViewName("mypage");
		return mav;
	}
	
	// 호스트 신청 처리.
	@RequestMapping(value = "/hostRegister.do", method = RequestMethod.POST)
	public ModelAndView hostRegister(HostVO hostVO, CustomerVO customerVO, HttpSession session, HttpServletRequest request, ModelAndView mav, MultipartFile multipartFile)throws Exception{
			String uploadPath = request.getSession().getServletContext().getRealPath("/resources/images/profile/");
			String sessionId = (String)session.getAttribute("login_session");
			customerVO = service.getCustomerInfo(sessionId);	
			String filePath = customerVO.getCustomer_image();
			multipartFile = hostVO.getHost_photo();
			if (multipartFile != null && multipartFile.isEmpty() == false) {
				String originalName = multipartFile.getOriginalFilename();
				String path = uploadFileUtils.uploadFile(uploadPath, originalName, multipartFile.getBytes());
				hostVO.setHost_image(path);
			}else {
				hostVO.setHost_image(filePath);
			}
			int result = service.hostRegister(hostVO);
			if (result == 1) {
				customerVO.setCustomer_type("host");
				service.changeCustomerType(customerVO);
			}
		mav.setViewName("index");
		return mav;
	}

	@ResponseBody
	@RequestMapping(value = "/checkPassword.do", method = RequestMethod.POST)
	public int checkPassword(String customer_password, HttpSession session)throws Exception{
		String customerId = (String)session.getAttribute("login_session");
		String dbPassword = service.passwordCheck(customerId);
		String inputPassword = customer_password;
		if (!passwordEncoder.matches(inputPassword, dbPassword)){
			return 0;
		}else {
			return 1;
		}
	}
		
	@RequestMapping(value = "/modifyPassword.do", method = RequestMethod.POST)
	public String modifyPassword(CustomerVO customerVO, HttpSession session)throws Exception{
		String newPassword = customerVO.getCustomer_password();
		String newPwd = passwordEncoder.encode(newPassword);
		customerVO.setCustomer_password(newPwd);
		customerVO.setCustomer_id((String)session.getAttribute("login_session"));
		service.modifyPassword(customerVO);
		String sessionId = (String)session.getAttribute("login_session");
		CustomerVO vo = service.getCustomerInfo(sessionId);
		if(vo.getCustomer_type().equals("host")) {
			HostVO hostVO = new HostVO();
			hostVO.setHost_id(sessionId);
			hostVO.setHost_password(newPwd);
			service.hostModifyPassword(hostVO);
		}
		return "passwordChange";
	}
	
	@RequestMapping(value = "/passwordCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public int passwordCheck(CustomerVO customerVO, HttpSession session)throws Exception{
		String customerId = (String)session.getAttribute("login_session");
		String dbPassword = service.passwordCheck(customerId);
		String inputPassword = customerVO.getCustomer_password();
		if (!passwordEncoder.matches(inputPassword, dbPassword)){
			return 0;
		}else {
			return 1;
		}
	}
	
	@RequestMapping(value = "/customerWithdrawal.do", method = RequestMethod.POST)
	public String customerWithdrawal(CustomerVO vo, HttpSession session)throws Exception{
		String customerId = (String)session.getAttribute("login_session");
		String hostId = (String)session.getAttribute("login_session");
		CustomerVO customerVO = service.getCustomerInfo(customerId);
		if (customerVO.getCustomer_type().equals("host")) {
			service.hostWithdrawal(hostId);
		}
		service.customerWithdrawal(customerId);
		session.invalidate();
		return "index";
	}

	@RequestMapping(value = "/logout.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response)throws Exception{
		Object object = (Object)session.getAttribute("login_session");
		String obj = String.valueOf(object);
		if (obj != null) {
			session.removeAttribute("login_session");
			session.invalidate();
		}
		return "index";
	}

	@RequestMapping(value = "/kakaologout.do", produces = "application/json")
	public String kakaoLogout(HttpSession session)throws Exception{
		JsonNode jsonToken = kakaoController.Logout(session.getAttribute("login_session").toString());
		session.invalidate();
		return "index";
	}	
}
