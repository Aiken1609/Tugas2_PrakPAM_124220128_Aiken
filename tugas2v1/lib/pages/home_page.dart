import 'package:flutter/material.dart';
import 'package:tugas2v1/pages/hasil_page.dart';

class PageHome extends StatefulWidget {
  final String username;
  const PageHome({super.key, required this.username});

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  final TextEditingController controller = TextEditingController();
  final List<String> spin = [];
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Utama'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        child: Center(
          child: Column(
            children: [
              Text(
                "Hai ${widget.username}\nSelamat datang di aplikasi spin wheel",
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 24),
              ),
              _textField(),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        i++;
                        if (controller.text.isNotEmpty) {
                          spin.add(controller.text);
                          controller.clear();
                        }
                      });
                    },
                    child: const Text(
                      'Tambahkan',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onPressed: () {
                      if (spin.isNotEmpty) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HasilPage(result: spin),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      'Acak',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(child: _buildList()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: 'Masukan opsi ke-$i',
          contentPadding: const EdgeInsets.all(8.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Colors.blue),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
        ),
      ),
    );
  }

  Widget _buildList() {
    return ListView.builder(
      itemCount: spin.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Text(
            '${index + 1}.',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          title: Text(
            spin[index],
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () {
              setState(() {
                spin.removeAt(index);
                i--;
              });
            },
          ),
        );
      },
    );
  }
}
