import 'package:flutter/material.dart';

class SilverCalculatorPage extends StatefulWidget {
  const SilverCalculatorPage({super.key});

  @override
  State<SilverCalculatorPage> createState() => _SilverCalculatorPageState();
}

class _SilverCalculatorPageState extends State<SilverCalculatorPage> {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _pricePerGramController = TextEditingController();
  final TextEditingController _commissionController = TextEditingController();
  final TextEditingController _taxController = TextEditingController();

  double? totalPrice, commission, tax, finalPrice;

  void _calculate() {
    double? weight = double.tryParse(_weightController.text);
    double? pricePerGram = double.tryParse(_pricePerGramController.text);
    double? commissionPercent = double.tryParse(_commissionController.text);
    double? taxPercent = double.tryParse(_taxController.text);

    if (weight == null || pricePerGram == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('يرجى إدخال الوزن وسعر الغرام')),
      );
      return;
    }

    totalPrice = weight * pricePerGram;
    commission = (commissionPercent ?? 0) * totalPrice! / 100;
    tax = (taxPercent ?? 0) * totalPrice! / 100;
    finalPrice = totalPrice! + commission! + tax!;

    setState(() {}); // لتحديث النتائج على الشاشة
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('حاسبة الفضة'),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildInputField(
              _weightController,
              'وزن الفضة بالغرام',
              Icons.monitor_weight,
            ),
            const SizedBox(height: 15),
            _buildInputField(
              _pricePerGramController,
              'سعر الغرام بالجنيه',
              Icons.price_change,
            ),
            const SizedBox(height: 15),
            _buildInputField(
              _commissionController,
              'نسبة العمولة %',
              Icons.percent,
            ),
            const SizedBox(height: 15),
            _buildInputField(
              _taxController,
              'نسبة الضريبة %',
              Icons.account_balance,
            ),

            const SizedBox(height: 25),
            ElevatedButton.icon(
              onPressed: _calculate,
              icon: const Icon(Icons.calculate),
              label: const Text('احسب'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
            ),

            const SizedBox(height: 30),
            if (finalPrice != null) ...[
              _buildResultRow(
                'السعر الأساسي:',
                '${totalPrice!.toStringAsFixed(2)} جنيه',
              ),
              _buildResultRow(
                'قيمة العمولة:',
                '${commission!.toStringAsFixed(2)} جنيه',
              ),
              _buildResultRow(
                'قيمة الضريبة:',
                '${tax!.toStringAsFixed(2)} جنيه',
              ),
              const Divider(thickness: 1.2),
              _buildResultRow(
                'السعر النهائي:',
                '${finalPrice!.toStringAsFixed(2)} جنيه',
                highlight: true,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(
    TextEditingController controller,
    String label,
    IconData icon,
  ) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  Widget _buildResultRow(String label, String value, {bool highlight = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: highlight ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              color: highlight ? Colors.teal : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
