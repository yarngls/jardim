<?php

	//require "../config/db_config.php";
	require "../function_RH.php";
	$db=connection();

	$want = $_SERVER["REQUEST_METHOD"];

	switch ($want) {
		
		case 'GET':

			if(isset($_GET["type_events"])=="minutos"){
			$id=$_GET["id"];
			$type_events=$_GET["type_events"];
			$month_current=$_GET["month_current"];
			$year_current=$_GET["year_current"];
				
				/*$search_codigo_funcionario=$db->query("SELECT codigo_funcionario,nome_funcionario from funcionarios where id_funcionario=$id;");
				$codigo_funcionario = mysqli_fetch_assoc($search_codigo_funcionario);
				$codigo=$codigo_funcionario["codigo_funcionario"];
				$nome=$codigo_funcionario["nome_funcionario"];


				$search_events_employee=$db->query("SELECT tipo_evento,data_evento,hora_evento from piquagem_ponto where codigo_funcionario=$codigo and tipo_evento like '%15 MIN%' and month(data_evento)='09' and year(data_evento)='2017' order by day(data_evento);");
				
				$array_events_employye=[];

				while($events = mysqli_fetch_assoc($search_events_employee)){
					$array_events_employye[]=$events;
				}*/
				$array_minutos_Funcionarios=calcular_15_minutos($id,$month_current,$year_current);
				$array_date=create_array_date($id,$month_current,$year_current);
				$array_saida_servico=calcular_saida_servico($id,$month_current,$year_current);
				echo json_encode(["array_minutos_Funcionarios"=>$array_minutos_Funcionarios,"array_date"=>$array_date,"array_saida_servico"=>$array_saida_servico]);
				

			}else{
				$ano = Date("Y");
				$mes = Date("m");
				$dia = Date("d");
				$data=["mes"=>$mes,"ano"=>$ano,"dia"=>$dia];
				echo json_encode($data);
			}
		break;

		case 'PUT':
			echo json_encode("not a found");
		break;

		default:
			echo json_decode(["erro"=>"404"]);	
		break;
	}

?>