<?php

	//require "../config/db_config.php";
	include_once  '../Models/criancaModel.php';
	require "../function_RH.php";
	$db=connection();

	$want = $_SERVER["REQUEST_METHOD"];
	$crianca = new Crianca();
	switch ($want) {
		
		case 'GET':
			
			$idCrianca = $_GET["id"];
			
			$criancasSelected = $crianca->selectByID($idCrianca,$db);
			echo json_encode($criancasSelected);
			
		break;
		case 'PUT':
			$received = json_decode(file_get_contents("php://input"), true);
			if(isset($received["condicao"]) && $received["condicao"]=='estatisticas'){
				$criancaReceived = $received["crianca"];
				$response=$crianca->saveEstatisticas($criancaReceived,$db);
				echo json_encode($response);
			}else{
				echo json_encode(["value"=>"other case"]);				
			}
		break;

		default:
			echo json_decode(["erro"=>"404"]);	
		break;
	}

?>