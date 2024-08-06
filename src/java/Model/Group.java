/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.ArrayList;

/**
 *
 * @author Cuong Bui
 */
public class Group {
   private int groupId;
    private String groupCode;
    private String groupDescription;
    private Subject subject;
    private Lecture lecture;    
    private ArrayList<Student> studentList;

    public Group(int groupId, String groupCode, Subject subject) {
        this.groupId = groupId;
        this.groupCode = groupCode;
        this.subject = subject;
    }

    public Group(int groupId, String groupCode, String groupDescription) {
        this.groupId = groupId;
        this.groupCode = groupCode;
        this.groupDescription = groupDescription;
    }

    public Group(int groupId, String groupCode, String groupDescription, Subject subject, Lecture lecture, ArrayList<Student> studentList) {
        this.groupId = groupId;
        this.groupCode = groupCode;
        this.groupDescription = groupDescription;
        this.subject = subject;
        this.lecture = lecture;
        this.studentList = studentList;
    }

    public Group() {
    }

    public int getGroupId() {
        return groupId;
    }

    public void setGroupId(int groupId) {
        this.groupId = groupId;
    }

    public String getGroupCode() {
        return groupCode;
    }

    public void setGroupCode(String groupCode) {
        this.groupCode = groupCode;
    }

    public String getGroupDescription() {
        return groupDescription;
    }

    public void setGroupDescription(String groupDescription) {
        this.groupDescription = groupDescription;
    }

    public Subject getSubject() {
        return subject;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
    }

    public Lecture getLecture() {
        return lecture;
    }

    public void setLecture(Lecture lecture) {
        this.lecture = lecture;
    }

    public ArrayList<Student> getStudentList() {
        return studentList;
    }

    public void setStudentList(ArrayList<Student> studentList) {
        this.studentList = studentList;
    }

}
