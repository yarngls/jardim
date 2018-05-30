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

		
		
		$scope.botaoRegistarCrianca = function(){
			delete $scope.crianca;
			$scope.popupTittle=" Registar Criança "; 	
			$scope.sizeCrianca = [];
			$("#form_crianca").trigger("reset");
			$("#form_pai").trigger("reset");
			$("#form_mae").trigger("reset");

		}

		$scope.localidades = localidades;
	

		$scope.criarCrianca = function(crianca){
		
			var picture = $("#imageUpload").val();
			$http({
				method:"POST",
				url:url,
				data:$scope.crianca,
			}).then(function(response){
				console.log("resposta" + response.data);
				$scope.getallCrianca();
				$("#form_crianca").trigger("reset");
				$("#modalRegistarCrianca").modal("hide");	
				window.location.href="#/criancas";	
			});
			
		}


		$scope.cancelarCrianca=function(){	
			$("#form_crianca").trigger("reset");
		}

		$scope.getallCrianca=function(){
			$http.get(url).success(function(data,status){
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

		$scope.editarCrianca = function(crianca){
			$http({
				method:"PUT",
				url:url,
				data:crianca,
			}).then(function(response){
				console.log(response.data);
				$scope.getallCrianca();
				$("#modalRegistarCrianca").modal("hide");
				window.location.href="#/criancas";
			});
		}

		$scope.eliminarCrianca = function(idCrianca){

			$scope.confirmar = function(){				
				var condicao = 'eliminar';
				console.log(idCrianca);
				$http({
					method:"PUT",
					url:url,
					data:{condicao,idCrianca},
				}).then(function(response){
					console.log(response.data);
					$scope.getallCrianca();
					$("#myModalEliminar").modal("hide");
					window.location.href="#/criancas";
				});
			}

		}

	});
