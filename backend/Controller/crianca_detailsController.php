<?php

	//require "../config/db_config.php";
	include_once '../Models/criancaModel.php';
	include_once '../Models/criancaModel.php';
	require_once '../Models/pagamentoModel.php';
	include_once '../Models/dividasModel.php';
	require "../function_RH.php";
	$db=connection();

	$want = $_SERVER["REQUEST_METHOD"];
	$receiveCrianca = json_decode(file_get_contents("php://input"),true);
	$crianca = new Crianca($receiveCrianca);
	switch ($want) {
		
		case 'GET':
			
			$idCrianca = $_GET["id"];
			
			$criancasSelected = $crianca->selectByID($idCrianca,$db);

			$selectCountPagamentos = $crianca->selectCountPagamentos($idCrianca,$db);
			
			$selectCountDividas = $crianca->selectCountDividas($idCrianca,$db);

			echo json_encode(["dadosCriancao" => $criancasSelected,"totalPagamentos" => $selectCountPagamentos,"totalDividas" => $selectCountDividas]);
			
		break;
		case 'PUT':
			$received = json_decode(file_get_contents("php://input"), true);
			if(isset($received["condicao"]) && $received["condicao"]=='estatisticas'){
				$criancaReceived = $received["crianca"];
				$response=$crianca->saveEstatisticas($criancaReceived,$db);
				echo json_encode($response);
			}else if(isset($received["condicao"]) && $received["condicao"]=='atualizarCrianca'){
				$criancaReceived = $received["crianca"];
				$crianca = new Crianca($criancaReceived);
				$response=$crianca->updateCrianca($criancaReceived,$db);

				echo json_encode($response);
			}else if(isset($received["condicao"]) && $received["condicao"]=='listarTodosPagamentos'){
				$idCrianca = $received["idCrianca"];
				$pagamento = new Pagamento();
				$response=$pagamento->listarTodosPagamentos($idCrianca,$db);
				echo json_encode($response);
			}else if(isset($received["condicao"]) && $received["condicao"]=='listarTodasDividas'){
				$idCrianca= $received["idCrianca"];
				$divida = new Dividas();
				$dividas=$divida->listarTodasDividas($idCrianca,$db);
				echo json_encode($dividas);
			}else if(isset($received["condicao"]) && $received["condicao"]=='liquidaDividas'){
				$idCrianca= $received["idCrianca"];
				$fatura= $received["fatura"];
				$divida = new Dividas();
				$dividas=$divida->liquidaDividas($idCrianca,$fatura,$db);
				echo json_encode($dividas);
			}else{
				echo json_encode(["value"=>"other case"]);				
			}
		break;

		default:
			echo json_decode(["erro"=>"404"]);	
		break;
	}

?>