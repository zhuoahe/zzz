
<?php if ($testmode) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $text_testmode; ?></div>
<?php } ?>

<style type="text/css"> .spinner { height: 100%; width: 100%; position: absolute; z-index: 10; } .spinner.preloader { position: fixed; top: 0; left: 0; z-index: 1000; background-color: #fff; } .spinner .spinWrap { width: 200px; height: 100px; position: absolute; top: 50%; left: 50%; margin-left: -100px; margin-top: -50px; } .spinner .spinnerImage { margin: 28px 0 0 -25px; background: url(https://www.paypalobjects.com/images/checkout/hermes/icon_ot_spin_lock_skinny.png) no-repeat; } .spinner .loader, .spinner .spinnerImage { height: 100px; width: 100px; position: absolute; top: 0; left: 50%; opacity: 1; filter: alpha(opacity=100); } .spinner .loader, .spinner .spinnerImage { height: 100px; width: 100px; position: absolute; top: 0; left: 50%; opacity: 1; filter: alpha(opacity=100); } .spinner .loader { margin: 0 0 0 -55px; background-color: transparent; -webkit-animation: rotation 0.7s infinite linear; animation: rotation 0.7s infinite linear; border-left: 5px solid #cbcbca; border-right: 5px solid #cbcbca; border-bottom: 5px solid #cbcbca; border-top: 5px solid #2380be; border-radius: 100%; } @-webkit-keyframes rotation { from { -webkit-transform: rotate(0) } to { -webkit-transform: rotate(359deg) } } @-moz-keyframes rotation { from { -moz-transform: rotate(0) } to { -moz-transform: rotate(359deg) } } @-o-keyframes rotation { from { -o-transform: rotate(0) } to { -o-transform: rotate(359deg) } } @keyframes rotation { from { transform: rotate(0) } to { transform: rotate(359deg) } } </style>
<div id="preloaderSpinner" class="preloader spinner" style="">
  <div class="spinWrap">
    <p class="spinnerImage"></p>
    <p class="loader"></p>
    <p class="loadingMessage" id="spinnerMessage"></p>
    <p class="loadingSubHeading" id="spinnerSubHeading"></p>
  </div>
</div>
<form name="cart" action="<?php echo $action; ?>" method="post">
  <input type="hidden" name="cmd" value="_cart"/>
  <input type="hidden" name="upload" value="1"/>
  <input type="hidden" name="business" value="<?php echo $business; ?>"/>
  <?php $i = 1; ?>
  <?php foreach ($products as $product) { ?>
  <input type="hidden" name="item_name_<?php echo $i; ?>" value="<?php echo $product['name']; ?>"/>
  <input type="hidden" name="item_number_<?php echo $i; ?>" value="<?php echo $product['model']; ?>"/>
  <input type="hidden" name="amount_<?php echo $i; ?>" value="<?php echo $product['price']; ?>"/>
  <input type="hidden" name="quantity_<?php echo $i; ?>" value="<?php echo $product['quantity']; ?>"/>
  <input type="hidden" name="weight_<?php echo $i; ?>" value="<?php echo $product['weight']; ?>"/>
  <?php $j = 0; ?>
  <?php foreach ($product['option'] as $option) { ?>
  <input type="hidden" name="on<?php echo $j; ?>_<?php echo $i; ?>" value="<?php echo $option['name']; ?>"/>
  <input type="hidden" name="os<?php echo $j; ?>_<?php echo $i; ?>" value="<?php echo $option['value']; ?>"/>
  <?php $j++; ?>
  <?php } ?>
  <?php $i++; ?>
  <?php } ?>
  <?php if ($discount_amount_cart) { ?>
    <input type="hidden" name="discount_amount_cart" value="<?php echo $discount_amount_cart; ?>" />
  <?php } ?>
  <input type="hidden" name="currency_code" value="<?php echo $currency_code; ?>" />
  <input type="hidden" name="first_name" value="<?php echo $first_name; ?>" />
  <input type="hidden" name="last_name" value="<?php echo $last_name; ?>" />
  <input type="hidden" name="address1" value="<?php echo $address1; ?>" />
  <input type="hidden" name="address2" value="<?php echo $address2; ?>" />
  <input type="hidden" name="city" value="<?php echo $city; ?>" />
  <input type="hidden" name="zip" value="<?php echo $zip; ?>" />
  <input type="hidden" name="country" value="<?php echo $country; ?>" />
  <input type="hidden" name="address_override" value="0" />
  <input type="hidden" name="email" value="<?php echo $email; ?>" />
  <input type="hidden" name="invoice" value="<?php echo $invoice; ?>" />
  <input type="hidden" name="lc" value="<?php echo $lc; ?>" />
  <input type="hidden" name="rm" value="2" />
  <input type="hidden" name="no_note" value="1" />
  <input type="hidden" name="no_shipping" value="1" />
  <input type="hidden" name="charset" value="utf-8" />
  <input type="hidden" name="return" value="<?php echo $return; ?>" />
  <input type="hidden" name="notify_url" value="<?php echo $notify_url; ?>" />
  <input type="hidden" name="cancel_return" value="<?php echo $cancel_return; ?>" />
  <input type="hidden" name="paymentaction" value="<?php echo $paymentaction; ?>" />
  <input type="hidden" name="custom" value="<?php echo $custom; ?>" />
  <input type="hidden" name="bn" value="OpenCart_2.0_WPS" />
<!--  <div class="buttons">
    <div class="pull-right">
      <input type="submit" value="<?php echo $button_confirm; ?>" class="btn btn-primary" />
    </div>
  </div>-->
</form>
<script>
    //cart.submit();
</script>
<!--

<form name ="cart" action="https://www.paypal.com/cgi-bin/webscr" method="post">
<input type="hidden" name="cmd" value="_cart">
<input type="hidden" name="upload" value="1">
<input type="hidden" name="business" value="<?php echo $business; ?>">
<input type="hidden" name="currency_code" value="<?php echo $currency_code; ?>">
<input type="hidden" name="custom" value="<?php echo $custom; ?>">
<input type="hidden" name="invoice" value="<?php echo $invoice; ?>">
<input type="hidden" name="lc" value="<?php echo $lc; ?>">

<input type="hidden" name="shopping_url" value="https://www.lightbicycle.com/">
<input type="hidden" name="image_url" value="https://www.lightbicycle.com/style/logo.png">
  <?php $i = 1; ?>
  <?php foreach ($products as $product) { ?>
  <input type="hidden" name="item_name_<?php echo $i; ?>" value="<?php echo $product['name']; ?>"/>
  <input type="hidden" name="item_number_<?php echo $i; ?>" value="<?php echo $product['model']; ?>"/>
  <input type="hidden" name="amount_<?php echo $i; ?>" value="<?php echo $product['price']; ?>"/>
  <input type="hidden" name="quantity_<?php echo $i; ?>" value="<?php echo $product['quantity']; ?>"/>
  <input type="hidden" name="weight_<?php echo $i; ?>" value="<?php echo $product['weight']; ?>"/>
  <?php $j = 0; ?>
  <?php foreach ($product['option'] as $option) { ?>
  <input type="hidden" name="on<?php echo $j; ?>_<?php echo $i; ?>" value="<?php echo $option['name']; ?>"/>
  <input type="hidden" name="os<?php echo $j; ?>_<?php echo $i; ?>" value="<?php echo $option['value']; ?>"/>
  <?php $j++; ?>
  <?php } ?>
  <?php $i++; ?>
  <?php } ?>
  <?php if ($discount_amount_cart) { ?>
    <input type="hidden" name="discount_amount_cart" value="<?php echo $discount_amount_cart; ?>" />
  <?php } ?>

	<input type="hidden" name="item_name_1" value="RM29C06">
	<input type="hidden" name="amount_1" value="165">
	<input type="hidden" name="quantity_1" value="1">
	<input type="hidden" name="shipping_1" value="39.93">
</form>
<SCRIPT LANGUAGE="javascript">
cart.action = "https://www.paypal.com/cgi-bin/webscr";
cart.submit();
</SCRIPT>

-->