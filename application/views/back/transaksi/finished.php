<?php $this->load->view('back/meta') ?>
  <div class="wrapper">
    <?php $this->load->view('back/navbar') ?>
    <?php $this->load->view('back/sidebar') ?>
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
      <!-- Content Header (Page header) -->
      <section class="content-header">
        <h1><?php echo $title ?></h1>
        <ol class="breadcrumb">
          <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
          <li><a href="#"><?php echo $module ?></a></li>
					<li class="active"><?php echo $title ?></li>
        </ol>
      </section>

<!-- Main content -->
<section class="content">
<!-- Small boxes (Stat box) -->
<div class="row">
            <div class="col-lg-12"><h1>TRANSAKSI SELESAI</h1><hr>
                    <h4>INVOICE NO. <?php echo $cart_finished_row->id_invoice ?> (<font color='red'>BELUM LUNAS</font>)</h4>
                    <?php echo form_open('cart/download_invoice/'.$cart_finished_row->id_trans, array("target"=>"_blank")) ?>
                        <button type="submit" name="download_invoice" class="btn btn-sm btn-success">Download Invoice</button>
                    <?php echo form_close() ?>
                    <br>
                    <div class="row">
                    <div class="col-lg-12">
                <div class="box-body table-responsive padding">
                    <table id="datatable" class="table table-striped table-bordered">
                    <thead>
                        <tr>
                                            <th style="text-align: center">No.</th>
                        <th style="text-align: center">Lapangan</th>
                                            <th style="text-align: center">Harga Per Jam</th>
                                            <th style="text-align: center">Tanggal</th>
                        <th style="text-align: center">Mulai</th>
                                            <th style="text-align: center">Durasi</th>
                                            <th style="text-align: center">Selesai</th>
                        <th style="text-align: center">Total</th>
                        </tr>
                    </thead>
                    <tbody>
                    <?php $no=1; foreach ($cart_finished as $cart){ ?>
                        <tr>
                        <td style="text-align:center"><?php echo $no++ ?></td>
                        <td style="text-align:left"><?php echo $cart->nama_lapangan ?></td>
                                            <td style="text-align:center"><?php echo number_format($cart->harga_jual) ?></td>
                                            <td style="text-align:center"><?php echo tgl_indo($cart->tanggal) ?></td>
                        <td style="text-align:center"><?php echo $cart->jam_mulai ?></td>
                                            <td style="text-align:center"><?php echo $cart->durasi ?></td>
                                            <td style="text-align:center"><?php echo $cart->jam_selesai ?></td>
                        <td style="text-align:right"><?php echo number_format($cart->total) ?></td>
                        </tr>
                    <?php } ?>
                    </tbody>
                    </table>
                    </div>
                    </div>
                </div>

                    <div class="row">
                        <div class="col-lg-12">
                            <table class="table table-striped table-bordered">
                            <tbody>
                                    <tr>
                                <th scope="row">SubTotal</th>
                                <td align="right">Rp</td>
                                        <td align="right"><?php echo number_format($cart_finished_row->subtotal) ?></td>
                                </tr>
                                    <tr>
                                <th scope="row">Diskon (Member)</th>
                                <td align="right">Rp</td>
                                        <td align="right"><?php echo number_format($cart_finished_row->diskon) ?></td>
                                </tr>
                                    <tr>
                                <th scope="row">Grand Total</th>
                                <td align="right">Rp</td>
                                        <td align="right"><b><?php echo number_format($cart_finished_row->grand_total) ?></b></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="col-lg-12">
                        <div class="row">
                            <label>Catatan:</label><br>
                            <?php if($cart_finished_row->catatan != NULL){?>
                        <?php echo $cart_finished_row->catatan ?>
                        <?php } else{echo "-";} ?>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-6">
                            <hr><h4>Pembayaran CashLez</h4><hr>
                            <button id="pay-button" class="btn btn-primary">Bayar Sekarang !!</button>
                            <pre style="margin-top:7px;"><div id="result-json">JSON result will appear here after payment:<br></div></pre> 
                        </div>
                        <div class="col-lg-6">
                            <hr><h4>Pembayaran Tunai</h4><hr>
                            <a href="<?php echo base_url('admin/transaksi/set_lunas/').$cart_finished_row->id_trans ?>">
                              <button name="update" class="btn btn-success"><i class="fa fa-check"></i> Set Lunas</button>
                            </a>
                             
                        </div>
                    </div>
                    <!-- 
                    <div class="row">
                        <div class="col-lg-12">
                            <hr><h4>PERHATIAN</h4><hr>
                            <ul>
                                <li>Segera lakukan pembayaran sebelum: <b><?php $time = strtotime($cart_finished_row->deadline); echo date("d F Y | H:i:s",$time); ?> WIB</b>, apabila melewati batas waktu tersebut maka booking dianggap batal.</li>
                        <li>Jumlah yang harus Anda bayarkan adalah sebesar: Rp <b><?php echo number_format($cart_finished_row->grand_total) ?></b></li>
                        <li>Silahkan melakukan konfirmasi pembayaran ke halaman berikut ini, <a href="<?php echo base_url('contact') ?>">klik disini</a> atau langsung menghubungi kami ke customer service yang telah disediakan dan melampirkan foto bukti bayarnya.</li>
                        <li>Kami akan segera memproses pemesanan Anda setelah mendapatkan konfirmasi pembayaran segera mungkin.</li>
                            </ul>
                            <p align="center">~ Terima Kasih ~</p>
                        </div>
                    </div> -->
          </div>

</div><!-- /.row -->
</section><!-- /.content -->

<!-- TODO: Remove ".sandbox" from script src URL for production environment. Also input your client key in "data-client-key" -->
<script src="https://app.midtrans.com/snap/snap.js" data-client-key="Mid-client-CMMvQbbR-Df185dW"></script>
    <script type="text/javascript">
      document.getElementById('pay-button').onclick = function(){
        // SnapToken acquired from previous step
        snap.pay('<?=$snapToken?>', {
          // Optional
          onSuccess: function(result){
            /* You may add your own js here, this is just example */ document.getElementById('result-json').innerHTML += JSON.stringify(result, null, 2);
          },
          // Optional
          onPending: function(result){
            /* You may add your own js here, this is just example */ document.getElementById('result-json').innerHTML += JSON.stringify(result, null, 2);
          },
          // Optional
          onError: function(result){
            /* You may add your own js here, this is just example */ document.getElementById('result-json').innerHTML += JSON.stringify(result, null, 2);
          }
        });
      };
    </script>
    </body>
</html>