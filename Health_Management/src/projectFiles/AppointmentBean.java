package projectFiles;

/**
 * Class: AppointmentBean.java
 * Purpose: This class encapsulates all the appointment note objects into a single object,
 * that can be set() and get() from anywhere
 */

public class AppointmentBean {
	String appName, timing, notes, meridian, day;
	
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
	
	public String getDay() {
		return day;
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
	
	public void setDay(String day) {
		this.day = day;
	}
}
