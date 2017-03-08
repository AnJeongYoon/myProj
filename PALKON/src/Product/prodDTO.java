package Product;

import java.io.Serializable;
import java.sql.*;

public class prodDTO implements Serializable{
	private int pr_board_num;
	private String pr_pro_code;
	private String pr_product;
	private String pr_size;
	private String pr_category;
	private String pr_brand;
	private int pr_price;
	private String pr_discount;
	private int pr_buy_cnt;
	private int pr_stock;
	private String pr_orgin;
	private String pr_color;
	private String pr_pro_info;
	private String pr_reg_date;
	private String pr_recent_date;
	private String pr_orgin_code;
	private String pr_length;
	private String pr_material;
	private String pr_status;
	private String pr_available;


	private int pi_num;
	private int pi_board_num;
	private String pi_pro_code;
	private String image_path;
	private int image_size;
	private String img_category;
	private String image_name;
	
	private int sc_pro_cnt;
	private int sc_num;
	
	
	public int getSc_num() {
		return sc_num;
	}
	public void setSc_num(int sc_num) {
		this.sc_num = sc_num;
	}


	
	
	public String getPr_discount() {
		return pr_discount;
	}
	public void setPr_discount(String pr_discount) {
		this.pr_discount = pr_discount;
	}
	public int getSc_pro_cnt() {
		return sc_pro_cnt;
	}
	public void setSc_pro_cnt(int sc_pro_cnt) {
		this.sc_pro_cnt = sc_pro_cnt;
	}
	public int getPr_board_num() {
		return pr_board_num;
	}
	public void setPr_board_num(int pr_board_num) {
		this.pr_board_num = pr_board_num;
	}
	public String getPr_pro_code() {
		return pr_pro_code;
	}
	public void setPr_pro_code(String pr_pro_code) {
		this.pr_pro_code = pr_pro_code;
	}
	public String getPr_product() {
		return pr_product;
	}
	public void setPr_product(String pr_product) {
		this.pr_product = pr_product;
	}
	public String getPr_size() {
		return pr_size;
	}
	public void setPr_size(String pr_size) {
		this.pr_size = pr_size;
	}
	public String getPr_category() {
		return pr_category;
	}
	public void setPr_category(String pr_category) {
		this.pr_category = pr_category;
	}
	public String getPr_brand() {
		return pr_brand;
	}
	public void setPr_brand(String pr_brand) {
		this.pr_brand = pr_brand;
	}
	public int getPr_price() {
		return pr_price;
	}
	public void setPr_price(int pr_price) {
		this.pr_price = pr_price;
	}
	public int getPr_buy_cnt() {
		return pr_buy_cnt;
	}
	public void setPr_buy_cnt(int pr_buy_cnt) {
		this.pr_buy_cnt = pr_buy_cnt;
	}
	public int getPr_stock() {
		return pr_stock;
	}
	public void setPr_stock(int pr_stock) {
		this.pr_stock = pr_stock;
	}
	public String getPr_orgin() {
		return pr_orgin;
	}
	public void setPr_orgin(String pr_orgin) {
		this.pr_orgin = pr_orgin;
	}
	public String getPr_color() {
		return pr_color;
	}
	public void setPr_color(String pr_color) {
		this.pr_color = pr_color;
	}
	public String getPr_pro_info() {
		return pr_pro_info;
	}
	public void setPr_pro_info(String pr_pro_info) {
		this.pr_pro_info = pr_pro_info;
	}
	public String getPr_reg_date() {
		return pr_reg_date;
	}
	public void setPr_reg_date(String pr_reg_date) {
		this.pr_reg_date = pr_reg_date;
	}
	public String getPr_recent_date() {
		return pr_recent_date;
	}
	public void setPr_recent_date(String pr_recent_date) {
		this.pr_recent_date = pr_recent_date;
	}
	public String getPr_orgin_code() {
		return pr_orgin_code;
	}
	public void setPr_orgin_code(String pr_orgin_code) {
		this.pr_orgin_code = pr_orgin_code;
	}
	public String getPr_length() {
		return pr_length;
	}
	public void setPr_length(String pr_length) {
		this.pr_length = pr_length;
	}
	public String getPr_material() {
		return pr_material;
	}
	public void setPr_material(String pr_material) {
		this.pr_material = pr_material;
	}
	public int getPi_num() {
		return pi_num;
	}
	public void setPi_num(int pi_num) {
		this.pi_num = pi_num;
	}
	
	public int getPi_board_num() {
		return pi_board_num;
	}
	public void setPi_board_num(int pi_board_num) {
		this.pi_board_num = pi_board_num;
	}
	public String getPi_pro_code() {
		return pi_pro_code;
	}
	public void setPi_pro_code(String pi_pro_code) {
		this.pi_pro_code = pi_pro_code;
	}
	public String getImage_path() {
		return image_path;
	}
	public void setImage_path(String image_path) {
		this.image_path = image_path;
	}
	public int getImage_size() {
		return image_size;
	}
	public void setImage_size(int image_size) {
		this.image_size = image_size;
	}
	public String getImg_category() {
		return img_category;
	}
	public void setImg_category(String img_category) {
		this.img_category = img_category;
	}
	public String getImage_name() {
		return image_name;
	}
	public void setImage_name(String image_name) {
		this.image_name = image_name;
	}
	public String getPr_status() {
		return pr_status;
	}
	public void setPr_status(String pr_status) {
		this.pr_status = pr_status;
	}
	public String getPr_available() {
		return pr_available;
	}
	public void setPr_available(String pr_available) {
		this.pr_available = pr_available;
	}

	

}
