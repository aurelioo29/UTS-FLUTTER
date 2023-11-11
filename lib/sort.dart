import 'package:flutter/material.dart';

class SortPages extends StatefulWidget {
  const SortPages({super.key});

  @override
  State<SortPages> createState() => _SortPagesState();
}

class _SortPagesState extends State<SortPages> {
  final formKey = GlobalKey<FormState>();
  final tecData = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Maximum Sort"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Container(),
      ),
      // Container(
      //   height: 2000,
      //   decoration: BoxDecoration(
      //       borderRadius: BorderRadius.only(
      //         topLeft: Radius.circular(50),
      //         topRight: Radius.circular(50),
      //       ),
      //       color: Colors.amber),
      //   padding: EdgeInsets.all(10),
      //   child: Form(
      //     child: Column(
      //       children: [
      //         SizedBox(
      //           width: 300,
      //           child: TextFormField(
      //             style: TextStyle(color: Colors.green),
      //             decoration: InputDecoration(
      //               labelText: 'Angka di Sorting',
      //               hintText: 'Masukan angka yang ingin di sorting',
      //               border: OutlineInputBorder(
      //                 borderRadius: BorderRadius.circular(10),
      //               ),
      //               enabledBorder: OutlineInputBorder(
      //                 borderSide: BorderSide(color: Colors.redAccent),
      //               ),
      //               prefixIcon: Icon(Icons.numbers),
      //             ),
      //             keyboardType: TextInputType.number,
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      // Padding(
      //   padding: EdgeInsets.all(15),
      //   child: Form(
      //     key: formKey,
      //     child: Column(
      //       children: [
      //         TextFormField(
      //           controller: tecData,
      //           validator: (value) => value == null || value.isEmpty
      //               ? 'Data tersebut masih kosong'
      //               : null,
      //           decoration: InputDecoration(
      //             labelText: 'Masukan jumlah data ',
      //             border: OutlineInputBorder(
      //               borderRadius: BorderRadius.circular(10),
      //             ),
      //           ),
      //         ),
      //         SizedBox(
      //           height: 7,
      //         ),
      //         ButtonBar(
      //           alignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             ElevatedButton(
      //               style:
      //                   ElevatedButton.styleFrom(backgroundColor: Colors.red),
      //               onPressed: () {},
      //               child: Text(
      //                 "Input Data",
      //                 style: TextStyle(color: Colors.white),
      //               ),
      //             ),
      //             ElevatedButton(
      //               style: ElevatedButton.styleFrom(
      //                   backgroundColor: Colors.cyanAccent),
      //               onPressed: () {},
      //               child: Text("Hapus Data"),
      //             ),
      //           ],
      //         ),
      //         SizedBox(
      //           height: 7,
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
