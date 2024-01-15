<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
<style>
    .swiper-slide img{
        width:100% !important;
    }
    .swiper-button-next, .swiper-button-prev{
        display:block;
    }
    @media(max-width:768px){
        .swiper-button-next, .swiper-button-prev{
            display:none;
        }
    }
</style>
<div class="swiper mySwiper">
    <div class="swiper-wrapper">
        <?php foreach($slider_data as $slider){ ?>
          <div class="swiper-slide">
              <a href="<?php echo $slider->link ?>" target="_self"><img src="<?php echo base_url('assets/images/slider/').$slider->foto.$slider->foto_type?>" alt="<?php echo $slider->nama_slider ?>"></a>
          </div>
      <?php } ?>
    </div>
    <div class="swiper-button-next"></div>
    <div class="swiper-button-prev"></div>
</div>

<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
<script>
    var swiper = new Swiper(".mySwiper", {
      navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
      },
    });
</script>
