package Product;

public class productDto {
	private String Snum;
	private String Sname;
	private String Sinfo;
	private String Spic;
	private String Sprice;
	
	public productDto() {};
	
	public productDto(String snum, String sname, String sinfo, String spic, String sprice) {
		super();
		Snum = snum;
		Sname = sname;
		Sinfo = sinfo;
		Spic = spic;
		Sprice = sprice;
	}

	public String getSnum() {
		return Snum;
	}

	public void setSnum(String snum) {
		Snum = snum;
	}

	public String getSname() {
		return Sname;
	}

	public void setSname(String sname) {
		Sname = sname;
	}

	public String getSinfo() {
		return Sinfo;
	}

	public void setSinfo(String sinfo) {
		Sinfo = sinfo;
	}

	public String getSpic() {
		return Spic;
	}

	public void setSpic(String spic) {
		Spic = spic;
	}

	public String getSprice() {
		return Sprice;
	}

	public void setSprice(String sprice) {
		Sprice = sprice;
	}


	
}
