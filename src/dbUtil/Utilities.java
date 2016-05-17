package dbUtil;

import java.sql.*;

public class Utilities {


	private Connection conn = null; // Connection object

	/**
	 * @return the conn
	 */
	public Connection getConn() {
		return conn;
	}

	/**
	 * @param conn the conn to set
	 */
	public void setConn(Connection conn) {
		this.conn = conn;
	}

	/**
	 * This method opens the default browser which connects the students to the database 
	 * 
	 */
	public void openDef() {
		try {
			Class.forName("com.mysql.jdbc.Driver");

		} catch (ClassNotFoundException e) {
			System.out.println("Unable to load driver.");
		}  

		// Connect to the database
		String url = "jdbc:mysql://zoe.cs.plu.edu:3306/ba367_2016";
		String username = "ba367";
		String password = "LizIsQueen";

		try {
			conn = DriverManager.getConnection(url, username, password);
		} catch (SQLException e) {
			System.out.println("Error connecting to database: " + e.toString());
		}

		System.out.println("Accessing: ba367_2016");
	}// openDB

	/**
	 * This method opens the default browser which connects the students to the database 
	 * 
	 */
	public ResultSet validUser(String id,String password) {
		ResultSet rset = null;
		String sql = null;

		try {
			sql = "SELECT * FROM student " +
					"WHERE sid = ? and s_password = ? ";

			// create a Statement and an SQL string for the statement
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.clearParameters();
			stmt.setString(1,id);
			stmt.setString(2, password);
			
			PreparedStatement stmt2 = conn.prepareStatement(sql);
			stmt2.clearParameters();
			stmt2.setString(1,id);
			stmt2.setString(2, password);
			
			rset = stmt.executeQuery();
			ResultSet copy = stmt2.executeQuery();
			
			if(copy.next()){
				return rset;
			}
			else{
				sql = null;
				sql = "SELECT * FROM advisor " +
						"WHERE fid = ? and a_password = ? ";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.clearParameters();
				pstmt.setString(1,id);
				pstmt.setString(2, password);
				rset = pstmt.executeQuery();
			}
				


		} catch (SQLException e) {
			System.out.println("createStatement " + e.getMessage() + sql);
		}

		return rset;

	}// validUser

	/**
	 * This method opens the database for the user 
	 * 
	 * @param uname username of the group 
	 * @param pass password of the group's database 
	 */
	public void openDB(String uname, String pass){
		// Load the MySQL JDBC driver
		try {
			Class.forName("com.mysql.jdbc.Driver");

		} catch (ClassNotFoundException e) {
			System.out.println("Unable to load driver.");
		}  

		// Connect to the database
		String url = "jdbc:mysql://zoe.cs.plu.edu:3306/ba367_2016";

		try {
			conn = DriverManager.getConnection(url, uname, pass);
		} catch (SQLException e) {
			System.out.println("Error connecting to database: " + e.toString());
		}
	}
	/**
	 * This method closes the database and will send a fail message if the connection was not closed 
	 */
	public void closeDB() {
		try {
			conn.close();
			conn = null;
			System.out.println("Connection to DB closed");
		} catch (SQLException e) {
			System.err.println("Failed to close database connection: " + e);
		}
	}// closeDB

	/**
	 * This method creates a new schedule for a student
	 * @param sNum Student's unique schedule number 
	 * @param yrPlan Number of years the student plans on taking to get their degree 
	 * @param type Type of degree the student plans on getting 
	 * @return result
	 */
	public int createSchedule(String sNum, String sid,int yrPlan, String type){
		//ResultSet rset = null;
		String sql = null;
		int success = 0;

		try {
			// create a Statement and an SQL string for the statement
			Statement stmt = conn.createStatement();
			sql = "INSERT INTO schedule (sch_num, sid, year_plan, type) " +
					"VALUES ( "+sNum+", '"+sid+"', "+yrPlan+", '"+type+"') ";
			success = stmt.executeUpdate(sql);

			/*if(success > 0){
				Statement show = conn.createStatement();
				sql = null;
				sql = "Select sch_num, year_plan, type From schedule Where sid = '"+sid+"' ";
				rset = show.executeQuery(sql);
			}*/


		} catch (SQLException e) {
			System.out.println("createStatement " + e.getMessage() + sql);

		}

		return success;
	}

	/**
	 * This method assigns a student a new advisor 
	 * @param fid Faculty's unique ID number 
	 * @param sid Student's unique ID number 
	 */

	public ResultSet newAdviser(String fid, String sid){
		ResultSet rset = null;
		String sql = null;


		try {
			Statement stmt = conn.createStatement();
			sql = "UPDATE student SET fid = '"+fid+"' " +
					"WHERE sid = '"+sid+"' ";
			int success = stmt.executeUpdate(sql);

			if(success > 0){
				Statement show = conn.createStatement();
				sql = "SELECT sid, fid FROM student WHERE sid = '"+sid+"' ";
				rset = show.executeQuery(sql);
			}

		} catch (SQLException e) {
			System.out.println("createStatement " + e.getMessage() + sql);
		}

		return rset;
	}

	/**
	 * This method deletes a course from a schedule
	 * @param sNum Student's unique schedule number 
	 * @param cNum Each course has a unique number to identify by
	 * @param dept Department where each course belongs to 
	 * 
	 */


	public String deleteCourse(int sNum, String cNum, String dept, String sid){

		String sql = null;

		String test = "The course was deleted";

		try {
			Statement stmt = conn.createStatement();

			stmt = conn.createStatement();
			sql = "DELETE FROM belongs_to "+
					"WHERE course_num = '"+cNum+"' and sch_num = "+sNum+" and "+ 
					"dept = '"+dept+"' and sid = '" + sid + "'";
			stmt.executeUpdate(sql);

			//EndDEBUG

		} catch (SQLException e) {
			System.out.println("createStatement " + e.getMessage() + sql);
			test = "The course was not deleted";
		}

		return test;
	}

	/**
	 * First schedule evaluation condition
	 * @param sch_num specific schedule number that student want to fulfill
	 * @return returns the course on required CSCE courses (12 credits) that student need to take
	 */
	public ResultSet scheduleEval1(int sch_num, String sid){
		ResultSet rset = null;
		String sql = null;
		try {
			sql = "SELECT concat(c.dept,c.course_num) Course, semester_c , credit_hrs "+
					"FROM semester s left outer join course c on concat(c.dept,c.course_num) = concat(s.dept,s.course_num) " +
					"WHERE concat(c.dept,c.course_num) in " +
					"(SELECT concat(f.dept,f.course_num) from fulfills f left outer join requirements r on f.req_num = r.req_num " +
					"WHERE f.req_num = 2) and concat(c.dept,c.course_num) not in " +
					"(SELECT concat(b.dept,b.course_num) from belongs_to b " + 
					"WHERE sid = ? and sch_num = ? ) ";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.clearParameters();
			stmt.setString(1,sid);
			stmt.setInt(2,sch_num);
			rset = stmt.executeQuery();
		}catch (SQLException e){
			System.out.println("createStatement " + e.getMessage() + sql);	
		}
		try {
			if(rset.next()){
				return rset;
			}
			else{
				rset = null;
			}
		} catch (SQLException e) {
			System.out.println("createStatement " + e.getMessage());
			e.printStackTrace();
		}
		return rset;
	}

	/**
	 * Second schedule evaluation condition
	 * @param sch_num specific schedule number that student want to fulfill
	 * @return returns the course on required of CSCE 367 or CSCE 390 (4 credits) that student need to take
	 */
	public ResultSet scheduleEval2(int sch_num, String sid){
		ResultSet rset = null;
		String sql = null;
		try {
			sql = "SELECT concat(c.dept,c.course_num) Course, semester_c , credit_hrs "+
					"FROM semester s left outer join course c on concat(c.dept,c.course_num) = concat(s.dept,s.course_num) " +
					"WHERE concat(c.dept,c.course_num) in " +
					"(SELECT concat(f.dept,f.course_num) from fulfills f left outer join requirements r on f.req_num = r.req_num " +
					"WHERE f.req_num = 3 and concat(c.dept,c.course_num) in " +
					"(SELECT concat(b.dept,b.course_num) from belongs_to b " + 
					"WHERE sid = ? and sch_num = ? )) ";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.clearParameters();
			stmt.setString(1,sid);
			stmt.setInt(2,sch_num);
			rset = stmt.executeQuery();
		}catch (SQLException e){
			System.out.println("createStatement " + e.getMessage() + sql);	
		}

		try {
			if(!rset.next()){
				sql = "SELECT concat(c.dept,c.course_num) Course, semester_c , credit_hrs "+
						"FROM semester s left outer join course c on concat(c.dept,c.course_num) = concat(s.dept,s.course_num) " +
						"WHERE concat(c.dept,c.course_num) in " +
						"(SELECT concat(f.dept,f.course_num) from fulfills f left outer join requirements r on f.req_num = r.req_num " +
						"WHERE f.req_num = 3 and concat(c.dept,c.course_num) not in " +
						"(SELECT concat(b.dept,b.course_num) from belongs_to b " + 
						"WHERE sid = ? and sch_num = ? )) ";
				PreparedStatement stmt = conn.prepareStatement(sql);
				stmt.clearParameters();
				stmt.setString(1,sid);
				stmt.setInt(2,sch_num);
				rset = stmt.executeQuery();
			}
			else{
				rset = null;
			}
		} catch (SQLException e) {
			System.out.println("createStatement " + e.getMessage());
			e.printStackTrace();
		}
		return rset;
	}

	/**
	 * Third schedule evaluation condition
	 * @param sch_num specific schedule number that student want to fulfill
	 * @return returns the course on required of CSCE electives (12 credits)that student need to take
	 */
	public ResultSet scheduleEval3(int sch_num, String sid){
		ResultSet rset = null;
		String sql = null;
		try {
			sql = "SELECT concat(c.dept,c.course_num) Course, semester_c , credit_hrs "+
					"FROM semester s left outer join course c on concat(c.dept,c.course_num) = concat(s.dept,s.course_num) " +
					"WHERE concat(c.dept,c.course_num) in " +
					"(SELECT concat(f.dept,f.course_num) from fulfills f left outer join requirements r on f.req_num = r.req_num " +
					"WHERE f.req_num = 4) and concat(c.dept,c.course_num) not in " +
					"(SELECT concat(b.dept,b.course_num) from belongs_to b " + 
					"WHERE sid = ? and sch_num = ? ) ";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.clearParameters();
			stmt.setString(1,sid);
			stmt.setInt(2,sch_num);
			rset = stmt.executeQuery();
		}catch (SQLException e){
			System.out.println("createStatement " + e.getMessage() + sql);	
		}
		return rset;
	}

	/**
	 * Fourth schedule evaluation condition
	 * @param sch_num specific schedule number that student want to fulfill
	 * @return returns the course on required of CSCE supporting Math Course (12 credits)that student need to take
	 */
	public ResultSet scheduleEval4(int sch_num, String sid){
		ResultSet rset = null;
		String sql = null;
		try {
			sql = "SELECT concat(c.dept,c.course_num) Course, semester_c , credit_hrs "+
					"FROM semester s left outer join course c on concat(c.dept,c.course_num) = concat(s.dept,s.course_num) " +
					"WHERE concat(c.dept,c.course_num) in " +
					"(SELECT concat(f.dept,f.course_num) from fulfills f left outer join requirements r on f.req_num = r.req_num " +
					"WHERE f.req_num = 5) and concat(c.dept,c.course_num) not in " +
					"(SELECT concat(b.dept,b.course_num) from belongs_to b " + 
					"WHERE sid = ? and sch_num = ? ) ";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.clearParameters();
			stmt.setString(1,sid);
			stmt.setInt(2,sch_num);
			rset = stmt.executeQuery();
		}catch (SQLException e){
			System.out.println("createStatement " + e.getMessage() + sql);	
		}
		return rset;
	}

	/**
	 * Fifth schedule evaluation condition
	 * @param sch_num specific schedule number that student want to fulfill
	 * @return returns the course on required of CSCE supporting Math Course (12 credits)that student need to take
	 */
	public ResultSet scheduleEval5(int sch_num, String sid){
		ResultSet rset = null;
		String sql = null;
		try {
			sql = "SELECT concat(c.dept,c.course_num) Course, semester_c , credit_hrs "+
					"FROM semester s left outer join course c on concat(c.dept,c.course_num) = concat(s.dept,s.course_num) " +
					"WHERE concat(c.dept,c.course_num) in " +
					"(SELECT concat(f.dept,f.course_num) from fulfills f left outer join requirements r on f.req_num = r.req_num " +
					"WHERE f.req_num = 1) and concat(c.dept,c.course_num) not in " +
					"(SELECT concat(b.dept,b.course_num) from belongs_to b " + 
					"WHERE sid = ? and sch_num = ? ) ";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.clearParameters();
			stmt.setString(1,sid);
			stmt.setInt(2,sch_num);
			rset = stmt.executeQuery();
		}catch (SQLException e){
			System.out.println("createStatement " + e.getMessage() + sql);	
		}
		return rset;
	}

	/**
	 * This method updates a PreReq for a certain course done by the advisor
	 * @param oldPRNum PreReq number of the courses being updated 
	 * @param oldPRDept Department name of the coursee being updated 
	 * @param newPRNum PreReq number of the course replacing the old PreReq
	 * @param newPRDept Department name of the course replacing the old PreReq
	 * @param cNum Course number that the updated PreReq is for
	 * @cDept cDept Department name that the updated PreReq is for 
	 */


	public String updatePreReq(String oldPRNum,String oldPRDept,String newPRNum,String newPRDept,String cNum,String cDept){

		String sql = null;

		String test = "The PreReq was updated";


		try {
			Statement stmt = conn.createStatement();

			sql = "delete from pre_req "+
					"where dept='"+cDept+"' and course_num='"+cNum+"' and dept2='"+oldPRDept+"' and course_num2='"+oldPRNum+"'";
			int update = stmt.executeUpdate(sql);
			sql = "insert into pre_req "+
					"values ('"+cDept+"','"+cNum+"','"+newPRDept+"','"+newPRNum+"')";
			update += stmt.executeUpdate(sql);
			//EndDEBUG
			System.out.print(oldPRDept+" "+oldPRNum+" replaced with "+newPRDept+" "+newPRNum+"\n");						
		} catch (SQLException e) {
			System.out.println("createStatement " + e.getMessage() + sql);
			test = "The PreReq was not updated";
		}

		return test;

	}

}
