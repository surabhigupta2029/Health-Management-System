package projectFiles;

public class RegistrationBean {
	private String firstName, lastName, address;
	private String contact;

	//Getters
	public String getFirstName() {
		return firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public String getAddress() {
		return address;
	}

	public String getContact() {
		return contact;
	}

	//Setters
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

}
