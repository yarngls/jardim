var funcoes = angular.module("funcoesServices",[]);

	funcoes.factory("funcoesApp",function () {
		
		var getContatos = function(c,d,operadora){

			if(operadora=='+'){
				return c+d;
				
			}else{
				return c*d;
			}
			
		}

		var _calculateCriancaAge = function (dataNascimento){
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

		var _formatarCrianca = function(crianca){

			
			var editCrianca = crianca;
			editCrianca.dataNascimento = new Date(crianca.dataNascimento);
			editCrianca.idade = parseInt(crianca.idade);
			editCrianca.propina = parseInt(crianca.propina);
			editCrianca.almoco = parseInt(crianca.almoco);
			editCrianca.dataInicioJardim = new Date(crianca.dataInicioJardim);
			editCrianca.idade=_calculateCriancaAge(editCrianca.dataNascimento);
			
			if(editCrianca.linguaFrancesa==1){
				editCrianca.linguaFrancesa=true;
			}else{
				editCrianca.linguaFrancesa=false;
			}

			if(editCrianca.linguaInglesa==1){
				editCrianca.linguaInglesa=true;
			}else{
				editCrianca.linguaInglesa=false;
			}

			if(editCrianca.periodoManha==1){
				editCrianca.periodoManha=true;
			}else{
				editCrianca.periodoManha=false;
			}

			if(editCrianca.periodoTarde==1){
				editCrianca.periodoTarde=true;
			}else{
				editCrianca.periodoTarde=false;
			}

			if(editCrianca.diaInteiro==1){
				editCrianca.diaInteiro=true;
			}else{
				editCrianca.diaInteiro=false;
			}

			return editCrianca;
			
		}



		return{

			calculateCriancaAge : 	_calculateCriancaAge,
			formatarCrianca	: 	_formatarCrianca,
			CgetContatos : getContatos

		};


	});