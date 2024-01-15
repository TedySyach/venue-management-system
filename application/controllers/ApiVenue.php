<?php

defined('BASEPATH') or exit('No direct script access allowed');
require APPPATH . '/libraries/REST_Controller.php';

class ApiVenue extends REST_Controller
{
    public function __construct()
    {
        parent::__construct();
        //inisialisasi model News_model.php dengan nama news
        $this->load->model('Lapangan_model', 'venue');
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
                    $venue = $this->venue->get_allApi();
                } else {
                    $venue = $this->venue->get_allApi($id);
                }

                if($venue){
                    $this->response(array('status' => 'OK', 'data' => $venue), REST_Controller::HTTP_OK);
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
                    $venue = $this->venue->get_allApiBySyc();
                } else {
                    $venue = $this->venue->get_allApiBySyc($id);
                }

                if($venue){
                    $this->response(array('status' => 'OK', 'data' => $venue), REST_Controller::HTTP_OK);
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
                    $venue = $this->venue->get_allApiOrg();
                } else {
                    $venue = $this->venue->get_allApiOrg($id);
                }

                if($venue){
                    $this->response(array('status' => 'OK', 'data' => $venue), REST_Controller::HTTP_OK);
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
