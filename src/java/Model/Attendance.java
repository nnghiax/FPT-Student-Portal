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
public class Attendance {
    private String subjectName;
    private String subjectCode;
    private String roomName;
    private String slotName;
    private String groupName;
    private Date sessionDate;
    private String lectureCode;
    private int isAbsent;
    private String comment;
    private Student student;

    public Attendance() {
    }

    public Attendance(Student student,int isAbsent, String comment) {
        this.isAbsent = isAbsent;
        this.comment = comment;
        this.student = student;
    }

    public Attendance(String subjectName, String subjectCode, String roomName, String slotName, String groupName, Date sessionDate, String lectureCode, int isAbsent, String comment) {
        this.subjectName = subjectName;
        this.subjectCode = subjectCode;
        this.roomName = roomName;
        this.slotName = slotName;
        this.groupName = groupName;
        this.sessionDate = sessionDate;
        this.lectureCode = lectureCode;
        this.isAbsent = isAbsent;
        this.comment = comment;
    }

    public String getLectureCode() {
        return lectureCode;
    }

    public void setLectureCode(String lectureCode) {
        this.lectureCode = lectureCode;
    }



    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public String getSubjectName() {
        return subjectName;
    }

    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }

    public String getSubjectCode() {
        return subjectCode;
    }

    public void setSubjectCode(String subjectCode) {
        this.subjectCode = subjectCode;
    }

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }

    public String getSlotName() {
        return slotName;
    }

    public void setSlotName(String slotName) {
        this.slotName = slotName;
    }

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    public Date getSessionDate() {
        return sessionDate;
    }

    public void setSessionDate(Date sessionDate) {
        this.sessionDate = sessionDate;
    }

    public int getIsAbsent() {
        return isAbsent;
    }

    public void setIsAbsent(int isAbsent) {
        this.isAbsent = isAbsent;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }
}
