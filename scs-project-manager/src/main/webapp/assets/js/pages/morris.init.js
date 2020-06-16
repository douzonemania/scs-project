/*
Template Name: Ubold - Responsive Bootstrap 4 Admin Dashboard
Author: CoderThemes
Version: 3.0.0
Website: https://coderthemes.com/
Contact: support@coderthemes.com
File: Morris charts init js
*/

!function($) {
    "use strict";

    var MorrisCharts = function() {};


    //creates line chart
    MorrisCharts.prototype.createLineChart = function(element, data, xkey, ykeys, labels, opacity, Pfillcolor, Pstockcolor, lineColors) {
        Morris.Line({
          element: element,
          data: data,
          xkey: xkey,
          ykeys: ykeys,
          labels: labels,
          fillOpacity: opacity,
          pointFillColors: Pfillcolor,
          pointStrokeColors: Pstockcolor,
          behaveLikeLine: true,
          gridLineColor: '#eef0f2',
          hideHover: 'auto',
          lineWidth: '3px',
          pointSize: 0,
          preUnits: '',
          resize: true, //defaulted to true
          lineColors: lineColors
        });
    },

    MorrisCharts.prototype.init = function() {


        //create line chart
        var $data  = [
            { period: '2020-06-17', a: 10},
            { period: '2020-06-18', a: 30},
            { period: '2020-06-19', a: 50},
            { period: '2020-06-20', a: 50},
            { period: '2020-06-21', a: 30},
            { period: '2020-06-22', a: 50},
            { period: '2020-06-23', a: 80}
          ];
        this.createLineChart('morris-line-example', $data, 'period', ['a'], ["이름이 무엇일까?"],['0.1'],['#ffffff'],['#999999'], ['#f672a7']);

    },
    //init
    $.MorrisCharts = new MorrisCharts, $.MorrisCharts.Constructor = MorrisCharts
}(window.jQuery),

//initializing 
function($) {
    "use strict";
    $.MorrisCharts.init();
}(window.jQuery);