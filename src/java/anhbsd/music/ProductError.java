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
public class ProductError {

    private String LoginFailed;
    private String IDDupplicated;

    public ProductError() {
        this.LoginFailed="";
        this.IDDupplicated="";
    }

    
    public ProductError(String LoginFailed, String IDDupplicated) {
        this.LoginFailed = LoginFailed;
        this.IDDupplicated = IDDupplicated;
    }

    public String getLoginFailed() {
        return LoginFailed;
    }

    public String getIDDupplicated() {
        return IDDupplicated;
    }

    public void setLoginFailed(String LoginFailed) {
        this.LoginFailed = LoginFailed;
    }

    public void setIDDupplicated(String IDDupplicated) {
        this.IDDupplicated = IDDupplicated;
    }
    
    
}
