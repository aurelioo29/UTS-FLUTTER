import 'package:flutter/material.dart';

class BubleSortPage extends StatefulWidget {
  const BubleSortPage({super.key});

  @override
  State<BubleSortPage> createState() => _BubleSortPageState();
}

class _BubleSortPageState extends State<BubleSortPage> {
  final formKey = GlobalKey<FormState>();
  final tecData = TextEditingController();
  final tecSblmUrut = TextEditingController();
  final tecStlhUrut = TextEditingController();
  var list = [];

  void bubbleSort(List dataList) {
    int n = dataList.length;
    int temp = 0;

    for (int i = 0; i < n; i++) {
      for (int j = 1; j < (n - i); j++) {
        if (dataList[j - 1] > dataList[j]) {
          temp = dataList[j - 1];
          dataList[j - 1] = dataList[j];
          dataList[j] = temp;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buble Sort'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 20, bottom: 8, left: 8, right: 8),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: tecData,
                  validator: (value) => value == null || value.isEmpty
                      ? 'Data masih kosong'
                      : null,
                  decoration: InputDecoration(
                    labelText: 'Data ke-',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FilledButton(
                        onPressed: () {
                          setState(() {
                            if (tecData.text.length != 0) {
                              int data = int.parse(tecData.text.toString());
                              list.add(data);
                              tecData.text = "";
                              debugPrint('Isi List : ${List}');
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Data masih kosong')));
                            }
                          });
                        },
                        child: Text('Input Data')),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            list.clear();
                            tecSblmUrut.text = "";
                            tecStlhUrut.text = "";
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('Data berhasil di hapus')));
                          });
                        },
                        child: Text('Hapus Data')),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[300]),
                  child: Text('Data : ${list}'),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  maxLines: 5,
                  readOnly: true,
                  controller: tecSblmUrut,
                  decoration: InputDecoration(
                    labelText: 'Data sebelum pengurutan',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  maxLines: 5,
                  readOnly: true,
                  controller: tecStlhUrut,
                  decoration: InputDecoration(
                    labelText: 'Data setelah pengurutan',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        setState(() {
                          String dataNotSort = '';
                          String dataSort = '';
                          list.forEach((elementNotSort) {
                            dataNotSort = dataNotSort + '${elementNotSort}';
                          });
                          tecSblmUrut.text = dataNotSort;

                          bubbleSort(list);
                          Text('Urut data : ${list}');
                        });
                      }
                    },
                    child: Text('URUTKAN'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
