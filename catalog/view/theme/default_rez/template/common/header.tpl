<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<meta charset="UTF-8" />
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/sidebarmenu.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/stylesheet.css" />
<?php foreach ($styles as $style) { ?>
<link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script type="text/javascript" src="catalog/view/javascript/jquery/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" />
<script type="text/javascript" src="catalog/view/javascript/common.js"></script>
<?php foreach ($scripts as $script) { ?>
<script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>
<!--[if IE 7]> 
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie7.css" />
<![endif]-->
<!--[if lt IE 7]>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie6.css" />
<script type="text/javascript" src="catalog/view/javascript/DD_belatedPNG_0.0.8a-min.js"></script>
<script type="text/javascript">
DD_belatedPNG.fix('#logo img');
</script>
<![endif]-->
<?php if ($stores) { ?>
<script type="text/javascript"><!--
$(document).ready(function() {
<?php foreach ($stores as $store) { ?>
$('body').prepend('<iframe src="<?php echo $store; ?>" style="display: none;"></iframe>');
<?php } ?>
});
//--></script>
<?php } ?>
<?php echo $google_analytics; ?>
</head>
<body>
<div id="container">

 <div id="header">
  <?php if ($logo) { ?>
   <div id="logo"><a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a>
   </div>
  <?php } ?>
  <?php echo $language; ?> 
  <?php echo $currency; ?>
  <?php echo $cart; ?>
  <div id="search">
    <div class="button-search">
    </div>
    <input type="text" name="search" placeholder="<?php echo $text_search; ?>" value="<?php echo $search; ?>" />
  </div>
  <div id="welcome">
    <?php if (!$logged) { ?>
    <?php echo $text_welcome; ?>
    <?php } else { ?>
    <?php echo $text_logged; ?>
    <?php } ?>
  </div>
  <div class="links" ><!-- <a href="<?php echo $home; ?>"><?php echo $text_home; ?></a>  <a href="<?php echo $wishlist; ?>" id="wishlist-total"><?php echo $text_wishlist; ?></a><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a><a href="<?php echo $shopping_cart; ?>"><?php echo $text_shopping_cart; ?></a><a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a> //-->
  </div>
 </div>
  
 <br />
 <br />
 <br />
 
<?php if ($categories) { ?>
<div style="background-color:green" id="menu" >
 
  <ul>
    
    <li><a href="<?php echo $home; ?>"><?php echo $text_home; ?></a></li>
      
    <li><a href="http://regard.com.ua/oc/index.php?route=information/news"><?php echo $button_news; ?></a></li>
     <!-- <li>   <a  href="http://regard.com.ua/oc/index.php?route=information/news"> News</a></li> //--> 
    <?php foreach ($categories as $category) { ?>
    <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?> </a>
      <?php if ($category['children']) { ?>
      <div>
        <?php for ($i = 0; $i < count($category['children']);) { ?>
        <ul>
          <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
          <?php for (; $i < $j; $i++) { ?>
          <?php if (isset($category['children'][$i])) { ?>
          <li><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a></li>
          <?php } ?>
          <?php } ?>
        </ul>
        <?php } ?>
      </div>
      <?php } ?>
    </li>
    <?php } ?>
    <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
    <!-- <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li> //-->
    <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
    <li><div id="search">
    <div class="button-search">
    </div>
    <input type="text" name="search" placeholder="Поиск" value="" />
  </div>
</li>   
  </ul>
</div>
<?php } ?>

<!--
<div style="background-color:#FFFAFA  ;height:100px "   id="menul" >

<p style="color: #0838D3; font-size: 100%; background-color:#FCF0A0;"><b>Адрес:</b> 61068, г.Харьков, ул. Семиградская, 12А. <b>E-mail:</b> regard2000@ukr.net <b>Тел./факс:</b> (057) 738-09-53; <b>Тел.</b> (057) 703-23-42; <b>Моб.</b> (067) 577-09-72; <b>Skype:</b> regard.ltd  </p>
 <hr> 
<a href="http://regard.com.ua/oc/index.php?route=product/manufacturer" class="buttong buttong-green"><span>Производители </span> </a>

<a href="http://regard.com.ua/oc/index.php?route=information/contact" class="buttong buttong-green"><span>Контакты</span></a>

<a href="http://regard.com.ua/oc/index.php?route=information/information&amp;information_id=4" class="buttong buttong-green"><span>О нас</span></a>

</div>

//-->
<?php if ($error) { ?>


    
    <div class="warning"><?php echo $error ?><img src="catalog/view/theme/default/image/close.png" alt="" class="close" />
    </div>
    
<?php } ?>
<div  id="notification" ></div>
