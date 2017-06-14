<?php echo $header; ?>
<div class="wrapper">
  <div class="container">
    <div class="row">
      <div id="content">
        <ul class="breadcrumb">
          <?php foreach ($breadcrumbs as $breadcrumb) { ?>
          <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
          <?php } ?>
        </ul>
        <div class="topCat">
          <div class="row">
            <h1><?php echo $heading_title; ?></h1>
          </div>
          <!--<label class="control-label" for="input-search"><?php echo $entry_search; ?></label>
        <input type="text" name="search" value="<?php echo $search; ?>" placeholder="<?php echo $text_keyword; ?>" id="input-search" class="form-control" />
        <select name="category_id" class="form-control">
          <option value="0"><?php echo $text_category; ?></option>
          <?php foreach ($categories as $category_1) { ?>
          <?php if ($category_1['category_id'] == $category_id) { ?>
          <option value="<?php echo $category_1['category_id']; ?>" selected="selected"><?php echo $category_1['name']; ?></option>
          <?php } else { ?>
          <option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
          <?php } ?>
          <?php foreach ($category_1['children'] as $category_2) { ?>
          <?php if ($category_2['category_id'] == $category_id) { ?>
          <option value="<?php echo $category_2['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
          <?php } else { ?>
          <option value="<?php echo $category_2['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
          <?php } ?>
          <?php foreach ($category_2['children'] as $category_3) { ?>
          <?php if ($category_3['category_id'] == $category_id) { ?>
          <option value="<?php echo $category_3['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
          <?php } else { ?>
          <option value="<?php echo $category_3['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
          <?php } ?>
          <?php } ?>
          <?php } ?>
          <?php } ?>
        </select>

        <label class="checkbox-inline">
          <?php if ($sub_category) { ?>
          <input type="checkbox" name="sub_category" value="1" checked="checked" />
          <?php } else { ?>
          <input type="checkbox" name="sub_category" value="1" />
          <?php } ?>
          <?php echo $text_sub_category; ?>
        </label>
        <p>
          <label class="checkbox-inline">
            <?php if ($description) { ?>
            <input type="checkbox" name="description" value="1" id="description" checked="checked" />
            <?php } else { ?>
            <input type="checkbox" name="description" value="1" id="description" />
            <?php } ?>
            <?php echo $entry_description; ?></label>
        </p>
        <input type="button" value="<?php echo $button_search; ?>" id="button-search" class="btn btn-primary" />
        -->
          <div class="clear"></div>
        </div>
        <div class="row toolbar">
          <div class="col-md-4">
            <div class="col-md-4">
              <div class="form-group input-group input-group-sm">
                <label class="input-group-addon" for="input-sort"><?php echo $text_sort; ?></label>
                <select id="input-sort" class="form-control" onchange="location = this.value;">
                  <?php foreach ($sorts as $sorts) { ?>
                  <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                  <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select>
              </div>
            </div>
            <div class="col-md-4">
              <div class="form-group input-group input-group-sm">
                <label class="input-group-addon" for="input-limit"><?php echo $text_limit; ?></label>
                <select id="input-limit" class="form-control" onchange="location = this.value;">
                  <?php foreach ($limits as $limits) { ?>
                  <?php if ($limits['value'] == $limit) { ?>
                  <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select>
              </div>
            </div>
            <div class="col-md-4">
              <div class="form-group">
                <a href="<?php echo $compare; ?>" id="compare-total" class="btn btn-link"><?php echo $text_compare; ?></a>
              </div>
            </div>
            <div class="clear"></div>
          </div>
        </div>

        <?php if ($products) { ?>
        <div class="row catProducts">
          <?php foreach ($products as $product) { ?>
          <div class="product-layout">
            <div class="product-thumb">
              <?php if ($product['special']) { ?>
              <span class="sale">Sale</span>
              <?php } ?>
              <div class="image">
                <a href="<?php echo $product['href']; ?>">
                  <img src="<?php echo $product['thumb']; ?>"
                       alt="<?php echo $product['name']; ?>"
                       title="<?php echo $product['name']; ?>"
                       class="img-responsive" />
                </a>
              </div>
              <div class="caption">
                <h4><a href="<?php echo $product['href']; ?>" title="<?php echo $product['name']; ?>"><?php echo $product['name']; ?></a></h4>
                <div class="price">
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
          </div>
          <?php } ?>
          <div class="clear"></div>
        </div>
        <div class="row">
          <div class="paging"><?php echo $pagination; ?></div>
          <div class="pagiResults"><?php echo $results; ?></div>
        </div>
        <?php }else{ ?>
        <div class="pagiResults">
          <p><?php echo $text_empty; ?></p>
        </div>
        <?php } ?>
        </div>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
$('#button-search').bind('click', function() {
	url = 'index.php?route=product/search';

	var search = $('#content input[name=\'search\']').prop('value');

	if (search) {
		url += '&search=' + encodeURIComponent(search);
	}

	var category_id = $('#content select[name=\'category_id\']').prop('value');

	if (category_id > 0) {
		url += '&category_id=' + encodeURIComponent(category_id);
	}

	var sub_category = $('#content input[name=\'sub_category\']:checked').prop('value');

	if (sub_category) {
		url += '&sub_category=true';
	}

	var filter_description = $('#content input[name=\'description\']:checked').prop('value');

	if (filter_description) {
		url += '&description=true';
	}

	location = url;
});

$('#content input[name=\'search\']').bind('keydown', function(e) {
	if (e.keyCode == 13) {
		$('#button-search').trigger('click');
	}
});

$('select[name=\'category_id\']').on('change', function() {
	if (this.value == '0') {
		$('input[name=\'sub_category\']').prop('disabled', true);
	} else {
		$('input[name=\'sub_category\']').prop('disabled', false);
	}
});

$('select[name=\'category_id\']').trigger('change');
--></script>
<?php echo $footer; ?>