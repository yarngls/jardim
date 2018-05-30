<?php
	
	include_once  '../Models/criancaModel.php';
	require_once "../function_RH.php";
	$db=connection();
	

	$want = $_SERVER["REQUEST_METHOD"];
	$crianca = new Crianca();
	switch ($want) {
		
		case 'GET':	

			$crianca->getAllCrianca($db);

		break;
		case 'POST':

			$receiveCrianca = json_decode(file_get_contents("php://input"),true);
			$crianca->registarCrianca($receiveCrianca,$db);

		break;
		case 'PUT':	
		
			$receiveCrianca = json_decode(file_get_contents("php://input"), true);

			if(isset($receiveCrianca["condicao"]) && $receiveCrianca["condicao"]=="eliminar"){	
				$idCrianca = $receiveCrianca["idCrianca"];
				$crianca->deleteByID($idCrianca,$db);
				//echo json_encode($receiveCrianca["condicao"]);

			}else{
				$crianca->updateCrianca($receiveCrianca,$db);
			}	
		break;		
		default:			
			echo json_decode(["erro"=>"404"]);	
		break;

		
	}


	/*

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

				$select_all=$db->query("SELECT * FROM criancas C, pai P,mae M where C.idPai=P.idPai and C.idMae=M.idMae and C.estado!='Suspenso'order by C.nome;");
				//$select_all=$db->query("SELECT * FROM criancas order by nome;");

				$criancas = []; 

				while ($data = mysqli_fetch_assoc($select_all))
				{
					//$data["nome"] = mb_convert_encoding($data["nome"], "UTF-8");
					/*foreach ($data as $key => $value) {
						$data[$key] = mb_convert_encoding($value, "UTF-8");
					}*/
					/*$criancas[] = $data;
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
			//echo json_encode("success");
		break;
		case 'PUT':			
			$request = json_decode(file_get_contents("php://input"), true);

			if(isset($request["condicao"]) && $request["condicao"]=="eliminar"){
				$idCrianca = $request["idCrianca"];
				$update_crianca=$db->query("UPDATE criancas set 
											estado='Suspenso' where idCrianca='$idCrianca';")
								 			or die(mysqli_error($db));
				echo json_encode($request["condicao"]);
			}else{

				$idCrianca					= 	@$request['idCrianca'];
				$nome						= 	@$request['nome'];
				$sexo						= 	@$request['sexo'];
				$dataNascimentoForm     	= 	@$request['dataNascimento'];
				$ExplodedataNascimento 		= 	explode("T", $dataNascimentoForm);
				$dataNascimento				= 	$ExplodedataNascimento[0];
				$idade						= 	@$request['idade'];
				$alcunha					= 	@$request['alcunha'];
				$numeroPMI					= 	@$request['numeroPMI'];
				
				$periodoManha				= 	@$request['periodoManha'];
				$periodoTarde				= 	@$request['periodoTarde'];
				$diaInteiro					= 	@$request['diaInteiro'];
				
				$propina					= 	@$request['propina'];
				
				$linguaFrancesa				= 	@$request['linguaFrancesa'];
				$linguaInglesa				= 	@$request['linguaInglesa'];

				$almoco						= 	@$request['almoco'];
				
				$nomePai					= 	@$request['nomePai'];
				$nomeMae					= 	@$request['nomeMae'];
				$encaregadoEducacao			= 	@$request['encaregadoEducacao'];
				$morada						= 	@$request['morada'];
				$dataInicioJardimForm     	= 	@$request['dataInicioJardim'];
				$ExplodedataInicioJardim 	= 	explode("T", $dataInicioJardimForm);
				$dataInicioJardim			= 	$ExplodedataInicioJardim[0];
				$estado						= 	@$request['estado'];

				$idPai						= 	@$request['idPai'];
				$nomePai					=	@$request['nomePai'];
				$profissaoPai				=	@$request['profissaoPai'];
				$telefonePai				=	@$request['telefonePai'];
				$movelPai					=	@$request['movelPai'];
				$moradaPai					=	@$request['moradaPai'];
				$alcunhaPai					=	@$request['alcunhaPai'];

				$idMae						= 	@$request['idMae'];
				$nomeMae					=	@$request['nomeMae'];
				$profissaoMae				=	@$request['profissaoMae'];
				$telefoneMae				=	@$request['telefoneMae'];
				$movelMae					=	@$request['movelMae'];
				$moradaMae					=	@$request['moradaMae'];
				$alcunhaMae					=	@$request['alcunhaMae'];


				$update_crianca=$db->query("UPDATE pai set nomePai='$nomePai',profissaoPai='$profissaoPai',
											telefonePai='$telefonePai',movelPai='$movelPai',moradaPai='$moradaPai',
											alcunhaPai='$alcunhaPai' where idPai='$idPai';")
								 			or die(mysqli_error($db));

				$update_crianca=$db->query("UPDATE mae set nomeMae='$nomeMae',profissaoMae='$profissaoMae',
											telefoneMae='$telefoneMae',movelMae='$movelMae',moradaMae='$moradaMae',
											alcunhaMae='$alcunhaMae' where idMae='$idMae';")
								 			or die(mysqli_error($db));				 			

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
				/*echo json_encode("sucess");
			}


		break;		
		default:			
			echo json_decode(["erro"=>"404"]);	
		break;

		
	}


	*/

?>



