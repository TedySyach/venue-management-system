<?php
defined('BASEPATH') or exit('No direct script access allowed');

require 'vendor/autoload.php';

use Spipu\Html2Pdf\Html2Pdf;

class Cart extends CI_Controller
{

	function __construct()
	{
		parent::__construct();
        date_default_timezone_set('Asia/Jakarta');
		$this->load->model('Bank_model');
		$this->load->model('Cart_model');
		$this->load->model('Company_model');
		$this->load->model('Kontak_model');
		$this->load->model('Jam_model');
		$this->load->model('Transaksi_detail_model');
		$this->load->model('Lapangan_model');
		$this->load->model('Ion_auth_model');
		$this->load->model('Wilayah_model');

		$this->data['company_data'] 			= $this->Company_model->get_by_company();
		$this->data['kontak'] 						= $this->Kontak_model->get_all();
		$this->data['total_cart_navbar'] 	= $this->Cart_model->total_cart_navbar();

		$this->load->helper('tgl_indo');

		

		// Set your Merchant Server Key
		\Midtrans\Config::$serverKey = 'Mid-server-m9Yqx9_oggo5xsIdFgaZDt4Z';
		// Set to Development/Sandbox Environment (default). Set to true for Production Environment (accept real transaction).
		\Midtrans\Config::$isProduction = true;
		// Set sanitization on (default)
		\Midtrans\Config::$isSanitized = true;
		// Set 3DS transaction for credit card to true
		\Midtrans\Config::$is3ds = true;
	}

	public function index()
	{
	    unset($_SESSION['ctm-change']);
		$this->data['title'] = 'Keranjang Belanja';

		$this->data['tanggal'] = array(
			'name'        => 'tanggal[]',
			'id'          => 'tanggal',
			'class' 			=> 'tanggal',
			'required'    => '',
			'autocomplete'    => 'off',
		);
		$this->data['jam_mulai'] = array(
			'name'        => 'jam_mulai[]',
			'id'          => 'jam_mulai',
			'class'       => 'jam_mulai',
			'required'    => '',
		);

		// ambil nilai diskon
		$this->db->select('harga');
		$this->db->where('id', '1');
		$query = $this->db->get('diskon')->row_array();
		$this->data['diskon'] = $query;

		// ambil data keranjang
		$this->data['cart_data'] 			  = $this->Cart_model->get_cart_per_customer()->result();
		$this->data['cek_keranjang'] 		= $this->Cart_model->get_cart_per_customer()->row();
		// ambil data customer
		$this->data['customer_data'] 		= $this->Cart_model->get_data_customer();

		$this->load->view('front/cart/body', $this->data);
	}

	public function buy($id)
	{	
		if (!$this->ion_auth->logged_in()) {
			// $this->session->set_flashdata('message', '<div class="alert alert-danger alert">Silahkan login dulu</div>');
			// redirect(base_url('auth/login'));
			$usrid=0;
			$ip= $this->input->ip_address();
		} else {
			$usrid=$this->session->userdata('user_id');
			$ip=$this->input->ip_address();
		}
		// ambil data produk
		$row = $this->Lapangan_model->get_by_id($id);

		// cek id produk
		if ($row) {
			// cek transaksi per user sedang login
			$cek_transaksi 	= $this->Cart_model->cek_transaksi();
			$id_trans 			= $cek_transaksi->id_trans;

			// cek data barang yang dibeli dan masuk ke tabel transaksi_detail
			$notransdet 				= $this->Cart_model->get_notransdet($id);

			// jika transaksi sudah ada
			if ($cek_transaksi) {
				// jika barang yang dibeli sudah ada di cart == update
				if ($notransdet) {
					$this->index();
				}
				// jika barang yang dibeli belum ada di cart == tambahkan
				else {
					$data2 = array(
						'trans_id'    => $id_trans,
						'lapangan_id' => $id,
						'harga_jual'  => $row->harga,
						'total'       => $row->harga,
					);

					$this->Cart_model->insert_detail($data2);

					// set pesan data berhasil dibuat
					$this->session->set_flashdata('message', '<div class="alert alert-success alert">Booking berhasil ditambahkan</div>');
					redirect(site_url('cart'));
				}
			}
			// jika belum ada transaksi
			else {
				// mengambil 1 data terakhir dari tabel untuk pengecekan id_invoice
				$hasil_cek = $this->Cart_model->create_invoiceCode();

				// jika data tidak sama NULL atau tidak kosong atau datanya sudah ada di tabel maka buat id_invoice yang selanjutnya
				if ($hasil_cek != NULL) {
					// mengganti string dengan fungsi substr dari hasil_cek data terakhir
					$kode_akhir = substr($hasil_cek->id_invoice, 10, 6);
					// membuat id_invoice
					$kode2      = str_pad($kode_akhir + 1, 4, '0', STR_PAD_LEFT);
				}
				// jika datanya masih kosong maka buat id_invoice baru
				else {
					$kode2 = "0001";
				}

				// pembuatan tanggal
				$kode1  = date('ymd');
				/*$kode   = "J-".$kode1."-".$kode2;*/
				$kode   = "J-" . $kode1 . "-" . $kode2;

				$data = array(
					'id_invoice'      => $kode,
					'user_id'  		  => $usrid,
					'ip_addres'  	  => $ip,
					'created_date'    => date('Y-m-d'),
					'created_time'    => date("G:i:s")
				);

				// eksekusi query INSERT
				$this->Cart_model->insert($data);

				$cek_transaksi 	= $this->Cart_model->cek_transaksi();

				$data2 = array(
					'trans_id'  	=> $cek_transaksi->id_trans,
					'lapangan_id' => $id,
					'harga_jual'  => $row->harga,
					'total'  	=> $row->harga,
				);

				$this->Cart_model->insert_detail($data2);

				// set pesan data berhasil dibuat
				$this->session->set_flashdata('message', '<div class="alert alert-success alert">Barang berhasil ditambahkan</div>');
				redirect(site_url('cart'));
			}
		} else {
			$this->session->set_flashdata('message', '
				<div class="alert alert-block alert-warning"><button type="button" class="close" data-dismiss="alert"><i class="ace-icon fa fa-times"></i></button>
					<i class="ace-icon fa fa-bullhorn green"></i> Data tidak ditemukan
				</div>');
			redirect(base_url());
		}
	}

	public function delete($id)
	{
		$id = $this->uri->segment(3);

		$row 			= $this->Cart_model->get_by_id_detail($id);

		if ($row) {
			$id_transdet 			= $row->id_transdet;

			$this->Cart_model->delete($id_transdet);
			$this->session->set_flashdata('message', '<div class="alert alert-success alert">Booking Anda Berhasil dihapus</div>');
			redirect(site_url('cart'));
		}
		// Jika data tidak ada
		else {
			$this->session->set_flashdata('message', '<div class="alert alert-warning alert">Booking tidak ditemukan</div>');
			redirect(site_url('cart'));
		}
	}

	public function empty_cart($id_trans)
	{
		$id_trans = $this->uri->segment(3);

		$this->Cart_model->kosongkan_keranjang($id_trans);

		$this->session->set_flashdata('message', '<div class="alert alert-block alert-success"><i class="ace-icon fa fa-bullhorn green"></i> Keranjang Anda telah dikosongkan</div>');

		redirect(site_url('cart'));
	}

	public function checkout()
	{
		$count = count($this->input->post('lapangan'));
		for ($i = 0; $i < $count; $i++) {
			$data_detail[$i] = array(
				'id_transdet'   => $this->input->post('id_transdet[' . $i . ']'),
				'tanggal'       => $this->input->post('tanggal[' . $i . ']'),
				'jam_mulai'     => $this->input->post('jam_mulai[' . $i . ']'),
				'durasi'        => $this->input->post('durasi[' . $i . ']'),
				'harga_jual'    => $this->input->post('harga_jual[' . $i . ']'),
				'jam_selesai'   => $this->input->post('jam_mulai[' . $i . ']') + $this->input->post('durasi[' . $i . ']') . ":00:00",
				'total'   			=> $this->input->post('harga_jual[' . $i . ']') * $this->input->post('durasi[' . $i . ']'),
			);

			$this->db->update_batch('transaksi_detail', $data_detail, 'id_transdet');
		}

		if ($this->session->userdata('usertype') == "3") {
			// ambil nilai diskon
			$this->db->select('harga');
			$this->db->where('id', '1');
			$query = $this->db->get('diskon')->row();
			$diskon = $query->harga;
		} else {
			$diskon = '0';
		}

		$this->db->select_sum('total');
		$this->db->join('transaksi_detail', 'transaksi.id_trans = transaksi_detail.trans_id');
		$this->db->where('id_trans', $this->input->post('id_trans'));
		$this->db->where('user_id', $this->session->userdata('user_id'));
		$query = $this->db->get('transaksi')->row();

		$gtotal = $query->total - $diskon;

		$this->db->where('id_trans', $this->input->post('id_trans'));
		$this->db->where('user_id', $this->session->userdata('user_id'));
		$this->db->update('transaksi', array(
			'subtotal'		=>	$query->total,
			'diskon'			=>	$diskon,
			'grand_total'	=>	$gtotal,
			'deadline'		=>	date('Y-m-d H:i:s', strtotime('1 hour')),
			'catatan'     => $this->input->post('catatan'),
			'status'			=>	'1',
			'id_sycPlat'			=>	'1',
			'created_time'    => date("G:i:s"),
		));

		redirect(site_url('cart/finished'));
	}

	public function finished()
	{
		$this->data['title'] 							= 'Transaksi Selesai';

		$this->data['cart_latest']	    				= $this->Cart_model->get_cart_per_customer_latest();
		$this->data['cart_finished']	    			= $this->Cart_model->get_cart_per_customer_finished($this->data['cart_latest']->id_trans)->result();
		$this->data['cart_finished_row']   			    = $this->Cart_model->get_cart_per_customer_finished($this->data['cart_latest']->id_trans)->row();
		$this->data['data_bank'] 						= $this->Bank_model->get_all();

		$datainv = $this->Cart_model->get_cart_per_customer_finished($this->data['cart_latest']->id_trans)->row_array();

		$inv=$datainv['id_invoice'] ;
		$grand_total=$datainv['grand_total'] ;
		$params = array(
			'transaction_details' => array(
				'order_id' => $inv,
				'gross_amount' => $grand_total,
			)
		);
		
		$this->data['snapToken'] = \Midtrans\Snap::getSnapToken($params);
		$this->load->view('front/cart/finished', $this->data);
	}

	public function download_invoice($id)
	{
		$row 						= $this->Cart_model->get_by_id($id);

		if ($this->session->userdata('user_id') != $row->user_id) {
			$this->session->set_flashdata('message', '<div class="alert alert-danger alert">Invoice tidak ditemukan</div>');
			redirect(site_url('cart/history'));
		}

		if ($row) {
			ob_start();

			$this->data['cart_finished']	    			= $this->Cart_model->get_cart_per_customer_finished($id)->result();
			$this->data['cart_finished_row']   			= $this->Cart_model->get_cart_per_customer_finished($id)->row();

			$this->data['data_bank'] 								= $this->Bank_model->get_all();

			$this->load->view('front/cart/download_invoice', $this->data);

			$html = ob_get_contents();
			$html = '<title style="font-family: freeserif">' . nl2br($html) . '</title>';
			ob_end_clean();

			$pdf = new HTML2PDF('P', 'A4', 'en', true, 'UTF-8', array(10, 0, 10, 0));
			$pdf->setDefaultFont('Arial');
			$pdf->setTestTdInOnePage(false);
			$pdf->WriteHTML($html);
			$pdf->Output('download_invoice.pdf');
		} else {
			$this->session->set_flashdata('message', "<script>alert('Data tidak ditemukan');</script>");
			redirect(site_url());
		}
	}

	public function history()
	{
		$this->data['title'] 							= 'Daftar Transaksi';
		$this->data['cek_cart_history']	  = $this->Cart_model->cart_history()->row();
		$this->data['cart_history']	    	= $this->Cart_model->cart_history()->result();

		$this->load->view('front/cart/history', $this->data);
	}

	public function history_detail($id)
	{
		$row 						= $this->Cart_model->get_by_id($id);

		if ($this->session->userdata('user_id') != $row->user_id) {
			$this->session->set_flashdata('message', '<div class="alert alert-danger alert">Invoice tidak ditemukan</div>');
			redirect(site_url('cart/history'));
		} else {
			$this->data['title'] 								= 'Detail Riwayat Transaksi';

			$this->data['history_detail']	    	= $this->Cart_model->history_detail($id)->result();
			$this->data['history_detail_row']		= $this->Cart_model->history_detail($id)->row();
			$this->data['data_bank'] 								= $this->Bank_model->get_all();

			$this->load->view('front/cart/history_detail', $this->data);
		}
	}

	public function getJamMulai()
	{
		$tanggal = $this->input->post('tanggal');
		$lapangan_id = $this->input->post('lapangan_id');

		if ($tanggal === FALSE || $lapangan_id === FALSE) {
			echo json_encode(array());
			die();
		}

		$list_jam_mulai_terpakai = $this->Transaksi_detail_model->get_jam_mulai_terpakai($tanggal, $lapangan_id);

		$list_jam_mulai_terpakai_arr = array();
		foreach ($list_jam_mulai_terpakai as $a_jam) {

			if (intval($a_jam->durasi) > 1) {
				$list_jam_range = $this->Jam_model->get_jam_range($a_jam->jam_mulai, $a_jam->jam_selesai);
				foreach ($list_jam_range as $a_jam_from_range) {
					if (!in_array($a_jam_from_range->jam, $list_jam_mulai_terpakai_arr))
						array_push($list_jam_mulai_terpakai_arr, $a_jam_from_range->jam);
				}
			} else {
				if (!in_array($a_jam->jam_mulai, $list_jam_mulai_terpakai_arr))
					array_push($list_jam_mulai_terpakai_arr, $a_jam->jam_mulai);
			}
		}

		$list_jam = $this->Jam_model->get();

		$list_jam_arr = array();
		foreach ($list_jam as $a_jam) {
			array_push($list_jam_arr, $a_jam->jam);
		}

		$result = array();

		foreach ($list_jam_arr as $a_jam) {
			if (!in_array($a_jam, $list_jam_mulai_terpakai_arr)) {
				$a_jam_row = new stdClass();
				$a_jam_row->durasi = '1';
				$a_jam_row->jam_mulai = $a_jam;

				array_push($result, $a_jam_row);
			}
		}

		echo json_encode($result);
	}
	
	public function get_jam_selesai_terpakai()
	{
		$tanggal = $this->input->post('tanggal');
		$lapangan_id = $this->input->post('lapangan_id');
		$jam_selesai= $this->input->post('jam_selesai');

		if ($tanggal === FALSE || $lapangan_id === FALSE) {
			echo json_encode(array());
			die();
		}

		$list_jam_mulai_terpakai = $this->Transaksi_detail_model->get_jam_selesai_terpakai($tanggal, $lapangan_id,$jam_selesai);

		

		echo json_encode($list_jam_mulai_terpakai);
	}



	public function register()
	{	
		$this->data['title'] 							= 'Information/ Login';

		// Cek sudah/ belum login
		if ($this->ion_auth->logged_in()){redirect(site_url('cart'));}

		/* setting bawaan ionauth */
		$tables 					= $this->config->item('tables','ion_auth');
		$identity_column 	= $this->config->item('identity','ion_auth');

		$this->data['identity_column'] = $identity_column;

		// validasi form input
		$this->form_validation->set_rules('name', 'Nama', 'required|trim|is_unique[users.name]');
		$this->form_validation->set_rules('username', 'Username', 'required|trim|is_unique[users.username]');
		$this->form_validation->set_rules('email', 'Email', 'required|valid_email|is_unique[users.email]');
		$this->form_validation->set_rules('phone', 'No. HP', 'trim|numeric');
		$this->form_validation->set_rules('password', 'Password', 'required|min_length[' . $this->config->item('min_password_length', 'ion_auth') . ']|max_length[' . $this->config->item('max_password_length', 'ion_auth') . ']|matches[password_confirm]');
		$this->form_validation->set_rules('password_confirm', 'Konfirmasi Password', 'required');

		// set pesan
		$this->form_validation->set_message('required', '{field} mohon diisi');
		$this->form_validation->set_message('valid_email', 'Format email tidak benar');
		$this->form_validation->set_message('numeric', 'No. HP harus angka');
		$this->form_validation->set_message('matches', 'Password baru dan konfirmasi harus sama');
		$this->form_validation->set_message('is_unique', '%s telah terpakai, silahkan ganti dengan yang lain');

		// cek form_validation dan register ke db
		if ($this->form_validation->run() == true)
		{
			$email    = strtolower($this->input->post('email'));
			$identity = ($identity_column==='email') ? $email : $this->input->post('identity');
			$password = $this->input->post('password');

			// data tambahan yang untuk dimasukkan pada tabel
			$additional_data = array(
				'name' 				=> $this->input->post('name'),
				'username'  	=> $this->input->post('username'),
				'phone'      	=> $this->input->post('phone'),
				'address'    	=> $this->input->post('alamat'),
				'provinsi' 		=> $this->input->post('provinsi_id'),
				'kota'   			=> $this->input->post('kota_id'),
				'usertype'    => '4',
			);

			// mengirimkan data yang sudah disediakan diatas $additional_data $email, $identity $password
			$this->ion_auth->register($identity, $password, $email, $additional_data);
			// Mendapatkan ID setelah operasi registrasi
			$user_idKudeta = $this->db->insert_id();

			// check to see if we are creating the user | redirect them back to the admin page
			$this->session->set_flashdata('message', '<div class="alert alert-success alert">Registrasi Berhasil, sekarang anda bisa chekout.</div>');
			
			$cek_transaksi 	= $this->Cart_model->cek_transaksi();
		    $id_transKudeta=$cek_transaksi->id_trans;

			$this->db->where('id_trans', $id_transKudeta);
			$this->db->update('transaksi', array(
				'user_id'		=>	$user_idKudeta
			));

			// cek user login dan menekan tombol remember me
			$remember = FALSE;

			$this->ion_auth->login_front($email, $password, $remember);

			redirect(site_url('cart'));
		}
			else
			{
				// display the create user form | set the flash data error message if there is one
				$this->data['message'] = (validation_errors() ? validation_errors() : ($this->ion_auth->errors() ? $this->ion_auth->errors() : $this->session->flashdata('message')));

				$this->data['name'] = array(
					'name'  => 'name',
					'id'    => 'name',
					'type'  => 'text',
					'class'  => 'form-control',
					'value' => $this->form_validation->set_value('name'),
				);
				$this->data['username'] = array(
					'name'  => 'username',
					'id'    => 'username',
					'class'  => 'form-control',
					'value' => $this->form_validation->set_value('username'),
				);
				$this->data['email'] = array(
					'name'  => 'email',
					'id'    => 'email',
					'class'  => 'form-control',
					'value' => $this->form_validation->set_value('email'),
				);
				$this->data['phone'] = array(
					'name'  => 'phone',
					'id'    => 'phone',
					'class'  => 'form-control',
					'value' => $this->form_validation->set_value('phone'),
				);
				$this->data['password'] = array(
					'name'  => 'password',
					'id'    => 'password',
					'class'  => 'form-control',
					'value' => $this->form_validation->set_value('password'),
				);
				$this->data['password_confirm'] = array(
					'name'  => 'password_confirm',
					'id'    => 'password_confirm',
					'class'  => 'form-control',
					'value' => $this->form_validation->set_value('password_confirm'),
				);
				$this->data['alamat'] = array(
					'name'  => 'alamat',
					'id'    => 'alamat',
					'class'  => 'form-control',
					'cols'  => '2',
					'rows'  => '2',
					'value' => $this->form_validation->set_value('alamat'),
				);
				$this->data['provinsi_id'] = array(
		      'name'        => 'provinsi_id',
		      'id'          => 'provinsi_id',
		      'class'       => 'form-control',
		      'onChange'    => 'tampilKota()',
		      'required'    => '',
		    );
		    $this->data['kota_id'] = array(
		      'name'        => 'kota_id',
		      'id'          => 'kota_id',
		      'class'       => 'form-control',
		      'required'    => '',
		    );

				$this->data['ambil_provinsi'] = $this->Wilayah_model->get_provinsi();

				$this->load->view('front/cart/register', $this->data);
			}
	}
}
