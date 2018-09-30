package database;

@SuppressWarnings({ "rawtypes" })
public class MenuDetails implements Comparable {
	private int id = 0;
	private String type = null;
	private String name = null;
	private String image = null;
	private String desc_eng = null;
	private String desc_chinese = null;
	private int price = 0;

	public MenuDetails() {
	}

	public MenuDetails(int id, String type, String name, String image, String desc_eng, String desc_chinese,
			int price) {
		this.id = id;
		this.type = type;
		this.name = name;
		this.image = image;
		this.desc_eng = desc_eng;
		this.desc_chinese = desc_chinese;
		this.price = price;
	}

	public int getId() {
		return this.id;
	}

	public String getType() {
		return this.type;
	}

	public String getName() {
		return this.name;
	}

	public String getImage() {
		return this.image;
	}

	public String getDescEng() {
		return this.desc_eng;
	}

	public String getDescChinese() {
		return this.desc_chinese;
	}

	public int getPrice() {
		return this.price;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setType(String type) {
		this.type = type;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public void setDescEng(String desc_eng) {
		this.desc_eng = desc_eng;
	}

	public void setDescChinese(String desc_chinese) {
		this.desc_chinese = desc_chinese;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int compareTo(Object o) {
		MenuDetails n = (MenuDetails) o;
		int lastCmp = name.compareTo(n.name);

		return (lastCmp);
	}
}
