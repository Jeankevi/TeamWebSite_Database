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
<<<<<<< HEAD
	private boolean addNewAdviser = true;
	private boolean student = true;
	
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
=======
	
>>>>>>> refs/remotes/origin/caleb
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
