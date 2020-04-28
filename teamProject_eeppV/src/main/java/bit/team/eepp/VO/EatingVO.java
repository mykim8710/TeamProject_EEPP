package bit.team.eepp.VO;

import java.sql.Timestamp;

public class EatingVO {

	private int eId;
	private int User_id;
	private String eTitle;
	private String eCategory;
	private Timestamp eDate;
	private String eContent;
	private String eTel;
	private String eAddress_new;
	private String eAddress_old;
	private String eThema;
	private String eKeyword_food;
	private int rvCount;
	private float rvAVG;
	private int sCount;
	private int eHit;
	private String eParkInfo;
	private String eOpeningHour;

	public EatingVO() {

	}

	public EatingVO(int eId, int user_id, String eTitle, String eCategory, Timestamp eDate, String eContent,
			String eTel, String eAddress_new, String eAddress_old, String eThema, String eKeyword_food, int rvCount,
			float rvAVG, int sCount, int eHit, String eParkInfo, String eOpeningHour) {
		this.eId = eId;
		User_id = user_id;
		this.eTitle = eTitle;
		this.eCategory = eCategory;
		this.eDate = eDate;
		this.eContent = eContent;
		this.eTel = eTel;
		this.eAddress_new = eAddress_new;
		this.eAddress_old = eAddress_old;
		this.eThema = eThema;
		this.eKeyword_food = eKeyword_food;
		this.rvCount = rvCount;
		this.rvAVG = rvAVG;
		this.sCount = sCount;
		this.eHit = eHit;
		this.eParkInfo = eParkInfo;
		this.eOpeningHour = eOpeningHour;
	}

	public String geteParkInfo() {
		return eParkInfo;
	}

	public void seteParkInfo(String eParkInfo) {
		this.eParkInfo = eParkInfo;
	}

	public String geteOpeningHour() {
		return eOpeningHour;
	}

	public void seteOpeningHour(String eOpeningHour) {
		this.eOpeningHour = eOpeningHour;
	}

	public int geteHit() {
		return eHit;
	}

	public void seteHit(int eHit) {
		this.eHit = eHit;
	}

	public int getsCount() {
		return sCount;
	}

	public void setsCount(int sCount) {
		this.sCount = sCount;
	}

	public int geteId() {
		return eId;
	}

	public void seteId(int eId) {
		this.eId = eId;
	}

	public int getUser_id() {
		return User_id;
	}

	public void setUser_id(int user_id) {
		User_id = user_id;
	}

	public String geteTitle() {
		return eTitle;
	}

	public void seteTitle(String eTitle) {
		this.eTitle = eTitle;
	}

	public String geteCategory() {
		return eCategory;
	}

	public void seteCategory(String eCategory) {
		this.eCategory = eCategory;
	}

	public Timestamp geteDate() {
		return eDate;
	}

	public void seteDate(Timestamp eDate) {
		this.eDate = eDate;
	}

	public String geteContent() {
		return eContent;
	}

	public void seteContent(String eContent) {
		this.eContent = eContent;
	}

	public String geteTel() {
		return eTel;
	}

	public void seteTel(String eTel) {
		this.eTel = eTel;
	}

	public String geteAddress_new() {
		return eAddress_new;
	}

	public void seteAddress_new(String eAddress_new) {
		this.eAddress_new = eAddress_new;
	}

	public String geteAddress_old() {
		return eAddress_old;
	}

	public void seteAddress_old(String eAddress_old) {
		this.eAddress_old = eAddress_old;
	}

	public String geteThema() {
		return eThema;
	}

	public void seteThema(String eThema) {
		this.eThema = eThema;
	}

	public String geteKeyword_food() {
		return eKeyword_food;
	}

	public void seteKeyword_food(String eKeyword_food) {
		this.eKeyword_food = eKeyword_food;
	}

	public int getRvCount() {
		return rvCount;
	}

	public void setRvCount(int rvCount) {
		this.rvCount = rvCount;
	}

	public float getRvAVG() {
		return rvAVG;
	}

	public void setRvAVG(float rvAVG) {
		this.rvAVG = rvAVG;
	}

}