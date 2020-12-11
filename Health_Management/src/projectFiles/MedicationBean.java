package projectFiles;

/**
 * Class: MedicationBean.java
 * Purpose: This class encapsulates all the medication note objects into a single object,
 * that can be set() and get() from anywhere
 */

public class MedicationBean {
	String medicationName, dose, time, notes, meridian;
	String id, day;
	
	//Getters
	public String getID() {
		return id;
	}
	
	public String getMedicationName() {
		return medicationName;
	}
	
	public String getDose() {
		return dose;
	}
	
	public String getTime() {
		return time;
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
	public void setID(String id) {
		this.id = id;
	}
	
	public void setMedicationName(String medicationName) {
		this.medicationName = medicationName;
	}
	
	public void setDose(String dose) {
		this.dose = dose;
	}
	
	public void setTime(String time) {
		this.time = time;
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
