<?php

	require_once "../function_RH.php";
	//require_once "../transportar_dados_morpho.php";
	//require_once "../transportar_dados_morpho.php";
	$db=connection();

	$want = $_SERVER["REQUEST_METHOD"];

	switch ($want) {
		
		case 'GET':
			//transportar_dados_morpho();
			if(isset($_GET["id"])){
				//transportar_dados_morpho();
				$id = $_GET["id"];					
				$select_all=$db->query("SELECT * FROM funcionarios where id_funcionario='$id';");

				$data = mysqli_fetch_assoc($select_all);

				echo json_encode($data);
			}else{
				
				$select_all=$db->query("SELECT  * FROM criancas where estado ='Matriculado' ORDER BY nome ASC;");

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

			}
		break;
		case 'POST':
			$crianca = json_decode(file_get_contents("php://input"), true);
			$nome						= 	@$crianca['nome'];
			$sexo						= 	@$crianca['sexo'];
			$dataNascimento				= 	@$crianca['dataNascimento'];
			$idade						= 	@$crianca['idade'];
			$alcunha					= 	@$crianca['alcunha'];
			$numeroPMI					= 	@$crianca['numeroPMI'];
			$propina					= 	@$crianca['propina'];
			$nomePai					= 	@$crianca['nomePai'];
			$nomeMae					= 	@$crianca['nomeMae'];
			$encaregadoEducacao			= 	@$crianca['encaregadoEducacao'];
			$morada						= 	@$crianca['morada'];
			$dataInicioJardim			= 	@$crianca['dataInicioJardim'];
			$estado						= 	@$crianca['estado'];

			/*$sql = "INSERT INTO criancas (nome, sexo, dataNascimento, estado) VALUES ('$nome', '$sexo', '$dataNascimento', '$estado')";
			if(mysqli_query($link, $sql)){
			    echo "Records added successfully.";
			} else{
			    echo "ERROR: Could not able to execute $sql. " . mysqli_error($link);
}			}*/

			$insert_crianca = $db->query("INSERT into criancas(nome,sexo,dataNascimento,
																  idade,alcunha,numeroPMI,propina,
																  nomePai,nomeMae,encaregadoEducacao,morada,dataInicioJardim,estado)
								values('$nome','$sexo','2018-03-12',
									   '$idade','$alcunha','$numeroPMI','$propina','$nomePai','$nomeMae','$encaregadoEducacao','$morada','$dataInicioJardim','$estado');") 
							or die(mysqli_error($db));
			/*$id_crianca=mysqli_insert_id($db);
			$crianca["id"] = $id_crianca;*/
			echo json_encode($crianca);
		break;
		/*case 'PUT':			
			$crianca = json_decode(file_get_contents("php://input"), true);
			$id							= 	@$crianca['id'];
			$nome						= 	@$crianca['nome'];
			$sexo						= 	@$crianca['sexo'];
			$dataNascimento				= 	@$crianca['dataNascimento'];
			$idade						= 	'0';
			$alcunha					= 	@$crianca['alcunha'];
			$numeroPMI					= 	@$crianca['numeroPMI'];
			$propina					= 	@$crianca['propina'];
			$nomePai					= 	@$crianca['nomePai'];
			$nomeMae					= 	@$crianca['nomeMae'];
			$encaregadoEducacao			= 	@$crianca['encaregadoEducacao'];
			$morada						= 	@$crianca['morada'];
			$dataInicioJardim			= 	@$crianca['dataInicioJardim'];
			$estado						= 	@$crianca['estado'];

			$update_crianca=$db->query("UPDATE criancas set nome='$nome',sexo='$sexo',
										 dataNascimento='$dataNascimento',alcunha='$alcunha',
										 numeroPMI='$numeroPMI',propina='$propina',nomePai='$nomePai',nomeMae='$nomeMae',
										 encaregadoEducacao='$encaregadoEducacao',morada='$morada',dataInicioJardim='$dataInicioJardim',
										 estado='$estado'
										 where id='$id';")
							 			or die(mysqli_error($db));*/
			/*$id_funcionario=mysqli_insert_id($db);
			$funcionario["id_funcionario"] = $id_funcionario;*/
			/*echo json_encode("success");
		break;	*/	
		default:			
			echo json_decode(["erro"=>"404"]);	
		break;

		
	}

?>