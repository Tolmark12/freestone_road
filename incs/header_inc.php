<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
	<head>
		<title><?php echo $pageTitle; ?></title>
		<link rel="stylesheet" type="text/css" href="style.css" />
		<script src="js/cufon.js" type="text/javascript"></script>
		<script src="js/Clarendon_500.font.js" type="text/javascript"></script>
		<script type="text/javascript">
        	Cufon.replace('h1', 'Clarendon');
        	Cufon.replace('h2', 'Clarendon');
        </script>
	</head>
<body>
	<!-- id='selected' for selecting which link is currently selected-->
	<div id='wrapper'>
		<div id='header' class='<?php echo $currentPage; ?>'>
			<div id='top-nav'>
				<img src="images/nav_top_piece.jpg" id='nav-top-piece' height="21" alt="Nav Top Piece">
				<a href='index.php'><img id='nav-logo' src="images/logo.png" width="119" height="74" alt="Logo"></a>
				<ul>
					<li><a href='index.php?page=services' <?php if($currentPage=='services'){echo"id='selected' ";} ?>>SERVICES</a></li>
					<li><a href='index.php?page=pricing' <?php  if($currentPage=='pricing'){echo"id='selected' ";} ?>>PRICING</a></li>
					<li><a href='index.php?page=clients' <?php  if($currentPage=='clients'){echo"id='selected' ";} ?>>CLIENTS</a></li>
					<li><a href='index.php?page=aboutus' <?php  if($currentPage=='aboutus'){echo"id='selected' ";} ?>>ABOUT US</a></li>
					<li><a href='index.php?page=contact' <?php  if($currentPage=='contact'){echo"id='selected' ";} ?>>CONTACT</a></li>
				</ul>
			</div>
		</div>
