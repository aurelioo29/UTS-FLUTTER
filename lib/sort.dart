import 'package:flutter/material.dart';

class SortPages extends StatefulWidget {
  const SortPages({super.key});

  @override
  State<SortPages> createState() => _SortPagesState();
}

class _SortPagesState extends State<SortPages> {
  // variabel untuk form
  final formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();
  var list = [];
  var listBeforeSorting = [];

  void sorting(List list) {
    int panjang = list.length;

    for (int i = 0; i < panjang - 1; i++) {
      int imin = i;

      // Mencari indeks nilai minimum dalam sisa list
      for (int j = i + 1; j < panjang; j++) {
        if (list[j].compareTo(list[imin]) < 0) {
          imin = j;
        }
      }

      // Menukar nilai minimum dengan nilai pada indeks i
      int temp = list[i];
      list[i] = list[imin];
      list[imin] = temp;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      appBar: AppBar(
        title: const Text(
          "Maximum Sort (Ascending)",
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              fontFamily: 'Agbalumo'),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.19,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(80),
                    bottomLeft: Radius.circular(80),
                  ),
                  color: Colors.deepOrangeAccent),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Nama : Aurelio Lucio Lie \n Nim : 223303030427 \n Kelas : 3 Malam A',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Poppins'),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    // Bagian Input Data Ingin Di Sorting (TAHAP 1)
                    TextFormField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      controller: _textController,
                      validator: (value) => value == null || value.isEmpty
                          ? 'Data nya masih kosong'
                          : null,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.format_list_numbered_rounded,
                          size: 40,
                          color: Colors.black,
                        ),
                        hintText: "Input angka yang ingin di sorting",
                        hintStyle: const TextStyle(color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 2.5),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 2.5),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 150),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              if (_textController.text.length != 0) {
                                int data =
                                    int.parse(_textController.text.toString());
                                list.add(data);
                                listBeforeSorting.add(data);
                                _textController.text = "";
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    backgroundColor: Colors.red,
                                    content:
                                        Text('Data inputan masih kosong !!!'),
                                  ),
                                );
                              }
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 139, 205,
                                141), // Ganti warna latar belakang sesuai keinginan
                          ),
                          child: const Text(
                            "Input",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              if (list.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    backgroundColor: Colors.red,
                                    content: Text(
                                        'Tidak ada data yang tersedia !!!'),
                                  ),
                                );
                              } else {
                                list.clear();
                                listBeforeSorting.clear();
                                _textController.clear();
                                _textController.text = "";
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    backgroundColor: Colors.red,
                                    content: Text('Data berhasil dihapus !!!'),
                                  ),
                                );
                              }
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 251, 128,
                                90), // Ganti warna latar belakang sesuai keinginan
                          ),
                          child: const Text(
                            "Clear",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 30,
                      width: double.infinity,
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          'DATA SEBELUM DI SORTING',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green[200],
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                    ),
                    // Bagian Input Data Yang Sudah Di tentukan di Atas (TAHAP 2)
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        '${listBeforeSorting}',
                        style: const TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                      padding: const EdgeInsets.all(10),
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        color: Colors.grey[350],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: () {
                          List<int> listBeforeSorting = List.from(list);
                          setState(() {
                            sorting(list);
                            // Menampilkan list sebelum diurutkan
                            debugPrint('Sebelum sorting: ${listBeforeSorting}');
                            // Menampilkan list setelah diurutkan
                            debugPrint('Setelah sorting: ${list}');
                          });
                        },
                        style:
                            FilledButton.styleFrom(backgroundColor: Colors.red),
                        child: const Text('URUTKAN'),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 30,
                      width: double.infinity,
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          'DATA SETELAH DI SORTING',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green[200],
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                    ),
                    // Bagian Data Yang Sudah Di Tentukan (TAHAP 3)
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        '${list}',
                        style: const TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                      padding: const EdgeInsets.all(10),
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        color: Colors.grey[350],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
