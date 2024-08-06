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
public class Course {
     private int TeachingScheduleId;
    private String subjectCode;
    private String slotName;
    private String roomName;
    private Date teachingDate;

    public Course(int TeachingScheduleId, String subjectCode, String slotName, String roomName, Date teachingDate) {
        this.TeachingScheduleId = TeachingScheduleId;
        this.subjectCode = subjectCode;
        this.slotName = slotName;
        this.roomName = roomName;
        this.teachingDate = teachingDate;
    }

    public Course(int TeachingScheduleId, Date teachingDate, String slotName) {
        this.TeachingScheduleId = TeachingScheduleId;
        this.slotName = slotName;
        this.teachingDate = teachingDate;
    }

    public Course(String subjectCode, Date teachingDate) {
        this.subjectCode = subjectCode;
        this.teachingDate = teachingDate;
    }

    public Course(String subjectCode) {
        this.subjectCode = subjectCode;
    }

    public Course() {
    }

    public int getTeachingScheduleId() {
        return TeachingScheduleId;
    }

    public void setTeachingScheduleId(int TeachingScheduleId) {
        this.TeachingScheduleId = TeachingScheduleId;
    }

    public String getSubjectCode() {
        return subjectCode;
    }

    public void setSubjectCode(String subjectCode) {
        this.subjectCode = subjectCode;
    }

    public String getSlotName() {
        return slotName;
    }

    public void setSlotName(String slotName) {
        this.slotName = slotName;
    }

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }

    public Date getTeachingDate() {
        return teachingDate;
    }

    public void setTeachingDate(Date teachingDate) {
        this.teachingDate = teachingDate;
    }
    
    
}
