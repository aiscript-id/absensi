<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Home extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		is_logged_in();
		$this->get_datasess = $this->db->get_where('user', ['username' =>
		$this->session->userdata('username')])->row_array();
		$this->load->model('M_Front');
		$this->get_datasetupapp = $this->M_Front->fetchsetupapp();
		$timezone_all = $this->get_datasetupapp;
		date_default_timezone_set($timezone_all['timezone']);
	}


	public function index()
	{
		if (date("H") < 4) {
			$greet = 'Selamat Malam';
		} elseif (date("H") < 11) {
			$greet = 'Selamat Pagi';
		} elseif (date("H") < 16) {
			$greet = 'Selamat Siang';
		} elseif (date("H") < 18) {
			$greet = 'Selamat Sore';
		} else {
			$greet = 'Selamat Malam';
		}
		$dbabsensi = $this->M_Front->fetchdbabsen($this->get_datasess['kode_pegawai']);
		// kalau $dbabsensi tidak ada, berarti belum absen pagi
		$sudah_absen = $dbabsensi === null ? 'false' : 'true';
		$setting = $this->db->get_where('db_setting', ['status_setting' => 1])->row_array();
		$jampulang = $setting['absen_pulang'];
		// kalau $dbabsensi['jam_pulang'] kosong, berarti belum absen pulang 
		$sudah_absen_pulang = empty($dbabsensi['jam_pulang']) ? 'false' : 'true';
		$data = [
			'title' => $this->get_datasetupapp['nama_app_absensi'],
			'user' => $this->get_datasess,
			'dataapp' => $this->get_datasetupapp,
			'dbabsensi' => $dbabsensi,
			'greeting' => $greet,
			'sudah_absen' => $sudah_absen, 
			'sudah_absen_pulang' => $sudah_absen_pulang,
			'jam_pulang' => $jampulang
		];
		$this->load->view('layout/header', $data);
		$this->load->view('layout/navbar', $data);
		$this->load->view('layout/sidebar', $data);
		$this->load->view('front/home', $data);
		$this->load->view('layout/footer', $data);
	}
}
