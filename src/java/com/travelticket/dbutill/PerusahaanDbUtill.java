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
public class PerusahaanDbUtill {

    private static final Akses akses = new Akses();

    public static void insertUserData(Perusahaan perusahaan)
            throws SQLException, ClassNotFoundException {
        try {
            akses.connect();
            String sql = String.format("INSERT INTO perusahaan VALUES('%s','%s','%s','%s')",
                    perusahaan.getIdPerusahaan(), perusahaan.getNamaPerusahaan(), perusahaan.getUsernamePerusahaan(), perusahaan.getPasswordPerusahaan());
            akses.executeUpdate(sql);
        } finally {
            akses.disconnect();
        }
    }

    public static Perusahaan getPerusahaanData(String username)
            throws ClassNotFoundException, SQLException {
        Perusahaan perusahaan = new Perusahaan();

        try {
            akses.connect();
            ResultSet rs = akses.executeQuery("SELECT * FROM perusahaan WHERE username='" + username + "'");

            while (rs.next()) {
                perusahaan.setIdPerusahaan(rs.getString(1));
                perusahaan.setNamaPerusahaan(rs.getString(2));
                perusahaan.setUsernamePerusahaan(rs.getString(3));
                perusahaan.setPasswordPerusahaan(rs.getString(4));
            }
        } finally {
            akses.disconnect();
        }

        return perusahaan;
    }
}
