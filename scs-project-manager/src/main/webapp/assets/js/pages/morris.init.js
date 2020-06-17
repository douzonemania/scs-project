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
            { period: 'a', a: 'a2'},
            { period: 'b', a: 'b2'},
            { period: 'c', a: 'c2'},
            { period: 'd', a: 'd2'},
            { period: 'e', a: 'e2'},
            { period: 'f', a: 'f2'},
            { period: 'g', a: 'g2'}
          ];
        this.createLineChart('morris-line-example', $data, 'period', ['a'], ["ㅇㅇ"],['0.1'],['#ffffff'],['#999999'], ['#f672a7']);

    },
    //init
    $.MorrisCharts = new MorrisCharts, $.MorrisCharts.Constructor = MorrisCharts
}(window.jQuery),

//initializing 
function($) {
    "use strict";
    $.MorrisCharts.init();
}(window.jQuery);