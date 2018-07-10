<?php
	include_once 'dividasModel.php';

	class Pagamento{

		
		function calcularMontanteApagar($tipo_pagamento,$mes_referencia,$ano_referencia,$idCrianca_pagamento,$db){

			
			$pagamento=$db->query("SELECT * FROM `criancas` where idCrianca='$idCrianca_pagamento';");	
			
			$data = mysqli_fetch_array($pagamento);
			$valorMensal = $data["$tipo_pagamento"];
			if($valorMensal>0){
				$pagamento=$db->query("SELECT SUM(montante_pago) as total FROM `pagamento` where id_crianca='$idCrianca_pagamento' and tipo_pagamento='$tipo_pagamento' 
													and mes_referencia='$mes_referencia' and ano_referencia='$ano_referencia';");	
				
				$data = mysqli_fetch_assoc($pagamento);

				
				$parcelaPaga = $data["total"];
				if($parcelaPaga < $valorMensal){
					$montanteEmDivida = $valorMensal-$parcelaPaga;
					return $montanteEmDivida;					
				}else{
					return 0;
				}
			}else{
				return 0;
			}

		}
		

		function verificarPagamentos($id_crianca,$mes_referencia,$ano_referencia,$tipo_pagamento,$db){

			$pagamento=$db->query("SELECT count(id_crianca) as id_crianca FROM `pagamento` where id_crianca='$id_crianca' and tipo_pagamento='$tipo_pagamento' 
												and mes_referencia='$mes_referencia' and ano_referencia='$ano_referencia';");	
			
			$result = mysqli_fetch_assoc($pagamento);
			
			if($result["id_crianca"]==0){
				return false;
			}
			return true;
		}

		public function efetuar_pagamento_normal($fatura,$id_crianca,$db){

			$ordem_pagamento="001062018";
			$dia_pagamento=Date("Y-m-d");
			
			//$observacoes=$fatura["descricao"];
			//$nome_user=$fatura["nome_user"];
			for($i=0;$i<count($fatura);$i++){

				$tipo_pagamento=$fatura[$i]["tipo_pagamento"];
				$mes_referencia=convertMonthforIndece($fatura[$i]["mes_referencia"]);
				$ano_referencia=$fatura[$i]["ano_referencia"];
				$montante_pago=$fatura[$i]["montante_pago"];
				$valorDivida=$fatura[$i]["valorDivida"];
				
				if($montante_pago!=0){
					

					$responsePagamento=$this->verificarPagamentos($id_crianca,$mes_referencia,$ano_referencia,$tipo_pagamento,$db);//verificar se crianca ja pagou alguma parcela do corrente mes;
					
					//if($responsePagamento==false){						
						$efetuar_pagamento=$db->query("insert into pagamento (ordem_pagamento,id_crianca,tipo_pagamento,mes_referencia,
																	  ano_referencia,dia_pagamento,montante_pago,observacoes,nome_user) 
																		values('$ordem_pagamento','$id_crianca','$tipo_pagamento','$mes_referencia',
																			   '$ano_referencia','$dia_pagamento','$montante_pago','Pagamento Normal',
																			   'Gilson');");
					//}
				}

				if($valorDivida>0){

					$divida = new Dividas();

					$divida->inserirDivida($tipo_pagamento,$valorDivida,$id_crianca,$mes_referencia,$ano_referencia,$db);
				}
			}
			
			echo json_encode(["sucesso"=>"Sucesso"]);
		}

		public function listarTodosPagamentos($idCrianca,$db){
			$pagamento=$db->query("SELECT * FROM `pagamento` where id_crianca='$idCrianca' order by id_pagamento;");	
			$TodosPagamentos=[];

			while ($data = mysqli_fetch_assoc($pagamento)) {
				//$data["mes_referencia"]=convertMonthforIndece($data["mes_referencia"])
				$TodosPagamentos[]=$data;

			}

			return $TodosPagamentos;
		}


		/*public function liquidarDivida($fatura,$idCrianca,$db){
			echo json_encode($fatura);
			$date=Date("Y-m-d");
			$ordem_pagamento=$dados_pagamento["ordem_pagamento"];
			$id_cliente=$dados_pagamento["id_cliente"];
			$chave_alarme=$dados_pagamento["chave_alarme"];
			$mes_referencia=$dados_pagamento["mes_referencia"];
			$ano_referencia=$dados_pagamento["ano_referencia"];
			$montante_pago=$dados_pagamento["montante_pago"];
			$saldo_a_pagar=$dados_pagamento["saldo_a_pagar"];
			$id_dividas=$dados_pagamento["id_dividas"];
			$observacoes=$dados_pagamento["observacoes"];
			$nome_user=$dados_pagamento["nome_user"];

			$registo_pagamento=$db->query("insert into pagamento (ordem_pagamento,id_cliente,chave_alarme,mes_referencia,
															  ano_referencia,dia_pagamento,montante_pago,observacoes,nome_user) values('$ordem_pagamento',
															  '$id_cliente','$chave_alarme','$mes_referencia','$ano_referencia',
															  '$date','$montante_pago','$observacoes','$nome_user');");

			if($saldo_a_pagar==0){
				$liquidar_divida=$db->query("update dividas set estado='liquidado' where id_dividas='$id_dividas';");
			}else{
				$liquidar_divida=$db->query("update dividas set montante='$saldo_a_pagar', data_registo='$date' where id_dividas='$id_dividas';");
			}
			
			echo json_encode(["sucesso"=>"sucesso"]);
			
		}


		public function cond_pagamento($id_cliente,$db){
			$cond_pagamento=$db->query("SELECT count(id_cliente) as total FROM `dividas` where id_cliente='$id_cliente' and estado='pendente';");
			
			echo json_encode(["resultado"=>$cond_pagamento]);
		}

		
		public function valor_pagos($dados,$db){
			$id_cliente=$dados["id_cliente"];
			$chave_alarme=$dados["chave_alarme"];
			$mes_certo=$dados["mes_certo"];
			$ano_ref=$dados["ano_ref"];
			$cond_pagamento=$db->query("SELECT *from `pagamento` where id_cliente='$id_cliente' 
										and chave_alarme='$chave_alarme' and mes_referencia='$mes_certo'
										and ano_referencia='$ano_ref';");
			
			echo json_encode(["resultado"=>$cond_pagamento]);
		}

		public function pagamento_parcela_registo($dados_parcela,$db){
			$ordem_pagamento=$dados_parcela["ordem_pagamento"];
			$id_cliente=$dados_parcela["id_cliente"];
			$chave_alarme=$dados_parcela["chave_alarme"];
			$mes_referencia=$dados_parcela["mes_referencia"];
			$ano_referencia=$dados_parcela["ano_referencia"];
			$dia_pagamento=Date("Y-m-d");
			$montante_pago=$dados_parcela["montante_pago"];
			$observacoes=$dados_parcela["observacoes"];
			$nome_user=$dados_parcela["nome_user"];
			$valor_para_divida=$dados_parcela["valor_para_divida"];

			$date = Date("Y-m-d");
			$arraydate=explode("-", $date);
			$mes_actual=$arraydate[1];
			$ano_actual=$arraydate[0];
			$dia=$arraydate[2];
			
			if($valor_para_divida=='0'){
				$efetuar_pagamento=$db->query("insert into pagamento (ordem_pagamento,id_cliente,chave_alarme,mes_referencia,
												  ano_referencia,dia_pagamento,montante_pago,observacoes,nome_user) values('$ordem_pagamento',
												  '$id_cliente','$chave_alarme','$mes_referencia','$ano_referencia',
												  '$dia_pagamento','$montante_pago','$observacoes','$nome_user');");

				$registo_dividas_parcela=$db->query("insert into dividas (id_cliente,chave_alarme,mes_referencia,
										ano_referencia,montante,data_registo,estado,observacoes,nome_user) values('$id_cliente',
										'$chave_alarme','$mes_actual','$ano_actual','$montante_pago',
										'$date','liquidado','parcela de registo','$nome_user');");
				echo json_encode(["sucesso"=>"sucesso"]);

			}else{
				$efetuar_pagamento=$db->query("insert into pagamento (ordem_pagamento,id_cliente,chave_alarme,mes_referencia,
											   ano_referencia,dia_pagamento,montante_pago,observacoes,nome_user) values('$ordem_pagamento',
											   '$id_cliente','$chave_alarme','$mes_referencia','$ano_referencia',
											   '$dia_pagamento','$montante_pago','$observacoes','$nome_user');");

				
				$registo_dividas_parcela=$db->query("insert into dividas (id_cliente,chave_alarme,mes_referencia,
										ano_referencia,montante,data_registo,estado,observacoes,nome_user) values('$id_cliente',
										'$chave_alarme','$mes_actual','$ano_actual','$valor_para_divida',
										'$date','pendente','$observacoes','$nome_user');");

				echo json_encode(["sucesso"=>"sucesso"]);;
			}
		}

		public function verificarNumeroRecibo($numeroRecibo,$db){
			$verificar = $db->query("SELECT * FROM PAGAMENTO where `ordem_pagamento`='$numeroRecibo';");
			$count = count($verificar);
			echo json_encode(["valor"=>$count]);
		}*/
		
	}

?>