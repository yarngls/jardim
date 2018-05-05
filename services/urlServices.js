angular.module('urlService',[]).factory("ModelUrl",function() {

	

	_gethomeUrl				= 	'backend/Controller/homeController.php';
	_getCriancaUrl			= 	'backend/Controller/criancaController.php';
	_getfolha_presencaUrl	= 	'backend/Controller/folhaPresencaController.php';
	_gethorarioUrl			= 	'backend/Controller/horarioController.php';
	_getprimaveraUrl		= 	'backend/Controller/primaveraController.php';
	_getrelatorioUrl		= 	'backend/Controller/relatorioController.php';
	

	return {
		gethomeUrl 				: 	_gethomeUrl,
		getCriancaUrl 			: 	_getCriancaUrl,
		getfolha_presencaUrl 	: 	_getfolha_presencaUrl,
		gethorarioUrl 			: 	_gethorarioUrl,
		getprimaveraUrl 		: 	_getprimaveraUrl,
		getrelatorioUrl 		: 	_getrelatorioUrl
	}

});

