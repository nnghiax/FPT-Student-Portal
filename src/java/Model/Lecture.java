/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Date;

/**
 *
 * @author Cuong Bui
 */
public class Lecture {
    private int lectureId;
    private String lectureName;
    private String lectureCode;
    private boolean gender;
    private Date dob;
      private String address;

    public Lecture() {
    }

    public Lecture(int lectureId, String lectureName, String lectureCode, boolean gender, Date dob, String address) {
        this.lectureId = lectureId;
        this.lectureName = lectureName;
        this.lectureCode = lectureCode;
        this.gender = gender;
        this.dob = dob;
        this.address = address;
    }

    public int getLectureId() {
        return lectureId;
    }

    public void setLectureId(int lectureId) {
        this.lectureId = lectureId;
    }

    public String getLectureName() {
        return lectureName;
    }

    public void setLectureName(String lectureName) {
        this.lectureName = lectureName;
    }

    public String getLectureCode() {
        return lectureCode;
    }

    public void setLectureCode(String lectureCode) {
        this.lectureCode = lectureCode;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
      
    
}
