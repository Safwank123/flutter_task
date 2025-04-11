import 'package:flutter/material.dart';
import 'package:spring_edge/widgets/auto_complete_textfeild.dart';
import 'package:spring_edge/widgets/custom_checkbox.dart';
import 'package:spring_edge/widgets/custom_textfeild.dart';
import 'package:spring_edge/widgets/info_row.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isNearbyOriginChecked = false;
  bool isNearbyDestinationChecked = false;
  bool isFCLChecked = false;
  bool isLCLChecked = false;
  String? selectedCommodity;
  final TextEditingController _cutOffDateController = TextEditingController();
  final TextEditingController _commodityController = TextEditingController();


  final List<String> commodities = [
    'Wheat', 'Rice', 'Corn', 'Barley',
    'Sugar', 'Coffee', 'Cotton', 'Soybeans',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 223, 220, 232),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 231, 235, 237),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Search the best Freight Rates',
              style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w500),
            ),
            Container(
              height: 40,
              width: 104,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(36),
              ),
              child: const Center(
                child: Text(
                  'History',
                  style: TextStyle(color: Colors.blue, fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Origin & Destination
                Row(
                  children: const [
                    Expanded(child: AutoCompleteTextField(hintText: "Origin")),
                    SizedBox(width: 10),
                    Expanded(child: AutoCompleteTextField(hintText: "Destination")),
                  ],
                ),
                const SizedBox(height: 10),

                /// Nearby port checkboxes
                Row(
                  children: [
                    Expanded(
                      child: CustomCheckbox(
                        value: isNearbyOriginChecked,
                        onChanged: (val) => setState(() => isNearbyOriginChecked = val!),
                        label: "Include nearby origin ports",
                      ),
                    ),
                    Expanded(
                      child: CustomCheckbox(
                        value: isNearbyDestinationChecked,
                        onChanged: (val) => setState(() => isNearbyDestinationChecked = val!),
                        label: "Include nearby destination ports",
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                /// Commodity & Date
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        hintText: "Commodity",
                        suffixIconPath: 'assets/arrow_downword.png',
                        controller: _commodityController,
                        onSuffixTap: () async {
                          final result = await showDialog<String>(
                            context: context,
                            builder: (context) => SimpleDialog(
                              title: const Text('Select Commodity'),
                              children: commodities
                                  .map((item) => SimpleDialogOption(
                                        onPressed: () => Navigator.pop(context, item),
                                        child: Text(item),
                                      ))
                                  .toList(),
                            ),
                          );
                          if (result != null) {
                            setState(() {
                              selectedCommodity = result;
                            });
                          }
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: CustomTextField(
                        controller: _cutOffDateController,
                        hintText: "Cut Off Date",
                        suffixIconPath: 'assets/calendar-2.png',

                       onSuffixTap: () async {
  final pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2100),
  );
  if (pickedDate != null) {
    final formattedDate = "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
    _cutOffDateController.text = formattedDate;
  }
},


                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                /// Shipment Type
                const Text(
                  'Shipment Type :',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    CustomCheckbox(
                      value: isFCLChecked,
                      onChanged: (val) => setState(() => isFCLChecked = val!),
                    ),
                    const Text('FCL'),
                    const SizedBox(width: 20),
                    CustomCheckbox(
                      value: isLCLChecked,
                      onChanged: (val) => setState(() => isLCLChecked = val!),
                    ),
                    const Text('LCL'),
                  ],
                ),
                const SizedBox(height: 10),

                /// Container Info
                Row(
                  children: [
                    SizedBox(
                      width: 652,
                      child: TextField(
                        decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always, 
                          hintText: "  40’ Standard",
                          labelText: 'Container Type',
                             hintStyle: TextStyle(color: Colors.grey),
                          labelStyle: TextStyle(color: Colors.grey),
                          suffixIcon: Image.asset('assets/arrow_downword.png'),
                          border: const OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                             hintStyle: TextStyle(color: Colors.grey),
                          labelStyle: TextStyle(color: Colors.grey),
                          labelText: 'No of Boxes',
                          border: const OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                             hintStyle: TextStyle(color: Colors.grey),
                          labelStyle: TextStyle(color: Colors.grey),
                          labelText: 'Weight (Kg)',
                          border: const OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                /// Info Note
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/info-circle.png', width: 24, height: 24),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: Text(
                        'To obtain accurate rate for spot rate with guaranteed space and booking, please ensure your container count and weight per container is accurate.',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                /// Container Dimensions
                const Text(
                  'Container Internal Dimensions :',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        InfoRow(label: "Length", value: '39.46 ft'),
                        SizedBox(height: 5),
                        InfoRow(label: "Width", value: '7.70 ft'),
                        SizedBox(height: 5),
                        InfoRow(label: "Height", value: '7.84 ft'),
                      ],
                    ),
                    const SizedBox(width: 40),
                    Image.asset("assets/container image  1.png", height: 85),
                  ],
                ),
                const SizedBox(height: 20),

                /// Bottom Search/History Button
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    height: 45,
                    width: 130,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(36),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/search-normal.png', height: 20),
                        const SizedBox(width: 5),
                        const Text(
                          'History',
                          style: TextStyle(color: Colors.blue, fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
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
