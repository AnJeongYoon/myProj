package Admin.Member;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Member.Dbaccess;
import Member.MemberDTO;


public class Admin_Member_dao extends Dbaccess{
	
	int startPageNo = 0;
	int pageSize = 0;
	
	public int getStartPageNo() {
		return startPageNo;
	}

	public void setStartPageNo(int startPageNo) {
		this.startPageNo = startPageNo;
	}
	
	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	//검색 결과 수 구하는 메소드
	public int getCountMember(HttpServletRequest req, HttpServletResponse resp){
		int count = 0;
		try {
			con = ds.getConnection();
			String sort="";
			String asc="";
			String searchMember = "";
			String searchSelect = "";
			if(req.getParameter("searchMember")!=null&&!req.getParameter("searchMember").equals("")){
				
				searchMember = req.getParameter("searchMember");
				searchSelect = req.getParameter("searchSelect");
				req.setAttribute("searchMember", searchMember);
				req.setAttribute("searchSelect", searchSelect);
				
				if(req.getParameter("sort")!=null){
					if(!req.getParameter("sort").equals("")){
						sort = req.getParameter("sort");
						asc = req.getParameter("asc");
						req.setAttribute("asc", asc);
						req.setAttribute("sort", sort);
						sql = "select count(*) from member where "+searchSelect+" like '%"+searchMember+"%' order by "+sort+" "+asc;	
					}else{
						sql = "select count(*) from member where "+searchSelect+" like '%"+searchMember+"%'";
					}
							
				}else{
					sql = "select count(*) from member where "+searchSelect+" like '%"+searchMember+"%'";
				}
				
			}else{
				if(req.getParameter("sort")!=null&&!req.getParameter("sort").equals("")){
				
					sort = req.getParameter("sort");
					asc = req.getParameter("asc");
					req.setAttribute("asc", asc);
					req.setAttribute("sort", sort);
					sql = "select count(*) from member order by "+sort+" "+asc;										
				}else{
					sql = "select count(*) from member";
				}
			}
					
			pstmt = con.prepareStatement(sql);				
			rs = pstmt.executeQuery();
			if(rs.next()){
				count = rs.getInt(1);
			}
				
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			freeResource();
		}
		//System.out.println(count);	
		return count;
	}
	
	
	
	//리스트 메소드
	public List<MemberDTO> getAllMember(HttpServletRequest req, HttpServletResponse resp){
		List<MemberDTO> list = new ArrayList<>();
		try {
			con = ds.getConnection();
			String sort="";
			String asc="";
			String searchMember = "";
			String searchSelect = "";
			if(req.getParameter("searchMember")!=null&&!req.getParameter("searchMember").equals("")){
				
				searchMember = req.getParameter("searchMember");
				searchSelect = req.getParameter("searchSelect");
				req.setAttribute("searchMember", searchMember);
				req.setAttribute("searchSelect", searchSelect);
				
				if(req.getParameter("sort")!=null){
					if(!req.getParameter("sort").equals("")){
						sort = req.getParameter("sort");
						asc = req.getParameter("asc");
						req.setAttribute("asc", asc);
						req.setAttribute("sort", sort);
						sql = "select * from member where "+searchSelect+" like '%"+searchMember+"%' order by "+sort+" "+asc+" limit ?,?";	
					}else{
						sql = "select * from member where "+searchSelect+" like '%"+searchMember+"%' limit ?,? ";
					}
							
				}else{
					sql = "select * from member where "+searchSelect+" like '%"+searchMember+"%' limit ?,? ";
				}
				
			}else{
				if(req.getParameter("sort")!=null&&!req.getParameter("sort").equals("")){
				
					sort = req.getParameter("sort");
					asc = req.getParameter("asc");
					req.setAttribute("asc", asc);
					req.setAttribute("sort", sort);
					sql = "select * from member order by "+sort+" "+asc+" limit ?,?";										
				}else{
					sql = "select * from member limit ?,? ";
				}
			}
			
			System.out.println(sql);			
			pstmt = con.prepareStatement(sql);				
				pstmt.setInt(1, (startPageNo-1)*pageSize);
				pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			while(rs.next()){
				MemberDTO mdto = new MemberDTO();
				
				mdto.setMb_addr(rs.getString("mb_addr"));
				mdto.setMb_brith_date(rs.getString("mb_brith_date"));
				mdto.setMb_buy_cnt(rs.getInt("mb_buy_cnt"));
				mdto.setMb_email(rs.getString("mb_email"));
				mdto.setMb_gender(rs.getString("mb_gender"));
				mdto.setMb_grade(rs.getString("mb_grade"));
				mdto.setMb_id(rs.getString("mb_id"));
				mdto.setMb_join_date(rs.getString("mb_join_date"));
				mdto.setMb_last_login(rs.getString("mb_last_login"));
				mdto.setMb_mobile(rs.getString("mb_mobile"));
				mdto.setMb_name(rs.getString("mb_name"));
				mdto.setMb_num(rs.getInt("mb_num"));
				mdto.setMb_tel(rs.getString("mb_tel"));
				mdto.setMb_status(rs.getString("mb_status"));
				list.add(mdto);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();	
		} finally {
			freeResource();
		}
		
		return list;
	}

	public void ban_member(String num) {
		try {
			con = ds.getConnection();
			sql = "update member set mb_status=? where mb_num=? and mb_id NOT IN('admin')";
			pstmt =  con.prepareStatement(sql);
				pstmt.setString(1, "차단");
				pstmt.setString(2, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			freeResource();
		}
		
	}
	
	public void del_member(String id){
		try {
			con = ds.getConnection();
			sql = "delete from member where mb_id =?";
			pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			freeResource();
		}
	}
	
}
