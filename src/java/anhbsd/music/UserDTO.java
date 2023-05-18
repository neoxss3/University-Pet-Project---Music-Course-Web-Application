/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhbsd.music;

/**
 *
 * @author anhbs
 */
public class UserDTO {
    private String userID;
    private String password;
    private String fullName;
    private String email;
    private String address;
    private String roleID;
    private String img;
     
    public UserDTO() {
    }

    public UserDTO(String userID, String password, String fullName, String email, String address, String roleID,String img) {
        this.userID = userID;
        this.password = password;
        this.fullName = fullName;
        this.email = email;
        this.address = address;
        this.roleID = roleID;
        this.img=img;
    }

    public String getUserID() {
        return userID;
    }

    public String getPassword() {
        return password;
    }

    public String getFullName() {
        return fullName;
    }

    public String getEmail() {
        return email;
    }

    public String getAddress() {
        return address;
    }

    public String getRoleID() {
        return roleID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setRoleID(String roleID) {
        this.roleID = roleID;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
    
}

