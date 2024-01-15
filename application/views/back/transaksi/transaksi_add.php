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
            <div class="col-lg-4">
              <?php echo form_open('#', array('id' => 'ctmForm')); ?>
                  <select class="form-control" name='customer' id="ctm">
                  <?php if (!isset($_SESSION['ctm-change'])): ?>
                    <option value="">...Pilih  Customer...</option>
                  <?php endif; ?>
                      <?php foreach($users as $usr) : ?>
                      <option value='<?= $usr->id ; ?>' <?php echo (isset($_SESSION['ctm-change']) && $_SESSION['ctm-change'] == $usr->id) ? 'selected' : ''; ?>><?= $usr->name ; ?></option>
                      <?php endforeach ; ?>
                  </select>
              <?php echo form_close(); ?>
           </div>
            <div class="col-lg-1">
              <!-- Button trigger modal -->
              <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#exampleModal">
                +Customer
              </button>
           </div>
           <div class="col-lg-4">
              <select class="form-control" name='venue' id="lapanganSelect">
                 <option value="">.Pilih Lapang Dulu...</option>
                  <?php foreach($lapangan_new as $pay) : ?>
                   <option value='<?= $pay->id_lapangan ; ?>'><?= $pay->nama_lapangan ; ?></option>
                  <?php endforeach ; ?>
              </select>
           </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
                 <h1>DETAIL BOOKING </h1>
            <hr>
            <form action="<?php echo base_url('admin/transaksi/checkout') ?>" method="post">
              <div class="row">
                <div class="col-lg-12"><?php if ($this->session->flashdata('message')) {
                                          echo $this->session->flashdata('message');
                                        } ?>
                  <div class="box-body table-responsive padding">
                    <table id="datatable" class="table table-striped table-bordered">
                      <thead>
                        <tr>
                          <th style="text-align: center">Lapangan</th>
                          <th style="text-align: center">Harga</th>
                          <th style="text-align: center">Tanggal</th>
                          <th style="text-align: center">Jam Mulai</th>
                          <th style="text-align: center">Durasi</th>
                          <th style="text-align: center">Jam Selesai</th>
                          <th style="text-align: center">Total</th>
                          <th style="text-align: center">Aksi</th>
                        </tr>
                      </thead>
                      <tbody>
                        <?php $no = 1;
                        foreach ($cart_data as $cart) { ?>
                          <tr>
                            <td style="text-align:left"><?php echo $cart->nama_lapangan ?></td>
                            <td style="text-align:center" class="harga_per_jam"><?php echo number_format($cart->harga) ?></td>
                            <td style="text-align:center">
                              <?php echo form_input($tanggal) ?>
                              <input type="hidden" name="harga_jual[]" value="<?php echo $cart->harga ?>">
                              <input type="hidden" name="lapangan[]" value="<?php echo $cart->lapangan_id ?>">
                              <input type="hidden" name="id_transdet[]" value="<?php echo $cart->id_transdet ?>">
                              <input type="hidden" value="<?php echo $cart->lapangan_id; ?>" class="lapangan_id">
                            </td>
                            <td style="text-align:center">
                              <?php echo form_dropdown('', array('' => '- Pilih Tanggal Dulu -'), '', $jam_mulai); ?>
                              <span class="loading_container" style="display:none;">
                                <img src="<?php echo base_url(); ?>assets/template/frontend/img/loading.gif" style="display:inline;" />&nbsp;memuat data ...</span>
                            </td>
                            <td style="text-align:center">
                              <input type="number" name="durasi[]" class="durasi" min="1">
                            </td>
                            <td style="text-align:center" class="jam_selesai"></td>
                            <td style="text-align:center" class="subtotal"></td>
                            <td style="text-align:center">
                              <a href="<?php echo base_url('admin/transaksi/delete/') . $cart->id_transdet ?>" class="btn btn-sm btn-danger"><i class="fa fa-remove"></i></a>
                            </td>
                          </tr>
                        <?php } ?>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>

              <table class="table table-striped table-bordered">
                <tbody>
                  <tr>
                    <th>SubTotal</th>
                    <td align="center">Rp</td>
                    <td align="right" id="subtotal_bawah"></td>
                  </tr>
                  <tr>
                    <th>Diskon (Member)</th>
                    <td align="center">Rp</td>
                    <td align="right" id="diskon"></td>
                  </tr>
                  <tr>
                    <th scope="row">Grand Total</th>
                    <td align="center">Rp</td>
                    <td align="right"><b>
                        <div id="grandtotal"></div>
                      </b></td>
                  </tr>
                </tbody>
              </table>

              <?php if ($cek_keranjang != NULL) { ?>
                <div class="col-lg-12">
                  <div class="row">
                    <div class="form-group"><label>Catatan</label>
                      <input type="text" name="catatan" class="form-control">
                    </div>
                  </div>
                </div>
              <?php } ?>

              <?php if (!empty($customer_data->id_trans)) { ?>
                <div class="row">
                  <div class="col-lg-12">
                    <?php if (!empty($cek_keranjang->lapangan_id)) { ?>
                      <a href="<?php echo base_url('admin/transaksi/empty_cart/') . $customer_data->id_trans ?>">
                        <button name="hapus" type="button" class="btn btn-danger" aria-label="Left Align" title="Kosongkan Keranjang" OnClick="return confirm('Apakah Anda yakin?');">
                          <span class="glyphicon glyphicon-trash" aria-hidden="true"></span> Kosongkan
                        </button>
                      </a>
                    <?php } ?>
                    <?php if ($cek_keranjang != NULL) { ?>
                      <?php	if (!$this->ion_auth->logged_in()) { ?>
                      <a href="<?php echo base_url('cart/register') ?>">
                      <button name="hapus" type="button" class="btn btn-primary" aria-label="Left Align" title="Lanjut Belanja">
                        <span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span> Chekout
                      </button>
                        </a>
                    <?php } else { ?>
                      <button name="checkout" type="submit" class="btn btn-success" aria-label="Left Align" title="Checkout">
                        <span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span> Checkout
                      </button>
                    <?php } } ?>
                  </div>
                </div>
                <input type="hidden" name="id_trans" value="<?php echo $customer_data->id_trans ?>">
              <?php } ?>
              <?php echo form_close() ?>
          </div>



        </div><!-- /.row -->
      </section><!-- /.content -->
    </div><!-- /.content-wrapper -->
    
    
      <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <?php echo form_open("admin/transaksi/registerCtm");?>
            <div class="modal-body">
          
                <div class="mb-3">
                  <label for="exampleFormControlInput1" class="form-label">Email</label>
                  <input name="email" required type="email" class="form-control" id="exampleFormControlInput1" placeholder="name@example.com">
                </div>
                <div class="mb-3">
                  <label for="exampleFormControlinput1" class="form-label">Nama Customer</label>
                  <input  name="nama" required class="form-control" id="exampleFormControlinput1" rows="3">
                </div>
                <div class="mb-3">
                  <label for="exampleFormControlinput2" class="form-label">No Hp</label>
                  <input  name="nohp" required class="form-control" id="exampleFormControlinput2" rows="3">
                </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Tutup</button>
              <button type="submit" class="btn btn-primary">Simpan</button>
            </div>
          <?php echo form_close(); ?>
        </div>
      </div>
    </div>
    
    <?php $this->load->view('back/footer') ?>
  </div><!-- ./wrapper -->
  <!-- <?php $this->load->view('back/js') ?> -->
 <link href="<?php echo base_url('assets/plugins/') ?>datepicker/css/bootstrap-datepicker.css" rel="stylesheet">
		<script src="<?php echo base_url('assets/plugins/') ?>datepicker/js/bootstrap-datepicker.js"></script>
		<script type="text/javascript">
			const numberWithCommas = (x) => {
				var parts = x.toString().split(".");
				parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				return parts.join(".");
			}

			$(function() {
				$(document).on("focus", ".tanggal", function() {
					$(this).datepicker({
						startDate: '0',
						autoclose: true,
						todayHighlight: true,
						format: 'yyyy-mm-dd'
					});
				});

				$('.tanggal').on('changeDate', function(ev) {
					tanggal_el = $(this);
					tanggal_val = $(this).val();
					jam_mulai_el = tanggal_el.parent().parent().find(".jam_mulai");
					durasi_el = tanggal_el.parent().parent().find(".durasi");
					jam_selesai_el = durasi_el.parent().parent().find(".jam_selesai");
					loading_container_el = tanggal_el.parent().parent().find(".loading_container");
					lapangan_id_el = tanggal_el.parent().parent().find(".lapangan_id");

					jam_mulai_el.hide();
					loading_container_el.show();

					$.post('<?php echo base_url(); ?>Cart/getJamMulai', {
							tanggal: tanggal_val,
							lapangan_id: lapangan_id_el.val()
						}, function(data) {
							jam_mulai_el.show();
							loading_container_el.hide();
							jam_mulai_el.html("");

							jam_mulai_el.append("<option value='' selected='selected'>- Pilih Jam Mulai -</option>");

							count = 0;

							data.forEach(function(item, index) {
								// console.log(item);
								jam_mulai_el.append("<option durasi='" + item.durasi + "'>" + item.jam_mulai + "</option>");
								count++;
							});

							durasi_el.val(0);
							jam_selesai_el.html("");

							if (count == 0) {
								jam_mulai_el.html("");
								jam_mulai_el.append("<option value='' selected='selected'>- Tidak ada pilihan -</option>");
							}

						},
						'json'
					);
				});

				$(document).on("change", ".jam_mulai", function() {
					jam_mulai_el = $(this);
					durasi_el = jam_mulai_el.parent().parent().find(".durasi");
					durasi_el.val(jam_mulai_el.find(":selected").attr("durasi")).change();
				});

				$(document).on("change keyup", ".durasi", function() {
					durasi_el = $(this);
					durasi = $(this).val();

					if (durasi == "") {
						durasi = 0;
						durasi_el.val(durasi);
					}

					jam_mulai_el = durasi_el.parent().parent().find(".jam_mulai");
					jam_selesai_el = durasi_el.parent().parent().find(".jam_selesai");

					harga_per_jam_el = durasi_el.parent().parent().find(".harga_per_jam");
					subtotal_el = durasi_el.parent().parent().find(".subtotal");
					
					tanggal_el5= durasi_el.parent().parent().find('.tanggal');
				    lapangan_id5 = durasi_el.parent().parent().find('.lapangan_id');

					if (jam_mulai_el.val() != "") {
						jam_selesai = moment("01-01-2018 " + jam_mulai_el.val(), "MM-DD-YYYY HH:mm:ss").add(parseInt(durasi), 'hours').format('HH:mm:ss');
						jam_selesai_el.html(jam_selesai);

						harga_per_jam = harga_per_jam_el.html().replace(/,/g, '');
						harga_per_jam_int = parseInt(harga_per_jam);

						subtotal_el.html(numberWithCommas(harga_per_jam_int * parseInt(durasi)));

						subtotal_bawah = 0;
						$('.subtotal').each(function(i, obj) {
							a_subtotal_html = $(this).html().trim().replace(/,/g, '');
							if (a_subtotal_html == "") {
								a_subtotal_html = "0";
							}

							a_subtotal_html_int = parseInt(a_subtotal_html);
							subtotal_bawah += a_subtotal_html_int;
						});

						<?php if ($this->session->userdata('usertype') == '3') {
							echo "var disc = '" . $diskon['harga'] . "';"; ?>
						<?php } else {
							echo "var disc = '0';";
						} ?>

						var diskon = $('#diskon').val();

						$("#subtotal_bawah").html(numberWithCommas(subtotal_bawah));
						$("#diskon").html(numberWithCommas(disc));
						var gtotal = (subtotal_bawah - disc);
						$("#grandtotal").html(numberWithCommas(gtotal));
						
				    	$.post('<?php echo base_url(); ?>Cart/get_jam_selesai_terpakai', {
							
							tanggal: tanggal_el5.val(),
							lapangan_id: lapangan_id5.val(),
							jam_selesai: jam_selesai
						}, function(data) {
							if (data == '0') {
								durasi_el.removeAttr('max');
							} else if (data == '1') {
								durasi_el.attr('max', '1');
							}
						},
						'json'
					   );
					}
				});
			});
		</script>

    <script>
        document.getElementById('lapanganSelect').addEventListener('change', function() {
            var selectedValue = this.value;
            if (selectedValue) {
                window.location.href = '<?php echo base_url("admin/transaksi/buyL/"); ?>' + selectedValue; // Gantilah 'link_anda/' dengan URL yang sesuai
            }
        });
    </script>
      
<script>
    $(document).ready(function () {
        // Menangani peristiwa perubahan pada elemen <select>
        $('#ctm').change(function () {
            // Mengambil nilai yang dipilih
            var selectedCtm = $(this).val();

            // Mengeksekusi permintaan Ajax
            $.ajax({
                type: 'POST',
                url: '<?= base_url('admin/transaksi/setCtm') ?>', // Gantilah dengan URL yang sesuai
                data: { selected_Ctm: selectedCtm },
                success: function (data) {
                    // Menampilkan hasil Ajax di div atau elemen lain
                     // Refresh the page after successful Ajax request
                     location.reload();

                },
                error: function () {
                    alert('Error in Ajax request');
                }
            });
        });
    });
</script>
</body>
</html>
