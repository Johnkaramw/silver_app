import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الملف الشخصي'),
        backgroundColor: const Color.fromARGB(255, 3, 3, 223),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/profile.jpg'),
            ),
            const SizedBox(height: 20),

            const Text(
              'جون كرم',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),
            const Text(
              'مهتم بأسعار الفضة اليومية',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),

            const SizedBox(height: 30),

            _buildProfileItem(
              icon: Icons.location_on,
              label: 'المنطقة',
              value: 'مصر - القاهرة',
            ),
            const SizedBox(height: 15),
            _buildProfileItem(
              icon: Icons.category,
              label: 'نوع المستخدم',
              value: 'مستثمر فردي',
            ),
            const SizedBox(height: 15),
            _buildProfileItem(
              icon: Icons.email,
              label: 'البريد الإلكتروني',
              value: 'johnsilver@app.com',
            ),

            const SizedBox(height: 30),

            ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('ميزة التعديل قيد التطوير')),
                );
              },
              icon: const Icon(Icons.edit),
              label: const Text('تعديل البيانات'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 136, 129, 148),
              ),
            ),

            const SizedBox(height: 20),

            TextButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
              label: const Text('الرجوع'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileItem({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.blueGrey),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 3),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
