angular.module("app")
	.controller("criancas-detailsController",function($scope,$http,$routeParams,ModelUrl,funcoesApp){
		//$scope.tittle="Informações Geral da Criança";
		//console.log("Meu id " + $routeParams.idCrianca);

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
				$scope.totalPagamentos=data["totalPagamentos"];
				$scope.totalDividas=data["totalDividas"];
				$scope.criancaFormatar = data["dadosCriancao"][0];
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
				$.confirm({
					title: false,
				    content: 'Registado com sucesso! <br> ',
				    buttons: {
				        OK: {
				            btnClass: 'btn-green',
				            action: function(){
				            		
				            }
				        },				       
				    }
				});
			}).error(function(response){
				console.log(response);
			});
		}


		$scope.editarCrianca = function(crianca){
			console.log(crianca);
			var condicao = 'atualizarCrianca';
			$http({
				method:"PUT",
				url:url,
				data:{crianca,condicao},
			}).then(function(response){
				console.log(response.data);
				$.confirm({
					title: false,
				    content: 'Criança atualizado com sucesso! <br> ',
				    buttons: {
				        OK: {
				            btnClass: 'btn-green',
				            action: function(){	

				            }
				        },				       
				    }
				});
				/*$scope.getallCrianca();
				$("#modalRegistarCrianca").modal("hide");
				window.location.href="#/criancas";*/
			});
		}

		$scope.alertConfirm = function(){
			$.alert({
					    title: 'Alert!',
					    content: 'Simple alert!',
					});
		}


		$scope.listarPagamentos = function(){
			var criancas = $scope.crianca;
			var condicao = 'listarTodosPagamentos';
			var idCrianca = $routeParams.idCrianca;
			$http({
				method:"PUT",
				url:url,
				data:{criancas,idCrianca,condicao},
			}).then(function(response){
				$scope.pagamentos = response.data;
				//console.log(response);
			});

		}


		$scope.listarDividas = function(){
			$scope.dividasporPagar=[];
			$scope.subtotal=0;
			$scope.total=0;
			var criancas = $scope.crianca;
			var condicao = 'listarTodasDividas';
			var idCrianca = $routeParams.idCrianca;
			$http({
				method:"PUT",
				url:url,
				data:{criancas,idCrianca,condicao},
			}).then(function(response){
				$scope.dividas = response.data;
				//console.log(response);
			});

		}

		$scope.dividasporPagar=[];
		$scope.subtotal=0;
		$scope.total=0;
		$scope.adicionarDivida = function(index){
			if($scope.dividasporPagar.length==0){
				$scope.dividasporPagar.push($scope.dividas[index]);
				$scope.subtotal=parseInt($scope.subtotal)+parseInt($scope.dividas[index].montante);
				$scope.total=parseInt($scope.total)+parseInt($scope.dividas[index].montante);
				console.log($scope.dividasporPagar);
			}else{				
				for(i=0;i<$scope.dividasporPagar.length;i++){
					if($scope.dividasporPagar[i] == $scope.dividas[index]){
						$scope.dividasporPagar[i];
						console.log("igual " + 	index);
						return;
					}
				}
				$scope.dividasporPagar.push($scope.dividas[index]);
				$scope.subtotal=parseInt($scope.subtotal)+parseInt($scope.dividas[index].montante);
				$scope.total=parseInt($scope.total)+parseInt($scope.dividas[index].montante);
				console.log("diferente " + 	index);			
			}
		}

		$scope.removerDivida = function(index){
			var valorAntes=$scope.dividasporPagar[index].montante;
			$scope.dividasporPagar[index].montante=0;
			$scope.dividas[index].montante=valorAntes;
			//valorAntes=0;
		}

		$scope.liquidarDivida = function(){

			var fatura = $scope.dividasporPagar;
			var criancas = $scope.crianca;
			var condicao = 'liquidaDividas';
			var idCrianca = $routeParams.idCrianca;
			$http({
				method:"PUT",
				url:url,
				data:{criancas,idCrianca,condicao,fatura},
			}).then(function(response){
				console.log(response.data);
				$.confirm({
					title: false,
				    content: 'Divida liquidada com sucesso! <br> ',
				    buttons: {
				        OK: {
				            btnClass: 'btn-green',
				            action: function(){
				            }
				        },				       
				    }
				});
				$("#modalTodasDividas").modal("hide");
				window.location.href="#/criancas-details/"+idCrianca;
			});
		}

	});