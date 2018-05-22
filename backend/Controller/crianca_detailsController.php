<?php

	//require "../config/db_config.php";
	require "../function_RH.php";
	$db=connection();

	$want = $_SERVER["REQUEST_METHOD"];

	switch ($want) {
		
		case 'GET':
			
			$idCrianca = $_GET["id"];
			
			$select_all=$db->query("SELECT * FROM criancas C, pai P,mae M where C.idPai=P.idPai and C.idMae=M.idMae and C.idCrianca='$idCrianca';");
				//$select_all=$db->query("SELECT * FROM criancas order by nome;");

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

		case 'PUT':
			
			echo json_encode(["value"=>"actualizado com sucesso"]);
		break;

		default:
			echo json_decode(["erro"=>"404"]);	
		break;
	}

?>