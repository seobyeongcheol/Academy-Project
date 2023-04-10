package com.Sport_Project001.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.Sport_Project001.dto.OrderDto;
import com.Sport_Project001.dto.ShopDto;


public interface ShopDao {
	
	@Select("SELECT * "
			  + "FROM shop "
			  + "WHERE shoptype ="
			  + "'축구화' ")
	ArrayList<ShopDto> selectshop1();
	
	@Select("SELECT * "
			  + "FROM shop "
			  + "WHERE shoptype ="
			  + "'풋살화' ")
	ArrayList<ShopDto> selectshop2();
	
	@Select("SELECT * "
			  + "FROM shop "
			  + "WHERE shoptype ="
			  + "'의류' ")
	ArrayList<ShopDto> selectshop3();

	@Select("SELECT * "
			  + "FROM shop "
			  + "WHERE shoptype ="
			  + "'유니폼' ")
	ArrayList<ShopDto> selectshop4();
	
	@Select("SELECT * "
			  + "FROM shop "
			  + "WHERE shoptype ="
			  + "'용품' ")
	ArrayList<ShopDto> selectshop5();

	
	
	@Insert("INSERT INTO SHOPORDER(ORCODE, ORID, ORAMOUNT, ORNAME, ORPRICE, ORDATE) "
			+ "VALUES(#{orcode}, #{orid}, '1', #{orname}, #{orprice}, SYSDATE)")
	void insertOrder(OrderDto orInfo);

	
	@Insert("")
	void insertPayInfo(String orcode, String tid, String loginId, String total);

	@Delete("DELETE FROM SHOPORDER WHERE ORCODE = #{orcode}")
	int deleteReservation(String orcode);
	
	@Select("SELECT COUNT(*) FROM SHOPORDER WHERE ORID = #{loginId}")
	int selectOrCount(String loginId);
	
	@Select("SELECT * FROM SHOPORDER WHERE ORID = #{loginId}")
	ArrayList<OrderDto> selectOrderList(String loginId);

	


	
}
