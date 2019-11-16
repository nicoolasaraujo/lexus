// import 'package:flutter/material.dart';
// import 'package:lexus/app/components/option_card.dart';

// class CustomGridList<T> extends StatefulWidget {
//   List<T> itemList;

//   @override
//   _CustomGridListState createState() => _CustomGridListState<T>();
// }

// class _CustomGridListState<T> extends State<CustomGridList> {
//   @override
//   Widget build(BuildContext context) {
//         return StreamBuilder<List<T>>(
//       stream: genderBloc.outGenderList,
//       builder: (context, snapshot) {
//         if (snapshot != null && snapshot.hasData) {
//           var list = snapshot.data;
//           return GridView.builder(
//             shrinkWrap: true,
//             gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2),
//             itemCount: list.length,
//             itemBuilder: (_, index) {
//               var itemGender = list[index];
//               return StreamBuilder<Gender>(
//                 stream: genderBloc.outSelectedGender,
//                 builder: (context, snapshot) {
//                   if (snapshot.hasData) {
//                     return Center(
//                         heightFactor: 1,
//                         child: OptionCard(
//                             description: itemGender.description,
//                             selected: itemGender.id == snapshot.data.id,
//                             imagePath: itemGender.imgPath,
//                             index: index,
//                             handleTap: genderBloc.changeSelectedGender));
//                   } else
//                     return Center(
//                         heightFactor: 1,
//                         child: Container(
//                             margin: EdgeInsets.all(2),
//                             child: OptionCard(
//                                 description: itemGender.description,
//                                 selected: false,
//                                 imagePath: itemGender.imgPath,
//                                 index: index,
//                                 handleTap: genderBloc.changeSelectedGender)));
//                 },
//               );
//             },
//           );
//         } else {
//           return Center(child: Text("Nenhum registro encontrado!"));
//         }
//       },
//     );
//   }
// }


  