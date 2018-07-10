<?php

	class Mae{

		/*var $idMae;
		var $nomeMae;
		var $profissaoMae;
		var $telefoneMae;
		var $movelMae;
		var $moradaMae;
		var $alcunhaMae;


		function __construct($crianca){

			parent::__construct($crianca);
			$this->idMae=@$crianca["idMae"];
			$this->nomeMae=@$crianca["nomeMae"];
			$this->profissaoMae=@$crianca["profissaoMae"];
			$this->telefoneMae=@$crianca["telefoneMae"];
			$this->movelMae=@$crianca["movelMae"];
			$this->moradaMae=@$crianca["moradaMae"];
			$this->alcunhaMae=@$crianca["alcunhaMae"];

		}*/


		function registarMae($nomeMae,$profissaoMae,$telefoneMae,$movelMae,$moradaMae,$alcunhaMae,$db){

			

			$insert_mae = $db->query("INSERT into mae(nomeMae,profissaoMae,telefoneMae,
													movelMae,moradaMae,alcunhaMae)
								values('$nomeMae','$profissaoMae','$telefoneMae',
									   '$movelMae','$moradaMae','$alcunhaMae');") 
							or die(mysqli_error($db));
			$idMae=mysqli_insert_id($db);

			return $idMae;

		}

		function updateMae($mae,$db){

			$idMae						= 	@$mae['idMae'];
			$nomeMae					=	@$mae['nomeMae'];
			$profissaoMae				=	@$mae['profissaoMae'];
			$telefoneMae				=	@$mae['telefoneMae'];
			$movelMae					=	@$mae['movelMae'];
			$moradaMae					=	@$mae['moradaMae'];
			$alcunhaMae					=	@$mae['alcunhaMae'];


			$update_crianca=$db->query("UPDATE mae set nomeMae='$nomeMae',profissaoMae='$profissaoMae',
											telefoneMae='$telefoneMae',movelMae='$movelMae',moradaMae='$moradaMae',
											alcunhaMae='$alcunhaMae' where idMae='$idMae';")
								 			or die(mysqli_error($db));		
		} 

		
	}

?>