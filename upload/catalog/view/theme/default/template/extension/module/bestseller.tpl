<div class="bestseller itemsBlock">
  <h3><?php echo $heading_title; ?></h3>
  <div class="slides">
    <?php foreach ($products as $product) { ?>
    <div class="product-layout">
      <div class="product-thumb">
        <div class="image">
          <a href="<?php echo $product['href']; ?>">
            <img src="<?php echo $product['thumb']; ?>"
                 alt="<?php echo $product['name']; ?>"
                 title="<?php echo $product['name']; ?>" />
          </a>
        </div>
        <div class="caption">
          <h4>
            <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
          </h4>
          <p class="price">
            <?php if (!$product['special']) { ?>
            <?php echo $product['price']; ?>
            <?php } else { ?>
            <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
            <?php } ?>
          </p>
        </div>
      </div>
    </div>
    <?php } ?>
  </div>
</div>
<script type="text/javascript"><!--
    $('.slides').owlCarousel({
        items: 5,
        autoPlay: 5000,
        singleItem: true,
        navigation: true,
        navigationText: false,
        pagination: false,
    });
    --></script>