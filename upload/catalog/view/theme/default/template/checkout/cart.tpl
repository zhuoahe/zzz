<?php echo $header; ?>
<div class="wrapper">
  <div class="container">
    <ul class="breadcrumb">
      <?php foreach ($breadcrumbs as $breadcrumb) { ?>
      <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
      <?php } ?>
    </ul>
    <?php if ($attention) { ?>
    <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $attention; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="row"><?php echo $column_left; ?>
      <?php if ($column_left && $column_right) { ?>
      <?php $class = 'col-sm-6'; ?>
      <?php } elseif ($column_left || $column_right) { ?>
      <?php $class = 'col-sm-9'; ?>
      <?php } else { ?>
      <?php $class = 'col-sm-12'; ?>
      <?php } ?>
      <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
        <div class="left">
          <h1><?php echo $heading_title; ?>
            <?php if ($weight) { ?>
            &nbsp;(<?php echo $weight; ?>)
            <?php } ?>
          </h1>
          <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
          <div class="table-responsive">
            <table class="table ">
              <thead>
                <tr>
                  <!--<td class="text-center"><?php echo $column_image; ?></td>-->
                  <td class="text-left"><?php echo 'Product';//$column_product; ?></td>
                  <td class="text-left">
                    <div class="hidde-782">
                    <?php echo 'OPtion';//$column_option; ?>
                    </div>
                    <div class="show-487">
                      <?php echo 'Product Info'; ?>
                    </div>
                  </td>
                  <td class="text-left"><?php echo $column_quantity; ?></td>
                  <td class="text-right"><?php echo $column_price; ?></td>
                  <td class="text-right"><?php echo $column_total; ?></td>
                  <td></td>
                </tr>
              </thead>
              <tbody>
                <?php foreach ($products as $product) { ?>
                <tr>
                  <!--
                  <td class="text-center"><?php if ($product['thumb']) { ?>
                    <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
                    <?php } ?></td>
                    -->
                  <td class="text-left"><?php if ($product['thumb']) { ?>
                    <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
                    <?php } ?><br>
                    <a href="<?php echo $product['href']; ?>"><?php echo $product['model']; ?></a>
                    <br>

                    <?php /*if (!$product['stock']) { ?>
                    <span class="text-danger">***</span>
                    <?php }*/ ?>
                    <?php //echo $product['model']; ?>
                  </td>
                  <td class="text-left">
                    <div class="show-487">
                      <?php if ($product['thumb']) { ?>
                      <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
                      <?php } ?><br>
                      <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                      <br>

                      <?php if (!$product['stock']) { ?>
                      <span class="text-danger">***</span>
                      <?php } ?>
                      <?php echo $product['model']; ?>
                    </div>

                    <?php if ($product['option']) { ?>
                    <?php foreach ($product['option'] as $option) { ?>
                    <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
                    <br />
                    <?php } ?>
                    <?php } ?>
                    <?php if ($product['reward']) { ?>
                    <small><?php echo $product['reward']; ?></small>
                    <br />
                    <?php } ?>
                    <?php if ($product['recurring']) { ?>
                    <span class="label label-info"><?php echo $text_recurring_item; ?></span> <small><?php echo $product['recurring']; ?></small>
                    <br />
                    <?php } ?>
                  </td>
                  <td class="text-left"><div class="input-group btn-block" style="max-width: 200px;">
                      <input type="text" name="quantity[<?php echo $product['cart_id']; ?>]" value="<?php echo $product['quantity']; ?>" size="1" class="form-control" />
                      <span class="input-group-btn">
                      <button style="padding: 7px" type="submit" data-toggle="tooltip" title="<?php echo $button_update; ?>" class="btn btn-primary">
                        <i class="fa fa-refresh"></i>
                      </button>
                      </span></div></td>
                  <td class="text-right"><?php echo $product['price']; ?></td>
                  <td class="text-right"><?php echo $product['total']; ?></td>
                  <td>
                    <a href="#"  data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger" onclick="cart.remove('<?php echo $product['cart_id']; ?>');">
                     delete
                    </a>
                  </td>
                </tr>
                <?php } ?>
                <?php foreach ($vouchers as $voucher) { ?>
                <tr>
                  <td></td>
                  <td class="text-left"><?php echo $voucher['description']; ?></td>
                  <td class="text-left"></td>
                  <td class="text-left"><div class="input-group btn-block" style="max-width: 200px;">
                      <input type="text" name="" value="1" size="1" disabled="disabled" class="form-control" />
                      <span class="input-group-btn">
                      <button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger" onclick="voucher.remove('<?php echo $voucher['key']; ?>');"><i class="fa fa-times-circle"></i></button>
                      </span></div></td>
                  <td class="text-right"><?php echo $voucher['amount']; ?></td>
                  <td class="text-right"><?php echo $voucher['amount']; ?></td>
                </tr>
                <?php } ?>
              </tbody>
            </table>
          </div>
        </form>
          <form action="<?php echo $pay_action; ?>" method="post" enctype="multipart/form-data">
            <div class="row">
              <div class="sub-total">
                <table class="" style="border-bottom: none">
                  <?php foreach ($totals as $total) { ?>
                  <tr>
                    <td class="text-right"><strong><?php echo $total['title']; ?>:</strong></td>
                    <td class="text-right"><?php echo $total['text']; ?></td>
                  </tr>
                  <?php } ?>
                </table>
              </div>
              <div class="client-info">
                <div class="input-group">
                  <div class="label">mail:</div>
                  <input type="email" value="" name="email" class="form-control">
                </div>
                <?php if($country_list){ ?>
                <div class="input-group">
                  <div class="label">shipping to:</div>
                  <select name="country_id">
                    <option value=""> --- Please Select --- </option>
                    <?php foreach($country_list as $country_item){ ?>
                    <option value="<?php echo $country_item['country_id']; ?>"><?php echo $country_item['name']; ?></option>
                    <?php } ?>
                  </select>
                </div>
                <?php } ?>
                <div class="input-group">
                  <div class="label" >order message:</div>
                  <textarea name="comment" rows="5"></textarea>
                </div>
              </div>
            </div>
            <div class="btnCart">
              <div class="pull-right">
                <a href="<?php echo $continue; ?>" class="btn btn-default"><?php echo $button_shopping; ?></a>
                <button type="submit" class="btnCheckout no-bordered" style="font-size: 15px">pay</button>
                <?php /* <a href="<?php echo $checkout; ?>" class="btnCheckout"><?php echo $button_checkout; ?></a>*/ ?>
              </div>
              <div class="clear"></div>
            </div>
          </form>
        </div>
        <div class="right">
          <?php if ($modules) { ?>
          <h2><?php echo $text_next; ?></h2>
          <p><?php echo $text_next_choice; ?></p>
          <div class="panel-group" id="accordion">
            <?php
            /* 插件管理 order totals 里 禁用 运费 中 运费估算 */
            foreach ($modules as $module) { ?>
            <?php echo $module; ?>
            <?php } ?>
          </div>
          <?php } ?>
          <br />
        </div>
        <?php echo $content_bottom; ?>
        <div class="clear"></div>
      </div>

      <?php echo $column_right; ?></div>
  </div>
</div>
<?php echo $footer; ?>
