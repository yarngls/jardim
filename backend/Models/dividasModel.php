<?php

	//include_once '../config/db_config.php';
	//require_once "../function_RH.php";
	include_once 'pagamentoModel.php';
	
	class Dividas{

		
		function countDividas($id_Crianca,$db){

			$search_countdividas=$db->query("SELECT count(id_Crianca) as total FROM `dividas` where  id_Crianca='$id_Crianca' and estado='pendente';");
			
			$total = mysqli_fetch_assoc($search_countdividas);

			return $total;
		}

		//funcao responsavel em registar dividas;
		function inserirDivida($tipo_divida,$valorDevePagar,$id_crianca,$mes_actual,$ano_actual,$db){
			$date = Date("Y-m-d");
			$registo_dividas=$db->query("insert into dividas (id_crianca,tipo_divida,mes_referencia,
										ano_referencia,montante,data_registo,estado) values('$id_crianca','$tipo_divida',
										'$mes_actual','$ano_actual','$valorDevePagar','$date','pendente');");
		}


		//(3) - funcao responsavel por verificar parcela em divida
		function verificarParcelaDividas($tipo_divida,$valorDevePagar,$id_crianca,$mes_actual,$ano_actual,$db){

			$search_dividas=$db->query("SELECT count(id_crianca) as id_crianca FROM `dividas` where  id_crianca='$id_crianca' and tipo_divida='$tipo_divida' 
										and mes_referencia='$mes_actual' and ano_referencia='$ano_actual' and estado='pendente' or estado='pago';");
			$result = mysqli_fetch_assoc($search_dividas);

			if($result["id_crianca"]==0){// como nao foi registado divida, entao verifica-se se o pagamento foi efetuada

				return false;
				
			}else{
				$success="success";
			}
		}
		// (2) - funcao verifica pagamento de um determindo mes e ano;	
		function verificarPagamentos($tipo_divida,$valorDevePagar,$id_crianca,$mes_actual,$ano_actual,$db){

			$pagamento=$db->query("SELECT SUM(montante_pago) as total FROM `pagamento` where id_crianca='$id_crianca' and tipo_pagamento='$tipo_divida' 
												and mes_referencia='$mes_actual' and ano_referencia='$ano_actual';");	
			
			$data = mysqli_fetch_assoc($pagamento);				
			$parcelaPaga = $data["total"];
			
			if($parcelaPaga!=NULL){// foi encontrado pagamento. Então verifica-se se montantante pago foi igual ao valor deve ser pago;
				//$parcelaPaga = $data["montante_pago"];
				if($parcelaPaga < $valorDevePagar){
					$montanteEmDivida = $valorDevePagar-$parcelaPaga;
					$responseDividas = $this->verificarParcelaDividas($tipo_divida,$montanteEmDivida,$id_crianca,$mes_actual,$ano_actual,$db);//verifica-se se a divida ja foi registada
					if($responseDividas==false){// como a divida não foi registada logo então regista-se adivida						
						$this->inserirDivida($tipo_divida,$montanteEmDivida,$id_crianca,$mes_actual,$ano_actual,$db);
					}else{
						$situacao = "Divida ja foi registada ou paga";
					}
				}else{
					$situacao = "Divida ja foi registada ou paga";
				}
			}else{//Se não foi registado divida e não foi encontrado pagamento, então deve seguir com registo de dividas;
				 $this->inserirDivida($tipo_divida,$valorDevePagar,$id_crianca,$mes_actual,$ano_actual,$db);
			}
		}

		// (1) - funcao responsavel por verificar se a crianca tem divida registado do referido mes e ano recebido como parametro
		function verificarDividas($tipo_divida,$valorDevePagar,$id_crianca,$mes_actual,$ano_actual,$db){

			$search_dividas=$db->query("SELECT count(id_crianca) as id_crianca FROM `dividas` where  id_crianca='$id_crianca' and tipo_divida='$tipo_divida' 
										and mes_referencia='$mes_actual' and ano_referencia='$ano_actual' and estado='pendente' or estado='pago';");
			$result = mysqli_fetch_assoc($search_dividas);

			if($result["id_crianca"]==0){// como nao foi registado divida, entao verifica-se se o pagamento foi efetuada

				$this->verificarPagamentos($tipo_divida,$valorDevePagar,$id_crianca,$mes_actual,$ano_actual,$db);
				
			}else{
				$success="success";
			}
			
		}


		//inicio do processo registar dividas;
		function registarDivida($db){

			$date = Date("Y-m-d");
			$arraydate=explode("-", $date);
			$mes_actual=$arraydate[1];
			$ano_actual=$arraydate[0];
			$dia=$arraydate[2];
			$lista_id=[];

			$select_devedores=$db->query("SELECT * FROM criancas where estado = 'Matriculado';");			

			while ($data = mysqli_fetch_assoc($select_devedores)){
			
				$id_crianca=$data["idCrianca"];

				$valorPropina=$data["propina"];
				if($valorPropina!=0){
					$tipo_divida="propina";
					$this->verificarDividas($tipo_divida,$valorPropina,$id_crianca,$mes_actual,$ano_actual,$db);					
				}

				$valorLinguaFrancesa=$data["linguaFrancesa"];
				if($valorLinguaFrancesa!=0){
					$tipo_divida="linguaFrancesa";
					$this->verificarDividas($tipo_divida,$valorLinguaFrancesa,$id_crianca,$mes_actual,$ano_actual,$db);					
				}

				$valorLinguaInglesa=$data["linguaInglesa"];
				if($valorLinguaInglesa!=0){
					$tipo_divida="linguaInglesa";
					$this->verificarDividas($tipo_divida,$valorLinguaInglesa,$id_crianca,$mes_actual,$ano_actual,$db);					
				}

				$valorAlmoco=$data["almoco"];
				if($valorAlmoco!=0){
					$tipo_divida="almoco";
					$this->verificarDividas($tipo_divida,$valorAlmoco,$id_crianca,$mes_actual,$ano_actual,$db);					
				}
			}
		}

		public function listarTodasDividas($idCrianca,$db){
			$dividas=$db->query("SELECT * FROM `dividas` where id_crianca='$idCrianca' and estado='pendente' order by id_dividas;");	
			$TodasDividas=[];

			while ($data = mysqli_fetch_assoc($dividas)) {
				//$data["mes_referencia"]=convertMonthforIndece($data["mes_referencia"])
				$TodasDividas[]=$data;

			}

			return $TodasDividas;
		}

		public function liquidaDividas($idCrianca,$fatura,$db){

			$ordem_pagamento="001062018";
			$dia_pagamento=Date("Y-m-d");

			for($i=0;$i<count($fatura);$i++){

				$tipo_pagamento=$fatura[$i]["tipo_divida"];
				$mes_referencia=$fatura[$i]["mes_referencia"]; //convertMonthforIndece($fatura[$i]["mes_referencia"]);
				$ano_referencia=$fatura[$i]["ano_referencia"];
				$valorDivida=$fatura[$i]["montante"];
				$id_dividas=$fatura[$i]["id_dividas"];		
									
					$efetuar_pagamento=$db->query("insert into pagamento (ordem_pagamento,id_crianca,tipo_pagamento,mes_referencia,
																  ano_referencia,dia_pagamento,montante_pago,observacoes,nome_user) 
																	values('$ordem_pagamento','$idCrianca','$tipo_pagamento','$mes_referencia',
																		   '$ano_referencia','$dia_pagamento','$valorDivida','Pagamento Dividas',
																		   'Gilson');");

					$efetuar_liquidarDivida=$db->query("update dividas set estado='pago' where id_dividas='$id_dividas';");
			}
		}

	}

?>