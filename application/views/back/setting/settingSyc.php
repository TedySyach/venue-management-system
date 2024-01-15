<?php $this->load->view('back/meta') ?>
<?php $this->load->view('back/navbar') ?>
<?php $this->load->view('back/sidebar') ?>
<link rel="stylesheet" href="https://upos-conn.com/assets_dashboard/css/styles.css">
    <div class="wrapper">
      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1><?php echo $title ?> </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            <li><a href="#"><?php echo $module ?></a></li>
  					<li class="active"><?php echo $title ?></li>
          </ol>
        </section>

        <!-- Main content -->
        <section class='content'>
          <div class='row'>
              <div class="col-lg-12">
                <div class="box box-primary">
                  <div class="box-body">
                    <div class="card">
                      <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation" class="active"><a href="#upos" aria-controls="upos" role="tab" data-toggle="tab"><label>Syc Upos Merchant</label></a></li>
                        <li role="presentation"><a href="#daftarin" aria-controls="daftarin" role="tab" data-toggle="tab"><label>Syc Organize Daftarin</label></a></li>
                        <li role="presentation"><a href="#master" aria-controls="master" role="tab" data-toggle="tab"><label>Syc Apikey Web Master</label></a></li>
                      </ul>
                    
                      <?php if($this->session->flashdata('message')){echo $this->session->flashdata('message');} ?>
                        <div class="tab-content">
                          <div role="tabpanel" class="tab-pane active" id="upos"><br>
                                  
                                    <div class="login-page">
                                        <h1 class="text-center text-gradient mt-2 font-weight-bold">Welcome!</h1>
                                        <p class="text-uppercase text-center text-warning h2">Sign In For Synchronize Merchant</p>
                                        <!-- <p>  <?= $this->session->flashdata('message_name'); ?></p> -->
                                        <form class="form-login" method="post" action="<?= site_url('admin/SettingSyc/login') ?>">
                                            <div class="form-group form-component">
                                                <input type="email" class="form-control rounded-pill shadow-none pl-3 border-input" placeholder="Masukan Email" name="posEmail"  value="<?= set_value('posEmail'); ?>">
                                                <?= form_error('posEmail','<font size="1px" color="red">','</font>') ?>
                                            </div>
                                        
                                            <div class="form-group form-component flex">
                                                <input type="password" class="form-control password rounded-pill shadow-none pl-3 border-input" placeholder="Password" name="posPassword">
                                                <i class="far fa-eye" id="PasswordShow" style="margin-left:-37px; cursor: pointer;"></i>
                                            </div>
                                            <?= form_error('posPassword','<font size="1px" color="red">','</font>') ?>
                                            <div class="form-group form-component flex">
                                                <input oninput="this.value = this.value.replace(/[^0-9]/g, '').slice(0, 4);" type="number" class="form-control password rounded-pill shadow-none pl-3 border-input" placeholder="Pin" name="posPin">
                                                <i class="fas fa-lock"  style="margin-left:-37px; cursor: pointer;"></i>
                                                
                                            </div>
                                            <?= form_error('posPin','<font size="1px" color="red">','</font>') ?>
                                          
                                            <button type="submit" class="btn btn-warning btn-lg btn-block rounded-pill text-uppercase font-weight-bold">Synchronize Now</button>
                                        </form>
                                    </div>
                          </div>

                          <div role="tabpanel" class="tab-pane" id="daftarin"><br>
                            Daftarin
                          </div>
                        
                          <div role="tabpanel" class="tab-pane" id="master"><br>
                            web master
                          </div>
                        
                        </div>
                    
                    </div>
                  </div>
                </div>
              </div>
          </div>
        </section>
      </div><!-- /.content-wrapper -->
      <?php $this->load->view('back/footer') ?>
    </div><!-- ./wrapper -->
    <?php $this->load->view('back/js') ?>
   
  </body>
</html>
