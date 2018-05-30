angular.module("app")
	.controller("criancas-detailsController",function($scope,$http,$routeParams,ModelUrl,funcoesApp){
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

		$scope.localidades = localidades;

		 $(document).ready(function(){

            $('#loading-example-btn').click(function () {
                btn = $(this);
                simpleLoad(btn, true)

                // Ajax example
//                $.ajax().always(function () {
//                    simpleLoad($(this), false)
//                });

                simpleLoad(btn, false)
            });
        });

        function simpleLoad(btn,state) {
            if (state) {
                btn.children().addClass('fa-spin');
                btn.contents().last().replaceWith(" Loading");
            } else {
                setTimeout(function () {
                    btn.children().removeClass('fa-spin');
                    btn.contents().last().replaceWith(" Refresh");
                }, 2000);
            }
        }

        
        $scope.Table = 'paisEncarregadosEducacao';
     	 $scope.paisEncarregadosEducacao = function(){
        	$scope.Table = 'paisEncarregadosEducacao';
        }

       	$scope.dadosEstatisticos = function(){
        	$scope.Table = 'dadosEstatisticos';
        }

	
		$scope.getCrianca = function(){
			$http.get(url+'?id='+$routeParams.idCrianca).success(function(data,status,headers,config){				
				//console.log(data);
				$scope.criancaFormatar = data[0];
				console.log($scope.criancaFormatar);
				$scope.crianca=funcoesApp.formatarCrianca($scope.criancaFormatar);
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


		$scope.criarEstatisticas = function(crianca){
			var condicao = 'estatisticas';
			$http({
				method:"PUT",
				url:url,
				data:{crianca,condicao}
			}).success(function(response){
				console.log(response);
			}).error(function(response){
				console.log(response);
			});
		}



	});