// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/views/widgets/Catroies/widgets/Allconslatme.dart';
// import 'package:flutter_application_1/core/utils/assets.dart';
// import 'package:flutter_application_1/core/utils/styles.dart';

// class GradViewBuilder extends StatelessWidget {
//   const GradViewBuilder({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => const AllConaltant(),
//             ));
//       },
//       child: Container(
//         decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
//         child: Column(
//           children: [
//             Card(
//               elevation: 20,
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: 150,
//                     child: Image.asset(
//                       AssetsData.logo,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   Text(
//                     "Theather",
//                     style: Styles.textStyle18,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/Catroies/widgets/allconsultantincategory.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/mangment/my_bloc.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/mangment/my_state.dart';
import 'package:flutter_application_1/core/Model/catroies_model.dart';
import 'package:flutter_application_1/core/utils/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GradViewBuilder extends StatelessWidget {
  const GradViewBuilder({Key? key, required this.model}) : super(key: key);
  final CatroiesModel model;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyBloc, MyState>(listener: (context, state) {
  
       
    }, builder: (context, state) {
      

      return InkWell(
          onTap: () {
            MyBloc.get(context).dataanyconsult.clear();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AllConaltanttogatogry( '',model:model,),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(model.catoiesImage ??
                    "https://firebasestorage.googleapis.com/v0/b/consultme-2be0e.appspot.com/o/user%2F1000297238.jpg?alt=media&token=23b3f3e1-46c1-448d-818e-8a384c6d8445"),
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 4,
                  offset: Offset(4, 8), // Shadow position
                ),
              ],
            ),
            child: Align(
                alignment: Alignment.center,
                child: Text(
                  "${model.text} ",
                  style: Styles.textStyle18.copyWith(color: Colors.white),
                )),
          ));
    });
  }
}
