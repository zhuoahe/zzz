<?php include("header.php"); ?>

<?php

if(is_array($_POST)&&count($_POST)>0){
	$post_str="";
	foreach ($_POST as $key => $value) {
	   $post_str = $post_str.";".$key.">>".$value;
	}
	$sql="INSERT INTO paypal_log (`page`,`method`,`content`) VALUES ('paypal_tongzhi','post','".$post_str."')";
	mysql_query($sql);	
}else if(is_array($_GET)&&count($_GET)>0){
	$get_str="";
	foreach ($_GET as $key => $value) {
	   $get_str = $get_str.";".$key.">>".$value;
	}
	$sql="INSERT INTO paypal_log (`page`,`method`,`content`) VALUES ('paypal_tongzhi','get','".$get_str."')";
	mysql_query($sql);	
}
?>


<?php

 //从 PayPal 出读取 POST 信息同时添加变量"cmd‟
$req = 'cmd=_notify-validate';
foreach ($_POST as $key => $value) {
	$value = urlencode(stripslashes($value));
	$req .= "&$key=$value";
}
$header .= "POST /cgi-bin/webscr HTTP/1.0\r\n";
$header .= "Content-Type:application/x-www-form-urlencoded\r\n";
$header .= "Content-Length:" . strlen($req) ."\r\n\r\n";
$fp = fsockopen ('www.paypal.com', 80, $errno, $errstr, 30);

if (!$fp) {
	mail_error("即时付款返回值","check-results_01");
}else {
	fputs ($fp, $header .$req);
	while (!feof($fp)) {
		$res = fgets ($fp, 1024);
		if (strcmp ($res, "VERIFIED") == 0) {
			
			if($_POST['receiver_email']!="pay@light-bicycle.com"){
				mail_error("收款邮箱错误:".$_POST['receiver_email'],"check-results_011");
			}
			//if(!isset($_POST['invoice'])&&$_POST['payment_status']=="Completed"){ del:2014-12-08
			if(isset($_POST['invoice'])){
				$check_no=$_POST['invoice'];
			}else{
				$check_no=identifier();
			}

			
			//进行安全过滤
			$new_post=$_POST;
			unset($_POST);
			foreach($new_post as $keys => $vals){
				$_POST[anquan_input($keys)]=anquan_input($vals);
			}
			//进行安全过滤
			
			$payment_amount =$_POST['mc_gross'];//总价
			$payment_currency = $_POST['mc_currency'];
			$payment_amount =$payment_amount."".$payment_currency;
			$mc_fee = $_POST['mc_fee'];
			$txn_id = $_POST['txn_id'];
			$payer_email = $_POST['payer_email'];//付款邮箱
			$payment_type = $_POST['payment_type'];//echeck：该款项通过电子支票支付。instant：该项付款通过PayPal余额、信用卡或即时转帐支付。
			$payment_status = $_POST['payment_status']; 
			
			$first_name = isset($_POST['first_name'])? $_POST['first_name'] : "";//名字
			$last_name = isset($_POST['last_name'])? $_POST['last_name'] : "";//姓
			$address_city = isset($_POST['address_city'])? $_POST['address_city'] : "";//城市
			$address_name = isset($_POST['address_name'])? $_POST['address_name'] : "";//收货名字
			$address_state = isset($_POST['address_state'])? $_POST['address_state'] : "";//省				
			$address_country = isset($_POST['address_country'])? $_POST['address_country'] : "";//国家
			$address_country_code = isset($_POST['address_country_code'])? $_POST['address_country_code'] : "";//国家编码
			$payer_id = isset($_POST['payer_id'])? $_POST['payer_id'] : "";//paypal ID
			$payer_status= isset($_POST['payer_status'])? $_POST['payer_status'] : "";//是否认证
			$address_street = isset($_POST['address_street'])? $_POST['address_street'] : "";//收货详细地址
			$address_street=str_replace("\\n"," ",$address_street);
			$address_street=str_replace("\\r"," ",$address_street);
			$address_zip = isset($_POST['address_zip'])? $_POST['address_zip'] : "";//邮编
			$phone =isset($_POST['contact_phone'])? $_POST['contact_phone'] : "";
			$memo = isset($_POST['memo'])? $_POST['memo'] : "";	
			$transaction_subject = isset($_POST['transaction_subject'])? $_POST['transaction_subject'] : "";
			$invoice_number = isset($_POST['invoice_number'])? $_POST['invoice_number'] : "";
			$ebay_user_id = isset($_POST['auction_buyer_id'])?"From ebay: ".$_POST['auction_buyer_id'] : "";
			$cusinfo= $invoice_number." --- ".$memo." --- ".$transaction_subject." --- ".$ebay_user_id;
			if($payment_type=="echeck"){
				$cusinfo= $cusinfo." --- 电子支票,出货前确认是否收到款";
			}

			//$address_street1 = isset($_POST['address_street'])? stripslashes($_POST['address_street']) : "";//收货详细地址   2015-9-25因为地址中有些字符被转义了。LDS	
			
			//如果有invoice变量，表面来自网站或者网站开单的付款，发邮件通知客户
			$is_first_buy="1";
			$is_web_buy="no";
			$web_seller="";

			if(isset($_POST['invoice'])){
				$result_pi_infor = mysql_query("SELECT `id`, `cl_id`,`seller` FROM `PI_infor` WHERE check_no = '".$_POST['invoice']."' LIMIT 1");
				while($row_pi_infor = mysql_fetch_array($result_pi_infor)){
					$is_web_buy="yes";
					$yuan_cl_id=$row_pi_infor['cl_id'];
					$web_seller=$row_pi_infor['seller'];
					
					$result = mysql_query("SELECT id FROM `dd_intro` WHERE check_no = '".$_POST['invoice']."' LIMIT 1");//排除来之网站付款的退款
					while($row = mysql_fetch_array($result)){
						$is_first_buy="0";
						
					}				
					
					
				}			
			}
			
			
			//如果是网站或者网站开单已经存在cl_id，调用不同的存储结构
			if(isset($_POST['invoice'])&&$is_web_buy=="yes"){
				//$sql="INSERT INTO dd_intro (cl_id,check_no,pay_way,payment_id,payer_id,pay_mail,payer_status,paypalment_type,total_fee,pay_is,name,shoping_ad,country_code,country,state,city,zip,phone,handling_fee,cusinfo,payment_status) VALUES ( '".$yuan_cl_id."','".$check_no."','paypal','".$txn_id."','".$payer_id."','".$payer_email."','".$payer_status."','".$payment_type."','".$payment_amount."','no','".$address_name."' ,'".$address_street."','".$address_country_code."','".$address_country."','".$address_state."','".$address_city."','".$address_zip."','".$phone."','".$mc_fee."','".$cusinfo."','".$payment_status."');";
				$sql="INSERT INTO dd_intro
								(cl_id,check_no,pay_way,payment_id,payer_id,pay_mail,payer_status,paypalment_type,total_fee,pay_is,name,shoping_ad,country_code,country,state,city,zip,phone,handling_fee,cusinfo,payment_status)
								SELECT  '".$yuan_cl_id."','".$check_no."','paypal','".$txn_id."','".$payer_id."','".$payer_email."','".$payer_status."','".$payment_type."','".$payment_amount."','no','".$address_name."' ,'".$address_street."','".$address_country_code."','".$address_country."','".$address_state."','".$address_city."','".$address_zip."','".$phone."','".$mc_fee."','".$cusinfo."','".$payment_status."'
									FROM dual
									WHERE not exists (select id from dd_intro where payment_id = '".$txn_id."' and payment_status = '".$payment_status."' )
								;";
				mysql_query($sql);			
								
			}else{//如果是直接在paypal打款
				$sql="call paypaltongzhi_in('".$check_no."','".$txn_id."','".$payer_id."','".$payer_email."','".$payer_status."','".$payment_type."','".$payment_amount."','".$address_name."','".$address_street."','".$address_country_code."','".$address_country."','".$address_state."','".$address_city."','".$address_zip."','".$phone."',@OUTclid,'".$first_name."','".$last_name."','".$mc_fee."','".$cusinfo."','".$payment_status."');";
				mysql_query($sql);	
			}
			
			//2017-03-23更新或保存paypal姓和名
			if ($first_name && $payer_email){
				$dd_intro_cl_id = 0;
				$cl_infor_query = mysql_query("SELECT cl_id FROM `becsbike_mclb`.`dd_intro` WHERE pay_mail='{$payer_email}' limit 1");
				while($row = mysql_fetch_array($cl_infor_query)){
					if ($row['cl_id']){
						$dd_intro_cl_id = $row['cl_id'];
					}
				}
				if($dd_intro_cl_id){
					$cl_infor_query = mysql_query("SELECT id,first_name FROM `becsbike_mclb`.`cl_infor` WHERE mail='{$payer_email}' OR id='{$dd_intro_cl_id}'");
				}else{
					$cl_infor_query = mysql_query("SELECT id,first_name FROM `becsbike_mclb`.`cl_infor` WHERE mail='{$payer_email}'");
				}
				
				while($row = mysql_fetch_array($cl_infor_query)){
					if (empty($row['first_name']) || trim($row['first_name'])==''){
						$sql = "UPDATE `becsbike_mclb`.`cl_infor` SET `first_name`='{$first_name}',`last_name`='{$last_name}' where id='{$row['id']}'";
						mysql_query($sql);
					}
				}				
			}
			
			//如果是网站订单，且不是开单订单，将付款地址写入到PI_infor
			 
			if($web_seller=="website"){	
				//判断条件收货人姓名和地址为空才能更新,防止来自网站付款补差价第二次地址覆盖掉已修改好的地址
				$sql="UPDATE `PI_infor` SET `name`='".$address_name."', `shoping_ad`='".$address_street."',  `state`='".$address_state."', `city`='".$address_city."', `zip`='".$address_zip."', `phone`='".$phone."'  WHERE `check_no` = '".$_POST['invoice']."' AND `name` ='' AND `shoping_ad` = '' ";
				mysql_query($sql);			
			}
			
			if(isset($_POST['invoice'])&&$is_first_buy=="1"&&$is_web_buy=="yes"){
				include("order_info_mail.php");
			}				
									
		
		
			
		}else if (strcmp ($res, "INVALID") == 0) {
			mail_error("即时付款未通过认证","check-results_03".$res);	
		}
	}
	
	fclose ($fp);
}
?>




<?php include("footer.php"); ?>
