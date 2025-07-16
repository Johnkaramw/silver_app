import 'package:flutter/material.dart';

class PriceAlertPage extends StatefulWidget {
  const PriceAlertPage({super.key});

  @override
  State<PriceAlertPage> createState() => _PriceAlertPageState();
}

class _PriceAlertPageState extends State<PriceAlertPage> {
  final TextEditingController _buyController = TextEditingController();
  final TextEditingController _sellController = TextEditingController();

  List<Map<String, double>> alerts = []; // ✅ تنبيهات مخزّنة مؤقتًا

  void _saveAlert() {
    double? buy = double.tryParse(_buyController.text);
    double? sell = double.tryParse(_sellController.text);

    if (buy == null && sell == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('يجب إدخال سعر واحد على الأقل')),
      );
      return;
    }

    alerts.add({'buy': buy ?? 0.0, 'sell': sell ?? 0.0});

    _buyController.clear();
    _sellController.clear();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تنبيهات السعر'),
        backgroundColor: const Color(0xFF4A4A58),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'أدخل السعر الذي تريد أن يتم تنبيهك عنده:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            TextField(
              controller: _buyController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'تنبيه عند سعر الشراء',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.shopping_cart),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _sellController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'تنبيه عند سعر البيع',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.sell),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _saveAlert,
              icon: const Icon(Icons.save),
              label: const Text('حفظ التنبيه'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
              ),
            ),
            const SizedBox(height: 30),

            if (alerts.isNotEmpty)
              const Text(
                '🔔 التنبيهات المحفوظة:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

            const SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                itemCount: alerts.length,
                itemBuilder: (context, index) {
                  final alert = alerts[index];
                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.notifications_active),
                      title: Text(
                        'شراء عند: ${alert['buy']} - بيع عند: ${alert['sell']}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          setState(() {
                            alerts.removeAt(index);
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
