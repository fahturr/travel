/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.travelticket.dbutill;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author fatur
 */
public class TransaksiDbUtill {

    private static final Akses akses = new Akses();

    public static int createTransaksi(Ticket ticket, User user, String kursi[]) {
        int result = 0;
        try {
            Transaksi transaksi = new Transaksi();
            transaksi.setTicket(ticket);
            transaksi.setUser(user);

            String kursi1 = (cariKursi(kursi, "1")) ? "1" : "0";
            String kursi2 = (cariKursi(kursi, "2")) ? "1" : "0";
            String kursi3 = (cariKursi(kursi, "3")) ? "1" : "0";
            String kursi4 = (cariKursi(kursi, "4")) ? "1" : "0";
            String kursi5 = (cariKursi(kursi, "5")) ? "1" : "0";

            String query = String.format("INSERT INTO transaksi(id_ticket,id_user,status) "
                    + "VALUES('%s','%s','belum lunas')",
                    transaksi.getTicket().getIdTicket(), transaksi.getUser().getIdUser()
            );
            String update = "UPDATE ticket SET kursi_satu='" + kursi1 + "', kursi_dua='" + kursi2 + "', kursi_tiga='" + kursi3 + "', kursi_empat='" + kursi4 + "', kursi_lima='" + kursi5 + "' WHERE id_ticket='" + ticket.getIdTicket() +"'";

            akses.connect();

            if (akses.executeUpdate(query) > 0 && akses.executeUpdate(update) > 0) {
                result = 1;
            }

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(TicketDbUtill.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                akses.disconnect();
            } catch (SQLException ex) {
                Logger.getLogger(TicketDbUtill.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return result;
    }

    public static ArrayList<Transaksi> getTransactionPayment(String username) {
        ArrayList<Transaksi> transaksis = null;
        try {
            transaksis = new ArrayList<>();
            User user = UserDbUtill.getUserData(username);

            akses.connect();
            String query = "SELECT * FROM transaksi WHERE id_user='" + username + "' and status='belum lunas'";
            ResultSet rs = akses.executeQuery(query);

            while (rs.next()) {
                Transaksi transaksi = new Transaksi();
                Ticket ticket = TicketDbUtill.getTicketById(rs.getString("id_ticket"));

                transaksi.setIdTransaksi(rs.getString("id_transaksi"));
                transaksi.setTicket(ticket);
                transaksi.setUser(user);

                transaksis.add(transaksi);
            }

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(TransaksiDbUtill.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                akses.disconnect();
            } catch (SQLException ex) {
                Logger.getLogger(TransaksiDbUtill.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return transaksis;
    }

    public static ArrayList<Transaksi> getTransactionMyTicket(String username) {
        ArrayList<Transaksi> transaksis = null;
        try {
            transaksis = new ArrayList<>();
            User user = UserDbUtill.getUserData(username);

            akses.connect();
            String query = "SELECT * FROM transaksi WHERE id_user='" + username + "' and status='lunas'";
            ResultSet rs = akses.executeQuery(query);

            while (rs.next()) {
                Transaksi transaksi = new Transaksi();
                Ticket ticket = TicketDbUtill.getTicketById(rs.getString("id_ticket"));

                transaksi.setIdTransaksi(rs.getString("id_transaksi"));
                transaksi.setTicket(ticket);
                transaksi.setUser(user);

                transaksis.add(transaksi);
            }

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(TransaksiDbUtill.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                akses.disconnect();
            } catch (SQLException ex) {
                Logger.getLogger(TransaksiDbUtill.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return transaksis;
    }

    public static int payTransaction(String idTransaction, String idTicket, String[] kursi) {
        int hasil = 0;

        try {
            String query = "UPDATE transaksi SET status='lunas' WHERE id_transaksi='" + idTransaction + "'";

            String kursi1 = (cariKursi(kursi, "1")) ? "1" : "0";
            String kursi2 = (cariKursi(kursi, "2")) ? "1" : "0";
            String kursi3 = (cariKursi(kursi, "3")) ? "1" : "0";
            String kursi4 = (cariKursi(kursi, "4")) ? "1" : "0";
            String kursi5 = (cariKursi(kursi, "5")) ? "1" : "0";

            String update = "UPDATE ticket SET "
                    + "kursi_satu='" + kursi1 + "',"
                    + "kursi_dua='" + kursi2 + "',"
                    + "kursi_tiga='" + kursi3 + "',"
                    + "kursi_empat='" + kursi4 + "',"
                    + "kursi_lima='" + kursi5 + "' "
                    + "WHERE id_ticket='" + idTicket + "'";

            akses.connect();
            if (akses.executeUpdate(query) > 0 && akses.executeUpdate(update) > 0) {
                hasil = 1;
            }

            return hasil;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(TransaksiDbUtill.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                akses.disconnect();
            } catch (SQLException ex) {
                Logger.getLogger(TransaksiDbUtill.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return hasil;
    }

    private static boolean cariKursi(String kursi[], String key) {
        for (String kursi1 : kursi) {
            if (kursi1.equals(key)) {
                return true;
            }
        }
        return false;
    }

}
