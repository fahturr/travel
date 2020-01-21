/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.travelticket.dbutill;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author fatur
 */
public class UserDbUtill {

    private static final Akses akses = new Akses();

    public static User getUserData(String username)
            throws SQLException, ClassNotFoundException {
        User user = new User();

        try {
            akses.connect();
            ResultSet rs = akses.executeQuery("SELECT * FROM user WHERE username='" + username + "'");;

            while (rs.next()) {
                user.setIdUser(rs.getString(1));
                user.setNameUser(rs.getString(2));
                user.setEmail(rs.getString(3));
                user.setUsername(rs.getString(4));
                user.setPassword(rs.getString(5));
                user.setSaldo(Integer.parseInt(rs.getString(6)));
            }
        } finally {
            akses.disconnect();
        }
        return user;
    }

    public static void insertUserData(User user)
            throws SQLException, ClassNotFoundException {
        try {
            akses.connect();
            String sql = String.format("INSERT INTO user VALUES('%s','%s','%s','%s','%s','0')",
                    user.getIdUser(), user.getNameUser(), user.getEmail(), user.getUsername(), user.getPassword());
            akses.executeUpdate(sql);
        } finally {
            akses.disconnect();
        }
    }

    public static int userTopUp(User user, int saldo)
            throws ClassNotFoundException, SQLException {
        int hasil = 0;
        try {
            akses.connect();
            String sql = "UPDATE user SET saldo='" + saldo + "' WHERE id_user='" + user.getIdUser() + "'";
            akses.executeUpdate(sql);
        } finally {
            akses.disconnect();
        }
        return hasil;
    }

}
