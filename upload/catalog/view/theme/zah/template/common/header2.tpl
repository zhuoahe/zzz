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
<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" />
<link href="catalog/view/theme/zah/stylesheet/stylesheet.css" rel="stylesheet">
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
<body class="<?php echo $class; ?>" style="margin-top: 50px">

<header>
  <nav class="navbar navbar-default navbar-fixed-top navbar-inverse">
    <div class="container">
      <div class="navbar-header">
        <button type="button" data-toggle="collapse" data-target="#navbar-collapse-header" class="navbar-toggle collapsed"><span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span></button>
        <a href="<?php echo $home ?>" class="navbar-brand">
          <img src="<?php //echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>"/></a></div>
      <div class="collapse navbar-collapse" id="navbar-collapse-header">
        <ul class="nav navbar-nav">
          <li><a href="https://www.opencart.com/index.php?route=cms/feature">Features</a></li>
          <li><a href="https://www.opencart.com/index.php?route=cms/demo">Demo</a></li>
          <li><a href="https://www.opencart.com/index.php?route=marketplace/extension">Marketplace</a></li>
          <li><a href="https://www.opencart.com/index.php?route=cms/blog">Blog</a></li>
          <li><a href="https://www.opencart.com/index.php?route=cms/showcase">Showcase</a></li>
          <li class="dropdown"><a href="#" data-toggle="dropdown">Resources <span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a href="https://www.opencart.com/index.php?route=cms/download">Download</a></li>
              <li><a href="https://www.opencart.com/index.php?route=support/partner">OpenCart Partners</a></li>
              <li><a href="https://forum.opencart.com">Community Forums</a></li>
              <li><a href="http://docs.opencart.com">OpenCart Documentation</a></li>
              <li><a href="http://docs.opencart.com/#additional-reading">OpenCart Books</a></li>
              <li><a href="https://github.com/opencart/opencart/issues">Github Bug Tracker</a></li>
              <li><a href="http://docs.opencart.com/developer/module/">Developer</a></li>
            </ul>
          </li>
          <li class="visible-xs"><a href="https://www.opencart.com/index.php?route=account/login">Login</a></li>
          <li class="visible-xs"><a href="https://www.opencart.com/index.php?route=account/register">Register</a></li>
        </ul>
        <div class="navbar-right hidden-xs"><a href="https://www.opencart.com/index.php?route=account/login" class="btn btn-link navbar-btn">Login</a> <a href="https://www.opencart.com/index.php?route=account/register" class="btn btn-black navbar-btn">Register</a></div>
      </div>
    </div>
  </nav>
</header>




