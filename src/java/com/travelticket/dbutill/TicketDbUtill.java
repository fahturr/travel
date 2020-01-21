/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.travelticket.dbutill;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author fatur
 */
public class TicketDbUtill {

    private static final Akses akses = new Akses();

    public static ArrayList<Ticket> getTicketList() {
        ArrayList<Ticket> tickets = null;
        try {
            tickets = new ArrayList<>();
            akses.connect();
            String query = "SELECT * FROM ticket t, perusahaan p WHERE t.id_perusahaan = p.id_perusahaan ORDER BY tanggal DESC";

            ResultSet rs = akses.executeQuery(query);

            while (rs.next()) {
                Ticket ticket = new Ticket();
                ticket.setIdTicket(rs.getString("id_ticket"));
                ticket.setTujuan(rs.getString("tujuan"));
                ticket.setWaktu(rs.getString("waktu"));
                ticket.setTanggal(rs.getString("tanggal"));
                ticket.setHarga(rs.getString("harga"));
                ticket.setKursiSatu(rs.getString("kursi_satu"));
                ticket.setKursiDua(rs.getString("kursi_dua"));
                ticket.setKursiTiga(rs.getString("kursi_tiga"));
                ticket.setKursiEmpat(rs.getString("kursi_empat"));
                ticket.setKursiLima(rs.getString("kursi_lima"));

                Perusahaan perusahaan = new Perusahaan();
                perusahaan.setIdPerusahaan(rs.getString("id_perusahaan"));
                perusahaan.setNamaPerusahaan(rs.getString("nama_perusahaan"));

                ticket.setPerusahaan(perusahaan);
                tickets.add(ticket);
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
        return tickets;
    }

    public static Ticket getTicketById(String id) {
        Ticket ticket = null;

        try {
            ticket = new Ticket();
            akses.connect();
            String query = "SELECT * FROM ticket t, perusahaan p WHERE t.id_perusahaan = p.id_perusahaan and id_ticket='" + id + "'";

            ResultSet rs = akses.executeQuery(query);

            while (rs.next()) {
                ticket.setIdTicket(rs.getString("id_ticket"));
                ticket.setTujuan(rs.getString("tujuan"));
                ticket.setWaktu(rs.getString("waktu"));
                ticket.setTanggal(rs.getString("tanggal"));
                ticket.setHarga(rs.getString("harga"));
                ticket.setKursiSatu(rs.getString("kursi_satu"));
                ticket.setKursiDua(rs.getString("kursi_dua"));
                ticket.setKursiTiga(rs.getString("kursi_tiga"));
                ticket.setKursiEmpat(rs.getString("kursi_empat"));
                ticket.setKursiLima(rs.getString("kursi_lima"));

                Perusahaan perusahaan = new Perusahaan();
                perusahaan.setIdPerusahaan(rs.getString("id_perusahaan"));
                perusahaan.setNamaPerusahaan(rs.getString("nama_perusahaan"));

                ticket.setPerusahaan(perusahaan);
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

        return ticket;
    }

    public static int addTicket(Ticket ticket)
            throws ClassNotFoundException, SQLException {
        int hasil = 0;

        try {
            akses.connect();
            String query = String.format("INSERT INTO ticket VALUES('%s','%s','%s','%s','%s','0','0','0','0','0')",
                    ticket.getTujuan(), ticket.getTanggal(), ticket.getWaktu(), ticket.getHarga(), ticket.getPerusahaan().getIdPerusahaan());

            if (akses.executeUpdate(query) > 0) {
                hasil = 1;
            }

        } finally {
            akses.disconnect();
        }

        return hasil;
    }

    public static String formatHarga(int harga) {
        DecimalFormat kursIndonesia = (DecimalFormat) DecimalFormat.getCurrencyInstance();
        DecimalFormatSymbols formatRp = new DecimalFormatSymbols();

        formatRp.setCurrencySymbol("Rp. ");
        formatRp.setGroupingSeparator('.');
        formatRp.setMonetaryDecimalSeparator(',');

        kursIndonesia.setDecimalFormatSymbols(formatRp);
        return kursIndonesia.format(harga);
    }

}
