package kg.air.cnc.vo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ReservationHouseDetailVO {
	private int house_seq;
	private int house_maxperson;
	private int house_bed_amount;
	private int house_bed_type_single;
	private int house_bed_type_double;
	private int house_bed_type_queen;
	private int house_bathroom_amount;
	private String house_location;
	private String house_location_sido;
	private String house_location_gugun;
	private String house_location_postnum;
	private String house_defaultsetting;
	private String house_default_tv;
	private String house_default_wifi;
	private String house_default_heater;
	private String house_default_cooler;
	private String house_default_iron;
	private String house_default_fireditecter;
	private String house_default_coditecter;
	private String house_default_aidkit;
	private String house_default_firesofwa;
	private String house_default_bedrock;
	private String house_default_livingroom_type;
	private String house_default_kitchen;
	private String house_default_laundry_washer;
	private String house_default_laundry_dryer;
	private String house_default_parking;
	private String house_default_gym;
	private String house_default_pool;
	private String house_desc1;
	private String house_desc2;
	private String house_desc3;
	private String house_desc4;
	private String house_desc5;
	private String house_photourl;
	private String [] house_photourl_list;
	private String house_name;
	private String house_condition_childok;
	private String house_condition_babyok;
	private String house_condition_smokeok;
	private String house_condition_partyok;
	private String house_condition_petok;
	private String house_restrict_stairs;
	private String house_restrict_noise;
	private String house_restrict_pet;
	private String house_restrict_cantpark;
	private String house_restrict_commonspace;
	private String house_restrict_facility;
	private String house_restrict_cctv;
	private String house_restrict_weapon;
	private String house_restrict_beast;
	private String house_xlocation;
	private String house_ylocation;
	private float fhouse_xlocation;
	private float fhouse_ylocation;
	private int house_price_default;
	private int house_price_max;
	private String house_checkin_time;
	private String house_checkout_time;
	private int house_status;
	private String house_status_text;
	private String host_id;
	private String host_name;
    private String host_image;
    private String host_phone;
    private Date host_regdate;
    private String reservation_status_text;
	private int reservation_seq;
	private int reservation_status;
	private int reservation_price;
	private String reservation_customer_id;
	private String check_in_day;
	private String house_person;
	private String check_in;
	private String check_out;
	private String reservation_check_in;
	private String reservation_check_out;
    private ArrayList<String> convinList;
    private ArrayList<String> restricList;
    private ArrayList<String> conditionList;
    private String accessType;
    private String favoriteHouse_String;
    private ArrayList<Integer> favoriteHouse_list;
    private String favorite_state;
    private String customer_name;
    private String customer_phone;
    private String house_photourl_detail1;
    private String house_photourl_detail2;
    private String house_photourl_detail3;
    private String house_photourl_detail4;
    
	public String getHouse_photourl_detail1() {
		return house_photourl_detail1;
	}
	public void setHouse_photourl_detail1(String house_photourl_detail1) {
		this.house_photourl_detail1 = house_photourl_detail1;
	}
	public String getHouse_photourl_detail2() {
		return house_photourl_detail2;
	}
	public void setHouse_photourl_detail2(String house_photourl_detail2) {
		this.house_photourl_detail2 = house_photourl_detail2;
	}
	public String getHouse_photourl_detail3() {
		return house_photourl_detail3;
	}
	public void setHouse_photourl_detail3(String house_photourl_detail3) {
		this.house_photourl_detail3 = house_photourl_detail3;
	}
	public String getHouse_photourl_detail4() {
		return house_photourl_detail4;
	}
	public void setHouse_photourl_detail4(String house_photourl_detail4) {
		this.house_photourl_detail4 = house_photourl_detail4;
	}
	public String[] getHouse_photourl_list() {
		return house_photourl_list;
	}
	public void setHouse_photourl_list(String[] house_photourl_list) {
		this.house_photourl_list = house_photourl_list;
	}
	public String getCheck_in_day() {
		return check_in_day;
	}
	public void setCheck_in_day(String check_in_day) {
		this.check_in_day = check_in_day;
	}
	public String getReservation_customer_id() {
		return reservation_customer_id;
	}
	public void setReservation_customer_id(String reservation_customer_id) {
		this.reservation_customer_id = reservation_customer_id;
	}
    public int getReservation_price() {
		return reservation_price;
	}
	public void setReservation_price(int reservation_price) {
		this.reservation_price = reservation_price;
	}
	public String getCustomer_name() {
		return customer_name;
	}
	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}
	public String getCustomer_phone() {
		return customer_phone;
	}
	public void setCustomer_phone(String customer_phone) {
		this.customer_phone = customer_phone;
	}

	public String getCheck_in() {
		return check_in;
	}
	public void setCheck_in(String check_in) {
		this.check_in = check_in;
	}
	public String getCheck_out() {
		return check_out;
	}
	public void setCheck_out(String check_out) {
		this.check_out = check_out;
	}
	
	public String getHouse_person() {
		return house_person;
	}
	public void setHouse_person(String house_person) {
		this.house_person = house_person;
	}
	public String getReservation_check_in() {
		return reservation_check_in;
	}
	public void setReservation_check_in(String reservation_check_in) {
		this.reservation_check_in = reservation_check_in;
	}
	public String getReservation_check_out() {
		return reservation_check_out;
	}
	public void setReservation_check_out(String reservation_check_out) {
		this.reservation_check_out = reservation_check_out;
	}
	public String getFavorite_state() {
		return favorite_state;
	}
	public void setFavorite_state(String favorite_state) {
		this.favorite_state = favorite_state;
	}
	public String getFavoriteHouse_String() {
		return favoriteHouse_String;
	}
	public void setFavoriteHouse_String(String favoriteHouse_String) {
		this.favoriteHouse_String = favoriteHouse_String;
	}
	public ArrayList<Integer> getFavoriteHouse_list() {
		return favoriteHouse_list;
	}
	public void setFavoriteHouse_list(ArrayList<Integer> favoriteHouse_list) {
		this.favoriteHouse_list = favoriteHouse_list;
	}
	public String getReservation_status_text() {
		return reservation_status_text;
	}
	public void setReservation_status_text(String reservation_status_text) {
		this.reservation_status_text = reservation_status_text;
	}
	public int getReservation_status() {
		return reservation_status;
	}
	public void setReservation_status(int reservation_status) {
		this.reservation_status = reservation_status;
	}
	public int getHouse_status() {
		return house_status;
	}
	public void setHouse_status(int house_status) {
		this.house_status = house_status;
	}
	public String getHouse_status_text() {
		return house_status_text;
	}
	public void setHouse_status_text(String house_status_text) {
		this.house_status_text = house_status_text;
	}
	public String getHost_id() {
		return host_id;
	}
	public void setHost_id(String host_id) {
		this.host_id = host_id;
	}
	public String getAccessType() {
		return accessType;
	}
	public void setAccessType(String accessType) {
		this.accessType = accessType;
	}
	public ArrayList<String> getConvinList() {
		return convinList;
	}
	public void setConvinList(ArrayList<String> convinList) {
		this.convinList = convinList;
	}

	public ArrayList<String> getRestricList() {
		return restricList;
	}
	public void setRestricList(ArrayList<String> restricList) {
		this.restricList = restricList;
	}
	public ArrayList<String> getConditionList() {
		return conditionList;
	}
	public void setConditionList(ArrayList<String> conditionList) {
		this.conditionList = conditionList;
	}
	public int getReservation_seq() {
		return reservation_seq;
	}
	public void setReservation_seq(int reservation_seq) {
		this.reservation_seq = reservation_seq;
	}
	public int getHouse_seq() {
		return house_seq;
	}
	public void setHouse_seq(int house_seq) {
		this.house_seq = house_seq;
	}
	public int getHouse_maxperson() {
		return house_maxperson;
	}
	public String getHouse_defaultsetting() {
		return house_defaultsetting;
	}
	public void setHouse_defaultsetting(String house_defaultsetting) {
		this.house_defaultsetting = house_defaultsetting;
	}
	public String getHouse_default_tv() {
		return house_default_tv;
	}
	public void setHouse_default_tv(String house_default_tv) {
		this.house_default_tv = house_default_tv;
	}
	public int getHouse_price_default() {
		return house_price_default;
	}
	public void setHouse_price_default(int house_price_default) {
		this.house_price_default = house_price_default;
	}
	public int getHouse_price_max() {
		return house_price_max;
	}
	public void setHouse_price_max(int house_price_max) {
		this.house_price_max = house_price_max;
	}
	public void setHouse_maxperson(int house_maxperson) {
		this.house_maxperson = house_maxperson;
	}
	public int getHouse_bed_amount() {
		return house_bed_amount;
	}
	public void setHouse_bed_amount(int house_bed_amount) {
		this.house_bed_amount = house_bed_amount;
	}
	public int getHouse_bed_type_single() {
		return house_bed_type_single;
	}
	public void setHouse_bed_type_single(int house_bed_type_single) {
		this.house_bed_type_single = house_bed_type_single;
	}
	
	public String getHouse_condition_petok() {
		return house_condition_petok;
	}
	public void setHouse_condition_petok(String house_condition_petok) {
		this.house_condition_petok = house_condition_petok;
	}
	public int getHouse_bed_type_double() {
		return house_bed_type_double;
	}
	public void setHouse_bed_type_double(int house_bed_type_double) {
		this.house_bed_type_double = house_bed_type_double;
	}
	public int getHouse_bed_type_queen() {
		return house_bed_type_queen;
	}
	public void setHouse_bed_type_queen(int house_bed_type_queen) {
		this.house_bed_type_queen = house_bed_type_queen;
	}
	public int getHouse_bathroom_amount() {
		return house_bathroom_amount;
	}
	public void setHouse_bathroom_amount(int house_bathroom_amount) {
		this.house_bathroom_amount = house_bathroom_amount;
	}
	public String getHouse_location() {
		return house_location;
	}
	public void setHouse_location(String house_location) {
		this.house_location = house_location;
	}
	public String getHouse_location_sido() {
		return house_location_sido;
	}
	public void setHouse_location_sido(String house_location_sido) {
		this.house_location_sido = house_location_sido;
	}
	public String getHouse_location_gugun() {
		return house_location_gugun;
	}
	public void setHouse_location_gugun(String house_location_gugun) {
		this.house_location_gugun = house_location_gugun;
	}
	public String getHouse_location_postnum() {
		return house_location_postnum;
	}
	public void setHouse_location_postnum(String house_location_postnum) {
		this.house_location_postnum = house_location_postnum;
	}
	public String getHouse_default_wifi() {
		return house_default_wifi;
	}
	public void setHouse_default_wifi(String house_default_wifi) {
		this.house_default_wifi = house_default_wifi;
	}
	public String getHouse_default_heater() {
		return house_default_heater;
	}
	public void setHouse_default_heater(String house_default_heater) {
		this.house_default_heater = house_default_heater;
	}
	public String getHouse_default_cooler() {
		return house_default_cooler;
	}
	public void setHouse_default_cooler(String house_default_cooler) {
		this.house_default_cooler = house_default_cooler;
	}
	public String getHouse_default_iron() {
		return house_default_iron;
	}
	public void setHouse_default_iron(String house_default_iron) {
		this.house_default_iron = house_default_iron;
	}
	public String getHouse_default_fireditecter() {
		return house_default_fireditecter;
	}
	public void setHouse_default_fireditecter(String house_default_fireditecter) {
		this.house_default_fireditecter = house_default_fireditecter;
	}
	public String getHouse_default_coditecter() {
		return house_default_coditecter;
	}
	public void setHouse_default_coditecter(String house_default_coditecter) {
		this.house_default_coditecter = house_default_coditecter;
	}
	public String getHouse_default_aidkit() {
		return house_default_aidkit;
	}
	public void setHouse_default_aidkit(String house_default_aidkit) {
		this.house_default_aidkit = house_default_aidkit;
	}
	public String getHouse_default_firesofwa() {
		return house_default_firesofwa;
	}
	public void setHouse_default_firesofwa(String house_default_firesofwa) {
		this.house_default_firesofwa = house_default_firesofwa;
	}
	public String getHouse_default_bedrock() {
		return house_default_bedrock;
	}
	public void setHouse_default_bedrock(String house_default_bedrock) {
		this.house_default_bedrock = house_default_bedrock;
	}
	public String getHouse_default_livingroom_type() {
		return house_default_livingroom_type;
	}
	public void setHouse_default_livingroom_type(String house_default_livingroom_type) {
		this.house_default_livingroom_type = house_default_livingroom_type;
	}
	public String getHouse_default_kitchen() {
		return house_default_kitchen;
	}
	public void setHouse_default_kitchen(String house_default_kitchen) {
		this.house_default_kitchen = house_default_kitchen;
	}
	public String getHouse_default_laundry_washer() {
		return house_default_laundry_washer;
	}
	public void setHouse_default_laundry_washer(String house_default_laundry_washer) {
		this.house_default_laundry_washer = house_default_laundry_washer;
	}
	public String getHouse_default_laundry_dryer() {
		return house_default_laundry_dryer;
	}
	public void setHouse_default_laundry_dryer(String house_default_laundry_dryer) {
		this.house_default_laundry_dryer = house_default_laundry_dryer;
	}
	public String getHouse_default_parking() {
		return house_default_parking;
	}
	public void setHouse_default_parking(String house_default_parking) {
		this.house_default_parking = house_default_parking;
	}
	public String getHouse_default_gym() {
		return house_default_gym;
	}
	public void setHouse_default_gym(String house_default_gym) {
		this.house_default_gym = house_default_gym;
	}
	public String getHouse_default_pool() {
		return house_default_pool;
	}
	public void setHouse_default_pool(String house_default_pool) {
		this.house_default_pool = house_default_pool;
	}
	public String getHouse_desc1() {
		return house_desc1;
	}
	public void setHouse_desc1(String house_desc1) {
		this.house_desc1 = house_desc1;
	}
	public String getHouse_desc2() {
		return house_desc2;
	}
	public void setHouse_desc2(String house_desc2) {
		this.house_desc2 = house_desc2;
	}
	public String getHouse_desc3() {
		return house_desc3;
	}
	public void setHouse_desc3(String house_desc3) {
		this.house_desc3 = house_desc3;
	}
	public String getHouse_desc4() {
		return house_desc4;
	}
	public void setHouse_desc4(String house_desc4) {
		this.house_desc4 = house_desc4;
	}
	public String getHouse_desc5() {
		return house_desc5;
	}
	public void setHouse_desc5(String house_desc5) {
		this.house_desc5 = house_desc5;
	}
	public String getHouse_photourl() {
		return house_photourl;
	}
	public void setHouse_photourl(String house_photourl) {
		this.house_photourl = house_photourl;
	}
	public String getHouse_name() {
		return house_name;
	}
	public void setHouse_name(String house_name) {
		this.house_name = house_name;
	}
	public String getHouse_condition_childok() {
		return house_condition_childok;
	}
	public void setHouse_condition_childok(String house_condition_childok) {
		this.house_condition_childok = house_condition_childok;
	}
	public String getHouse_condition_babyok() {
		return house_condition_babyok;
	}
	public void setHouse_condition_babyok(String house_condition_babyok) {
		this.house_condition_babyok = house_condition_babyok;
	}
	public String getHouse_condition_smokeok() {
		return house_condition_smokeok;
	}
	public void setHouse_condition_smokeok(String house_condition_smokeok) {
		this.house_condition_smokeok = house_condition_smokeok;
	}
	public String getHouse_condition_partyok() {
		return house_condition_partyok;
	}
	public void setHouse_condition_partyok(String house_condition_partyok) {
		this.house_condition_partyok = house_condition_partyok;
	}
	public String getHouse_restrict_stairs() {
		return house_restrict_stairs;
	}
	public void setHouse_restrict_stairs(String house_restrict_stairs) {
		this.house_restrict_stairs = house_restrict_stairs;
	}
	public String getHouse_restrict_noise() {
		return house_restrict_noise;
	}
	public void setHouse_restrict_noise(String house_restrict_noise) {
		this.house_restrict_noise = house_restrict_noise;
	}
	public String getHouse_restrict_pet() {
		return house_restrict_pet;
	}
	public void setHouse_restrict_pet(String house_restrict_pet) {
		this.house_restrict_pet = house_restrict_pet;
	}
	public String getHouse_restrict_cantpark() {
		return house_restrict_cantpark;
	}
	public void setHouse_restrict_cantpark(String house_restrict_cantpark) {
		this.house_restrict_cantpark = house_restrict_cantpark;
	}
	public String getHouse_restrict_commonspace() {
		return house_restrict_commonspace;
	}
	public void setHouse_restrict_commonspace(String house_restrict_commonspace) {
		this.house_restrict_commonspace = house_restrict_commonspace;
	}
	public String getHouse_restrict_facility() {
		return house_restrict_facility;
	}
	public void setHouse_restrict_facility(String house_restrict_facility) {
		this.house_restrict_facility = house_restrict_facility;
	}
	public String getHouse_restrict_cctv() {
		return house_restrict_cctv;
	}
	public void setHouse_restrict_cctv(String house_restrict_cctv) {
		this.house_restrict_cctv = house_restrict_cctv;
	}
	public String getHouse_restrict_weapon() {
		return house_restrict_weapon;
	}
	public void setHouse_restrict_weapon(String house_restrict_weapon) {
		this.house_restrict_weapon = house_restrict_weapon;
	}
	public String getHouse_restrict_beast() {
		return house_restrict_beast;
	}
	public void setHouse_restrict_beast(String house_restrict_beast) {
		this.house_restrict_beast = house_restrict_beast;
	}
	public String getHouse_xlocation() {
		return house_xlocation;
	}
	public void setHouse_xlocation(String house_xlocation) {
		this.house_xlocation = house_xlocation;
	}
	public String getHouse_ylocation() {
		return house_ylocation;
	}
	public void setHouse_ylocation(String house_ylocation) {
		this.house_ylocation = house_ylocation;
	}
	public float getFhouse_xlocation() {
		return fhouse_xlocation;
	}
	public void setFhouse_xlocation(float fhouse_xlocation) {
		this.fhouse_xlocation = fhouse_xlocation;
	}
	public float getFhouse_ylocation() {
		return fhouse_ylocation;
	}
	public void setFhouse_ylocation(float fhouse_ylocation) {
		this.fhouse_ylocation = fhouse_ylocation;
	}
	public String getHouse_checkin_time() {
		return house_checkin_time;
	}
	public void setHouse_checkin_time(String house_checkin_time) {
		this.house_checkin_time = house_checkin_time;
	}
	public String getHouse_checkout_time() {
		return house_checkout_time;
	}
	public void setHouse_checkout_time(String house_checkout_time) {
		this.house_checkout_time = house_checkout_time;
	}
	public String getHost_name() {
		return host_name;
	}
	public void setHost_name(String host_name) {
		this.host_name = host_name;
	}
	public String getHost_image() {
		return host_image;
	}
	public void setHost_image(String host_image) {
		this.host_image = host_image;
	}
	public String getHost_phone() {
		return host_phone;
	}
	public void setHost_phone(String host_phone) {
		this.host_phone = host_phone;
	}
	public Date getHost_regdate() {
		return host_regdate;
	}
	public void setHost_regdate(Date host_regdate) {
		this.host_regdate = host_regdate;
	}
	@Override
	public String toString() {
		return "ReservationHouseDetailVO [house_seq=" + house_seq + ", house_maxperson=" + house_maxperson
				+ ", house_bed_amount=" + house_bed_amount + ", house_bed_type_single=" + house_bed_type_single
				+ ", house_bed_type_double=" + house_bed_type_double + ", house_bed_type_queen=" + house_bed_type_queen
				+ ", house_bathroom_amount=" + house_bathroom_amount + ", house_location=" + house_location
				+ ", house_location_sido=" + house_location_sido + ", house_location_gugun=" + house_location_gugun
				+ ", house_location_postnum=" + house_location_postnum + ", house_defaultsetting="
				+ house_defaultsetting + ", house_default_tv=" + house_default_tv + ", house_default_wifi="
				+ house_default_wifi + ", house_default_heater=" + house_default_heater + ", house_default_cooler="
				+ house_default_cooler + ", house_default_iron=" + house_default_iron + ", house_default_fireditecter="
				+ house_default_fireditecter + ", house_default_coditecter=" + house_default_coditecter
				+ ", house_default_aidkit=" + house_default_aidkit + ", house_default_firesofwa="
				+ house_default_firesofwa + ", house_default_bedrock=" + house_default_bedrock
				+ ", house_default_livingroom_type=" + house_default_livingroom_type + ", house_default_kitchen="
				+ house_default_kitchen + ", house_default_laundry_washer=" + house_default_laundry_washer
				+ ", house_default_laundry_dryer=" + house_default_laundry_dryer + ", house_default_parking="
				+ house_default_parking + ", house_default_gym=" + house_default_gym + ", house_default_pool="
				+ house_default_pool + ", house_desc1=" + house_desc1 + ", house_desc2=" + house_desc2
				+ ", house_desc3=" + house_desc3 + ", house_desc4=" + house_desc4 + ", house_desc5=" + house_desc5
				+ ", house_photourl=" + house_photourl + ", house_photourl_list=" + house_photourl_list
				+ ", house_name=" + house_name + ", house_condition_childok=" + house_condition_childok
				+ ", house_condition_babyok=" + house_condition_babyok + ", house_condition_smokeok="
				+ house_condition_smokeok + ", house_condition_partyok=" + house_condition_partyok
				+ ", house_condition_petok=" + house_condition_petok + ", house_restrict_stairs="
				+ house_restrict_stairs + ", house_restrict_noise=" + house_restrict_noise + ", house_restrict_pet="
				+ house_restrict_pet + ", house_restrict_cantpark=" + house_restrict_cantpark
				+ ", house_restrict_commonspace=" + house_restrict_commonspace + ", house_restrict_facility="
				+ house_restrict_facility + ", house_restrict_cctv=" + house_restrict_cctv + ", house_restrict_weapon="
				+ house_restrict_weapon + ", house_restrict_beast=" + house_restrict_beast + ", house_xlocation="
				+ house_xlocation + ", house_ylocation=" + house_ylocation + ", fhouse_xlocation=" + fhouse_xlocation
				+ ", fhouse_ylocation=" + fhouse_ylocation + ", house_price_default=" + house_price_default
				+ ", house_price_max=" + house_price_max + ", house_checkin_time=" + house_checkin_time
				+ ", house_checkout_time=" + house_checkout_time + ", house_status=" + house_status
				+ ", house_status_text=" + house_status_text + ", host_id=" + host_id + ", host_name=" + host_name
				+ ", host_image=" + host_image + ", host_phone=" + host_phone + ", host_regdate=" + host_regdate
				+ ", reservation_status_text=" + reservation_status_text + ", reservation_seq=" + reservation_seq
				+ ", reservation_status=" + reservation_status + ", reservation_price=" + reservation_price
				+ ", reservation_customer_id=" + reservation_customer_id + ", check_in_day=" + check_in_day
				+ ", house_person=" + house_person + ", check_in=" + check_in + ", check_out=" + check_out
				+ ", reservation_check_in=" + reservation_check_in + ", reservation_check_out=" + reservation_check_out
				+ ", convinList=" + convinList + ", restricList=" + restricList + ", conditionList=" + conditionList
				+ ", accessType=" + accessType + ", favoriteHouse_String=" + favoriteHouse_String
				+ ", favoriteHouse_list=" + favoriteHouse_list + ", favorite_state=" + favorite_state
				+ ", customer_name=" + customer_name + ", customer_phone=" + customer_phone + "]";
	}
    
	
}
