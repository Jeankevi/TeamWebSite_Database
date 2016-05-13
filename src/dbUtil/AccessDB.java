package dbUtil;
//contains methods for accessing MySQL DB
import java.sql.*;
import java.util.Scanner;

public class AccessDB {

	static Utilities testObj = new Utilities(); // Utilities object for testing
	static Scanner keyboard = new Scanner(System.in); // standard input
	
	/**  
	  * Main method that will loop until the exit command (submitting the number 8) is
	  * specified. It will also call the display menu method, which displays the numbered options
	  * for actions the user can carry out.
	  */
	public static void main(String[] args) throws SQLException{
		int choice;
		boolean done = false;

		while (!done) {
			System.out.println();
			displaymenu();
			choice = getChoice();
			switch (choice) {
			case 1: {
				openDB();
				break;
			}
			case 2: {
				callCreateSchedule();
				break;
			}
			case 3: {
				callNewAdviser();
				break;
			}
			case 4: {
				callDeleteCourse();
				break;
			}
			case 5: {
				callScheduleEval();
				break;
			}
			case 6:{
				callUpdatePreReq();
				break;
			}
			case 7: {
				testObj.closeDB(); //close the DB connection 
				break;
			}
			case 8: {
				done = true;
				System.out.println("Good bye");
				break;
			}
			case 9:{
				openDefault();
				break;
			}
			}
		}
	}
	/** 
	 * This method will print a menu of the options available to the user
	  */
	static void displaymenu() {
		System.out.println("1)  Open the DB");
		System.out.println("2)  Create a new schedule");
		System.out.println("3)  Give student a new adviser");
		System.out.println("4)  Delete a course from a schedule");
		System.out.println("5)  Evaluate a schedule");
		System.out.println("6)  Update a prerequisite for a class");
		System.out.println("7)  Close the DB");
		System.out.println("8)  Quit");
		System.out.println("9)  Open Default Database");
	}
	
	/** 
	  * Get choice will take the users specified command (in the form of an integer)
	  * and return it to the main method where it will specify which operation the user
	  * wants to perform. 
	  */
	static int getChoice() {
		String input;
		int i = 0;
		while (i < 1 || i > 10) {
			try {
				System.out.print("Please enter an integer between 1-10: ");
				input = keyboard.nextLine();
				i = Integer.parseInt(input);
				System.out.println();
			} catch (NumberFormatException e) {
				System.out.println("Invalid input");
			}
		}
		return i;
	}
	
	/** 
	 * Opens the default database (ba367_2016)
	 */
	static void openDefault(){
		testObj.openDef();
	}
	/**  
	 * Opens the database and requires the user enter the username and 
	 * password for the database ba367_2016
	 */
	static void openDB() {
		String user;
		String pass;
		
		System.out.print("Please enter the username: ");
		user = keyboard.nextLine();
		System.out.print("Please enter the password: ");
		pass = keyboard.nextLine();
		testObj.openDB(user,pass);
	}
	
	/**
	 * This method will allow student to create a new schedule
	 * Student needs to enter the schedule number, their year plan (2 or 4 year plan),
	 * type of the degree they want (BA or BS)
	 */
	static void callCreateSchedule() throws SQLException {
		System.out.print("Please enter the student id number:  ");
		String sid = keyboard.nextLine();
		
		System.out.print("Please enter the schedule number:  ");
		String sNum = keyboard.nextLine();
		
		System.out.print("Please enter your desired year plan:  ");
		int yrPlan = Integer.parseInt(keyboard.nextLine());
		
		System.out.print("Please enter the degree type (BA or BS):  ");
		String type = keyboard.nextLine().toUpperCase();
				
		int result = testObj.createSchedule(sNum, yrPlan, type, sid);
		if(result == 1){
			System.out.println("Schedule created.");
		}
		else{
			System.out.println("An error has occurred, the schedule was not created.");
		};
	}
	
	/**
	 * This method will allow adviser to add themselves as the adviser for a student
	 * Adviser need to enter their fid and the sid of the student they will be advising 
	 */
	static void callNewAdviser() throws SQLException {
		ResultSet rs;
		System.out.print("Please enter the Advisers ID number (8 numbers): ");
		String fid = keyboard.nextLine();
		System.out.print("Please enter the Students ID number (8 numbers): ");
		String sid = keyboard.nextLine();
		
		System.out.printf("\n%-12s\n", "Student and Adviser");
		System.out.println("------------------------");
		System.out.printf("%s\t\t%s\n", "SID", "FID");
		rs = testObj.newAdviser(fid, sid);
		
		while(rs.next()){
			System.out.printf("%s\t%s \n", rs.getString(1), rs.getString(2));
			
		}
	}
	
	/**
	 * This method allows the user to delete a course from a specified schedule that belongs to them.
	 * They will be prompted to enter the schedule number and the course number and department, which
	 * will then be deleted from the specified schedule. 
	 */
	static void callDeleteCourse() throws SQLException {
		System.out.print("Please enter the student id number: ");
		String sid = keyboard.nextLine();
		System.out.print("Please enter the schedule number: ");
		String input = keyboard.nextLine();
		int sNum= Integer.parseInt(input);
		System.out.print("Please enter the course number: ");
		String cNum = keyboard.nextLine();
		System.out.print("Please enter the course department(CSCE): ");
		String dept = keyboard.nextLine();
		
		int result = testObj.deleteCourse(sNum, cNum, dept, sid);
		if(result == 1){
			System.out.println("Delete successful");
		}
		else{
			System.out.println("Delete unsuccessful");
		};
	}
	
	/**
	 * This method will evaluate a students schedule and display information about what 
	 * required classes are missing from the schedule. The user must specify the schedule number
	 * of the schedule to be evaluated.
	 */
	static void callScheduleEval() throws SQLException {
		ResultSet rs = null;
		System.out.print("Please enter the student id number: ");
		String sid = keyboard.nextLine();
		System.out.print("Please enter your schedule number: ");
		int sch_num = Integer.parseInt(keyboard.nextLine());
		
		rs = testObj.scheduleEval1(sch_num, sid);
		if(rs != null){
			System.out.println("\nThere are classes you should take to fulfill the degree: ");
			System.out.println("**********************************************************");
			System.out.printf("%s\t\t%s\t%s\n", "Course","Semester","Credit hours");
			
			while (rs.next()) {
				System.out.printf("%s\t%s\t\t%s\n", rs.getString(1),rs.getString(2),rs.getString(3));
			}
		}
		else{
			System.out.println("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
			System.out.println("This requirement has been satisfied");
		}
		
		rs = testObj.scheduleEval2(sch_num, sid);
		if(rs != null){
			System.out.println("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
			System.out.println("Please choose 1 course in this list: ");
			System.out.printf("%s\t\t%s\t%s\n", "Course","Semester","Credit hours");
			while (rs.next()) {
			System.out.printf("%s\t\t%s\t\t%s\n", rs.getString(1),rs.getString(2),rs.getString(3));
			}
		}
		else{
			System.out.println("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
			System.out.println("This requirement has been satisfied");
		}
		rs = testObj.scheduleEval3(sch_num, sid);
		System.out.println("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
		System.out.println("Please choose 3 in this list: ");
		System.out.printf("%s\t\t%s\t%s\n", "Course","Semester","Credit hours");
		while (rs.next()) {
			System.out.printf("%s\t\t%s\t\t%s\n", rs.getString(1),rs.getString(2),rs.getString(3));
			}
	}
	
	/**
	 * This method allows the user to update the current prerequisite for a specified class 
	 * to a new prerequisite. The user must specify the course number and department for the 
	 * new prerequisite course, course number and department for the old prerequisite course,
	 * and the course number and department for the course that the prerequisite will be 
	 * required for. 
	 */
	static void callUpdatePreReq() throws SQLException {
		System.out.print("Enter the course number of the prerequisite to be changed: ");
		String oldPRnum = keyboard.nextLine();
		System.out.print("Enter the department of the prerequisite to be changed: ");
		String oldPRdept= keyboard.nextLine();
		System.out.print("Enter the course number of the new prerequisite: ");
		String newPRnum = keyboard.nextLine();
		System.out.print("Enter the department of the new prerequisite: ");
		String newPRdept = keyboard.nextLine();
		System.out.print("Enter the number of the course that the prerequisite is for: ");
		String cNum = keyboard.nextLine();
		System.out.print("Enter the department of the course that the prerequisite is for: ");
		String cDept = keyboard.nextLine();
		
		int result = testObj.updatePreReq(oldPRnum, oldPRdept, newPRnum, newPRdept, cNum, cDept);
		if(result == 2){
			System.out.println("Update successful");
		}
		else{
			System.out.println("Update unsuccessful");
		}
			
	}
	
}