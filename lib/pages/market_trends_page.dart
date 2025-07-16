import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MarketTrendsPage extends StatefulWidget {
  const MarketTrendsPage({super.key});

  @override
  State<MarketTrendsPage> createState() => _MarketTrendsPageState();
}

class _MarketTrendsPageState extends State<MarketTrendsPage> {
  int selectedRange = 1; // 0 = يومي, 1 = أسبوعي, 2 = شهري

  List<FlSpot> getChartData() {
    if (selectedRange == 0) {
      // بيانات يومي (كل ساعتين تقريبًا)
      return [
        FlSpot(0, 59.5),
        FlSpot(1, 60),
        FlSpot(2, 59.8),
        FlSpot(3, 60.2),
        FlSpot(4, 60.4),
        FlSpot(5, 60.3),
        FlSpot(6, 60.5),
        FlSpot(7, 60.7),
        FlSpot(8, 61),
        FlSpot(9, 61.2),
        FlSpot(10, 61.1),
        FlSpot(11, 61.3),
      ];
    } else if (selectedRange == 1) {
      // بيانات أسبوعي
      return [
        FlSpot(0, 60),
        FlSpot(1, 60.5),
        FlSpot(2, 59.8),
        FlSpot(3, 60.2),
        FlSpot(4, 60.7),
        FlSpot(5, 60.1),
        FlSpot(6, 61.0),
      ];
    } else {
      // بيانات شهري (مبسطة)
      return List.generate(
        30,
        (index) => FlSpot(index.toDouble(), 59.5 + (index % 5) * 0.3),
      );
    }
  }

  List<String> getLabels() {
    if (selectedRange == 0) {
      return [
        '12ص',
        '2',
        '4',
        '6',
        '8',
        '10',
        '12ظ',
        '2',
        '4',
        '6',
        '8',
        '10م',
      ];
    } else if (selectedRange == 1) {
      return ['سبت', 'أحد', 'اثنين', 'ثلاث', 'أربع', 'خميس', 'جمعة'];
    } else {
      return List.generate(30, (i) => '${i + 1}');
    }
  }

  @override
  Widget build(BuildContext context) {
    List<FlSpot> data = getChartData();
    List<String> labels = getLabels();

    return Scaffold(
      appBar: AppBar(
        title: const Text('اتجاه السوق'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'تغير سعر الفضة',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),

            // ✅ أزرار التبديل
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ChoiceChip(
                  label: const Text('يومي'),
                  selected: selectedRange == 0,
                  onSelected: (_) => setState(() => selectedRange = 0),
                ),
                const SizedBox(width: 10),
                ChoiceChip(
                  label: const Text('أسبوعي'),
                  selected: selectedRange == 1,
                  onSelected: (_) => setState(() => selectedRange = 1),
                ),
                const SizedBox(width: 10),
                ChoiceChip(
                  label: const Text('شهري'),
                  selected: selectedRange == 2,
                  onSelected: (_) => setState(() => selectedRange = 2),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // ✅ الرسم البياني
            AspectRatio(
              aspectRatio: 1.6,
              child: LineChart(
                LineChartData(
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: selectedRange == 2 ? 5 : 1,
                        getTitlesWidget: (value, _) {
                          int index = value.toInt();
                          if (index >= 0 && index < labels.length) {
                            return Text(
                              labels[index],
                              style: const TextStyle(fontSize: 10),
                            );
                          }
                          return const Text('');
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: true),
                    ),
                  ),
                  borderData: FlBorderData(show: true),
                  lineBarsData: [
                    LineChartBarData(
                      spots: data,
                      isCurved: true,
                      color: Colors.teal,
                      barWidth: 3,
                      belowBarData: BarAreaData(
                        show: true,
                        color: Colors.teal.withOpacity(0.2),
                      ),
                      dotData: FlDotData(show: true),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'تابع تحركات السعر لفهم اتجاه السوق واتخاذ قرارات أفضل.',
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
