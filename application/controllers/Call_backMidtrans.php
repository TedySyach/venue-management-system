<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Call_backMidtrans extends CI_Controller {

    public function __construct() {
        parent::__construct();
        // Load model yang dibutuhkan
        $this->load->model('Cart_model');
    }
    public function index() {
        // Mengambil seluruh isi permintaan HTTP
        $raw_input = $this->input->raw_input_stream;
    
        // Mencoba mendekode JSON
        $notification_body = json_decode($raw_input, true);
    
        // Inisialisasi respons
        $response = [];
    
        // Periksa apakah JSON berhasil diuraikan
        if ($notification_body !== null) {
            // Mengambil data yang Anda butuhkan
            $order_id = $notification_body['order_id'];
            $trx_id = $notification_body['transaction_id'];
            $status_code = $notification_body['status_code'];

            // Mengonversi status_code ke pesan yang sesuai
            switch ($status_code) {
                case 200:
                    $message = 2 ;
                    break;
                case 201:
                    $message = 1 ;
                    break;
                case 202:
                    $message = 3;
                    break;
                default:
                    $message = 4;
                    break;
            }

            $cek_transaksi 	= $this->Cart_model->cek_transaksiCallBack($order_id);
		    $id_transKudeta=$cek_transaksi->id_trans;

			$this->db->where('id_trans', $id_transKudeta);
			$this->db->update('transaksi', array(
				'status'		=>	$message
			));

            
    
    
            // Menyusun respons
            $response['status_code'] = $status_code;
            $response['message'] = $message;
            $response['order_id'] = $order_id;
        } else {
            // JSON tidak dapat diuraikan
            $response['status_code'] = 500; // Kode status error, sesuaikan sesuai kebutuhan
            $response['message'] = "Error: Failed to decode JSON.";
        }
    
        // Mengembalikan respons dalam format JSON
        $this->output
            ->set_status_header($response['status_code'])
            ->set_content_type('application/json', 'utf-8')
            ->set_output(json_encode($response));
    }

  
    
}
