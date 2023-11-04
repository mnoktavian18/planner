import 'package:budget_plan/types/item_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  final formKey = GlobalKey<FormState>();
  TextEditingController dateInput = TextEditingController();
  TextEditingController valueInput = TextEditingController();
  bool? checkInput = false;
  List<ItemType> item = [];

  void checkInputChange(bool? value) {
    setState(() {
      if (value == null) {
        setState(() {
          item.clear();
        });
        return;
      }

      if (item.isEmpty) {
        setState(() {
          item.add(ItemType(itemName: '', itemValue: 0));
        });
      }

      valueInput.text = value ? '0' : '';
      checkInput = value;
    });
  }

  @override
  void initState() {
    dateInput.text = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        title: const Text(
          'Tambah Baru',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        leading: BackButton(
          style: ButtonStyle(
            iconSize: MaterialStateProperty.resolveWith((states) => 20),
            overlayColor: MaterialStateColor.resolveWith(
              (states) => Colors.transparent,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.white,
        ),
      ),
      body: Form(
        key: formKey,
        child: Container(
          padding: const EdgeInsets.all(30),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      bottom: 10,
                    ),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Nama',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          TextSpan(
                            text: ' *',
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ),
                  TextFormField(
                    autocorrect: false,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.abc_rounded),
                      prefixIconColor: Colors.grey[400],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 189, 189, 189),
                        ),
                      ),
                      isDense: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Tanggal Realisasi',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          TextSpan(
                            text: ' *',
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: dateInput,
                    autocorrect: false,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.date_range_rounded),
                      prefixIconColor: Colors.grey[400],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 189, 189, 189),
                        ),
                      ),
                      isDense: true,
                    ),
                    onTap: () async {
                      DateTime? selectedDate = await showDatePicker(
                        context: context,
                        initialDate: DateFormat('yyyy-MM-dd').parse(
                          dateInput.text == ''
                              ? DateTime.now().toString()
                              : dateInput.text,
                        ),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(
                          const Duration(days: 100 * 365),
                        ),
                      );

                      if (selectedDate != null) {
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(selectedDate);
                        setState(() {
                          dateInput.text = formattedDate;
                        });
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      bottom: 10,
                    ),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Nilai',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: valueInput,
                    enabled: checkInput != true,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    autocorrect: false,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.money_rounded),
                      prefixIconColor: Colors.grey[400],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 189, 189, 189),
                        ),
                      ),
                      isDense: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                    width: 20,
                    child: Checkbox(
                      value: checkInput,
                      onChanged: checkInputChange,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Input Nilai Dengan Rincian?',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              checkInput == true
                  ? Column(
                      children: [
                        Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: Divider(),
                            ),
                            Column(
                              children: item
                                  .map(
                                    (e) => Row(
                                      children: [
                                        Text(e.itemName),
                                        Text(e.itemValue.toString())
                                      ],
                                    ),
                                  )
                                  .toList(),
                            )
                          ],
                        ),
                      ],
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(0),
        child: Container(
          padding: const EdgeInsets.all(10),
          color: Colors.blue[300],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: checkInput == true
                    ? () {
                        setState(() {
                          item.add(ItemType(
                            itemName: '',
                            itemValue: 0,
                          ));
                        });
                      }
                    : null,
                child: const Text('Tambah Rincian'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                  }
                },
                child: const Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
