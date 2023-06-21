
//login_dto
//
/**=======================================
 * 작성자 : yungday
 * 작성일자 : 2023. 5. 10.
 * 파일명 : Login_Dto.java
 * 프로그램설명 :
 *    - DB의 login 테이블의 데이터를 처리하기위한 클래스
 *    - 데이터 베이스에서 검색해온 데이터를 넣어서 전달
 =======================================**/
package login;

public class LoginDto {
   //propertiy
	private String Mid;
	private String pwd;
	private String Mname;
	private String Maddr;
	private String Mphone;
	private String Mbirth;
	private String Msms;
	private String Memail;
	private int ManageLvl = 1;

	

	public LoginDto(){};
	
	public LoginDto(String Mid, String pwd, String Mname, String Maddr, String Mphone, String Mbirth, String Msms, String Memail) {
		super();
		this.Mid = Mid;
		this.pwd = pwd;
		this.Mname = Mname;
		this.Maddr = Maddr;
		this.Mphone = Mphone;
		this.Mbirth = Mbirth;
		this.Msms = Msms;
		this.Memail = Memail;
	}
	
	public String getMid() {
		return Mid;
	}
	
	public void setMid(String mid) {
		Mid = mid;
	}
	
	public String getPwd() {
		return pwd;
	}
	
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
	public String getMname() {
		return Mname;
	}
	
	public void setMname(String mname) {
		Mname = mname;
	}
	
	public String getMaddr() {
		return Maddr;
	}
	
	public void setMaddr(String maddr) {
		Maddr = maddr;
	}
	
	public String getMphone() {
		return Mphone;
	}
	
	public void setMphone(String mphone) {
		Mphone = mphone;
	}
	
	public String getMbirth() {
		return Mbirth;
	}
	
	public void setMbirth(String mbirth) {
		Mbirth = mbirth;
	}
	
	public String getMsms() {
		return Msms;
	}
	
	public void setMsms(String msms) {
		Msms = msms;
	}
	
	public String getMemail() {
		return Memail;
	}
	
	public void setMemail(String memail) {
		Memail = memail;
	}
}
	
	
	