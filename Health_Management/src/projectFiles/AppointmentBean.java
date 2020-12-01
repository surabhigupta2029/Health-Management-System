package projectFiles;

public class AppointmentBean {
	String appName, timing, notes, meridian;
	
	//Getters
	public String getAppName() {
		return appName;
	}
	
	public String getTiming() {
		return timing;
	}
	
	public String getNotes() {
		return notes;
	}
	
	public String getMeridian() {
		return meridian;
	}
	
	//Setters
	public void setAppName(String appName) {
		this.appName = appName;
	}
	
	public void setTiming(String timing) {
		this.timing = timing;
	}
	
	public void setNotes(String notes) {
		this.notes = notes;
	}
	
	public void setMeridian(String meridian) {
		this.meridian = meridian;
	}
}
