package it.unicam.cs.ids.smartchalet.Model.Users;

public interface AuthenticatedUser extends GenericUser {

    /**
     * This method is used to login a user
     */
    void login(String u, String p);


}
