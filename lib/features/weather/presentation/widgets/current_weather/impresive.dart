import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:weatherapp/features/weather/data/models/SevenWeatherModel.dart';

class ConChart extends StatefulWidget {
  ConChart({super.key, required this.weatherModel});

  final SevenWeatherModel weatherModel;

  @override
  State<ConChart> createState() => _ConChartState();
}

class _ConChartState extends State<ConChart> {
  @override
  Widget build(BuildContext context) {
    final forecast = widget.weatherModel.forecast!.forecastday!;
    return Container(
        child: SfCartesianChart(
      plotAreaBorderWidth: 0,
      primaryXAxis: CategoryAxis(
        majorTickLines: MajorTickLines(
          width: 0.2,
          color: Colors.white38,
        ),
        majorGridLines: const MajorGridLines(
            width: 0.2, color: Colors.white38, dashArray: <double>[5, 5]),
        axisLine: AxisLine(),
      ),
      primaryYAxis: CategoryAxis(
        interval: 5,
        majorGridLines: MajorGridLines(
          width: 1,
          color: Colors.white12,
          dashArray: <double>[5, 5],
        ),
        majorTickLines: const MajorTickLines(
          width: 0.2,
          color: Colors.white38,
        ),
        axisLine: AxisLine(),
        minimum: 0,
        maximum: 30,
      ),
      tooltipBehavior: TooltipBehavior(enable: true),
      series: <ChartSeries<ChartData, String>>[
        AreaSeries(
          borderColor: Colors.blue,
          borderWidth: 3,
          gradient: LinearGradient(
            colors: [
              Colors.blue.withOpacity(0.4),
              Colors.blue.withOpacity(0.2),
              Colors.blue.withOpacity(0.1)
            ],
            stops: const [0.0, 0.3, 0.6],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          dataSource: [
            ChartData('0', forecast[0].day!.maxtempC!.round().toInt()),
            ChartData('1', forecast[1].day!.maxtempC!.round().toInt()),
            ChartData('2', forecast[2].day!.maxtempC!.round().toInt()),
            ChartData('3', forecast[3].day!.maxtempC!.round().toInt()),
            ChartData('4', forecast[4].day!.maxtempC!.round().toInt()),
            ChartData('5', forecast[5].day!.maxtempC!.round().toInt()),
            ChartData('6', forecast[6].day!.maxtempC!.round().toInt()),
          ],
          xValueMapper: (ChartData sales, _) => sales.x,
          yValueMapper: (ChartData sales, _) => sales.y,
        ),
      ],
    ));
  }
}

class ChartData {
  ChartData(this.x, this.y);

  final String x;
  final int? y;
}
