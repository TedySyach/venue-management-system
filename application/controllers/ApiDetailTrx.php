<?php

defined('BASEPATH') or exit('No direct script access allowed');
require APPPATH . '/libraries/REST_Controller.php';

class ApiDetailTrx extends REST_Controller
{
    public function __construct()
    {
        parent::__construct();
        //inisialisasi model News_model.php dengan nama news
        $this->load->model('Cart_model', 'trx');
        // $token_validasi='eternitynews768';
    }

    public function index_get($id = null)
    {
        // Mengambil nilai token dari header
        $token = $this->input->get_request_header('apikey', TRUE);

        if ($token != null) {
            $token_validasi = 'Aa5PbtwL9kXHL5n0/pwQMvVo1BhqPj7G0tROQO6Pa4g=';
            if ($token == $token_validasi) {
             
                if($id === null) {
                    $trx = $this->trx->get_cart_per_Trans_finished_backApi();
                } else {
                    $trx = $this->trx->get_cart_per_Trans_finished_backApi($id);
                }

                if($trx){
                    $this->response(array('status' => 'OK', 'data' => $trx), REST_Controller::HTTP_OK);
                } else {
                    $this->response(array('status' => 'failed', 'pesan' => 'Data Not Found'), REST_Controller::HTTP_NOT_FOUND);
                }
            } else {
                $this->response(array('status' => 'failed', 'pesan' => 'Token keliru'));
            }
        } else {
            $this->response(array('status' => 'failed', 'pesan' => 'token tidak di isi'));
        }
    }

    public function ByTrxId_get($id = null)
    {
        // Mengambil nilai token dari header
        $token = $this->input->get_request_header('apikey', TRUE);

        if ($token != null) {
            $token_validasi = 'Aa5PbtwL9kXHL5n0/pwQMvVo1BhqPj7G0tROQO6Pa4g=';
            if ($token == $token_validasi) {
                // $id= $this->get('id');
                if($id === null) {
                    $trx = $this->trx->get_allApiBySyc();
                } else {
                    $trx = $this->trx->get_allApiBySyc($id);
                }

                if($trx){
                    $this->response(array('status' => 'OK', 'data' => $trx), REST_Controller::HTTP_OK);
                } else {
                    $this->response(array('status' => 'failed', 'pesan' => 'Data Not Found'), REST_Controller::HTTP_NOT_FOUND);
                }
            } else {
                $this->response(array('status' => 'failed', 'pesan' => 'Token keliru'));
            }
        } else {
            $this->response(array('status' => 'failed', 'pesan' => 'token tidak di isi'));
        }
    }

  
}
