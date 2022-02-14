package suamil;

import java.sql.Date;

public class listboardDTO {
	private String goods_num;
	private String goods_choice;
	private String goods_image;
	private String goods_id;
	private String goods_price;
	private String goods_stampprice;
	private String goods_count;
	private String goods_content;
	private java.sql.Date reg_date;
	
	public String getGoods_num() {
		return goods_num;
	}
	public void setGoods_num(String goods_num) {
		this.goods_num = goods_num;
	}
	public String getGoods_choice() {
		return goods_choice;
	}
	public void setGoods_choice(String goods_choice) {
		this.goods_choice = goods_choice;
	}
	public String getGoods_image() {
		return goods_image;
	}
	public void setGoods_image(String goods_image) {
		this.goods_image = goods_image;
	}
	public String getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(String goods_id) {
		this.goods_id = goods_id;
	}
	public String getGoods_price() {
		return goods_price;
	}
	public void setGoods_price(String goods_price) {
		this.goods_price = goods_price;
	}
	public String getGoods_stampprice() {
		return goods_stampprice;
	}
	public void setGoods_stampprice(String goods_stampprice) {
		this.goods_stampprice = goods_stampprice;
	}
	public String getGoods_count() {
		return goods_count;
	}
	public void setGoods_count(String goods_count) {
		this.goods_count = goods_count;
	}
	public String getGoods_content() {
		return goods_content;
	}
	public void setGoods_content(String goods_content) {
		this.goods_content = goods_content;
	}
	public java.sql.Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(java.sql.Date date) {
		this.reg_date = date;
	}
}
