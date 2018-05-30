angular.module("app")
	.controller("homeController",function($http,$scope){

		console.log("link used fro create chart - https://www.fusioncharts.com/charts/pie-doughnut-charts/");
		$scope.nome		=	"Gilson";
		$scope.apelido	=	"Santos"; 
		$scope.morada	=	"Calheta do Maio";

		FusionCharts.ready(function(){
			var revenueChart = new FusionCharts({
		        "type": "stackedcolumn2d",
		        "renderAt": "chartContainer",
		        "width": "500",
		        "height": "300",
		        "dataFormat": "json",
		        "dataSource": {
					"chart": {
					    "caption": "Revenue split by product category",
					    "subCaption": "For current year",
					    "xAxisname": "Quarter",
					    "yAxisName": "Revenues (In USD)",
					    "showSum": "1",
					    "numberPrefix": "$",
					    "theme": "fint"
					},
				    "categories": [
				        {
				            "category": [
				                {
				                    "label": "Q1"
				                },
				                {
				                    "label": "Q2"
				                },
				                {
				                    "label": "Q3"
				                },
				                {
				                    "label": "Q4"
				                }
				            ]
				        }
				    ],
    				"dataset": [
				        {
				            "seriesname": "Food Products",
				            "data": [
				                {
				                    "value": "11000"
				                },
				                {
				                    "value": "15000"
				                },
				                {
				                    "value": "13500"
				                },
				                {
				                    "value": "15000"
				                }
				            ]
				        },
				        {
				            "seriesname": "Non-Food Products",
				            "data": [
				                {
				                    "value": "11400"
				                },
				                {
				                    "value": "14800"
				                },
				                {
				                    "value": "8300"
				                },
				                {
				                    "value": "11800"
				                }
				            ]
				        }
    				]
				}
			});
			revenueChart.render();
		})

		FusionCharts.ready(function(){
			var revenueChart2 = new FusionCharts({
		        "type": "stackedcolumn2d",
		        "renderAt": "chartContainer2",
		        "width": "500",
		        "height": "300",
		        "dataFormat": "json",
		        "dataSource": {
					"chart": {
					    "caption": "Revenue split by product category",
					    "subCaption": "For current year",
					    "xAxisname": "Quarter",
					    "yAxisName": "Revenues (In USD)",
					    "showSum": "1",
					    "numberPrefix": "$",
					    "theme": "fint"
					},
				    "categories": [
				        {
				            "category": [
				                {
				                    "label": "Q1"
				                },
				                {
				                    "label": "Q2"
				                },
				                {
				                    "label": "Q3"
				                },
				                {
				                    "label": "Q4"
				                }
				            ]
				        }
				    ],
    				"dataset": [
				        {
				            "seriesname": "Food Products",
				            "data": [
				                {
				                    "value": "11000"
				                },
				                {
				                    "value": "15000"
				                },
				                {
				                    "value": "13500"
				                },
				                {
				                    "value": "15000"
				                }
				            ]
				        },
				        {
				            "seriesname": "Non-Food Products",
				            "data": [
				                {
				                    "value": "11400"
				                },
				                {
				                    "value": "14800"
				                },
				                {
				                    "value": "8300"
				                },
				                {
				                    "value": "11800"
				                }
				            ]
				        }
    				]
				}
			});
			revenueChart2.render();
		})

		FusionCharts.ready(function(){
		    var fusioncharts = new FusionCharts({
			    type: 'pie2d',
			    renderAt: 'chart-container',
			    width: '450',
			    height: '300',
			    dataFormat: 'json',
			    dataSource: {
			        "chart": {
			            "caption": "Split of revenue by product categories",
			            "subCaption": "Last year",
			            "numberPrefix": "$",
			            "showPercentValues": "1",
			            "showPercentInTooltip": "0",
			            "decimals": "1",
			            "enableSmartLabels": "1",
			            "use3DLighting": "1",
			            "useDataPlotColorForLabels": "1",
			            //Theme
			            "theme": "fint"
			        },
			        "data": [{
			            "label": "Food",
			            "value": "285040"
			        }, {
			            "label": "Apparels",
			            "value": "146330"
			        }, {
			            "label": "Electronics",
			            "value": "105070"
			        }, {
			            "label": "Household",
			            "value": "49100"
			        }]
			    }
			}
		);
		    fusioncharts.render();
		});

		FusionCharts.ready(function() {
		    var revenueChart = new FusionCharts({
		        "type": "mscolumn2d",
		        "renderAt": "chartContainer3",
		        "width": "500",
		        "height": "300",
		        "dataFormat": "json",
		        "dataSource": {
		            "chart": {
		                "caption": "Monthly revenue for last year",
		                "subCaption": "Harry's SuperMart",
		                "xAxisName": "Month",
		                "yAxisName": "Revenues (In USD)",
		                "theme": "fint"
		            },
		            "chart": {
        "caption": "Comparison of Quarterly Revenue",
        "xAxisname": "Quarter",
        "yAxisName": "Revenues (In USD)",
        "numberPrefix": "$",
        "plotFillAlpha": "80",
        "paletteColors": "#0075c2,#1aaf5d",
        "baseFontColor": "#333333",
        "baseFont": "Helvetica Neue,Arial",
        "captionFontSize": "14",
        "subcaptionFontSize": "14",
        "subcaptionFontBold": "0",
        "showBorder": "0",
        "bgColor": "#ffffff",
        "showShadow": "0",
        "canvasBgColor": "#ffffff",
        "canvasBorderAlpha": "0",
        "divlineAlpha": "100",
        "divlineColor": "#999999",
        "divlineThickness": "1",
        "divLineIsDashed": "1",
        "divLineDashLen": "1",
        "divLineGapLen": "1",
        "usePlotGradientColor": "0",
        "showplotborder": "0",
        "valueFontColor": "#ffffff",
        "placeValuesInside": "1",
        "showHoverEffect": "1",
        "rotateValues": "1",
        "showXAxisLine": "1",
        "xAxisLineThickness": "1",
        "xAxisLineColor": "#999999",
        "showAlternateHGridColor": "0",
        "legendBgAlpha": "0",
        "legendBorderAlpha": "0",
        "legendShadow": "0",
        "legendItemFontSize": "10",
        "legendItemFontColor": "#666666"
    },
    "categories": [
        {
            "category": [
                {
                    "label": "Q1"
                },
                {
                    "label": "Q2"
                },
                {
                    "label": "Q3"
                },
                {
                    "label": "Q4"
                }
            ]
        }
    ],
    "dataset": [
        {
            "seriesname": "Previous Year",
            "data": [
                {
                    "value": "10000"
                },
                {
                    "value": "11500"
                },
                {
                    "value": "12500"
                },
                {
                    "value": "15000"
                }
            ]
        },
        {
            "seriesname": "Current Year",
            "data": [
                {
                    "value": "25400"
                },
                {
                    "value": "29800"
                },
                {
                    "value": "21800"
                },
                {
                    "value": "26800"
                }
            ]
        }
    ],
    
		        }
		    });

		    revenueChart.render();
		})



 FusionCharts.ready(function(){
    var fusioncharts = new FusionCharts({
    type: 'column2D',
    renderAt: 'chart-container6',
    width: '450',
    height: '300',
    dataFormat: 'json',
    dataSource: {
        "chart": {
             "caption": "Annual Sales Summary (2010-2013)",
        "subcaption": "Click on a column to drill-down",
        "numberprefix": "$",
        "showvalues": "0",
        "bgcolor": "FFFFFF",
        "xaxisname": "Year",
        "plotgradientcolor": "",
        "showalternatehgridcolor": "0",
        "showplotborder": "0",
        "divlinecolor": "CCCCCC",
        "canvasborderalpha": "0"
        },
        "data": [{
            "value": 230,
            "label": "Poor Quality",
            "color": "#1790E1",
            "stepSkipped": false,
            "appliedSmartLabel": true
        },
        {
            "value": 185,
            "label": "Incorrect Pricing",
            "color": "#1790E1",
            "stepSkipped": false,
            "appliedSmartLabel": true
        },
        {
            "value": 115,
            "label": "Confusing Layout",
            "color": "#1790E1",
            "stepSkipped": false,
            "appliedSmartLabel": true
        },
        {
            "value": 72,
            "label": "Parking Difficulties",
            "color": "#1790E1",
            "stepSkipped": false,
            "appliedSmartLabel": true
        },
        {
            "value": 83,
            "label": "Limited Size",
            "color": "#1790E1",
            "stepSkipped": false,
            "appliedSmartLabel": true
        },
        {
            "value": 64,
            "label": "Others",
            "color": "#1790E1",
            "stepSkipped": false,
            "appliedSmartLabel": true
        }]
    }
}
);
    fusioncharts.render();
    });


	 FusionCharts.ready(function(){
    var fusioncharts = new FusionCharts({
    type: 'doughnut2d',
    renderAt: 'chart-container9',
    width: '450',
    height: '300',
    dataFormat: 'json',
    dataSource: {
        "chart": {
        "caption": "Split of Revenue by Product Categories",
        "subcaption": "Los Angeles Topanga - Last month",
        "numberprefix": "$",
        "startingangle": "310",
        "decimals": "0",
        "defaultcenterlabel": "Total revenue: $60K",
        "centerlabel": "Revenue from $label: $value",
        "theme": "fint"
    },
    "data": [
        {
            "label": "Food",
            "value": "28504"
        },
        {
            "label": "Apparels",
            "value": "14633"
        },
        {
            "label": "Electronics",
            "value": "10507"
        },
        {
            "label": "Household",
            "value": "4910"
        }
    ]
    }
}
);
    fusioncharts.render();
    });





	});