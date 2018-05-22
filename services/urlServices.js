angular.module('urlService',[]).factory("ModelUrl",function() {

	

	_gethomeUrl				= 	'backend/Controller/homeController.php';
	_getCriancaUrl			= 	'backend/Controller/criancaController.php';
	_crianca_detailsUrl		= 	'backend/Controller/crianca_detailsController.php';
	_gethorarioUrl			= 	'backend/Controller/horarioController.php';
	_getprimaveraUrl		= 	'backend/Controller/primaveraController.php';
	_getrelatorioUrl		= 	'backend/Controller/relatorioController.php';
	

	return {
		gethomeUrl 				: 	_gethomeUrl,
		getCriancaUrl 			: 	_getCriancaUrl,
		crianca_detailsUrl 		: 	_crianca_detailsUrl,
		gethorarioUrl 			: 	_gethorarioUrl,
		getprimaveraUrl 		: 	_getprimaveraUrl,
		getrelatorioUrl 		: 	_getrelatorioUrl
	}

});

