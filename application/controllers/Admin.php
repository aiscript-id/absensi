<?php

use SebastianBergmann\Diff\Diff;

defined('BASEPATH') or exit('No direct script access allowed');

class Admin extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        is_logged_in();
        $this->get_datasess = $this->db->get_where('user', ['username' =>
        $this->session->userdata('username')])->row_array();
        $this->load->model('M_Front');
        $this->load->model('M_Admin');
        $this->get_datasetupapp = $this->M_Front->fetchsetupapp();
    }


    public function settingapp()
    {
        is_admin();
        $data = [
            'title' => 'Setting Aplikasi',
            'user' => $this->get_datasess,
            'dataapp' => $this->get_datasetupapp
        ];
        $this->load->view('layout/header', $data);
        $this->load->view('layout/navbar', $data);
        $this->load->view('layout/sidebar', $data);
        $this->load->view('admin/settingapp', $data);
        $this->load->view('layout/footer', $data);
    }

    public function dashboard()
    {
        is_admin();
        $data = [
            'title' => 'Dashboard Absensi',
            'user' => $this->get_datasess,
            'dataapp' => $this->get_datasetupapp
        ];
        $data['jmlpegawai'] = $this->M_Admin->hitungjumlahdata('jmlpgw');
        $data['pegawaitelat'] = $this->M_Admin->hitungjumlahdata('pgwtrl');
        $data['pegawaimasuk'] = $this->M_Admin->hitungjumlahdata('pgwmsk');
        $this->load->view('layout/header', $data);
        $this->load->view('layout/navbar', $data);
        $this->load->view('layout/sidebar', $data);
        $this->load->view('admin/dashboard', $data);
        $this->load->view('layout/footer', $data);
    }

    public function datapegawai()
    {
        is_admin();
        $data = [
            'title' => 'Data Pegawai',
            'user' => $this->get_datasess,
            'dataapp' => $this->get_datasetupapp,
            'fetchdbpegawai' => $this->M_Admin->fetchlistpegawai()
        ];
        $this->load->view('layout/header', $data);
        $this->load->view('layout/navbar', $data);
        $this->load->view('layout/sidebar', $data);
        $this->load->view('admin/datapegawai', $data);
        $this->load->view('layout/footer', $data);
    }

    public function absensi()
    {
        is_moderator();
        $data = [
            'title' => 'Kehadiran Pegawai',
            'user' => $this->get_datasess,
            'dataapp' => $this->get_datasetupapp
        ];
        $this->load->view('layout/header', $data);
        $this->load->view('layout/navbar', $data);
        $this->load->view('layout/sidebar', $data);
        $this->load->view('admin/absenpegawai', $data);
        $this->load->view('layout/footer', $data);
    }

    public function absensiUser()
    {
        is_moderator();
        $data = [
            'title' => 'Kehadiran Pegawai',
            'user' => $this->get_datasess,
            'dataapp' => $this->get_datasetupapp,
            
        ];

        // if get tanggalawal and tanggalakhir
        if ($this->input->post('tanggalawal') && $this->input->post('tanggalakhir')) {
            $data['tanggalawal'] = $this->input->post('tanggalawal');
            $data['tanggalakhir'] = $this->input->post('tanggalakhir');
        } else {
            // $tanggalawal set first date in this month
            $data['tanggalawal'] = date('Y-m-01');
            $data['tanggalakhir'] = date('Y-m-30');
        }
        // count hari from tanggalawal to tanggalakhir
        $startTimeStamp = strtotime($data['tanggalawal']);
        $endTimeStamp = strtotime($data['tanggalakhir']);

        $timeDiff = abs($endTimeStamp - $startTimeStamp);
        $numberDays = $timeDiff/86400;  // 86400 seconds in one day
        // and you might want to convert to integer
        $numberDays = intval($numberDays);

        $data['jumlah_hari'] = $numberDays + 1;
        $this->load->view('layout/header', $data);
        $this->load->view('layout/navbar', $data);
        $this->load->view('layout/sidebar', $data);
        $this->load->view('admin/absenpegawaiuser', $data);
        $this->load->view('layout/footer', $data);
    }

    public function setAllJamKerja()
    {
        // get all db_absensi
        $data = $this->db->get('db_absensi')->result_array();
        foreach ($data as $key => $value) {
            // count minute from jam_masuk until jam_pulang
            $jam_masuk = strtotime($value['jam_masuk']);
            $jam_pulang = strtotime($value['jam_pulang']);
            $diff = $jam_pulang - $jam_masuk;
            $minute = $diff / 60;
            // update db_absensi
            if ($minute > 0 && $jam_masuk != null && $jam_pulang != null) {
                $this->db->set('jam_kerja', $minute);
                $this->db->where('id_absen', $value['id_absen']);
                $this->db->update('db_absensi');
            }
        }
        return true;
    }

    // settanggal
    public function setTanggal()
    {
        $data = $this->db->get('db_absensi')->result_array();
        foreach ($data as $key => $value) {
            // $tanggal = parse from DATE text to dmy
            $tgl_absen = $value['tgl_absen'];
            $bulan = array(1 => "Januari", "Februari", "Maret", "April", "Mei", "Juni", "Juli", "Agustus", "September", "Oktober", "November", "Desember");
            $hari = array("Minggu", "Senin", "Selasa", "Rabu", "Kamis", "Jumat", "Sabtu");
            // tanggal after day explode ,

            $tanggal = explode(" ", $tgl_absen);
            $hari = $tanggal[1];
            // parse text tanggal[2] to int form $bulan
            $bulan = array_search($tanggal[2], $bulan);
            $tahun = $tanggal[3];

            // date to d-m-y
            $date = $tahun . '-' . $bulan . '-' . $hari;


            // update db_absensi
            $this->db->set('tanggal', $date);
            $this->db->where('id_absen', $value['id_absen']);
            $this->db->update('db_absensi');
        }
    }

    public function setKeterlambatan()
    {
        $settingapp = $this->db->where('status_setting', 1)->get('db_setting')->row_array();
        $data = $this->db->get('db_absensi')->result_array();
        foreach ($data as $key => $value) {
            // count minute from jam_masuk until absen_mulai_to
            $jam_masuk = strtotime($value['jam_masuk']);
            $absen_mulai_to = strtotime($settingapp['absen_mulai_to']);
            $diff =  $jam_masuk - $absen_mulai_to;
            $minute = $diff / 60;
            // update db_absensi
            if ($minute > 0 && $jam_masuk != null && $absen_mulai_to != null) {
                $this->db->set('keterlambatan', $minute);
                $this->db->where('id_absen', $value['id_absen']);
                $this->db->update('db_absensi');
            }
        }
    }

}
