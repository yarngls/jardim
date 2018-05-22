angular.module("app")
	.controller("criancas-detailsController",function($scope,$http,$routeParams,ModelUrl){
		//$scope.tittle="Informações Geral da Criança";
		console.log("Meu id " + $routeParams.idCrianca);

		var url = ModelUrl.crianca_detailsUrl;
		console.log(url);



		$("#profileImage").click(function(e) {
		    $("#imageUpload").click();
		});

		function fasterPreview( uploader ) {
		    if ( uploader.files && uploader.files[0] ){
		          $('#profileImage').attr('src', 
		             window.URL.createObjectURL(uploader.files[0]) );
		    }
		}

		$("#imageUpload").change(function(){
		    fasterPreview( this );
		});

		
		$scope.getCrianca = function(){
			$http.get(url+'?id='+$routeParams.idCrianca).success(function(data,status,headers,config){				
				//console.log(data);
				$scope.crianca = data[0];
				console.log($scope.crianca);
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
		}

		$scope.getCrianca();
	});