// import 'package:date_time_picker/date_time_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// import 'addTaskEvent.dart';

// class MyHomePage extends StatefulWidget {
//   // TaskModel? taskTemp;
//   MyHomePage({
//     Key? key,
//   }) : super(key: key);

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   GlobalKey<FormState> _oFormKey = GlobalKey<FormState>();
//   late TextEditingController _controller1;
//   late TextEditingController _controller2;
//   late TextEditingController _controller3;
//   late TextEditingController _controller4;

//   String _initialValue = '';
//   // String _valueChanged1 = '';
//   // String _valueToValidate1 = '';
//   // String _valueSaved1 = '';
//   String _valueChanged2 = '';
//   String _valueToValidate2 = '';
//   String _valueSaved2 = '';
//   // String _valueChanged3 = '';
//   // String _valueToValidate3 = '';
//   // String _valueSaved3 = '';
//   // String _valueChanged4 = '';
//   // String _valueToValidate4 = '';
//   // String _valueSaved4 = '';

//   @override
//   void initState() {
//     super.initState();
//     Intl.defaultLocale = 'pt_BR';
//     _initialValue = DateTime.now().toString();
//     _controller1 = TextEditingController(text: DateTime.now().toString());
//     _controller2 = TextEditingController(text: DateTime.now().toString());
//     _controller3 = TextEditingController(text: DateTime.now().toString());

//     String lsHour = TimeOfDay.now().hour.toString().padLeft(2, '0');
//     String lsMinute = TimeOfDay.now().minute.toString().padLeft(2, '0');
//     _controller4 = TextEditingController(text: '$lsHour:$lsMinute');

//     _getValue();
//   }

//   /// This implementation is just to simulate a load data behavior
//   /// from a data base sqlite or from a API
//   Future<void> _getValue() async {
//     await Future.delayed(const Duration(), () {
//       // await Future.delayed(const Duration(seconds: 3), () {
//       setState(() {
//         _initialValue = '2000-10-22 14:30';
//         _controller1.text = '2000-09-20 14:30';
//         // _controller2.text = '2001-10-21 15:31';
//         _controller3.text = '2002-11-22';
//         _controller4.text = '17:01';
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     taskTemp?.date = DateTime.now().toString();
//     return Form(
//       key: _oFormKey,
//       child: Padding(
//         padding: const EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 2),
//         child: Column(
//           children: <Widget>[
//             // DateTimePicker(
//             //   decoration: const InputDecoration(
//             //     // focusColor: rWhite,
//             //     // fillColor: rWhite,
//             //     enabledBorder: OutlineInputBorder(
//             //       borderSide: BorderSide(color: rWhite),
//             //     ),
//             //     focusedBorder: OutlineInputBorder(
//             //       borderSide: BorderSide(color: rWhite),
//             //     ),
//             //     labelText: 'Date and time',
//             //     labelStyle: TextStyle(
//             //         fontWeight: FontWeight.w500,
//             //         fontFamily: 'comic',
//             //         fontSize: 16,
//             //         color: rWhite),
//             //     hintText: 'Enter Your Name',
//             //     hintStyle: TextStyle(
//             //         fontWeight: FontWeight.w500,
//             //         fontFamily: 'comic',
//             //         fontSize: 16,
//             //         color: rWhite),
//             //   ),
//             //   type: DateTimePickerType.dateTime,
//             //   dateMask: 'd MMMM  yyyy  hh:mm a',
//             //   style: const TextStyle(
//             //       fontWeight: FontWeight.w500,
//             //       fontFamily: 'comic',
//             //       fontSize: 17,
//             //       color: rWhite),
//             //   controller: _controller2,
//             //   initialValue: _initialValue,
//             //   firstDate: DateTime(2021),
//             //   lastDate: DateTime(2100),
//             //   // icon: Icon(Icons.event),
//             //   // dateLabelText: 'Date Time',
//             //   use24HourFormat: false,
//             //   locale: Locale('en', 'US'),
//             //   onChanged: (val) => setState(() => _valueChanged2 = val),
//             //   validator: (val) {
//             //     setState(() => _valueToValidate2 = val ?? '');
//             //     return null;
//             //   },
//             //   onSaved: (val) => setState(() => _valueSaved2 = val ?? ''),
//             // ),

//             DateTimePicker(
//                 decoration: const InputDecoration(
//                   // focusColor: rWhite,
//                   // fillColor: rWhite,
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: rWhite),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: rWhite),
//                   ),
//                   labelText: 'Date and time',
//                   labelStyle: TextStyle(
//                       fontWeight: FontWeight.w500,
//                       fontFamily: 'comic',
//                       fontSize: 16,
//                       color: rWhite),
//                   hintText: 'Enter Your Name',
//                   hintStyle: TextStyle(
//                       fontWeight: FontWeight.w500,
//                       fontFamily: 'comic',
//                       fontSize: 16,
//                       color: rWhite),
//                 ),
//                 type: DateTimePickerType.dateTime,
//                 // dateMask: 'd MMMM, yyyy - hh:mm a',
//                 dateMask: 'd MMM yyyy - hh:mm a',
//                 style: const TextStyle(
//                     fontWeight: FontWeight.w500,
//                     fontFamily: 'comic',
//                     fontSize: 17,
//                     color: rWhite),
//                 controller: _controller2,
//                 //initialValue: _initialValue,
//                 firstDate: DateTime(2000),
//                 lastDate: DateTime(2100),
//                 //icon: Icon(Icons.event),
//                 // dateLabelText: 'Date Time',
//                 use24HourFormat: false,
//                 locale: Locale('en', 'US'),
//                 onChanged: (val) {
//                   setState(() => _valueChanged2 = val);
//                   // taskTemp?.date = _controller2.text;
//                   tempDate = _controller2.text;
//                   // print(_controller2.text);
//                   // print(taskTemp?.date);
//                   // print(tempDate);
//                   // print('1');
//                 },
//                 validator: (val) {
//                   setState(() => _valueToValidate2 = val ?? '');
//                   // print(taskTemp!.date);
//                   print('2');
//                   return null;
//                 },
//                 onSaved: (val) {
//                   setState(() => _valueSaved2 = val ?? '');
//                   taskTemp!.date = _controller2.text;
//                   // print(_controller2.text);
//                   print('3');
//                 }),

//             // SizedBox(height: 10),
//             // SelectableText(_valueChanged1),
//             // SelectableText(_valueChanged2),
//             // SelectableText(_valueChanged3),
//             // SelectableText(_valueChanged4),
//             // SizedBox(height: 10),
//             // ElevatedButton(
//             //   onPressed: () {
//             //     final loForm = _oFormKey.currentState;

//             //     if (loForm?.validate() == true) {
//             //       loForm?.save();
//             //     }
//             //   },
//             //   child: Text('Submit'),
//             // ),
//             // SizedBox(height: 30),
//             // Text(
//             //   'DateTimePicker data value validator:',
//             //   style: TextStyle(fontWeight: FontWeight.bold),
//             // ),
//             // SizedBox(height: 10),
//             // SelectableText(_valueToValidate1),
//             // SelectableText(_valueToValidate2),
//             // SelectableText(_valueToValidate3),
//             // SelectableText(_valueToValidate4),
//             // SizedBox(height: 10),
//             // Text(
//             //   'DateTimePicker data value onSaved:',
//             //   style: TextStyle(fontWeight: FontWeight.bold),
//             // ),
//             // SizedBox(height: 10),
//             // SelectableText(_valueSaved1),
//             // SelectableText(_valueSaved2),
//             // SelectableText(_valueSaved3),
//             // SelectableText(_valueSaved4),
//             // SizedBox(height: 20),
//             // ElevatedButton(
//             //   onPressed: () {
//             //     final loForm = _oFormKey.currentState;
//             //     loForm?.reset();

//             //     setState(() {
//             //       _valueChanged1 = '';
//             //       _valueChanged2 = '';
//             //       _valueChanged3 = '';
//             //       _valueChanged4 = '';
//             //       _valueToValidate1 = '';
//             //       _valueToValidate2 = '';
//             //       _valueToValidate3 = '';
//             //       _valueToValidate4 = '';
//             //       _valueSaved1 = '';
//             //       _valueSaved2 = '';
//             //       _valueSaved3 = '';
//             //       _valueSaved4 = '';
//             //     });

//             //     _controller1.clear();
//             //     _controller2.clear();
//             //     _controller3.clear();
//             //     _controller4.clear();
//             //   },
//             //   child: Text('Reset'),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }
