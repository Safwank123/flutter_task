
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class AutoCompleteTextField extends StatefulWidget {
//   final String hintText;

//   const AutoCompleteTextField({super.key, required this.hintText});

//   @override
//   State<AutoCompleteTextField> createState() => _AutoCompleteTextFieldState();
// }

// class _AutoCompleteTextFieldState extends State<AutoCompleteTextField> {
//   final TextEditingController _controller = TextEditingController();
//   List<String> _suggestions = [];
//   bool _isLoading = false;

//   void _fetchSuggestions(String input) async {
//     if (input.isEmpty) {
//       setState(() {
//         _suggestions = [];
//       });
//       return;
//     }

//     setState(() => _isLoading = true);
//     final url = 'https://restcountries.com/v3.1/name/$input';

//     try {
//       final response = await http.get(Uri.parse(url));

//       if (response.statusCode == 200) {
//         final List data = json.decode(response.body);
//         final List<String> countryNames =
//             data.map<String>((e) => e['name']['common'].toString()).toList();

//         setState(() {
//           _suggestions = countryNames;
//         });
//       } else {
//         setState(() {
//           _suggestions = [];
//         });
//       }
//     } catch (e) {
//       setState(() {
//         _suggestions = [];
//       });
//     } finally {
//       setState(() => _isLoading = false);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//      TextField(
//   controller: _controller,
//   onChanged: _fetchSuggestions,
//   style: const TextStyle(color: Colors.black), 
//   decoration: InputDecoration(
    
//     hintText: widget.hintText,
//     hintStyle: const TextStyle(color: Colors.grey), // Hint = grey
//     suffixIcon: _isLoading
//         ? const Padding(
//             padding: EdgeInsets.all(10.0),
//             child: SizedBox(
//               width: 20,
//               height: 20,
//               child: CircularProgressIndicator(strokeWidth: 2),
//             ),
//           )
//         : null,
//     border: OutlineInputBorder(
//       borderSide: BorderSide(color: Colors.grey),
//       borderRadius: BorderRadius.circular(8),
//     ),
//   ),
  
// ),


//         if (_suggestions.isNotEmpty)
//           Container(
//             constraints: const BoxConstraints(maxHeight: 200),
//             margin: const EdgeInsets.only(top: 5),
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.grey),
//               borderRadius: BorderRadius.circular(8),
//               color: Colors.white,
//             ),
//             child: ListView.builder(
//               shrinkWrap: true,
//               itemCount: _suggestions.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(_suggestions[index]),
//                   onTap: () {
//                     _controller.text = _suggestions[index];
//                     setState(() => _suggestions = []);A
//                   },
//                 );
//               },
//             ),
//           ),
//       ],
//     );
//   }
// }
