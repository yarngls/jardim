<?php
	class Pai{

		function registarPai($nomePai,$profissaoPai,$telefonePai,$movelPai,$moradaPai,$alcunhaPai,$db){

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


	}
?>