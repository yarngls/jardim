<?php

	require_once "../function_RH.php";
	//require_once "../transportar_dados_morpho.php";
	//require_once "../transportar_dados_morpho.php";
	$db=connection();

	$want = $_SERVER["REQUEST_METHOD"];

	switch ($want) {
		
		case 'GET':
		
			if(isset($_GET["Localidades"])){

						
				$select_localidades=$db->query("SELECT * FROM localidades order by nomeLocaliades;");
				$localidades=[];
				while ($data = mysqli_fetch_assoc($select_localidades))
				{
					$localidades[] = $data;
				}

				echo json_encode($localidades);
			}else{

				/*$select_all=$db->query("SELECT * FROM criancas C, pai P,mae M where C.idPai=P.idPai and C.idMae=M.idMae order by C.nome;");*/
				$select_all=$db->query("SELECT * FROM criancas order by nome;");

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
			$dataNascimentoForm     	= 	@$crianca['dataNascimento'];
			$ExplodedataNascimento 		= 	explode("T", $dataNascimentoForm);
			$dataNascimento				= 	$ExplodedataNascimento[0];
			$idade						= 	@$crianca['idade'];
			$alcunha					= 	@$crianca['alcunha'];
			$numeroPMI					= 	@$crianca['numeroPMI'];
			
			$periodoManha				= 	@$crianca['periodoManha'];
			$periodoTarde				= 	@$crianca['periodoTarde'];
			$diaInteiro					= 	@$crianca['diaInteiro'];
			
			$propina					= 	@$crianca['propina'];
			
			$linguaFrancesa				= 	@$crianca['linguaFrancesa'];
			$linguaInglesa				= 	@$crianca['linguaInglesa'];

			$almoco						= 	@$crianca['almoco'];
			
			$nomePai					= 	@$crianca['nomePai'];
			$nomeMae					= 	@$crianca['nomeMae'];
			$encaregadoEducacao			= 	@$crianca['encaregadoEducacao'];
			$morada						= 	@$crianca['morada'];
			$dataInicioJardimForm     	= 	@$crianca['dataInicioJardim'];
			$ExplodedataInicioJardim 	= 	explode("T", $dataInicioJardimForm);
			$dataInicioJardim			= 	$ExplodedataInicioJardim[0];
			$estado						= 	@$crianca['estado'];

			$nomePai					=	@$crianca['nomePai'];
			$profissaoPai				=	@$crianca['profissaoPai'];
			$telefonePai				=	@$crianca['telefonePai'];
			$movelPai					=	@$crianca['movelPai'];
			$moradaPai					=	@$crianca['moradaPai'];
			$alcunhaPai					=	@$crianca['alcunhaPai'];

			$nomeMae					=	@$crianca['nomeMae'];
			$profissaoMae				=	@$crianca['profissaoMae'];
			$telefoneMae				=	@$crianca['telefoneMae'];
			$movelMae					=	@$crianca['movelMae'];
			$moradaMae					=	@$crianca['moradaMae'];
			$alcunhaMae					=	@$crianca['alcunhaMae'];


			$insert_pai = $db->query("INSERT into pai(nomePai,profissaoPai,telefonePai,
																  movelPai,moradaPai,alcunhaPai)
								values('$nomePai','$profissaoPai','$telefonePai',
									   '$movelPai','$moradaPai','$alcunhaPai');") 
							or die(mysqli_error($db));
			$idPai=mysqli_insert_id($db);


			$insert_mae = $db->query("INSERT into mae(nomeMae,profissaoMae,telefoneMae,
																  movelMae,moradaMae,alcunhaMae)
								values('$nomeMae','$profissaoMae','$telefoneMae',
									   '$movelMae','$moradaMae','$alcunhaMae');") 
							or die(mysqli_error($db));
			$idMae=mysqli_insert_id($db);


			$insert_crianca = $db->query("INSERT into criancas(nome,sexo,dataNascimento,
																  idade,alcunha,numeroPMI,periodoManha,periodoTarde,diaInteiro,propina,
																  linguaFrancesa,linguaInglesa,almoco,morada,dataInicioJardim,estado,idPai,idMae)
								values('$nome','$sexo','$dataNascimento',
									   '$idade','$alcunha','$numeroPMI','$periodoManha','$periodoTarde','$diaInteiro','$propina',
									   '$linguaFrancesa','$linguaInglesa','$almoco','$morada','$dataInicioJardim','$estado','$idPai','$idMae');") 
							or die(mysqli_error($db));
			$id_crianca=mysqli_insert_id($db);
			$crianca["id"] = $id_crianca;
			echo json_encode($id_crianca);

		break;
		case 'PUT':			
			$crianca = json_decode(file_get_contents("php://input"), true);
			$idCrianca					= 	@$crianca['idCrianca'];
			$nome						= 	@$crianca['nome'];
			$sexo						= 	@$crianca['sexo'];
			$dataNascimentoForm     	= 	@$crianca['dataNascimento'];
			$ExplodedataNascimento 		= 	explode("T", $dataNascimentoForm);
			$dataNascimento				= 	$ExplodedataNascimento[0];
			$idade						= 	@$crianca['idade'];
			$alcunha					= 	@$crianca['alcunha'];
			$numeroPMI					= 	@$crianca['numeroPMI'];
			
			$periodoManha				= 	@$crianca['periodoManha'];
			$periodoTarde				= 	@$crianca['periodoTarde'];
			$diaInteiro					= 	@$crianca['diaInteiro'];
			
			$propina					= 	@$crianca['propina'];
			
			$linguaFrancesa				= 	@$crianca['linguaFrancesa'];
			$linguaInglesa				= 	@$crianca['linguaInglesa'];

			$almoco						= 	@$crianca['almoco'];
			
			$nomePai					= 	@$crianca['nomePai'];
			$nomeMae					= 	@$crianca['nomeMae'];
			$encaregadoEducacao			= 	@$crianca['encaregadoEducacao'];
			$morada						= 	@$crianca['morada'];
			$dataInicioJardimForm     	= 	@$crianca['dataInicioJardim'];
			$ExplodedataInicioJardim 	= 	explode("T", $dataInicioJardimForm);
			$dataInicioJardim			= 	$ExplodedataInicioJardim[0];
			$estado						= 	@$crianca['estado'];

			$nomePai					=	@$crianca['nomePai'];
			$profissaoPai				=	@$crianca['profissaoPai'];
			$telefonePai				=	@$crianca['telefonePai'];
			$movelPai					=	@$crianca['movelPai'];
			$moradaPai					=	@$crianca['moradaPai'];
			$alcunhaPai					=	@$crianca['alcunhaPai'];

			$nomeMae					=	@$crianca['nomeMae'];
			$profissaoMae				=	@$crianca['profissaoMae'];
			$telefoneMae				=	@$crianca['telefoneMae'];
			$movelMae					=	@$crianca['movelMae'];
			$moradaMae					=	@$crianca['moradaMae'];
			$alcunhaMae					=	@$crianca['alcunhaMae'];

			$update_crianca=$db->query("UPDATE criancas set nome='$nome',sexo='$sexo',
										dataNascimento='$dataNascimento',alcunha='$alcunha',
										numeroPMI='$numeroPMI',periodoManha='$periodoManha',
										periodoTarde='$periodoTarde',diaInteiro='$diaInteiro',
										propina='$propina',linguaFrancesa='$linguaFrancesa',
										linguaInglesa='$linguaInglesa',almoco='$almoco',
										morada='$morada',dataInicioJardim='$dataInicioJardim',
										estado='$estado' where idCrianca='$idCrianca';")
							 			or die(mysqli_error($db));
			/*$id_funcionario=mysqli_insert_id($db);
			$funcionario["id_funcionario"] = $id_funcionario;*/
			echo json_encode("success");

		break;		
		default:			
			echo json_decode(["erro"=>"404"]);	
		break;

		
	}

?>