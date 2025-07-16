import 'package:flutter/material.dart';
import 'package:silvar_app/services/background_wrapper.dart';

class CurrencyConverterPage extends StatefulWidget {
  const CurrencyConverterPage({super.key});

  @override
  State<CurrencyConverterPage> createState() => _CurrencyConverterPageState();
}

class _CurrencyConverterPageState extends State<CurrencyConverterPage> {
  final TextEditingController _amountController = TextEditingController();
  String _result = '';

  void _convertToDollar() {
    final amount = double.tryParse(_amountController.text);
    if (amount != null) {
      double dollar = amount / 50;
      setState(() {
        _result = 'المبلغ بالدولار: ${dollar.toStringAsFixed(2)}';
      });
    }
  }

  void _convertToSilver() {
    final amount = double.tryParse(_amountController.text);
    if (amount != null) {
      double silverGrams = amount / 60;
      setState(() {
        _result = 'يعادل ${silverGrams.toStringAsFixed(2)} جرام فضة';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('تحويل العملات')),
      body: BackgroundWrapper(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                'تحويل بين الجنيه والدولار والفضة',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'أدخل المبلغ بالجنيه',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _convertToDollar,
                    child: const Text('إلى دولار'),
                  ),
                  ElevatedButton(
                    onPressed: _convertToSilver,
                    child: const Text('إلى فضة'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                _result,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
