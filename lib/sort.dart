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

  // void sorting(List list) {
  //   int panjang = list.length;

  //   for (int i = 0; i < panjang - 1; i++) {
  //     int imaks = i;

  //     // Mencari indeks nilai maksimum dalam sisa list
  //     for (int j = i + 1; j < panjang; j++) {
  //       if (list[j].compareTo(list[imaks]) > 0) {
  //         imaks = j;
  //       }
  //     }

  //     // Menukar nilai maksimum dengan nilai pada indeks i
  //     int temp = list[i];
  //     list[i] = list[imaks];
  //     list[imaks] = temp;
  //   }
  // }

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
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: Text(
          "Maximum Sort (Ascending)",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          color: Colors.green,
          child: Row(
            children: [
              Form(
                  key: formKey,
                  child: Container(
                    width: 300,
                    child: TextFormField(
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
                  )),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Input"),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Input"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      // body: SingleChildScrollView(
      //   child: Padding(
      //     padding: EdgeInsets.all(10),
      //     child: Form(
      //       key: formKey,
      //       child: Column(
      //         children: [
      //           // Bagian Input Data Ingin Di Sorting (TAHAP 1)
      //           TextFormField(
      //             controller: _textController,
      //             validator: (value) => value == null || value.isEmpty
      //                 ? 'Data nya masih kosong'
      //                 : null,
      //             decoration: InputDecoration(
      //               labelText: "Masukan berapa data yang ingin di sorting",
      //               border: OutlineInputBorder(
      //                 borderRadius: BorderRadius.circular(10),
      //               ),
      //             ),
      //           ),
      //           SizedBox(
      //             height: 5,
      //           ),
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: [
      //               ElevatedButton(
      //                 onPressed: () {
      //                   setState(() {
      //                     if (_textController.text.length != 0) {
      //                       int data =
      //                           int.parse(_textController.text.toString());
      //                       list.add(data);
      //                       listBeforeSorting.add(data);
      //                       _textController.text = "";
      //                     } else {
      //                       ScaffoldMessenger.of(context).showSnackBar(
      //                         SnackBar(
      //                           backgroundColor: Colors.red,
      //                           content: Text('Data inputan masih kosong !!!'),
      //                         ),
      //                       );
      //                     }
      //                   });
      //                 },
      //                 child: Text("Input"),
      //               ),
      //               ElevatedButton(
      //                 onPressed: () {
      //                   setState(() {
      //                     if (list.isEmpty) {
      //                       ScaffoldMessenger.of(context).showSnackBar(
      //                         SnackBar(
      //                           backgroundColor: Colors.red,
      //                           content:
      //                               Text('Tidak ada data yang tersedia !!!'),
      //                         ),
      //                       );
      //                     } else {
      //                       list.clear();
      //                       listBeforeSorting.clear();
      //                       _textController.clear();
      //                       _textController.text = "";
      //                       ScaffoldMessenger.of(context).showSnackBar(
      //                         SnackBar(
      //                           backgroundColor: Colors.green,
      //                           content: Text('Data berhasil dihapus !!!'),
      //                         ),
      //                       );
      //                     }
      //                   });
      //                 },
      //                 child: Text("Clear"),
      //               ),
      //             ],
      //           ),
      //           SizedBox(
      //             height: 10,
      //           ),
      //           Container(
      //             height: 30,
      //             width: double.infinity,
      //             child: Align(
      //               alignment: Alignment.center,
      //               child: Text(
      //                 'DATA SEBELUM DI SORTING',
      //                 style: TextStyle(
      //                   color: Colors.black,
      //                   fontWeight: FontWeight.bold,
      //                 ),
      //               ),
      //             ),
      //             decoration: BoxDecoration(
      //               color: Colors.green[200],
      //               borderRadius: BorderRadius.only(
      //                 topLeft: Radius.circular(10),
      //                 topRight: Radius.circular(10),
      //               ),
      //             ),
      //           ),
      //           // Bagian Input Data Yang Sudah Di tentukan di Atas (TAHAP 2)
      //           Container(
      //             child: Text('${listBeforeSorting}'),
      //             padding: EdgeInsets.all(10),
      //             height: 130,
      //             width: double.infinity,
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.only(
      //                   bottomLeft: Radius.circular(10),
      //                   bottomRight: Radius.circular(10)),
      //               color: Colors.grey[350],
      //             ),
      //           ),
      //           SizedBox(
      //             height: 10,
      //           ),
      //           Container(
      //             width: double.infinity,
      //             child: FilledButton(
      //               onPressed: () {
      //                 List<int> listBeforeSorting = List.from(list);
      //                 setState(() {
      //                   sorting(list);
      //                   // Menampilkan list sebelum diurutkan
      //                   debugPrint('Sebelum sorting: ${listBeforeSorting}');
      //                   // Menampilkan list setelah diurutkan
      //                   debugPrint('Setelah sorting: ${list}');
      //                 });
      //               },
      //               child: Text('URUTKAN'),
      //             ),
      //           ),
      //           SizedBox(
      //             height: 10,
      //           ),
      //           Container(
      //             height: 30,
      //             width: double.infinity,
      //             child: Align(
      //               alignment: Alignment.center,
      //               child: Text(
      //                 'DATA SETELAH DI SORTING',
      //                 style: TextStyle(
      //                   color: Colors.black,
      //                   fontWeight: FontWeight.bold,
      //                 ),
      //               ),
      //             ),
      //             decoration: BoxDecoration(
      //               color: Colors.green[200],
      //               borderRadius: BorderRadius.only(
      //                 topLeft: Radius.circular(10),
      //                 topRight: Radius.circular(10),
      //               ),
      //             ),
      //           ),
      //           // Bagian Data Yang Sudah Di Tentukan (TAHAP 3)
      //           Container(
      //             child: Text('${list}'),
      //             padding: EdgeInsets.all(10),
      //             height: 130,
      //             width: double.infinity,
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.only(
      //                   bottomLeft: Radius.circular(10),
      //                   bottomRight: Radius.circular(10)),
      //               color: Colors.grey[350],
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
