/**
 * 
 */
package dbUtil;

/**
 * @author hoangja
 *
 */
/**
 * @author holmla
 *
 */
public class UserData { 
	private String user = "";
	private int yr_in = 0;
	private boolean valid = true;
	private boolean addNewAdviser = true;
	private boolean student = true;
	private boolean validSchedule = true;
	private boolean validCourse = true;
	private boolean courseOnSchedule = false;
	private boolean validDept = true;
	
	/**
	 * @return the validDept
	 */
	public boolean isValidDept() {
		return validDept;
	}

	/**
	 * @param validDept the validDept to set
	 */
	public void setValidDept(boolean validDept) {
		this.validDept = validDept;
	}

	/**
	 * @return the student
	 */
	public boolean isStudent() {
		return student;
	}

	/**
	 * @param student the student to set
	 */
	public void setStudent(boolean student) {
		this.student = student;
	}

	/**
	 * Resets user info and flags, used in logout
	 */
	public void reset(){
		user = "";
		yr_in = 0;
		valid = true;
		addNewAdviser = true;
		student = true;
		validSchedule = true;
		validCourse = true;
		courseOnSchedule = false;
	}
	
	/**
	 * Resets flags only, used in navigation to homepage
	 */
	public void homeReset(){
		valid = true;
		addNewAdviser = true;
		student = true;
		validSchedule = true;
		validCourse = true;
		courseOnSchedule = false;
	}
	
	/**
	 * Method that returns the value of validSchedule
	 * @return boolean value of validSchedule
	 */
	public boolean isValidSchedule(){
		return validSchedule;
	}
	
	/**
	 * method that sets the value of validSchedule
	 * @param valSch the boolean value that validSchedule will be set to
	 */
	public void setValidSchedule(boolean valSch){
		this.validSchedule = valSch;
	}
	
	/**
	 * method that returns the value of validCourse
	 * @return boolean value of validCourse
	 */
	public boolean isValidCourse(){
		return validCourse;
	}
	
	/**
	 * method that sets the value of courseOnSchedule
	 * @param cOS the boolean value that courseOnSchedule will be set to
	 */
	public void setCourseOnSchedule(boolean cOS){
		this.courseOnSchedule = cOS;
	}
	
	/**
	 * method that returns the value of courseOnSchedule 
	 * @return boolean value of courseOnSchedule
	 */
	public boolean isCourseOnSchedule(){
		return courseOnSchedule;
	}

	/**
	 * method that sets the value of validCourse
	 * @param valCrs the boolean value that validCourse will be set to
	 */
	public void setValidCourse(boolean valCrs){
		this.validCourse = valCrs;
	}
	
	/**
	 * @return the addNewAdviser
	 */
	public boolean isAddNewAdviser() {
		return addNewAdviser;
	}
	/**
	 * @param addNewAdviser the addNewAdviser to set
	 */
	public void setAddNewAdviser(boolean addNewAdviser) {
		this.addNewAdviser = addNewAdviser;
	}
	/**
	 * UserData super class
	 */
	public UserData(){
		super();
	}
	/**
	 * @return the valid
	 */
	public boolean isValid() {
		return valid;
	}

	/**
	 * @param valid the valid to set
	 */
	public void setValid(boolean valid) {
		this.valid = valid;
	}

	/**
	 * @return the user
	 */
	public String getUser() {
		return user;
	}

	/**
	 * @param user the user to set
	 */
	public void setUser(String user) {
		this.user = user;
	}
	
	/**
	 * Method that returns the current value of yr_in
	 * @return integer value of yr_in
	 */
	public int getYearIn(){
		return yr_in;
	}
	
	/**
	 * Method that sets the value of yr_in
	 * @param yrIn the passed in value that yr_in will be set to
	 */
	public void setYearIn(int yrIn) {
		this.yr_in = yrIn;
	}
}
