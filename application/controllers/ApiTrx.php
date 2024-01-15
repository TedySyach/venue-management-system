<?php

defined('BASEPATH') or exit('No direct script access allowed');
require APPPATH . '/libraries/REST_Controller.php';

class ApiTrx extends REST_Controller
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
                    $trx = $this->trx->get_allApi();
                } else {
                    $trx = $this->trx->get_allApi($id);
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
    
      public function Bysyc_get($id = null)
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
    
      public function BysycCount_get($id = null)
    {
        // Mengambil nilai token dari header
        $token = $this->input->get_request_header('apikey', TRUE);

        if ($token != null) {
            $token_validasi = 'Aa5PbtwL9kXHL5n0/pwQMvVo1BhqPj7G0tROQO6Pa4g=';
            if ($token == $token_validasi) {
                // $id= $this->get('id');
                if($id === null) {
                    $trx = $this->trx->get_allApiBySycCount();
                } else {
                    $trx = $this->trx->get_allApiBySycCount($id);
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
    
    
     public function Organize_get($id = null)
    {
        // Mengambil nilai token dari header
        $token = $this->input->get_request_header('apikey', TRUE);

        if ($token != null) {
            $token_validasi = 'Aa5PbtwL9kXHL5n0/pwQMvVo1BhqPj7G0tROQO6Pa4g=';
            if ($token == $token_validasi) {
                // $id= $this->get('id');
                if($id === null) {
                    $trx = $this->trx->get_allApiOrg();
                } else {
                    $trx = $this->trx->get_allApiOrg($id);
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
    
    
    public function index_put() {
         // Mengambil nilai token dari header
         $token = $this->input->get_request_header('apikey', TRUE);

         if ($token != null) {
             $token_validasi = 'Aa5PbtwL9kXHL5n0/pwQMvVo1BhqPj7G0tROQO6Pa4g=';
             if ($token == $token_validasi) {
                        $id=$this->put('id');
                        $data= [
                            'status' => $this->put('status')
                        ];

                        if ($this->trx->transaksiUpdate($data,$id) > 0) {
                            $this->response(array('status' => 'OK', 'pesan' => 'success update data'), REST_Controller::HTTP_OK);
                        } else {
                            $this->response(array('status' => 'false', 'pesan' => 'failed to update data'), REST_Controller::HTTP_BAD_REQUEST);
                        }
            } else {
                $this->response(array('status' => 'failed', 'pesan' => 'Token keliru'));
            }
        } else {
            $this->response(array('status' => 'failed', 'pesan' => 'token tidak di isi'));
        }
    }
}
