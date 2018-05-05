<?php
	error_reporting(E_ALL);
	
	function connection(){
		
		$hostname 	=	'localhost';
		$username	=	'root';
		$password	=	'b3nl1t3ch18';
		$dbname   	=	'encanto';

		$connection = mysqli_connect($hostname,$username,$password,$dbname) or die(mysql_error("erro de conexao"));
	
		return $connection;

	}

	header("Content-Type: application/json; charset=utf-8");
	

	function convertIndeceforMonth($indece){

		$arrayindece=array(
						"01"	=>	"Janeiro",
						"02"	=>	"Fevereiro",
						"03"	=>	"Março",
						"04"	=>	"Abril",
						"05"	=>	"Maio",
						"06"	=>	"Junho",
						"07"	=>	"Julho",
						"08"	=>	"Agosto",
						"09"	=>	"Setembro",
						"10"	=>	"Outubro",
						"11"	=>	"Novembro",
						"12"	=>	"Dezembro"

					);


		foreach ($arrayindece as $key => $value) {
			
			if($indece==$key){
				return $value;
			}			
			
		}
		return false;
	}

	function convertMonthforIndece($month){

		$arraymonth=array(
						"01"	=>	"Janeiro",
						"02"	=>	"Fevereiro",
						"03"	=>	"Março",
						"04"	=>	"Abril",
						"05"	=>	"Maio",
						"06"	=>	"Junho",
						"07"	=>	"Julho",
						"08"	=>	"Agosto",
						"09"	=>	"Setembro",
						"10"	=>	"Outubro",
						"11"	=>	"Novembro",
						"12"	=>	"Dezembro"

					);


		foreach ($arraymonth as $key => $value) {
			
			if($month==$value){
				return $key;
			}			
			
		}
		return false;
	}


	function convertDate($date){

		$dateExplode=explode("-", $date);

		$month=convertIndeceforMonth($dateExplode[1]);

		$dateImplode = $dateExplode[2]." ".$month." ".$dateExplode[0];
		return $dateImplode;
	}

	function returnDiaSemanaw(){
		$array_semana = array(
								"1"	=>	"Domingo",
								"2"	=>	"Segunda-Feira",
								"3"	=>	"Terça-Feira",
								"4"	=>	"Quarta-Feira",
								"5"	=>	"Quinta-Feira",
								"6"	=>	"Sexta-Feira",
								"7"	=>	"Sabado"
						);

		foreach ($array_semana as $key => $value) {
			if(date('w')==$key){
				return $value;
			}
			
		}
		
	}

	function returnDia(){
		$array_semana = array(
								"0"	=>	"domingo",
								"1"	=>	"segunda",
								"2"	=>	"terca",
								"3"	=>	"quarta",
								"4"	=>	"quinta",
								"5"	=>	"sexta",
								"6"	=>	"sabado"
						);

		foreach ($array_semana as $key => $value) {
			if(date('w')==$key){
				return $value;
			}
			
		}
		
	}
	
	function diasemana($data){

		$ano =  substr("$data", 0, 4);
		$mes =  substr("$data", 5, -3);
		$dia =  substr("$data", 8, 9);

		$diasemana = date("w", mktime(0,0,0,$mes,$dia,$ano) );

		switch($diasemana) {
			case"0": $diasemana = "Domingo";       break;
			case"1": $diasemana = "Segunda-Feira"; break;
			case"2": $diasemana = "Terça-Feira";   break;
			case"3": $diasemana = "Quarta-Feira";  break;
			case"4": $diasemana = "Quinta-Feira";  break;
			case"5": $diasemana = "Sexta-Feira";   break;
			case"6": $diasemana = "Sabado";        break;
		}

		return $diasemana;
	}

		function converHour($hour){

			$array_hous=array(
							"00"=>"24",
							"01"=>"25",
							"02"=>"26",
							"03"=>"27",
							"04"=>"28",
							"05"=>"29",
							"06"=>"30",
							"07"=>"31",
							"08"=>"32",
							"09"=>"33",							
							"10"=>"34",
							"11"=>"35",
							"12"=>"36"
							);
			foreach ($array_hous as $key => $value) {
				if($hour==$key){
					return $value;
				}
			}
		}

	

		function convertediasDB($dia){
			$array_semana = array(
									"domingo"	=>	"Domingo",
									"segunda"	=>	"Segunda-Feira",
									"terca"		=>	"Terça-Feira",
									"quarta"	=>	"Quarta-Feira",
									"quinta"	=>	"Quinta-Feira",
									"sexta"		=>	"Sexta-Feira",
									"sabado"	=>	"Sabado"
							);

			foreach ($array_semana as $key => $value) {
				if($dia==$value){
					return $key;
				}
				
			}
			
		}

	function create_array_date($id,$month_current,$year_current){
		$total_dia_mes=compareMonthCurrent_for_MonthSearch($month_current,$year_current); 	
		$array_date=[];
		for($i=1;$i<=$total_dia_mes;$i++){
			
			if($i<=9){
				$i='0'.$i;
			}

			$data=$year_current.'-'.$month_current.'-'.$i;
			$array_date[]=$data;
		}
		return $array_date;
	}


?>	