package projectFiles;

public class regMember {
	private String firstName, lastName, username, password, address, contact;

	public regMember(String firstName, String lastName, String username, String password, String address,
			String contact) {

		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.username = username;
		this.password = password;
		this.address = address;
		this.contact = contact;
	}

	public String getFirstName() {
		return firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public String getUsername() {
		return username;
	}

	public String getPassword() {
		return password;
	}

	public String getAddress() {
		return address;
	}

	public String getContact() {
		return contact;
	}

	public String setFirstName(String arg) {
		firstName = arg;
		return firstName;
	}

	public String setLastName(String arg) {
		lastName = arg;
		return lastName;
	}

	public String setUsername(String arg) {
		username = arg;
		return username;
	}

	public String setPassword(String arg) {
		password = arg;
		return password;
	}

	public String setAddress(String arg) {
		address = arg;
		return address;
	}

	public String setContact(String arg) {
		contact = arg;
		return contact;
	}

}// end of class
