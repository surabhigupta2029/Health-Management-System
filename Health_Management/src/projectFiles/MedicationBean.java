package projectFiles;

public class MedicationBean {
	String medicationName, dose, time, notes;
	String id;
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
}
