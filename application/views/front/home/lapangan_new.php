<style>
    .layout-lapangan{
        padding:40px 0;
        background-color:white;
    }
    .heading-text{
        text-align:center;
        font-size:50px;
        margin-bottom:25px;
        color:#3287C6;
    }
    .grid-lapangan{
        width:1180px;
        margin:auto;
        display: flex;
        flex-wrap: wrap;
        justify-content: center; /* Menengahkan box secara horizontal */
        gap: 20px; /* Jarak antar box */
        row-gap:50px;
    }
    .grid-lapangan-box{
        flex: 0 1 calc(50% - 20px);
        text-align: center; /* Menengahkan teks secara horizontal */
    }
    .grid-lapangan-box img{
        width:100%;
        
    }
    .heading-venue{
        font-size:20px;
        font-weight:500;
        margin-bottom:15px;
    }
    .btn-venue{
        background:#2FA385;
        border:none;
        outline:none;
        color:white;
        border-radius:100px;
        padding:9px 16px;
        border:2px solid transparent;
    }
    .btn-venue:hover{
        border:2px solid #FF6600;
    }
    .venue-image{
        width:100%;
        height:320px;
        object-fit:cover;
        position:relative;
        border-radius:15px;
        margin-bottom:13px;
        overflow:hidden;
    }
    .venue-image img{
        width:100%;
        height:100%;
        position:absolute;
        left:0;
        top:0;
        transition:.4s all;
    }
    .venue-image:hover img{
        transform:scale(1.2);
    }
    @media(max-width:768px){
        .heading-text{
            font-size:35px;
        }
        .grid-lapangan{
            width:90%;
            flex-direction:column;
        }
        .venue-image{
            height:290px;
        }
    }
</style>
<div class="layout-lapangan">
    <h3 class="heading-text"><b>LAPANGAN KAMI</b></h3>
    <div class="grid-lapangan">
      <?php foreach($lapangan_new as $lapangan){ ?>
        <div class="grid-lapangan-box">
            <div class="venue-image">
                <?php
                if(empty($lapangan->foto)) {echo "<img class='card-img-top' src='".base_url()."assets/images/no_image_thumb.png'>";}
                else { echo "<img src='".base_url()."assets/images/lapangan/".$lapangan->foto."'> ";}
                ?>
            </div>
            
            <div class="caption">
              <p class="heading-venue"><?php echo $lapangan->nama_lapangan ?></p>
              <a href="<?php echo base_url('cart/buy/').$lapangan->id_lapangan ?>">
                <button class="btn-venue"><i class="fa fa-shopping-cart"></i> Booking Sekarang!</button>
              </a>
            </div>
        </div>
      <?php } ?>
    </div>
</div>

