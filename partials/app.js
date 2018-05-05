var app  = angular.module('app',['ngRoute','urlService','funcoesServices','fullCalendar'])
	

	.config(['$routeProvider',function($routeProvider){

		$routeProvider.	
		when('/',{controller:'homeController',templateUrl:"partials/home/home.html"}).
		when('/criancas',{controller:'criancasController',templateUrl:"partials/criancas/criancas.html"}).
		when('/criancas-details',{controller:'criancas-detailsController',templateUrl:"partials/criancas/criancas-details.html"}).
		/*when('/primavera',{controller:'primaveraController',templateUrl:"partials/primavera/primavera.html"}).
		when('/horario',{controller:'horario_funcionarioController',templateUrl:"partials/horario/horario_funcionarios.html"}).*/
		otherwise({redirectTo:'/'});
		
	}]);