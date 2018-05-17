<?php

	require_once "../function_RH.php";
	//require_once "../transportar_dados_morpho.php";
	//require_once "../transportar_dados_morpho.php";
	$db=connection();

	$want = $_SERVER["REQUEST_METHOD"];

	switch ($want) {
		
		case 'GET':
				echo json_encode("criancas");
		break;
		default:			
			echo json_decode(["erro"=>"404"]);	
		break;

		
	}

?>