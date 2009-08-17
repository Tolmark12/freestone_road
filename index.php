<?php


// Section
$section = $_GET['page'];
//$sub	 = $_GET['sub'];

// Whether to add the default header and footer
$addHeaderAndFooter = true;



switch ( strtolower($section) ) {
	
		// HOME //
		case 'home':								
		$pageTitle		= "Home";
		$currentPage	= "Home";
		$phpPage		= "home.php";
		$keywords		= "";
		break;
		
		// SERVICES //
		case 'services':								
		$pageTitle		= "Services";
		$currentPage	= "Services";
		$phpPage		= "services.php";
		$keywords		= "";
		break;
		
		// PRICING //
		case 'pricing':								
		$pageTitle		= "Pricing";
		$currentPage	= "Pricing";
		$phpPage		= "pricing.php";
		$keywords		= "";
		break;
		
		// CLIENTS //
		case 'clients':								
		$pageTitle		= "Clients";
		$currentPage	= "Clients";
		$phpPage		= "home.php";
		$keywords		= "";
		break;
		
		// ABOUT US //
		case 'aboutus':								
		$pageTitle		= "About Us";
		$currentPage	= "About Us";
		$phpPage		= "aboutus.php";
		$keywords		= "";
		break;
		
		// CONTACT //
		case 'contact':								
		$pageTitle		= "Contact";
		$currentPage	= "Contact";
		$phpPage		= "contact.php";
		$keywords		= "";
		break;
		
			// SiteMap //
			case 'sitemap':								
			$pageTitle		= "SiteMap";
			$currentPage	= "SiteMap";
			$phpPage		= "sitemap.php";
			$keywords		= "";
			break;
			
			// TermsOfUse //
			case 'termsofuse':								
			$pageTitle		= "TermsOfUse";
			$currentPage	= "TermsOfUse";
			$phpPage		= "termsofuse.php";
			$keywords		= "";
			break;
			
			// Privacy //
			case 'privacy':								
			$pageTitle		= "Privacy";
			$currentPage	= "Privacy";
			$phpPage		= "privacy.php";
			$keywords		= "";
			break;
			
	
	// Default
	default:											
	$pageTitle		= "Home";
	$currentPage	= "Home";
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