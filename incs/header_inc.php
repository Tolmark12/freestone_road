<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
	<head>
		<title>Home</title>
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
				<a href='index.php'><img id='nav-logo' src="images/logo.png" width="119" height="74" alt="Logo"></a>
				<ul>
					<li><a href='index.php?page=services'>SERVICES</a></li>
					<li><a href='index.php?page=pricing'>PRICING</a></li>
					<li><a href='index.php?page=clients'>CLIENTS</a></li>
					<li><a href='index.php?page=aboutus'>ABOUT US</a></li>
					<li><a href='index.php?page=contact'>CONTACT</a></li>
				</ul>
			</div>
		</div>
