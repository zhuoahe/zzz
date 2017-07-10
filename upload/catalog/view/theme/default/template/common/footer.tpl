<?php /* ?>
<footer>
  <div class="wrapper">
    <div class="copyright">
      <img src="http://themes.webiz.mu/opencart/teez2/catalog/view/theme/teez/image/logoFooter.jpg"
           alt="<?php echo $name; ?>" width="68" height="33" />
      <p><?php echo $powered; ?></p>
    </div>
    <ul class="footerLinks">
      <li><a href="<?php echo $home; ?>">Home</a></li>
      <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
      <li><a href="http://themes.webiz.mu/opencart/teez2/index.php?route=account/order">Order History</a></li>
      <li><a href="http://themes.webiz.mu/opencart/teez2/index.php?route=account/wishlist">Wish List</a></li>
      <li><a href="http://themes.webiz.mu/opencart/teez2/index.php?route=account/newsletter">Newsletter</a></li>
    </ul>
    <div class="clear"></div>
  </div>
</footer>

<?php // */ ?>
<?php //* ?>
<footer>
  <div class="container wrapper">
    <div class="row">
      <?php if ($informations) { ?>
      <div class="col-sm-3">
        <h5><?php echo $text_information; ?></h5>
        <ul class="list-unstyled">
          <?php foreach ($informations as $information) { ?>
          <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
          <?php } ?>
        </ul>
      </div>
      <?php } ?>
      <div class="col-sm-3">
        <h5><?php echo $text_service; ?></h5>
        <ul class="list-unstyled">
          <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
          <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
          <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
        </ul>
      </div>
      <div class="col-sm-3">
        <h5><?php echo $text_extra; ?></h5>
        <ul class="list-unstyled">
          <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
          <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
          <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
          <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
        </ul>
      </div>
      <div class="col-sm-3">
        <h5><?php echo $text_account; ?></h5>
        <ul class="list-unstyled">
          <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
          <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
          <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
          <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
        </ul>
      </div>
    </div>
    <hr>
    <p><?php echo $powered; ?></p>
  </div>
</footer>
<?php //*/ ?>

<script src="catalog/view/theme/default/js/custom.js" type="text/javascript"></script>
</body></html>