import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 186, 0),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 91, 80, 151),
        title: Center(
          child: Text(
            'سعر الفضة اللحظى',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 80),
                child: Center(
                  child: Text(
                    ' الوقت اللحظي للسعر  3:30ص',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Icon(Icons.replay_outlined, color: Colors.red, size: 45),
              SizedBox(height: 60),
              Text(
                'السعر',
                style: TextStyle(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Column(
                  children: [
                    Text(
                      ' الشراء من المحل ',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '60',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 90),
                Column(
                  children: [
                    Text(
                      'البيع الى المحل ',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '59.5',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 60),
          Text(
            'اجعل الفضه صديقة لاستثمارك',
            style: TextStyle(
              fontSize: 30,
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          SizedBox(height: 35),
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset('assets/images/silver.png', height: 120),
          ),
        ],
      ),
    );
  }
}
