angular.module("app")
	.controller("criancasController",function($scope,$http,ModelUrl){

		$('#loading-example-btn').click(function () {
                
            btn = $(this);
            simpleLoad(btn, true)

            // Ajax example
//                $.ajax().always(function () {
//                    simpleLoad($(this), false)
//                });

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
		

        Dropzone.options.myAwesomeDropzone = {
            autoProcessQueue: false,
            uploadMultiple: true,
            parallelUploads: 100,
            maxFiles: 100,

            // Dropzone settings
            init: function() {
                var myDropzone = this;

                this.element.querySelector("button[type=submit]").addEventListener("click", function(e) {
                    e.preventDefault();
                    e.stopPropagation();
                    myDropzone.processQueue();
                });
                this.on("sendingmultiple", function() {
                });
                this.on("successmultiple", function(files, response) {
                });
                this.on("errormultiple", function(files, response) {
                });
            }

        }
  
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

		
		$scope.botaoRegistarCrianca = function(){
			$scope.popupTittle=" Registar Criança "; 	
			$scope.sizeCrianca = [];
			$("#form_crianca").trigger("reset");
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

		$scope.ver = function(crianca){
			console.log(crianca["nome"]);
		};

		function calculateCriancaAge(dataNascimento){
			var anoNacimento = parseInt(dataNascimento.getFullYear());
			var correntDate = new Date();
			//var correntDay = parseInt(correntDate.getFullDay())
			var correnteYear = parseInt(correntDate.getFullYear());
			var mesDataNascimento = parseInt((dataNascimento.getMonth()+1)); //getMonth - Obtém o número do mês. Retornando um valor entre 0 e 11. ( janeiro=0)
			var correnteMonth = parseInt(correntDate.getMonth()+1);
			if(correnteMonth<mesDataNascimento){
				var ageCrianca = correnteYear-anoNacimento;
				return ageCrianca-1;
			}else{
				var ageCrianca = correnteYear-anoNacimento;
				return ageCrianca;
			}
			
		}

		$("#criancadataNascimento").on("change",function(){
			$scope.crianca.idade=calculateCriancaAge($scope.crianca.dataNascimento);

		});

		$scope.editar = function(crianca){
			$scope.popupTittle=" Editar Criança ";
			var editCrianca = crianca;
			editCrianca.dataNascimento = new Date(crianca.dataNascimento);
			editCrianca.idade = parseInt(crianca.idade);
			editCrianca.propina = parseInt(crianca.propina);
			editCrianca.dataInicioJardim = new Date(crianca.dataInicioJardim);
			editCrianca.idade=calculateCriancaAge(editCrianca.dataNascimento);
			$scope.crianca=editCrianca;
			$scope.sizeCrianca = [];
			$scope.sizeCrianca.push(crianca);
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

		$scope.eliminarCrianca = function(){
			console.log("eliminar");

		}

	});