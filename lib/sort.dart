import 'package:flutter/material.dart';

class SortPages extends StatefulWidget {
  const SortPages({super.key});

  @override
  State<SortPages> createState() => _SortPagesState();
}

class _SortPagesState extends State<SortPages> {
  final formKey = GlobalKey<FormState>();
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
                  validator: (value) => value == null || value.isEmpty
                      ? 'Data nya masih kosong'
                      : null,
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
                            if (_textController.text.length != 0) {
                              int data =
                                  int.parse(_textController.text.toString());
                              list.add(data);
                              _textController.text = "";
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.red,
                                  content:
                                      Text('Data inputan masih kosong !!!'),
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
                                  backgroundColor: Colors.red,
                                  content: Text(
                                      'Data di dalam inputan tidak ada !!!'),
                                ),
                              );
                            } else {
                              list.clear();
                              _textController.clear();
                              _textController.text = "";
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.green,
                                  content: Text(
                                      'Data inputan berhasil di hapus !!!'),
                                ),
                              );
                            }
                          },
                        );
                      },
                      child: Text("Hapus Inputan"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(
                          () {
                            if (list.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.red,
                                  content:
                                      Text('Tidak ada data yang tersedia !!!'),
                                ),
                              );
                            } else {
                              list.clear();
                              _textController.clear();
                              _textController.text = "";
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.green,
                                  content: Text('Data berhasil di hapus !!!'),
                                ),
                              );
                            }
                          },
                        );
                      },
                      child: Text("Clear"),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                // Bagian Input Data Yang Sudah Di tentukan di Atas (TAHAP 2)
                Container(
                  child: Text('Data : ${list}'),
                  padding: EdgeInsets.all(10),
                  height: 130,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[350],
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
