import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:silvar_app/pages/PriceAlertPage.dart';

import 'currency_converter_page.dart';
import 'market_trends_page.dart';
import 'silver_calculator_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _currentTime = DateFormat('hh:mm:ss a').format(DateTime.now());

  void _updateTime() {
    setState(() {
      _currentTime = DateFormat('hh:mm:ss a').format(DateTime.now());
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF4A4A58),
        centerTitle: true,
        title: const Text(
          'سعر الفضة اللحظي',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),
              Text(
                'الوقت اللحظي للسعر: $_currentTime',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              IconButton(
                onPressed: _updateTime,
                icon: const Icon(
                  Icons.replay_outlined,
                  color: Colors.red,
                  size: 35,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'السعر',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildPriceCard(
                    'الشراء من المحل',
                    '60',
                    Icons.shopping_cart,
                    Colors.green,
                  ),
                  _buildPriceCard(
                    'البيع إلى المحل',
                    '59.5',
                    Icons.sell,
                    Colors.red,
                  ),
                ],
              ),
              const SizedBox(height: 40),
              const Text(
                'اجعل الفضة صديقة لاستثمارك',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 25),
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  'assets/images/silver.png',
                  height: screenWidth * 0.35,
                ),
              ),
              const SizedBox(height: 30),

              const Text(
                'الخدمات المتاحة',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),

              // ✅ خدمة: حاسبة الفضة
              _serviceTile(
                icon: Icons.calculate,
                title: 'حاسبة الفضة',
                subtitle: 'احسب قيمة وزن معين',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SilverCalculatorPage(),
                    ),
                  );
                },
              ),

              // ✅ خدمة: تحويل العملات
              _serviceTile(
                icon: Icons.currency_exchange,
                title: 'تحويل العملات',
                subtitle: 'حول بين الجنيه والدولار والفضة',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CurrencyConverterPage(),
                    ),
                  );
                },
              ),

              // ✅ خدمة: اتجاه السوق
              _serviceTile(
                icon: Icons.trending_up,
                title: 'اتجاه السوق',
                subtitle: 'تحليل سريع للسوق',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MarketTrendsPage(),
                    ),
                  );
                },
              ),

              // ✅ خدمة: تنبيه السعر
              _serviceTile(
                icon: Icons.notifications_active,
                title: 'تنبيهات السعر',
                subtitle: 'حدد سعر تتنبه عنده',
                onTap: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const PriceAlertPage()),
                  );

                  if (result != null) {
                    double? buy = result['buy'];
                    double? sell = result['sell'];
                    print('🟢 تنبيه للشراء عند: $buy');
                    print('🔴 تنبيه للبيع عند: $sell');
                    // هنعمل فحص السعر عند التحديث لاحقًا
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPriceCard(
    String title,
    String price,
    IconData icon,
    Color color,
  ) {
    return Column(
      children: [
        Icon(icon, size: 35, color: color),
        const SizedBox(height: 10),
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 5),
        Text(
          price,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }

  Widget _serviceTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: ListTile(
        leading: Icon(icon, size: 35, color: Colors.blueGrey),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 18),
        onTap: onTap,
      ),
    );
  }
}
