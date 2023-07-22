// import 'package:flutter/material.dart';

// class AboutScreen extends StatefulWidget {
//   final String name;
//   final String phoneNumber;
//   final bool isFavorite;

//   AboutScreen({
//     required this.name,
//     required this.phoneNumber,
//     required this.isFavorite,
//   });

//   @override
//   _AboutScreenState createState() => _AboutScreenState();
// }

// class _AboutScreenState extends State<AboutScreen> {
//   final TextEditingController firstNameController = TextEditingController();
//   final TextEditingController lastNameController = TextEditingController();
//   final TextEditingController phoneNoController = TextEditingController();
//   bool isFavorite = false;

//   @override
//   void initState() {
//     // Initialize the controllers with the existing contact details
//     var nameParts = widget.name.split(' ');
//     firstNameController.text = nameParts[0];
//     lastNameController.text = nameParts.length > 1 ? nameParts[1] : '';
//     phoneNoController.text = widget.phoneNumber;
//     isFavorite = widget.isFavorite;
//     super.initState();
//   }

//   void updateContact(BuildContext context) {
//     String updatedName = firstNameController.text + ' ' + lastNameController.text;
//     String updatedNumber = phoneNoController.text;

//     // Update the contact in the contacts list
//     setState(() {
//       for (int i = 0; i < contacts.length; i++) {
//         if (contacts[i]['name'] == widget.name && contacts[i]['phoneNumber'] == widget.phoneNumber) {
//           contacts[i]['name'] = updatedName;
//           contacts[i]['phoneNumber'] = updatedNumber;
//           contacts[i]['isFavorite'] = isFavorite;
//           break;
//         }
//       }
//     });

//     Navigator.of(context).pop(); // Close the dialog
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Contact Details'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             CircleAvatar(
//               backgroundColor: Colors.lightBlueAccent,
//               radius: 50,
//               child: Icon(Icons.person, size: 50, color: Colors.white),
//             ),
//             SizedBox(height: 16),
//             Text(
//               'Name:',
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//             ),
//             SizedBox(height: 4),
//             Row(
//               children: [
//                 Expanded(
//                   child: TextFormField(
//                     controller: firstNameController,
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       labelText: 'First Name',
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 8),
//                 Expanded(
//                   child: TextFormField(
//                     controller: lastNameController,
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       labelText: 'Last Name',
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//             Text(
//               'Phone Number:',
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//             ),
//             SizedBox(height: 4),
//             TextFormField(
//               controller: phoneNoController,
//               keyboardType: TextInputType.phone,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 labelText: 'Phone Number',
//               ),
//             ),
//             SizedBox(height: 16),
//             Row(
//               children: [
//                 Text(
//                   'Favorite:',
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//                 ),
//                 SizedBox(width: 8),
//                 Checkbox(
//                   value: isFavorite,
//                   onChanged: (newValue) {
//                     setState(() {
//                       isFavorite = newValue ?? false;
//                     });
//                   },
//                 ),
//               ],
//             ),
//             Spacer(),
//             Center(
//               child: ElevatedButton(
//                 onPressed: () => updateContact(context),
//                 child: Text('Save'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
