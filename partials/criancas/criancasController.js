angular.module("app")
	.controller("criancasController",function($scope,$http,ModelUrl){

		$scope.tittle = "Crianças Jardim Encanto";
		$scope.tittle_modal="Registar Criança";

		var url = ModelUrl.getCriancaUrl;

		console.log(url);

		/*$scope.getFuncionario = function(){
			$http.get(url+'?id='+$routeParams.id).success(function(data,status,headers,config){
				$scope.funcionario=data;		
				$scope.estado='perfil';
				console.log(data);
			}).error(function(data,status,headers,config){
				switch(status){
					case '404':
						console.log('pag not a found');
					break;
					default:
						console.log(status);
					break;
				}
			});
		}*/

		//$scope.getFuncionario();

		$scope.ola = function(){
			console.log("ola");
		}
		

		$scope.criarCrianca = function(crianca){
			//console.log(crianca);
			$http({
				method:"POST",
				url:url,
				data:$scope.crianca,
			}).then(function(response){
				$scope.getallCrianca();
				/*var datas = response.data;	
				console.log("sexo " + datas.sexo);	*/
				$("#form_crianca").trigger("reset");
				$("#modalRegistarCrianca").modal("hide");		
			});

		}

		$scope.cancelarCrianca=function(){	
			$("#form_crianca").trigger("reset");
		}

		$scope.getallCrianca=function(){
			$http.get(url).success(function(data,status){
				$scope.criancas=data;
				console.log(data);
			}).error(function(response){
				console.log(response);
			});
		}


		$scope.getallCrianca();

	});