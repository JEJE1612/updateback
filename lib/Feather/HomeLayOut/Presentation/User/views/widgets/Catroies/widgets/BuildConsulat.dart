import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/Catroies/widgets/Reating.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/Catroies/widgets/consltantProfail.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/mangment/my_bloc.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/mangment/my_state.dart';
import 'package:flutter_application_1/core/utils/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildConsulat extends StatelessWidget {
  int i;
  BuildConsulat({super.key, required this.i});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyBloc, MyState>(listener: (context, state) {
      
    }, builder: (context, state) {

      return InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ConsltantProfail(),
              ));
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 3),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.grey[300]),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(
                        MyBloc.get(context).dataanyconsult[i]['image'],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        MyBloc.get(context).dataanyconsult[i]['name'],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.textStyle16.copyWith(
                          color: const Color(0xff060E1E),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        MyBloc.get(context).dataanyconsult[i]['bio'],
                        style: Styles.textStyle14.copyWith(
                          color: Theme.of(context).colorScheme.brightness ==
                                  Brightness.dark
                              ? Colors.white
                              : Colors.black45,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                const BookReating(),
              ],
            ),
          ),
        ),
      );
    });
  }
}
