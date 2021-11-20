import 'package:flutter/material.dart';
import 'package:flutterweekend/Components/icne_text.dart';
import 'package:flutterweekend/constants/app_colors.dart';
import 'package:flutterweekend/model/task.dart';
import '../main.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  const TaskCard({
    required this.task,
  });
  @override
  Widget build(BuildContext context) {
    // print(product.productId);
    return
        // Bounce(
        // onTap: () => Navigator.pushNamed(context, 'ProductScreen', arguments: {'product': product, 'liked': liked}),
        Container(
      height: 100,
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: kBoxShadow,
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 0, right: 40),
            child: Row(
              children: <Widget>[
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(task.imageURL)),
                      borderRadius: BorderRadius.circular(7)),
                ),
                const SizedBox(width: 15),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(task.taskName,
                          style: const TextStyle(fontSize: 15), maxLines: 1, overflow: TextOverflow.ellipsis),
                      Column(
                        children: const [
                          IconText(
                            icon: Icons.person,
                            text: 'vildeted by:',
                          ),
                          SizedBox(height: 5),
                          IconText(icon: Icons.access_time, text: ''),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          // authBloc.userId != product.userId
          //     ? LikeButton(
          //         productId: product.productId,
          //         liked: liked,
          //       )
          //     : Container()
        ],
      ),
    );
    // );
  }
}
