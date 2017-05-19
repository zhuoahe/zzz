<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<!--<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" /> -->
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="//fonts.googleapis.com/css?family=Maven+Pro" rel="stylesheet" type="text/css" />
<link href="catalog/view/theme/default/stylesheet/stylesheet.css" rel="stylesheet">
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>
</head>
<body class="<?php echo $class; ?> home">
<div id="top">
  <div class="wrapper">
    <div class="welcome">
      <p>Welcome
        <?php if ($logged) { ?>
        <a href="<?php echo $account; ?>"><?php echo $text_account; ?></a>
        <a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a>
        <?php }else{ ?>
        guest, you can
        <a href="<?php echo $login; ?>"><?php echo $text_login; ?></a>
        or
        <a href="<?php echo $register; ?>"><?php echo $text_register; ?></a>.
        <?php } ?>
      </p>
    </div>
    <?php echo $search; ?>
    <div id="top-links">
      <ul>
        <li>
          <a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>">
            <?php echo $text_account; ?>
          </a>
        </li>
        <li>
          <a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>">
            <?php echo $text_wishlist; ?>
          </a>
        </li>
        <li>
          <a href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>">
            <?php echo $text_shopping_cart; ?>
          </a>
        </li>
        <li>
          <a href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>"><?php echo $text_checkout; ?></a>
        </li>
      </ul>
    </div>
    <div class="clear"></div>
  </div>
</div>

<header>
  <div class="wrapper">
    <div class="logo">
      <?php if ($logo) { ?>
      <a href="<?php echo $home; ?>" title="<?php echo $name; ?>">
        <img src="http://themes.webiz.mu/opencart/teez2/image/catalog/logo.png"
             d-src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" />
      </a>
      <?php } else { ?>
      <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
      <?php } ?>
    </div>
    <div class="mobMenu">
      <ul>
        <li class="parentM">
          <a href="javascript:void(0);">cat</a>
          <?php if ($categories) { ?>
          <ul class="nav navbar-nav">
            <?php foreach($categories as $category){ ?>
              <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
            <?php } ?>
          </ul>
          <?php } ?>
        </li>
      </ul>
    </div>
    <?php echo $cart; ?>
    <?php if ($categories) { ?>
    <div class="categories">
      <ul class="nav navbar-nav">
        <?php foreach($categories as $category){ ?>
        <?php if ($category['children']) { ?>
        <li class="dropdown">
          <a href="<?php echo $category['href']; ?>" class="dropdown" ><?php echo $category['name']; ?></a>
          <div class="dropdown-menu">
            <div class="dropdown-inner">
              <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
              <ul class="list-unstyled">
                <?php foreach ($children as $child) { ?>
                <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                <?php } ?>
              </ul>
              <?php } ?>
            </div>
          </div>
        </li>
        <?php }else { ?>
        <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
        <?php } ?>
        <?php } ?>
      </ul>
    </div>
    <?php } ?>
    <div class="clear"></div>
  </div>
</header>


