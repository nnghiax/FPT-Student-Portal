/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Cuong Bui
 */
public class Rooms {
    private int RoomId;
    private String RoomCode;

    public Rooms(int RoomId, String RoomCode) {
        this.RoomId = RoomId;
        this.RoomCode = RoomCode;
    }

    public Rooms() {
    }

    public int getRoomId() {
        return RoomId;
    }

    public void setRoomId(int RoomId) {
        this.RoomId = RoomId;
    }

    public String getRoomCode() {
        return RoomCode;
    }

    public void setRoomCode(String RoomCode) {
        this.RoomCode = RoomCode;
    }


    
    
    
}
