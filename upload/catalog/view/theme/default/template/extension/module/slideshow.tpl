<div id="slideshow<?php echo $module; ?>" class="mycarousel" style="opacity: 1;">
  <?php foreach ($banners as $banner) { ?>
  <div class="item">
    <?php if ($banner['link']) { ?>
    <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
    <?php } else { ?>
    <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
    <?php } ?>
    <p class="slideDesc"><?php echo $banner['title']; ?></p>
  </div>
  <?php } ?>
</div>
<script type="text/javascript"><!--
$('#slideshow<?php echo $module; ?>').owlCarousel({
	items: '<?php echo count($banners) ?>' - 0,
    autoPlay: 5000,
    singleItem: true,
    navigation: true,
    navigationText: false,
    pagination: true,
    paginationNumbers: true
});
--></script>