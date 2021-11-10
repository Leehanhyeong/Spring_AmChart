package test.vo;

public class CountryVO {
	String name;
	int litres;
	
	
	public CountryVO(String name, int litres) {
		super();
		this.name = name;
		this.litres = litres;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getLitres() {
		return litres;
	}
	public void setLitres(int litres) {
		this.litres = litres;
	}
	
	
}
