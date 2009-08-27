<?php


// Section
$section = $_GET['page'];
//$sub	 = $_GET['sub'];

// Whether to add the default header and footer
$addHeaderAndFooter = true;
$js	= "";

// Flash embed scripts

// STONES:
$stonesFlash = '<script type="text/javascript" src="js/swfobject/swfobject.js"></script>' 
			 . '<script type="text/javascript">'
			 . 'swfobject.embedSWF("SteppingStones.swf", "flash-div", "350", "200", "9.0.0", "js/swfobject/expressInstall.swf");'
			 . '</script>';
			
$quoteFlash	 = '<script type="text/javascript" src="js/swfobject/swfobject.js"></script>' 
			 . '<script type="text/javascript">'
			 . 'swfobject.embedSWF("QuoteSS.swf", "flash-div", "350", "400", "9.0.0", "js/swfobject/expressInstall.swf");'
			 . '</script>';

switch ( strtolower($section) ) {
	
		// HOME //
		case 'home':								
		$pageTitle		= "Home";
		$currentPage	= "home";
		$phpPage		= "home.php";
		$keywords		= "";
		break;
		
		// SERVICES //
		case 'services':								
		$pageTitle		= "Services";
		$currentPage	= "services";
		$phpPage		= "services.php";
		$keywords		= "";
		$js				= $stonesFlash;
		break;
		
		// PRICING //
		case 'pricing':								
		$pageTitle		= "Pricing";
		$currentPage	= "pricing";
		$phpPage		= "pricing.php";
		$keywords		= "";
		$js				= $quoteFlash;
		break;
		
		// CLIENTS //
		case 'clients':								
		$pageTitle		= "Clients";
		$currentPage	= "clients";
		$phpPage		= "clients.php";
		$keywords		= "";
		$js				= $quoteFlash;
		break;
		
		// ABOUT US //
		case 'aboutus':								
		$pageTitle		= "About Us";
		$currentPage	= "aboutus";
		$phpPage		= "aboutus.php";
		$keywords		= "";
		break;
		
		// CONTACT //
		case 'contact':								
		$pageTitle		= "Contact";
		$currentPage	= "contact";
		$phpPage		= "contact.php";
		$keywords		= "";
		break;
		
			// SiteMap //
			case 'sitemap':								
			$pageTitle		= "SiteMap";
			$currentPage	= "sitemap";
			$phpPage		= "sitemap.php";
			$keywords		= "";
			break;
			
			// TermsOfUse //
			case 'termsofuse':								
			$pageTitle		= "TermsOfUse";
			$currentPage	= "termsofuse";
			$phpPage		= "termsofuse.php";
			$keywords		= "";
			break;
			
			// Privacy //
			case 'privacy':								
			$pageTitle		= "Privacy";
			$currentPage	= "privacy";
			$phpPage		= "privacy.php";
			$keywords		= "";
			break;
			
	
	// Default
	default:											
	$pageTitle		= "Home";
	$currentPage	= "home";
	$phpPage		= "home.php";
	$keywords 		= "";

}


// Temporary until we launch
if($addHeaderAndFooter )
{
	// Build page
	include_once 'incs/header_inc.php';
	include_once $phpPage;
	include_once 'incs/footer_inc.php';
}
else
{
	include_once $phpPage;
}


?>