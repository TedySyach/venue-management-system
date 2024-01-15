<!--<nav class="navbar navbar-default navbar-fixed-top">-->
<!--  <div class="container">-->
<!--    <div>-->
<!--      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">-->
<!--        <span class="sr-only">Toggle navigation</span>-->
<!--        <span class="icon-bar"></span>-->
<!--        <span class="icon-bar"></span>-->
<!--        <span class="icon-bar"></span>-->
<!--      </button>-->
<!--      <a href="<?php echo base_url() ?>">-->
<!--        <img src="<?php echo base_url('assets/images/company/').$company_data->foto.$company_data->foto_type ?>" alt="<?php echo $company_data->company_name ?>" width="100px">-->
<!--      </a>-->
<!--    </div>-->

    <!-- Collect the nav links, forms, and other content for toggling -->
<!--    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">-->
<!--      <ul class="nav navbar-nav">-->
<!--        <li class="<?php if($this->uri->segment(1) == ""){echo "active";} ?>">-->
<!--          <a href="<?php echo base_url() ?>">Home </a>-->
<!--        </li>-->
<!--        <li class="dropdown <?php if($this->uri->segment(1) == "about" or $this->uri->segment(1) == "contact"){echo "active";} ?>">-->
<!--          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Profil <span class="caret"></span></a>-->
<!--          <ul class="dropdown-menu">-->
<!--            <li class="<?php if($this->uri->segment(1) == "about"){echo "active";} ?>">-->
<!--              <a href="<?php echo base_url('about') ?>"> Tentang Kami</a>-->
<!--            </li>-->
<!--            <li class="<?php if($this->uri->segment(1) == "contact"){echo "active";} ?>">-->
<!--              <a href="<?php echo base_url('contact') ?>"> Hubungi Kami</a>-->
<!--            </li>-->
<!--          </ul>-->
<!--        </li>-->
<!--        <li class="<?php if($this->uri->segment(1) == "cart" && $this->uri->segment(2) == ""){echo "active";} ?>">-->
<!--          <a href="<?php echo base_url('cart') ?>"> Keranjang</a>-->
<!--        </li>-->
<!--      </ul>-->

<!--      <?php if($this->session->userdata('usertype') != NULL){ ?>-->
<!--        <ul class="nav navbar-nav navbar-right">-->
<!--          <li class="dropdown">-->
<!--            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Hi, <?php echo $this->session->userdata('username') ?> <span class="caret"></span></a>-->
<!--            <ul class="dropdown-menu">-->
<!--              <li><a href="<?php echo base_url('cart/history') ?>">Riwayat Booking</a></li>-->
<!--              <li><a href="<?php echo base_url('auth/edit_profil/').$this->session->userdata('user_id') ?>">Edit Profil</a></li>-->
<!--              <li><a href="<?php echo base_url('auth/profil') ?>">Profil Saya</a></li>-->
<!--              <li role="separator" class="divider"></li>-->
<!--              <li><a href="<?php echo base_url('auth/logout') ?>">Logout</a></li>-->
<!--            </ul>-->
<!--          </li>-->
<!--        </ul>-->
<!--      <?php }else{ ?>-->
<!--        <ul class="nav navbar-nav navbar-right">-->
<!--          <li><a href="<?php echo base_url('auth/register') ?>">Register</a></li>-->
<!--          <li><a href="<?php echo base_url('auth/login') ?>">Login</a></li>-->
<!--        </ul>-->
<!--      <?php } ?>-->
<!--    </div>-->
<!--  </div>-->
<!--</nav>-->
<script src="https://code.iconify.design/iconify-icon/1.0.7/iconify-icon.min.js"></script>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;1,100;1,200;1,300;1,400;1,500;1,600;1,700&display=swap');
    *{
        padding:0;
        margin:0;
        box-sizing:border-box;
        font-family: 'Poppins', sans-serif;
    }
    body{
        padding:0 !important;
    }
    .navbar{
        width:100%;
        background-color:white;
        z-index:5;
        margin-bottom:0;
        box-shadow: 0px 2px 9px 0px rgba(0, 0, 0, 0.19);
        position:relative;
        top:0;
        left:0;
    }
    .navbar-layout{
        width:1180px;
        margin:auto;
        display:grid;
        padding:7px 0;
        grid-template-columns:20% 60% 20%;
        align-items:center;
    }
    .navbar-menu .navbar-layout{
            display:none;
        }
    .navbar-menu ul{
        display:flex;
        justify-content:center;
        gap:35px;
        align-items:center;
        margin-bottom:0;
    }
    .navbar-menu ul li{
        list-style:none;
    }
    .navbar-menu ul li a{
        text-decoration:none;
        color:#252525;
        font-size:16px;
        font-weight:500;
    }
    .navbar-menu ul li a:hover{
        color:#3287C6;
    }
    .logo{
        position:relative;
    }
    .logo img{
        width:135px;
    }
    .navbar-button{
        display:flex;
        justify-content:flex-end;
        gap:10px;
        margin-top:0;
    }
    .navbar-menu .navbar-button{
        display:none;
    }
    .navbar-button ul{
        margin:0 !important;
    }
    .navbar-button ul li{
        list-style:none;
    }
    .navbar-button button{
        padding:6px 22px;
        padding-bottom:5px;
        border-radius:100px;
        transition:.2s all;
    }
    .navbar-button a:nth-child(1) button{
        background:transparent;
        border:2px solid #FF6600;
        font-size:15px;
        color:#FF6600;
    }
    .navbar-button a:nth-child(1) button:hover{
        background:#FF6600;
        color:white;
    }
    .navbar-button a:nth-child(2) button{
        background:transparent;
        border:2px solid #2FA385;
        font-size:15px;
        color:#2FA385;
    }
    .navbar-button a:nth-child(2) button:hover{
        background:#2FA385;
        color:white;
    }
    .hamburger{
        display:none;
    }
    .divider{
            display:block;
        }
    @media(max-width:768px){
        .navbar{
            position:relative;
        }
        .navbar-button{
            display:none;
        }
        .navbar-layout{
            display:flex;
            justify-content:space-between;
            width:100%;
            padding:9px 12px;
        }
        .navbar-menu .navbar-layout{
            display:flex;
        }
        .navbar-menu{
            position:fixed;
            top:0;
            left:0;
            transform:translateX(-300%);
            background:white;
            transition:.5s all;
            width:100%;
            height:100vh;
        }
        .navbar-menu logo a img{
            filter: brightness(0) invert(1);
        }
        .navbar-menu ul{
            display:flex;
            flex-direction:column;
            align-items:flex-start;
            justify-content:flex-start;
            padding:0 17px;
            gap:0;
            padding-top:20px;
            width:100%;
        }
        .navbar-menu ul li{
            /*border-top:1px solid #2FA385;*/
            border-bottom:1px solid #2FA385;
            width:100%;
            padding:11px 0;
        }
        .navbar-menu ul li a{
            font-size:18px;
        }
        #navbarMenu.active-menu{
            transform:translateX(0);
        }
        .navbar-menu .navbar-button{
            display:flex;
            justify-content:center;
            padding:0 17px;
            margin-top:30px;
        }
        .navbar-menu .navbar-button button{
            padding:7px 28px;
            padding-bottom:6px;
            border-radius:100px;
            transition:.2s all;
            font-size:18px !important;
            width:100%;
        }
        .dropdown-menu{
            background-color:transparent;
            border:none;
            box-shadow:none;
        }
        .divider{
            display:none;
        }
        .navbar-menu .navbar-button ul{
            padding-top:0;
            padding:0;
        }
        .hamburger{
            background:#2FA385;
            border:none;
            outline:none;
            padding:0;
            margin:0;
            width:51px;
            height:51px;
            position:relative;
            display:block;
            border-radius:100px;
            box-shadow: -5px 1px 0px 0px #2B876F inset;
        }
        .hamburger iconify-icon{
            font-size:24px;
            color:white;
            position:absolute;
            left:50%;
            top:50%;
            transform:translate(-50%, -50%);
        }
        .dropdown .dropdown-menu{
            padding:0;
        }
        .dropdown-menu li a{
            padding:0 !important;
        }
    }
</style>

<div class="navbar">
    <div class="navbar-layout">
        <div class="logo">
            <a href="<?php echo base_url() ?>">
                <img src="<?php echo base_url('assets/images/company/').$company_data->foto.$company_data->foto_type ?>" alt="<?php echo $company_data->company_name ?>" width="100px">
            </a>
        </div>
        <button class="hamburger" onclick="clickMenu()">
            <iconify-icon icon="line-md:close-to-menu-alt-transition"></iconify-icon>
        </button>
        <div class="navbar-menu" id="navbarMenu">
            <div class="navbar-layout">
                <div class="logo">
                    <a href="<?php echo base_url() ?>">
                        <img src="<?php echo base_url('assets/images/company/').$company_data->foto.$company_data->foto_type ?>" alt="<?php echo $company_data->company_name ?>" width="100px">
                    </a>
                </div>
                <button class="hamburger" onclick="clickMenu()">
                    <iconify-icon icon="line-md:menu-to-close-alt-transition"></iconify-icon>
                </button>
            </div>
            
            <ul>
                <li><a href="<?php echo base_url() ?>">Beranda</a></li>
                <li><a href="<?php echo base_url('about') ?>">Tentang Kami</a></li>
                <li><a href="<?php echo base_url('contact') ?>">Hubungi kami</a></li>
                <li><a href="<?php echo base_url('cart') ?>">Pemesanan</a></li>
            </ul>
            <div class="navbar-button">
                <?php if($this->session->userdata('usertype') != NULL){ ?>
                <ul>
                  <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><button>Hi, <?php echo $this->session->userdata('username') ?> <span class="caret"></span></button></a>
                    <ul class="dropdown-menu">
                      <li><a href="<?php echo base_url('cart/history') ?>">Riwayat Booking</a></li>
                      <li><a href="<?php echo base_url('auth/edit_profil/').$this->session->userdata('user_id') ?>">Edit Profil</a></li>
                      <li><a href="<?php echo base_url('auth/profil') ?>">Profil Saya</a></li>
                      <li role="separator" class="divider"></li>
                      <li><a href="<?php echo base_url('auth/logout') ?>">Logout</a></li>
                    </ul>
                  </li>
                </ul>
                <?php }else{ ?>
                <a href="<?php echo base_url('auth/login') ?>"><button>Masuk</button></a>
                <a href="<?php echo base_url('auth/register') ?>"><button>Daftar</button></a>
                <?php } ?>
            </div>
        </div>
        <div class="navbar-button">
            <?php if($this->session->userdata('usertype') != NULL){ ?>
            <ul>
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><button>Hi, <?php echo $this->session->userdata('username') ?> <span class="caret"></span></button></a>
                <ul class="dropdown-menu">
                  <li><a href="<?php echo base_url('cart/history') ?>">Riwayat Booking</a></li>
                  <li><a href="<?php echo base_url('auth/edit_profil/').$this->session->userdata('user_id') ?>">Edit Profil</a></li>
                  <li><a href="<?php echo base_url('auth/profil') ?>">Profil Saya</a></li>
                  <li role="separator" class="divider"></li>
                  <li><a href="<?php echo base_url('auth/logout') ?>">Logout</a></li>
                </ul>
              </li>
            </ul>
            <?php }else{ ?>
            <a href="<?php echo base_url('auth/login') ?>"><button>Masuk</button></a>
            <a href="<?php echo base_url('auth/register') ?>"><button>Daftar</button></a>
            <?php } ?>
        </div>
    </div>
</div>

<script>
    function clickMenu() {
      const menuLayout = document.getElementById('navbarMenu');
      menuLayout.classList.toggle('active-menu');
    }
</script>
