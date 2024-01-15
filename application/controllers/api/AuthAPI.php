<?php

defined('BASEPATH') or exit('No direct script access allowed');
use Firebase\JWT\JWT;

class AuthAPI extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->library('form_validation');
        $this->lang->load('auth');
        $this->load->model('Ion_auth_model');
        $this->load->library('Jwt'); // Memuat library JWT
    }

    public function login()
    {
        // validate form input
        $this->form_validation->set_rules('identity', str_replace(':', '', $this->lang->line('login_identity_label')), 'required');
        $this->form_validation->set_rules('password', str_replace(':', '', $this->lang->line('login_password_label')), 'required');
        $this->form_validation->set_message('required', '{field} mohon diisi');
    
        if ($this->form_validation->run() == FALSE) {
            $this->output->set_content_type('application/json')->set_status_header(400)->set_output(json_encode(['status' => 'failed', 'message' => validation_errors()]));
        } else {
            // check to see if the user is logging in
            // check for "remember me"
            $remember = (bool) $this->input->post('remember');
    
            if ($this->ion_auth->login($this->input->post('identity'), $this->input->post('password'), $remember)) {
                // If the login is successful, generate JWT token
                $user = $this->ion_auth->user()->row();
                $token = $this->generate_jwt_token($user->id, $user->email);
    
                // Send the token as JSON response
                $this->output->set_content_type('application/json')->set_output(json_encode(['status' => 'success', 'token' => $token]));
            } else {
                // If the login was unsuccessful
                $this->output->set_content_type('application/json')->set_status_header(401)->set_output(json_encode(['status' => 'failed', 'message' => 'Login gagal.']));
            }
        }
    }
    

    private function generate_jwt_token($user_id, $email)
    {

        // Sesuaikan data yang akan dimasukkan ke dalam token
        $token_data = array(
            'user_id' => $user_id,
            'email' => $email,
            'exp' => time() + 3600 // Token akan berlaku selama 1 jam (sesuaikan kebutuhan)
        );

        return $token = JWT::encode($token_data, 'your_secret_key');

    }
}
