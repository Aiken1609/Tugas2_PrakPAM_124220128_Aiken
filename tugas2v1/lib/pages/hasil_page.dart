import 'package:flutter/material.dart';

class HasilPage extends StatelessWidget {
  final List<String> result;

  const HasilPage({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    result.shuffle();
    result.shuffle();
    result.shuffle();
    result.shuffle();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hasil Spin'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Selamat untuk:',
              style: TextStyle(fontSize: 24),
            ),
            if (result.isNotEmpty)
              Text(
                result[0],
                style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Kembali'),
            ),
          ],
        ),
      ),
    );
  }
}
