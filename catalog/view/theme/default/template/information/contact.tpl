<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <h1><?php echo $heading_title; ?></h1>


<table   width="100%">
<tr>
	<td width="90%"><h2><b>ООО фирма "РЕГАРД":</b></h2>
<br>
Адрес: 61068, г.Харьков, ул. Семиградская, 12А<br>
Отдел сбыта: +38 (057) 703-23-25<br>
Оптовый отдел: +38 (057) 738-09-53, +38 (067) 545-88-33 opt@regard.com.ua<br>
Отдел закупки: +38 (057) 738-09-53<br>
Отдел сервисной службы: +38 (057) 703-23-42<br>
Салон-магазин: +38 (057) 771-65-90<br>
Факс: +38 (057) 738-09-53<br>
e-mail: regard@rambler.ru<br>
<br>
<center><h1>Мы на Яндекс картах:</h1><br>

     <script type="text/javascript" charset="utf-8" src="https://api-maps.yandex.ru/services/constructor/1.0/js/?sid=lIbcMG5TrF3k_7M8D2SOQNFSxkHzGJvk&width=600&height=450"></script>
    </center>
<hr>

<b>Филиал в Одессе:</b><br>
г. Одесса ул. Успенская, 47 <br>
телефон/факс +38 (048) 728-68-45<br>
e-mail: regard-odessa200@mail.ru<br>
<br>
<center><h1>Мы на Яндекс картах:</h1>
<script type="text/javascript" charset="utf-8" src="https://api-maps.yandex.ru/services/constructor/1.0/js/?sid=j_YTh70_42IOxBcYZyokm5myKydVHrPc&width=500&height=400&lang=ru_UA&sourceType=constructor"></script>
</center>
<hr>
<b>Магазины ООО фирма "РЕГАРД":</b>
<br>
г. Харьков, ул. Тринклера, 6 </br>
(в здании областной стоматологической поликлиники)<br>
тел.: +38(057) 705-17-45<br>
<br>
<center><h1>Мы на Яндекс картах:</h1>
<script type="text/javascript" charset="utf-8" src="https://api-maps.yandex.ru/services/constructor/1.0/js/?sid=JqX-VMGCdy6K-yb9izNNXZX8iYCB9dSi&width=500&height=400&lang=ru_UA&sourceType=constructor"></script>
</center>
<hr>

г. Харьков, пр. Победы, 51<br>
(в здании Университетского<br>
стоматологического центра ХНМУ)<br>
тел.: +38(057) 781-57-25<br>
<br>
<center><h1>Мы на Яндекс картах:</h1>
<script type="text/javascript" charset="utf-8" src="https://api-maps.yandex.ru/services/constructor/1.0/js/?sid=heQDgP-Hb5xJ61Qe3TN1rRE52fz6wnIZ&width=500&height=400&lang=ru_UA&sourceType=constructor"></script>
</center>
 </left></td>
	<td>
    <!--
    <center><h1>Мы на Яндекс картах:</h1><br>

     <script type="text/javascript" charset="utf-8" src="https://api-maps.yandex.ru/services/constructor/1.0/js/?sid=lIbcMG5TrF3k_7M8D2SOQNFSxkHzGJvk&width=600&height=450"></script>
    </center> -->
    </td>
</tr>

</table>

 
 <div class="content-map" style="display: inline-block; width: 100%;">
   <center><h1>Часы работы:</h1></center><br>
      <div  style="float: left; display: inline-block; width: 50%;"><center>
         Будни: с 9:00 до 18:00 </center>
      </div>
<div style="float: right; display: inline-block; width: 50%;"><center>
Выходные: суббота, воскресенье </center>
</div>    


 <!--   <div class="contact-info">
          <div class="content">
            <div class="left"><b><?php echo $text_address; ?></b><br />
              <?php echo $store; ?><br />
              <?php echo $address; ?>
            </div>
          </div>
          
          <div class="right">
            <?php if ($telephone) { ?>
             <b><?php echo $text_telephone; ?></b><br />
             <?php echo $telephone; ?><br />
             <br />
             <?php } ?>
             <?php if ($fax) { ?>
             <b><?php echo $text_fax; ?></b><br />
             <?php echo $fax; ?>
             <?php } ?>
          </div>
        </div>  -->
    </div>
    <h2><?php echo $text_contact; ?></h2>
    <div class="content">
    <b><?php echo $entry_name; ?></b><br />
    <input type="text" name="name" value="<?php echo $name; ?>" />
    <br />
    <?php if ($error_name) { ?>
    <span class="error"><?php echo $error_name; ?></span>
    <?php } ?>
    <br />
    <b><?php echo $entry_email; ?></b><br />
    <input type="text" name="email" value="<?php echo $email; ?>" />
    <br />
    <?php if ($error_email) { ?>
    <span class="error"><?php echo $error_email; ?></span>
    <?php } ?>
    <br />
    <b><?php echo $entry_enquiry; ?></b><br />
    <textarea name="enquiry" cols="40" rows="10" style="width: 99%;"><?php echo $enquiry; ?></textarea>
    <br />
    <?php if ($error_enquiry) { ?>
    <span class="error"><?php echo $error_enquiry; ?></span>
    <?php } ?>
    <br />
    <b><?php echo $entry_captcha; ?></b><br />
    <input type="text" name="captcha" value="<?php echo $captcha; ?>" />
    <br />
    <img src="index.php?route=information/contact/captcha" alt="" />
    <?php if ($error_captcha) { ?>
    <span class="error"><?php echo $error_captcha; ?></span>
    <?php } ?>
    </div>
    <div class="buttons">
      <div class="right"><input type="submit" value="<?php echo $button_continue; ?>" class="button" /></div>
    </div>
  </form>
  <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>