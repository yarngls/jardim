angular.module("app")
	.controller("criancasController",function($scope,$http,ModelUrl,funcoesApp){

		$('#loading-example-btn').click(function () {
                
            btn = $(this);
            simpleLoad(btn, true)
            simpleLoad(btn, false)
        });

				
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
		
      
  
		function simpleLoad(btn, state) {
            if (state) {
                btn.children().addClass('fa-spin');
                btn.contents().last().replaceWith(" actualizando");
            } else {
                setTimeout(function () {
                    btn.children().removeClass('fa-spin');
                    btn.contents().last().replaceWith(" Actualizar");
                }, 2000);
            }
        }

        $scope.popupTittle=" ";

		$scope.tittle = "Crianças Jardim Encanto";
		$scope.tittle_modal="Registar Criança";

		var url = ModelUrl.getCriancaUrl;

		console.log(url);

		$scope.tipoPagamento = function(fatura){
			if(fatura.tipo_pagamento!=undefined && fatura.mes_referencia!=undefined && fatura.ano_referencia!=undefined){
				var idCrianca_pagamento=$scope.CurrentIdCrianca;
				completeMontante(fatura.tipo_pagamento,fatura.mes_referencia,fatura.ano_referencia,idCrianca_pagamento);
			}
		}

		$scope.mesPagamento = function(fatura){
			if(fatura.tipo_pagamento!=undefined && fatura.mes_referencia!=undefined && fatura.ano_referencia!=undefined){
				var idCrianca_pagamento=$scope.CurrentIdCrianca;
				completeMontante(fatura.tipo_pagamento,fatura.mes_referencia,fatura.ano_referencia,idCrianca_pagamento);
			}
		};

		$scope.anoPagamento = function(fatura){
			if(fatura.tipo_pagamento!=undefined && fatura.mes_referencia!=undefined && fatura.ano_referencia!=undefined){
				var idCrianca_pagamento=$scope.CurrentIdCrianca;
				completeMontante(fatura.tipo_pagamento,fatura.mes_referencia,fatura.ano_referencia,idCrianca_pagamento);
			}
		};

		$scope.valor;
		$scope.valorRealPagar=0;
		function completeMontante(tipo_pagamento,mes_referencia,ano_referencia,idCrianca_pagamento){			
			var condicao = "montanteApagar";
			$http({
				method:"PUT",
				url:url,
				data:{condicao,tipo_pagamento,mes_referencia,ano_referencia,idCrianca_pagamento},
			}).then(function(response){
				console.log(response.data);
				$scope.valor=response.data;
				$scope.fatura.montante_pago=parseInt($scope.valor);
			});
		}
		
		$scope.botaoRegistarCrianca = function(){
			delete $scope.crianca;
			$scope.popupTittle=" Registar Criança "; 	
			$scope.sizeCrianca = [];
			$("#form_crianca").trigger("reset");
			$("#form_pai").trigger("reset");
			$("#form_mae").trigger("reset");

		}

		$scope.localidades = localidades;
	
		//$scope.crianca.linguaInglesa=parseInt(0);

		$scope.criarCrianca = function(crianca){
			if(crianca.propina==undefined){
				crianca.propina=parseInt(0);
			}

			if(crianca.linguaInglesa==undefined){
				crianca.linguaInglesa=parseInt(0);
			}

			if(crianca.linguaFrancesa==undefined){
				crianca.linguaFrancesa=parseInt(0);
			}

			if(crianca.almoco==undefined){
				crianca.almoco=parseInt(0);
			}
		
			var picture = $("#imageUpload").val();
			$http({
				method:"POST",
				url:url,
				data:$scope.crianca,
			}).then(function(response){
				//console.log("resposta" + response.data);
				$scope.getallCrianca();
				//$("#form_crianca").trigger("reset");
				$("#modalRegistarCrianca").modal("hide");
				$.confirm({
					title: false,
				    content: 'Criança Registado com sucesso! <br> ',
				    buttons: {
				        OK: {
				            btnClass: 'btn-green',
				            action: function(){

				            	window.location.href="#/criancas";	
				            }
				        },				       
				    }
				});
				
			});
			
		}

		$scope.meses=["Janeiro","Fevereiro","Março","Abril","Maio","Junho","Julho","Agosto","Setembro","Outubro","Novembro","Dezembro"];
		$scope.tipoPagamentos=["propina","almoco","linguaInglesa","linguaFrancesa"];
		$scope.anos=["2017","2018","2019","2020","2021"];
		$scope.itens = [];
		$scope.subtotal=0;
		$scope.total=0;

		$scope.adicionarValor = function(fatura){
			var dataFatura = $scope.fatura;
			var idCrianca=$scope.criancaPagar.idCrianca;							
			var condicao = 'verificarDividas';			
			if(fatura.montante_pago>$scope.valor){
				alert("O montante inserido é maior que o " + $scope.valor +"$00 que é o valor correto.");
			}else{
				 
				fatura.valorDivida=$scope.valor-fatura.montante_pago;
				console.log(fatura);
				if(fatura!=undefined){				
					$scope.itens.push(fatura);
					$scope.subtotal=$scope.subtotal+$scope.fatura.montante_pago;
					$scope.total=$scope.total+$scope.fatura.montante_pago;
					delete $scope.fatura;
				}				
			}
		
		}

		$scope.removerItem = function(index){
			$scope.subtotal=$scope.subtotal-parseInt($scope.itens[index].montante_pago);
			//console.log($scope.subtotal);
			$scope.total=$scope.total-parseInt($scope.itens[index].montante_pago);
			$scope.itens[index].montante_pago=parseInt(0);
			console.log(index + "-> " + $scope.itens[index].montante_pago);
		}

		$scope.cancelarCrianca=function(){	
			$("#form_crianca").trigger("reset");
		}

		$scope.getallCrianca=function(){
			$http.get(url).success(function(data,status){
				console.log(data);
				$scope.criancas=data;
			}).error(function(response){
				console.log("error" + response);
			});

		}
		$scope.getallCrianca();

		$scope.ver = function(crianca){
			console.log(crianca["nome"]);
		};

		

		$("#criancadataNascimento").on("change",function(){
			$scope.crianca.idade=funcoesApp.calculateCriancaAge($scope.crianca.dataNascimento);
			console.log(" " + $scope.crianca.idade);


		});

		$scope.editar = function(criancaReceived){
			$scope.popupTittle=" Editar Criança ";
			var criancaFomated = funcoesApp.formatarCrianca(criancaReceived);

			$scope.crianca=criancaFomated;
			$scope.sizeCrianca = [];
			$scope.sizeCrianca.push($scope.crianca);

			console.log("Size " + $scope.sizeCrianca);
		}

		

		$scope.eliminarCrianca = function(idCrianca){
			$.confirm({
				title: 'Desejas eliminar a crinça!',
			    content: '',
			    buttons: {
			        specialKey: {
			        	btnClass: 'btn-success',
			            text: 'NÃO',
			            action: function(){
			               
			            }
			        },
			        alphabet: {
			        	btnClass: 'btn-red',
			            text: 'SIM',			            
			            action: function(){
			            	var condicao = 'eliminar';
			            	$http({
								method:"PUT",
								url:url,
								data:{condicao,idCrianca},
							}).then(function(response){
								console.log(response.data);							
				                $.alert("Eliminado com sucesso");
				                $scope.getallCrianca();
							});
			            }
			        }
			    }
			});
		}

		$scope.CurrentIdCrianca;
		$scope.pagamento = function(crianca){

			var condicao = 'consultarDividas';
			var idCrianca=crianca.idCrianca;
			$scope.CurrentIdCrianca=crianca.idCrianca;
			$http({
				method:"PUT",
				url:url,
				data:{condicao,idCrianca},
			}).then(function(response){
				if(response.data.total>0){
					$("#modalPagamento").modal("hide")		
					$.alert({
					    title: 'Alerta de divida!',
					    type: 'red',
					    btnClass: 'btn-red',
					    content: "A Criança " + crianca.nome + " têm dividas por liquidar!",
					    buttons: {
					        tryAgain: {
					            text: 'sair',
					            btnClass: 'btn-red',
					            action: function(){
					            }
					     	},
					    }
					});
					/*alert("A Criança " + crianca.nome + " têm dividas por liquidar");*/
				}
				/*$scope.getallCrianca();
				window.location.href="#/criancas";*/
			});


			$scope.criancaPagar = crianca;
			$scope.nomeCriancaFatura=crianca.nome;
			$scope.moradaCriancaFatura=crianca.morada;
			$scope.nomePaiFatura=crianca.nomePai;
			$scope.nomeMaeFatura=crianca.nomeMae;
			$scope.telefoneMai=crianca.telefoneMai;
			$scope.telefoneMai=crianca.telefoneMai;
			$scope.dataFatura = new Date();

			$scope.itens=[];
			$scope.subtotal=0;
			$scope.total=0;

			
		}

		$scope.efetuarPagamento = function (){
			
			var idCrianca= $scope.criancaPagar.idCrianca;
			var condicao = 'pagamento';
			var fatura=$scope.itens;
			console.log(fatura);
			$http({
				method:"PUT",
				url:url,
				data:{condicao,idCrianca,fatura}
			}).then(function(response){
				console.log(response.data);
				/*$scope.getallCrianca();
				$("#myModalEliminar").modal("hide");
				window.location.href="#/criancas";*/
			});		
		}

			
	});
