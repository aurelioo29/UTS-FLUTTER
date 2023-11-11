import 'package:flutter/material.dart';

class SortPages extends StatefulWidget {
  const SortPages({super.key});

  @override
  State<SortPages> createState() => _SortPagesState();
}

class _SortPagesState extends State<SortPages> {
  final formKey = GlobalKey<FormState>();
  final tecData = TextEditingController();
  // variabel untuk mengahapus inputan
  TextEditingController _textController = TextEditingController();
  var list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Maximum Sort"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                // Bagian Input Data Ingin Di Sorting (TAHAP 1)
                TextFormField(
                  controller: _textController,
                  decoration: InputDecoration(
                    labelText: "Masukan berapa data yang ingin di sorting",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(
                          () {
                            if (tecData.text.length != 0) {
                              int data = int.parse(tecData.text.toString());
                              list.add(data);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Data inputan masih kosong'),
                                ),
                              );
                            }
                          },
                        );
                      },
                      child: Text("Input"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(
                          () {
                            if (_textController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content:
                                      Text('Data di dalam inputan tidak ada'),
                                ),
                              );
                            } else {
                              _textController.clear();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Data berhasil di hapus'),
                                ),
                              );
                            }
                          },
                        );
                      },
                      child: Text("Hapus"),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                // Bagian Input Data Yang Sudah Di tentukan di Atas (TAHAP 2)
                TextField(
                  maxLines: 2,
                  decoration: InputDecoration(
                    labelText: 'Data : ${list}',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(
                          () {},
                        );
                      },
                      child: Text("Next"),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                // Bagian Data Yang Sudah Di Tentukan (TAHAP 3)
                TextField(
                  maxLines: 5,
                  readOnly: true,
                  // controller: tecStlhUrut,
                  decoration: InputDecoration(
                    labelText: 'Data sebelum pengurutan',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                // Bagian Data Yang Sudah Di Tentukan (TAHAP 3)
                TextField(
                  maxLines: 5,
                  readOnly: true,
                  // controller: tecStlhUrut,
                  decoration: InputDecoration(
                    labelText: 'Data setelah pengurutan',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
