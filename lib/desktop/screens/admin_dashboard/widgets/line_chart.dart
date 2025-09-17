import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MonthlyViewsChart extends StatelessWidget {
  final List<double> monthlyViews; // must be 6 values (last 6 months)

  const MonthlyViewsChart({super.key, required this.monthlyViews});

  List<String> _getLastSixMonths() {
    final now = DateTime.now();
    return List.generate(6, (i) {
      final date = DateTime(now.year, now.month - 5 + i);
      return DateFormat('MMM').format(date); // e.g., Apr, May...
    });
  }

  @override
  Widget build(BuildContext context) {
    final months = _getLastSixMonths();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: LineChart(
        LineChartData(
          backgroundColor: Colors.transparent,
          gridData: FlGridData(show: false),
          borderData: FlBorderData(
            show: true,
            border: const Border(
              left: BorderSide(color: Colors.deepOrange, width: 2),
              bottom: BorderSide(color: Colors.deepOrange, width: 2),
              top: BorderSide.none,
              right: BorderSide.none,
            ),
          ),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
                getTitlesWidget: (value, meta) {
                  return Text(
                    value.toInt().toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  );
                },
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  if (value.toInt() >= 0 && value.toInt() < months.length) {
                    return Text(
                      months[value.toInt()],
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: List.generate(
                monthlyViews.length,
                (i) => FlSpot(i.toDouble(), monthlyViews[i]),
              ),
              isCurved: true,
              color: Colors.white,
              barWidth: 3,
              dotData: FlDotData(show: true, dotSize: 4, dotColor: Colors.white),
            ),
          ],
          minY: 0,
          maxY: (monthlyViews.reduce((a, b) => a > b ? a : b) * 1.2),
        ),
      ),
    );
  }
}
