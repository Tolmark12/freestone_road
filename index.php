<?php


// Section
$section = $_GET['page_id'];
$sub	 = $_GET['sub_id'];

// Whether to add the default header and footer
$addHeaderAndFooter = true;



switch ( strtolower($section) ) {
	
	// HOME //
	case '':
	case 'home':										
		$pageTitle		= "Bevy, Inc :: Corporate Site for the Fashion-Forward Facebook Application";
		$currentPage	= "Home";
		$phpPage		= "home.php";
		$keywords		= "Bevy, Bevy Application, Fashion Facebook, Facebook Application, Bevy Funding, Bevy Investment, Bevy Partnership, Fashion Partner Facebook, Style Facebook, Women Facebook, Women Social Networking, Fashion Social Networking, Style Social Networking, Seattle Startup, Seattle Facebook. Conversation Catalyst, Catalyst for Conversations";
	break;

	// Default
	default :											
	$pageTitle		= "Bevy, Inc :: Corporate Site for the Fashion-Forward Facebook Application";
	$currentPage	= "Home";
	$phpPage		= "home.php";
	$keywords 		= "Bevy, Bevy Application, Fashion Facebook, Facebook Application, Bevy Funding, Bevy Investment, Bevy Partnership, Fashion Partner Facebook, Style Facebook, Women Facebook, Women Social Networking, Fashion Social Networking, Style Social Networking, Seattle Startup, Seattle Facebook. Conversation Catalyst, Catalyst for Conversations";
}


// Temporary until we launch
if($addHeaderAndFooter )
{
	// Build page
	include_once 'scripts/incs/header_inc.php';
	include_once $phpPage						 ;
	include_once 'scripts/incs/footer_inc.php';
}
else
{
	include_once $phpPage;
}


?>