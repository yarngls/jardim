<?php

	require_once "../function_RH.php";
	//require_once "../transportar_dados_morpho.php";
	//require_once "../transportar_dados_morpho.php";
	$db=connection();

	$want = $_SERVER["REQUEST_METHOD"];

	switch ($want) {
		
		case 'GET':
			
				
				$select_all=$db->query("SELECT  * FROM criancas where estado = 'Matriculado' ORDER BY nome ASC;");

				$criancas = []; 

				while ($data = mysqli_fetch_assoc($select_all))
				{
					//$data["nome"] = mb_convert_encoding($data["nome"], "UTF-8");
					/*foreach ($data as $key => $value) {
						$data[$key] = mb_convert_encoding($value, "UTF-8");
					}*/
					$criancas[] = $data;
				}

				echo json_encode($criancas);
		break;
		default:			
			echo json_decode(["erro"=>"404"]);	
		break;

		
	}

?>