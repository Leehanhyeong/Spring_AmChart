<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
	<style>
		#chart_area{
			width: 900px;
			height: 400px;
			border: 1px solid black;
		}
	</style>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>

<div id="chart_div">
	<header>
		<h1>amChart Test</h1>
	</header>
	<article>
		<div id="chart_area"></div>
	</article>
</div>	
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.amcharts.com/lib/4/core.js"></script>
<script src="https://cdn.amcharts.com/lib/4/charts.js"></script>
<script src="https://cdn.amcharts.com/lib/4/themes/animated.js"></script>

	<script>
		$(function () {
			am4core.useTheme(am4themes_animated);

			var chart = am4core.create("chart_area", am4charts.XYChart);
			
			chart.data = [
			<c:forEach var="vo" items="${ar}">
				{"country":"${vo.name}", "litres":${vo.litres}},
			</c:forEach>	
			];
			
			
			
			
			//x축 만들기
			var x_Axis = chart.xAxes.push(new am4charts.CategoryAxis());
			x_Axis.dataFields.category = "country";
			
			x_Axis.renderer.labels.template.fontSize = 11;
			x_Axis.renderer.minGridDistance = 30;
			
			//y축 만들기
			var y_Axis = chart.yAxes.push(new am4charts.ValueAxis());
	
			
			
			//Series 만들기
			var series = chart.series.push(new am4charts.ColumnSeries());
			series.dataFields.categoryX = "country";
			series.dataFields.valueY = "litres";
			
			series.columns.template.tooltipText = "[bold]{valueY}[/]";
			series.columns.template.fill = am4core.color("#6e6eff");
			series.columns.template.fillOpacity = .7;
			series.columns.template.strock = am4core.color("#ff0000");
	});		
	</script>

</body>
</html>
