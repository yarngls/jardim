<?php

	include_once '../config/db_config.php';
	include_once 'paiModel.php';
	include_once 'maeModel.php';

	class Crianca {

		var $idCrianca;
		var $fotoPerfil;
		var $nome;
		var $sexo;
		var $dataNascimento;
		var $idade;
		var $alcunha;
		var $numeroPMI;
		var $periodoManha;
		var $periodoTarde;
		var $diaInteiro;
		var $propina;
		var $linguaFrancesa;
		var $linguaInglesa;
		var $almoco;
		var $morada;
		var $dataInicioJardim;
		var $estado;
		var $idPai;
		var $idmae;




		function registarCrianca($crianca,$db){
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

			$pai = new Pai();
			$idPai=$pai->registarPai($crianca,$db);

			$mae = new Mae();
			$idMae=$mae-> registarMae($crianca,$db);

			$insert_crianca = $db->query("INSERT into criancas(nome,sexo,dataNascimento,
																  idade,alcunha,numeroPMI,periodoManha,periodoTarde,diaInteiro,propina,
																  linguaFrancesa,linguaInglesa,almoco,morada,dataInicioJardim,estado,idPai,idMae)
								values('$nome','$sexo','$dataNascimento',
									   '$idade','$alcunha','$numeroPMI','$periodoManha','$periodoTarde','$diaInteiro','$propina',
									   '$linguaFrancesa','$linguaInglesa','$almoco','$morada','$dataInicioJardim','$estado','$idPai','$idMae');") 
							or die(mysqli_error($db));
			$id_crianca=mysqli_insert_id($db);
			$crianca["id"] = $id_crianca;

			$insert_estatisticas = $db->query("INSERT into estatisticas(idCrianca)values('$id_crianca');") 
							or die(mysqli_error($db));
			$id_estatisticas=mysqli_insert_id($db);

			echo json_encode($id_crianca);
		}


		function getAllCrianca($db){
			$select_all=$db->query("SELECT * FROM criancas C, pai P,mae M, estatisticas E where C.idPai=P.idPai and C.idMae=M.idMae and C.idCrianca=E.idCrianca and C.estado!='Suspenso'order by C.nome;");
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

		
		function updateCrianca($crianca,$db){
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
			$morada						= 	@$crianca['morada'];
			$dataInicioJardimForm     	= 	@$crianca['dataInicioJardim'];
			$ExplodedataInicioJardim 	= 	explode("T", $dataInicioJardimForm);
			$dataInicioJardim			= 	$ExplodedataInicioJardim[0];
			$estado						= 	@$crianca['estado'];


			$pai = new Pai();
			$idPai=$pai->updatePai($crianca,$db);

			$mae = new Mae();
			$idMae=$mae-> updateMae($crianca,$db);
			
			$updateCrianca=$db->query("UPDATE criancas set nome='$nome',sexo='$sexo',
											dataNascimento='$dataNascimento',alcunha='$alcunha',
											numeroPMI='$numeroPMI',periodoManha='$periodoManha',
											periodoTarde='$periodoTarde',diaInteiro='$diaInteiro',
											propina='$propina',linguaFrancesa='$linguaFrancesa',
											linguaInglesa='$linguaInglesa',almoco='$almoco',
											morada='$morada',dataInicioJardim='$dataInicioJardim',
											estado='$estado' where idCrianca='$idCrianca';")
								 			or die(mysqli_error($db));
				echo json_encode("sucess");
			
		}

		function deleteByID($idCrianca,$db){
			$deleteByID=$db->query("UPDATE criancas set 
											estado='Suspenso' where idCrianca='$idCrianca';")
								 			or die(mysqli_error($db));
			echo json_encode("sucess");
		}

		function selectByID($idCrianca,$db){
			$selectByID=$db->query("SELECT * FROM criancas C, pai P,mae M, estatisticas E where C.idPai=P.idPai and C.idMae=M.idMae and C.idCrianca=E.idCrianca and C.idCrianca='$idCrianca' and C.estado!='Suspenso'order by C.nome;");
				
			$criancas = []; 

			while ($data = mysqli_fetch_assoc($selectByID))
			{
				//$data["nome"] = mb_convert_encoding($data["nome"], "UTF-8");
				/*foreach ($data as $key => $value) {
					$data[$key] = mb_convert_encoding($value, "UTF-8");
				}*/
				$criancas[] = $data;
			}

			return $criancas;
		}

		function saveEstatisticas($crianca,$db){

			$idCrianca = $crianca['idCrianca'];
			$frequentouOutroJardim = $crianca['frequentouOutroJardim'];
			$viveComPais = $crianca['viveComPais'];
			$vacinaBCG = $crianca['vacinaBCG'];
			$vacinaPolio = $crianca['vacinaPolio'];
			$vacinaHepatiteB = $crianca['vacinaHepatiteB'];
			$vacinaSarampo = $crianca['vacinaSarampo'];
			$nee = $crianca['nee'];
			$timida = $crianca['timida'];
			$alegre = $crianca['alegre'];
			$brinca = $crianca['brinca'];
			$vaiCasaBanho = $crianca['vaiCasaBanho'];
			$gostaJardim = $crianca['gostaJardim'];
			$relaciona = $crianca['relaciona'];
			$temAlergia = $crianca['temAlergia'];

			$insert_crianca = $db->query("UPDATE estatisticas set frequentouOutroJardim = '$frequentouOutroJardim', 
																  viveComPais='$viveComPais',
																  vacinaBCG='$vacinaBCG',
																  vacinaPolio='$vacinaPolio',
																  vacinaHepatiteB='$vacinaHepatiteB',
																  vacinaSarampo='$vacinaSarampo',
																  nee='$nee',
																  timida='$timida',
																  alegre='$alegre',
																  brinca='$brinca',
																  vaiCasaBanho='$vaiCasaBanho',
																  gostaJardim='$gostaJardim',
																  relaciona='$relaciona',
																  temAlergia='$temAlergia'
																   where idCrianca='$idCrianca';") 
							or die(mysqli_error($db));
			$id_crianca=mysqli_insert_id($db);
			$crianca["id"] = $id_crianca;

			return $frequentouOutroJardim;
		}
		/*function __construct($fotoPerfil,$nome,$sexo,$dataNascimento,$idade,$alcunha,$numeroPMI,$periodoManha,
							$periodoTarde,$diaInteiro,$propina,$linguaFrancesa,$linguaInglesa,$almoco,$morada,$dataInicioJardim,$estado){
			
		
			$this->$fotoPerfil=$fotoPerfil;
			$this->$nome=$nome;
			$this->$sexo=$sexo;
			$this->$dataNascimento=$dataNascimento;
			$this->$idade=$idade;
			$this->$alcunha=$alcunha;
			$this->$numeroPMI=$numeroPMI;
			$this->$periodoManha=$periodoManha;
			$this->$periodoTarde=$periodoTarde;
			$this->$diaInteiro=$diaInteiro;
			$this->$propina=$propina;
			$this->$linguaFrancesa=$linguaFrancesa;
			$this->$linguaInglesa=$linguaInglesa;
			$this->$almoco=$almoco;
			$this->$morada=$morada;
			$this->$dataInicioJardim=$dataInicioJardim;
			$this->$estado=$estado;
		
		}*/
		
	}
?>