<?php
	class Pai{

		var $idPai;
		var $nomePai;
		var $profissaoPai;
		var $telefonePai;
		var $moradaPai;
		var $alcunhaPai;


		function registarPai($pai,$db){
			$nomePai					=	@$pai['nomePai'];
			$profissaoPai				=	@$pai['profissaoPai'];
			$telefonePai				=	@$pai['telefonePai'];
			$movelPai					=	@$pai['movelPai'];
			$moradaPai					=	@$pai['moradaPai'];
			$alcunhaPai					=	@$pai['alcunhaPai'];

			$insert_pai = $db->query("INSERT into pai(nomePai,profissaoPai,telefonePai,
													movelPai,moradaPai,alcunhaPai)
								values('$nomePai','$profissaoPai','$telefonePai',
									   '$movelPai','$moradaPai','$alcunhaPai');") 
							or die(mysqli_error($db));
			$idPai=mysqli_insert_id($db);

			return $idPai;

		} 

		function updatePai($pai,$db){

			$idPai						= 	@$pai['idPai'];
			$nomePai					=	@$pai['nomePai'];
			$profissaoPai				=	@$pai['profissaoPai'];
			$telefonePai				=	@$pai['telefonePai'];
			$movelPai					=	@$pai['movelPai'];
			$moradaPai					=	@$pai['moradaPai'];
			$alcunhaPai					=	@$pai['alcunhaPai'];


			$update_crianca=$db->query("UPDATE pai set nomePai='$nomePai',profissaoPai='$profissaoPai',
											telefonePai='$telefonePai',movelPai='$movelPai',moradaPai='$moradaPai',
											alcunhaPai='$alcunhaPai' where idPai='$idPai';")
								 			or die(mysqli_error($db));
		}


		/*function __construct($nomePai,$profissaoPai,$telefonePai,$moradaPai,$alcunhaPai){
			$this->$nomePai=$nomePai;
			$this->profissaoPai=$profissaoPai;
			$this->$telefonePai=$telefonePai;
			$moradaPai->$moradaPai=$moradaPai;
			$alcunhaPai->$alcunhaPai=$alcunhaPai;
		}*/
	}
?>