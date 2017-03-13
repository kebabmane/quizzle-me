!function(e){"use strict";function t(e){return"[object Array]"===Object.prototype.toString.call(e)}function n(e){return e instanceof Function}function i(e){return!n(e)&&e instanceof Object}function r(e,n){var o;for(o in n)i(n[o])||t(n[o])?(i(n[o])&&!i(e[o])&&(e[o]={}),t(n[o])&&!t(e[o])&&(e[o]=[]),r(e[o],n[o])):void 0!==n[o]&&(e[o]=n[o])}function o(e,t){var n={};return r(n,e),r(n,t),n}function s(e){var t,n,i,r,o,s,a,l,c,u,h;return u=Object.prototype.toString.call(e),"[object Date]"===u?e:"[object String]"===u&&(i=e.match(R))?(h=parseInt(i[1],10),s=parseInt(i[3],10)-1,t=parseInt(i[5],10),n=parseInt(i[7],10),o=i[9]?parseInt(i[9],10):0,c=i[11]?parseInt(i[11],10):0,r=i[12]?1e3*parseFloat(O+i[12].slice(1)):0,l=Date.UTC(h,s,t,n,o,c,r),i[13]&&i[14]&&(a=60*i[15],i[17]&&(a+=parseInt(i[17],10)),a*="-"===i[14]?-1:1,l-=60*a*1e3),new Date(l)):void 0}function a(e){var t,n,i;for(t=0;t<e.length;t++)for(i=e[t].data,n=0;n<i.length;n++)if(i[n][1]<0)return!0;return!1}function l(e,t,n,i,r,s,l){return function(c,u,h){var d=o({},e);return d=o(d,h||{}),u.hideLegend&&t(d),"min"in u?n(d,u.min):a(c)||n(d,0),u.max&&i(d,u.max),"stacked"in u&&r(d,u.stacked),u.colors&&(d.colors=u.colors),u.xtitle&&s(d,u.xtitle),u.ytitle&&l(d,u.ytitle),d=o(d,u.library||{})}}function c(e,t){document.body.innerText?e.innerText=t:e.textContent=t}function u(e,t){c(e,"Error Loading Chart: "+t),e.style.color="#ff0000"}function h(t,n,i){var r=e.jQuery||e.Zepto||e.$;r.ajax({dataType:"json",url:n,success:i,error:function(e,n,i){var r="string"==typeof i?i:i.message;u(t,r)}})}function d(e,t){try{t(e)}catch(n){throw u(e.element,n.message),n}}function f(e,t){"string"==typeof e.dataSource?h(e.element,e.dataSource,function(n){e.data=n,d(e,t)}):(e.data=e.dataSource,d(e,t))}function p(e){return""+e}function g(e){return parseFloat(e)}function m(e){if("object"!=typeof e)if("number"==typeof e)e=new Date(1e3*e);else{var t=e.replace(/ /,"T").replace(" ","").replace("UTC","Z");e=s(t)||new Date(e)}return e}function v(e){if(!t(e)){var n,i=[];for(n in e)e.hasOwnProperty(n)&&i.push([n,e[n]]);e=i}return e}function y(e,t){return e[0].getTime()-t[0].getTime()}function A(){if(!t&&"Highcharts"in e){var t=new function(){var t=e.Highcharts;this.name="highcharts";var n={chart:{},xAxis:{title:{text:null},labels:{style:{fontSize:"12px"}}},yAxis:{title:{text:null},labels:{style:{fontSize:"12px"}}},title:{text:null},credits:{enabled:!1},legend:{borderWidth:0},tooltip:{style:{fontSize:"12px"}},plotOptions:{areaspline:{},series:{marker:{}}}},i=function(e){e.legend.enabled=!1},r=function(e,t){e.yAxis.min=t},s=function(e,t){e.yAxis.max=t},a=function(e,t){e.plotOptions.series.stacking=t?"normal":null},c=function(e,t){e.xAxis.title.text=t},u=function(e,t){e.yAxis.title.text=t},h=l(n,i,r,s,a,c,u);this.renderLineChart=function(e,n){n=n||"spline";var i={};"areaspline"===n&&(i={plotOptions:{areaspline:{stacking:"normal"},series:{marker:{enabled:!1}}}});var r,o,s,a=h(e.data,e.options,i);a.xAxis.type=e.options.discrete?"category":"datetime",a.chart.type=n,a.chart.renderTo=e.element.id;var l=e.data;for(o=0;o<l.length;o++){if(r=l[o].data,!e.options.discrete)for(s=0;s<r.length;s++)r[s][0]=r[s][0].getTime();l[o].marker={symbol:"circle"}}a.series=l,new t.Chart(a)},this.renderScatterChart=function(e){var n={},i=h(e.data,e.options,n);i.chart.type="scatter",i.chart.renderTo=e.element.id,i.series=e.data,new t.Chart(i)},this.renderPieChart=function(e){var i={};e.options.colors&&(i.colors=e.options.colors);var r=o(o(n,i),e.options.library||{});r.chart.renderTo=e.element.id,r.series=[{type:"pie",name:e.options.label||"Value",data:e.data}],new t.Chart(r)},this.renderColumnChart=function(e,n){var i,r,o,s,n=n||"column",a=e.data,l=h(a,e.options),c=[];for(l.chart.type=n,l.chart.renderTo=e.element.id,i=0;i<a.length;i++)for(o=a[i],r=0;r<o.data.length;r++)s=o.data[r],c[s[0]]||(c[s[0]]=new Array(a.length)),c[s[0]][i]=s[1];var u=[];for(i in c)c.hasOwnProperty(i)&&u.push(i);l.xAxis.categories=u;var d=[];for(i=0;i<a.length;i++){for(s=[],r=0;r<u.length;r++)s.push(c[u[r]][i]||0);d.push({name:a[i].name,data:s})}l.series=d,new t.Chart(l)};var d=this;this.renderBarChart=function(e){d.renderColumnChart(e,"bar")},this.renderAreaChart=function(e){d.renderLineChart(e,"areaspline")}};P.push(t)}if(!n&&e.google&&e.google.setOnLoadCallback){var n=new function(){var t=e.google;this.name="google";var n={},i=[],r=function(){for(var e,n,r=0;r<i.length;r++)e=i[r],n=t.visualization&&("corechart"===e.pack&&t.visualization.LineChart||"timeline"===e.pack&&t.visualization.Timeline),n&&(e.callback(),i.splice(r,1),r--)},s=function(e,o){if(o||(o=e,e="corechart"),i.push({pack:e,callback:o}),n[e])r();else{n[e]=!0;var s={packages:[e],callback:r};N.language&&(s.language=N.language),t.load("visualization","1",s)}},a={chartArea:{},fontName:"'Lucida Grande', 'Lucida Sans Unicode', Verdana, Arial, Helvetica, sans-serif",pointSize:6,legend:{textStyle:{fontSize:12,color:"#444"},alignment:"center",position:"right"},curveType:"function",hAxis:{textStyle:{color:"#666",fontSize:12},titleTextStyle:{},gridlines:{color:"transparent"},baselineColor:"#ccc",viewWindow:{}},vAxis:{textStyle:{color:"#666",fontSize:12},titleTextStyle:{},baselineColor:"#ccc",viewWindow:{}},tooltip:{textStyle:{color:"#666",fontSize:12}}},c=function(e){e.legend.position="none"},u=function(e,t){e.vAxis.viewWindow.min=t},h=function(e,t){e.vAxis.viewWindow.max=t},d=function(e,t){e.hAxis.viewWindow.min=t},f=function(e,t){e.hAxis.viewWindow.max=t},p=function(e,t){e.isStacked=!!t},m=function(e,t){e.hAxis.title=t,e.hAxis.titleTextStyle.italic=!1},v=function(e,t){e.vAxis.title=t,e.vAxis.titleTextStyle.italic=!1},A=l(a,c,u,h,p,m,v),b=function(e,n){var i,r,o,s,a,l=[];for(i=0;i<e.length;i++)for(o=e[i],r=0;r<o.data.length;r++)s=o.data[r],a="datetime"===n?s[0].getTime():s[0],l[a]||(l[a]=new Array(e.length)),l[a][i]=g(s[1]);var c,u=[],h=!0;for(i in l)l.hasOwnProperty(i)&&("datetime"===n?(c=new Date(g(i)),h=h&&w(c)):c="number"===n?g(i):i,u.push([c].concat(l[i])));"datetime"===n&&u.sort(y);var d=new t.visualization.DataTable;for(n="datetime"===n&&h?"date":n,d.addColumn(n,""),i=0;i<e.length;i++)d.addColumn("number",e[i].name);return d.addRows(u),d},C=function(t){e.attachEvent?e.attachEvent("onresize",t):e.addEventListener&&e.addEventListener("resize",t,!0),t()};this.renderLineChart=function(e){s(function(){var n=A(e.data,e.options),i=b(e.data,e.options.discrete?"string":"datetime");e.chart=new t.visualization.LineChart(e.element),C(function(){e.chart.draw(i,n)})})},this.renderPieChart=function(e){s(function(){var n={chartArea:{top:"10%",height:"80%"}};e.options.colors&&(n.colors=e.options.colors);var i=o(o(a,n),e.options.library||{}),r=new t.visualization.DataTable;r.addColumn("string",""),r.addColumn("number","Value"),r.addRows(e.data),e.chart=new t.visualization.PieChart(e.element),C(function(){e.chart.draw(r,i)})})},this.renderColumnChart=function(e){s(function(){var n=A(e.data,e.options),i=b(e.data,"string");e.chart=new t.visualization.ColumnChart(e.element),C(function(){e.chart.draw(i,n)})})},this.renderBarChart=function(e){s(function(){var n={hAxis:{gridlines:{color:"#ccc"}}},i=l(a,c,d,f,p)(e.data,e.options,n),r=b(e.data,"string");e.chart=new t.visualization.BarChart(e.element),C(function(){e.chart.draw(r,i)})})},this.renderAreaChart=function(e){s(function(){var n={isStacked:!0,pointSize:0,areaOpacity:.5},i=A(e.data,e.options,n),r=b(e.data,e.options.discrete?"string":"datetime");e.chart=new t.visualization.AreaChart(e.element),C(function(){e.chart.draw(r,i)})})},this.renderGeoChart=function(e){s(function(){var n={legend:"none",colorAxis:{colors:e.options.colors||["#f6c7b6","#ce502d"]}},i=o(o(a,n),e.options.library||{}),r=new t.visualization.DataTable;r.addColumn("string",""),r.addColumn("number",e.options.label||"Value"),r.addRows(e.data),e.chart=new t.visualization.GeoChart(e.element),C(function(){e.chart.draw(r,i)})})},this.renderScatterChart=function(e){s(function(){var n={},i=A(e.data,e.options,n),r=b(e.data,"number");e.chart=new t.visualization.ScatterChart(e.element),C(function(){e.chart.draw(r,i)})})},this.renderTimeline=function(e){s("timeline",function(){var n={legend:"none"};e.options.colors&&(n.colors=e.options.colors);var i=o(o(a,n),e.options.library||{}),r=new t.visualization.DataTable;r.addColumn({type:"string",id:"Name"}),r.addColumn({type:"date",id:"Start"}),r.addColumn({type:"date",id:"End"}),r.addRows(e.data),e.chart=new t.visualization.Timeline(e.element),C(function(){e.chart.draw(r,i)})})}};P.push(n)}}function b(e,t){var i,r,o,s;for(o="render"+e,s=t.options.adapter,0==P.length&&A(),i=0;i<P.length;i++)if(r=P[i],(!s||s===r.name)&&n(r[o]))return r[o](t);throw new Error("No adapter found")}function w(e){return e.getMilliseconds()+e.getSeconds()+e.getMinutes()+e.getHours()===0}function C(e,n,i){var r;for(!t(e)||"object"!=typeof e[0]||t(e[0])?(e=[{name:n.label||"Value",data:e}],n.hideLegend=!0):n.hideLegend=!1,n.discrete&&(i="string"),r=0;r<e.length;r++)e[r].data=H(v(e[r].data),i);return e}function E(e){var t,n=v(e);for(t=0;t<n.length;t++)n[t]=[p(n[t][0]),g(n[t][1])];return n}function x(e){var t;for(t=0;t<e.length;t++)e[t][1]=m(e[t][1]),e[t][2]=m(e[t][2]);return e}function F(e){e.data=C(e.data,e.options,"datetime"),b("LineChart",e)}function S(e){e.data=C(e.data,e.options,"string"),b("ColumnChart",e)}function D(e){e.data=E(e.data),b("PieChart",e)}function k(e){e.data=C(e.data,e.options,"string"),b("BarChart",e)}function T(e){e.data=C(e.data,e.options,"datetime"),b("AreaChart",e)}function $(e){e.data=E(e.data),b("GeoChart",e)}function _(e){e.data=C(e.data,e.options,"number"),b("ScatterChart",e)}function B(e){e.data=x(e.data),b("Timeline",e)}function M(e,t,n,i,r){"string"==typeof t&&(t=document.getElementById(t)),e.element=t,e.options=i||{},e.dataSource=n,L.charts[t.id]=e,f(e,r)}var L,R,O,N=e.Chartkick||{},P=[],P=[];R=/(\d\d\d\d)(\-)?(\d\d)(\-)?(\d\d)(T)?(\d\d)(:)?(\d\d)?(:)?(\d\d)?([\.,]\d+)?($|Z|([\+\-])(\d\d)(:)?(\d\d)?)/i,O=String(1.5).charAt(1);var I=function(e,t){return e="number"===t?g(e):"datetime"===t?m(e):p(e)},H=function(e,t){var n,i,r=[];for(i=0;i<e.length;i++)n=I(e[i][0],t),r.push([n,g(e[i][1])]);return"datetime"===t&&r.sort(y),r};L={LineChart:function(e,t,n){M(this,e,t,n,F)},PieChart:function(e,t,n){M(this,e,t,n,D)},ColumnChart:function(e,t,n){M(this,e,t,n,S)},BarChart:function(e,t,n){M(this,e,t,n,k)},AreaChart:function(e,t,n){M(this,e,t,n,T)},GeoChart:function(e,t,n){M(this,e,t,n,$)},ScatterChart:function(e,t,n){M(this,e,t,n,_)},Timeline:function(e,t,n){M(this,e,t,n,B)},charts:{}},e.Chartkick=L}(window);