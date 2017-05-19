<div class="featured itemsBlock">
  <h3><?php echo $heading_title; ?></h3>
  <?php foreach ($products as $product) { ?>
  <div class="product-layout">
    <div class="product-thumb">
      <?php if ($product['special']) { ?>
      <span class="sale">Sale</span>
      <?php } ?>
      <div class="image">
        <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>">
      </div>
      <div class="caption">
        <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
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
