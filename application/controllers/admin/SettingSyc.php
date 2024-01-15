<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class SettingSyc extends CI_Controller
{
  function __construct()
  {
    parent::__construct();
    $this->load->model('Album_model');

    $this->data['module'] = 'Settting Syncronize';

    if(!$this->ion_auth->logged_in()){redirect('admin/auth/login', 'refresh');}
    elseif(!$this->ion_auth->is_superadmin() && !$this->ion_auth->is_admin()){redirect(base_url());}
  }

  public function index()
  {
    $this->data['title']    = 'Data '.$this->data['module'];

    $this->load->view('back/setting/settingSyc', $this->data);
  }


    
  public function login()
  {	
     
      
      $this->form_validation->set_rules('posEmail','PosEmail','required|trim');
      $this->form_validation->set_rules('posPassword','PosPassword','required|trim');
      $this->form_validation->set_rules('posPin','PosPin','required|trim');
      if ($this->form_validation->run() == false) {

        $this->data['title']    = 'Data '.$this->data['module'];

         $this->load->view('back/setting/settingSyc', $this->data);
      }
      else
      {
              $posEmail=htmlspecialchars($this->input->post('posEmail', true));
              $posPassword=htmlspecialchars($this->input->post('posPassword', true));
              $posPin=htmlspecialchars($this->input->post('posPin', true));
                $data =
                [
                    'posEmail'          =>$posEmail,
                    'posPassword'       =>$posPassword,
                    'posPin'       	  =>$posPin
                ];

              
                $verif  = $this->http_request(base_api."/auth/v1/posAuth-login",$data);
                $data= [
                    'item'     => json_decode($verif, TRUE)
                ];
          
                $isTouch = empty($data['item']['login']);
                // var_dump($isTouch);
                if ($isTouch == false) {
                $data['pesan'] =$data['item']['messages'];
                $notif=$data['pesan']['error'];
                } else {
                $data['pesan2'] =$data['item'];
              //   var_dump($data['pesan']);
                $data['pesan'] =$data['item']['messages'];
                // var_dump($data['pesan']);
                $notif=$data['pesan']['success'];
                
              //   var_dump ($notif); die;
                }
              
                //   echo $notif ; die;
                //   var_dump($data['item']); die;
                
                
                if ($notif == "Password Salah.") {
                    $this->session->set_flashdata('message', '
                    <div class="alert alert-block alert-warning"><button type="button" class="close" data-dismiss="alert"><i class="ace-icon fa fa-times"></i></button>
                                <i class="ace-icon fa fa-bullhorn green"></i>' .$notif.'
                    </div>');
                     redirect(site_url('admin/SettingSyc'));
                  }
                  else if ($notif == "Akun tidak terdaftar.") {
                    $this->session->set_flashdata('message', '
                    <div class="alert alert-block alert-warning"><button type="button" class="close" data-dismiss="alert"><i class="ace-icon fa fa-times"></i></button>
                                <i class="ace-icon fa fa-bullhorn green"></i> ' .$notif.'
                    </div>');
                       redirect(site_url('admin/SettingSyc'));
                  }
                  else if ($notif == "Akun belum aktif.") {
                    $this->session->set_flashdata('message', '
 						        <div class="alert alert-block alert-danger"><button type="button" class="close" data-dismiss="alert"><i class="ace-icon fa fa-times"></i></button>
 											<i class="ace-icon fa fa-bullhorn green"></i>' .$notif.'
 						        </div>');
                       redirect(site_url('admin/SettingSyc'));
                  }
                  else {
                      $data['login'] =$data['item']['data'];
                    // $data['token'] =$data['item']['login']['token'];
                      $pin =$posPin;
                      $role=$data['login']['role'];
                      $userID=$data['login']['userId'];

                      $ambilUSer = $this->http_get(base_api."/auth/v1/PosUser/".$userID);
                      $dataRu= [
                          'item'     => json_decode($ambilUSer  , TRUE)
                      ];
                      
                      $data['info'] =$dataRu['item']['data'][0];
                  
                      $merchantID=$data['info']['merchantId'];
                      $branchId=$data['info']['branchId'];
                    //   var_dump($data['info']); die;
                      // echo $merchantID; die;
                  
                      // $role=1;
                      if ($role == 10) {
                        //   redirect('prahwa-home');
                      } else if ($role == 20) {
                        //   redirect('mitra-home');
                      } else if ($role == 30) {
                          if ($pin == 0000){
                            echo 'berhasil login';

                            $this->db->where('id_syc', '1');
                            $this->db->update('synchronization_plat', array(
                                'id_merchat_upos'		=>	$merchantID
                            ));
                            
                                $cekFbo = $this->http_get(base_api."/master/v1/PosFiturBuyOnl/".$merchantID);
                                $dataFbo= [
                                    'item'     => json_decode($cekFbo  , TRUE)
                                ];
                                @$data['infoFbo'] =$dataFbo['item']['data'];
                                if ($data['infoFbo'] != null) {
                                  // var_dump($data['infoFbo']);
                                } else {
                                  // echo 'boleh create fbo';
    
                                  $data_Fbo1 =
                                    [
                                        'posMerchantID'     	=>$merchantID
                                    ];
                                
                                    
                                    $insertFbo1 = $this->http_Post(base_api."/master/v1/PosFiturBuyOnl",$data_Fbo1);
    
                                }
                            
                            $this->session->set_flashdata('message', '
                            <div class="alert alert-block alert-success"><button type="button" class="close" data-dismiss="alert"><i class="ace-icon fa fa-times"></i></button>
                                        <i class="ace-icon fa fa-bullhorn green"></i>Congratulations. Account synchronization was successful
                            </div>');
                            redirect(site_url('admin/SettingSyc'));

                            
                            
                            //   $_SESSION['aksesKm']='utama';
                            //   $_SESSION['data-login']=$data['login'];
                            //   $_SESSION['merchantID']=$merchantID;
                            //   $_SESSION['bToken']=0;
                            //   redirect('merchant-home');
                          } else {
                                  $cekKasir = $this->http_get(base_api."/master/v1/PosKasirMerchant-showBypin/".$merchantID."/".$pin);
                                  // $cekKasir = $this->http_get(base_api."/master/v1/PosKasirMerchant-showBypin/15/0");
                                  $dataCk= [
                                      'item'     => json_decode($cekKasir  , TRUE)
                                  ];
                                  @$data['infoKc'] =$dataCk['item']['data'];
                                  
                                  if($data['infoKc'] != null) {
                                    //   $idKasir=$data['infoKc']['idKasir'];
                                    //   $namaKasir=$data['infoKc']['namaKasir'];
                                    //   $akses=$data['infoKc']['akses'];
                                    //   $_SESSION['idKm']=$idKasir;
                                    //   $_SESSION['nameKm']=$namaKasir;
                                    //   $_SESSION['aksesKm']=$akses;

                                    //   $_SESSION['data-login']=$data['login'];
                                    //   $_SESSION['merchantID']=$merchantID;
                                    //$_SESSION['bToken']=$data['token'];
                                          if ($akses == 'utama') {
                                            //   redirect('merchant-home');
                                          } else if($akses == 'gudang') {
                                            //   redirect('master-produk-ritel');
                                          } else {
                                            //   redirect('merchant-pos-ritel');
                                          }
                                      
                                  } else {
                                    $this->session->set_flashdata('message', '
                                    <div class="alert alert-block alert-danger"><button type="button" class="close" data-dismiss="alert"><i class="ace-icon fa fa-times"></i></button>
                                                <i class="ace-icon fa fa-bullhorn green"></i>Pin Tidak Cocok
                                    </div>');
                                      redirect(site_url('admin/SettingSyc'));
                                  }
                          }
                      } else if ($role == 40) {
                          if ($pin == 0000){
                            //   $_SESSION['aksesKm']='utama';
                            //   $_SESSION['data-login']=$data['login'];
                            //   $_SESSION['merchantID']=$merchantID;
                            //   $_SESSION['branchId']=$branchId;
                            //   $_SESSION['bToken']=0;
                            //    redirect('branch-home');
                          }else {
                              $cekSales = $this->http_get(base_api."/master/v1/PosSalesBranch-showBypin/".$branchId."/".$pin);
                              // $cekSales = $this->http_get(base_api."/master/v1/PosKasirMerchant-showBypin/15/0");
                              $dataCk= [
                                  'item'     => json_decode($cekSales  , TRUE)
                              ];
                              @$data['infoKc'] =$dataCk['item']['data'];
                              
                              if($data['infoKc'] != null) {
                                //   $idKasir=$data['infoKc']['idSales'];
                                //   $namaKasir=$data['infoKc']['namaKasir'];
                                //   $akses=$data['infoKc']['akses'];
                                //   $_SESSION['idKm']=$idKasir;
                                //   $_SESSION['nameKm']=$namaKasir;
                                //   $_SESSION['aksesKm']=$akses;

                                //   $_SESSION['data-login']=$data['login'];
                                //   $_SESSION['merchantID']=$merchantID;
                                //   $_SESSION['branchId']=$branchId;
                                //$_SESSION['bToken']=$data['token'];
                                      if ($akses == 'utama') {
                                        //   redirect('branch-home');
                                      } else {
                                        //   redirect('branch-pos-ritel');
                                      }
                                  
                              } else {
                                  $this->session->set_flashdata('message_name', '<div class="alert alert-success text-danger alert-dismissible fade show" role="alert">Pin Tidak Cocok</div>');
                                //   redirect('sign-in');
                              }
                          }
                      } else if ($role == 50) {
                        //   redirect('kasir-home');
                      } else {
                        //   echo "Koneksi Internet Terputus";
                      }
                      // echo $role ;
                 
                  //   redirect('proteksi-berhasil');
                }
         }

  }

    
      function http_request($url,$data){
    
        $ch = curl_init(); 
                
        // set url 
        curl_setopt($ch, CURLOPT_URL, $url);
        
        // set user agent    
        curl_setopt($ch,CURLOPT_USERAGENT,'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.13) Gecko/20080311 Firefox/2.0.0.13');
        
        //insert data
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
        // return the transfer as a string 
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1); 
    
        // $output contains the output string 
        $output = curl_exec($ch); 
    
        // tutup curl 
        curl_close($ch);    
    
        // mengembalikan hasil curl
        return $output ;
    }
    
    
    function http_get($url){
        // persiapkan curl
        $ch = curl_init(); 
    
        // set url 
        curl_setopt($ch, CURLOPT_URL, $url);
        
        // set user agent    
        curl_setopt($ch,CURLOPT_USERAGENT,'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.13) Gecko/20080311 Firefox/2.0.0.13');
    
        // return the transfer as a string 
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1); 
    
        // $output contains the output string 
        $output = curl_exec($ch); 
    
        // tutup curl 
        curl_close($ch);      
    
        // mengembalikan hasil curl
      return $output;
    }

  
  
}
