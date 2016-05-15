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
