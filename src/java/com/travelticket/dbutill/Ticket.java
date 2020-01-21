/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.travelticket.dbutill;

/**
 *
 * @author fatur
 */
public class Ticket {

    private String idTicket;
    private String waktu;
    private String tanggal;
    private String tujuan;
    private String harga;
    private Perusahaan perusahaan;

    private String kursiSatu;
    private String kursiDua;
    private String kursiTiga;
    private String kursiEmpat;
    private String kursiLima;

    public String getIdTicket() {
        return idTicket;
    }

    public void setIdTicket(String idTicket) {
        this.idTicket = idTicket;
    }

    public String getWaktu() {
        return waktu;
    }

    public void setWaktu(String waktu) {
        this.waktu = waktu;
    }

    public String getTanggal() {
        return tanggal;
    }

    public void setTanggal(String tanggal) {
        this.tanggal = tanggal;
    }

    public String getTujuan() {
        return tujuan;
    }

    public void setTujuan(String tujuan) {
        this.tujuan = tujuan;
    }

    public String getHarga() {
        return harga;
    }

    public void setHarga(String harga) {
        this.harga = harga;
    }

    public Perusahaan getPerusahaan() {
        return perusahaan;
    }

    public void setPerusahaan(Perusahaan perusahaan) {
        this.perusahaan = perusahaan;
    }

    public String getKursiSatu() {
        return kursiSatu;
    }

    public void setKursiSatu(String kursiSatu) {
        this.kursiSatu = kursiSatu;
    }

    public String getKursiDua() {
        return kursiDua;
    }

    public void setKursiDua(String kursiDua) {
        this.kursiDua = kursiDua;
    }

    public String getKursiTiga() {
        return kursiTiga;
    }

    public void setKursiTiga(String kursiTiga) {
        this.kursiTiga = kursiTiga;
    }

    public String getKursiEmpat() {
        return kursiEmpat;
    }

    public void setKursiEmpat(String kursiEmpat) {
        this.kursiEmpat = kursiEmpat;
    }

    public String getKursiLima() {
        return kursiLima;
    }

    public void setKursiLima(String kursiLima) {
        this.kursiLima = kursiLima;
    }

}
