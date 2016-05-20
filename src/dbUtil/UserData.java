/**
 * 
 */
package dbUtil;

/**
 * @author hoangja
 *
 */
public class UserData { 
	private String user = "";
	private boolean valid = true;
	private boolean addNewAdviser = true;
	private boolean student = true;
	private boolean validSchedule = true;
	private boolean validCourse = true;
	private boolean courseOnSchedule = false;
	
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

	public void reset(){
		user = "";
		valid = true;
		addNewAdviser = true;
		student = true;
		validSchedule = true;
	}
	
	public boolean isValidSchedule(){
		return validSchedule;
	}
	
	public void setValidSchedule(boolean valSch){
		this.validSchedule = valSch;
	}
	
	public boolean isValidCourse(){
		return validCourse;
	}
	
	public void setCourseOnSchedule(boolean cOS){
		this.validCourse = cOS;
	}
	
	public boolean courseOnSchedule(){
		return courseOnSchedule;
	}
	
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


}
