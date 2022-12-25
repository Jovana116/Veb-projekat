<?php
session_start();
require_once("pages/dbcontroller.php");
require("index.html");
$db_handle = new DBController();
if(!empty($_GET["action"])) {
switch($_GET["action"]) {
	case "add":
		if(!empty($_POST["quantity"])) {
			$productByCode = $db_handle->runQuery("SELECT * FROM proizvodi WHERE sifra='" . $_GET["code"] . "'");
			$itemArray = array($productByCode[0]["sifra"]=>array('ime'=>$productByCode[0]["ime"], 'sifra'=>$productByCode[0]["sifra"], 'quantity'=>$_POST["quantity"], 'cena'=>$productByCode[0]["cena"], 'slika'=>$productByCode[0]["slika"]));
			
			if(!empty($_SESSION["cart_item"])) {
				if(in_array($productByCode[0]["sifra"],array_keys($_SESSION["cart_item"]))) {
					foreach($_SESSION["cart_item"] as $k => $v) {
							if($productByCode[0]["sifra"] == $k) {
								if(empty($_SESSION["cart_item"][$k]["quantity"])) {
									$_SESSION["cart_item"][$k]["quantity"] = 0;
								}
								$_SESSION["cart_item"][$k]["quantity"] += $_POST["quantity"];
							}
					}
				} else {
					$_SESSION["cart_item"] = array_merge($_SESSION["cart_item"],$itemArray);
				}
			} else {
				$_SESSION["cart_item"] = $itemArray;
			}
		}
	break;
	case "remove":
		if(!empty($_SESSION["cart_item"])) {
			foreach($_SESSION["cart_item"] as $k => $v) {
					if($_GET["code"] == $k)
						unset($_SESSION["cart_item"][$k]);				
					if(empty($_SESSION["cart_item"]))
						unset($_SESSION["cart_item"]);
			}
		}
	break;
	case "empty":
		unset($_SESSION["cart_item"]);
	break;	
}
}
	$product_array = $db_handle->runQuery("SELECT * FROM proizvodi ORDER BY id ASC");
	if (!empty($product_array)) { 
		foreach($product_array as $key=>$value){
	?>
		<div class="product-item">
			<form method="post" action="index.php?action=add&code=<?php echo $product_array[$key]["sifra"]; ?>">
			<div class="product-image"><img src="<?php echo $product_array[$key]["slika"]; ?>"></div>
			<div class="product-tile-footer">
			<div class="product-title"><?php echo $product_array[$key]["ime"]; ?></div>
			<div class="product-price"><?php echo $product_array[$key]["cena"] . "din"; ?></div>
			<div class="cart-action"><input type="text" class="product-quantity" name="quantity" value="1" size="2" /><input type="submit" value="Dodaj u korpu"  style="margin-bottom:10px;"class="btnAddAction" /></div>
			</div>
			</form>
		</div>
	<?php
		}
	}
	?>