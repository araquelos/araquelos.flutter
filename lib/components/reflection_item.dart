import 'package:flutter/material.dart';
import '../models/reflection.dart';
import '../utils/app_routes.dart';

class ReflectionItem extends StatelessWidget {
  final Reflection reflection;

  const ReflectionItem(this.reflection, {Key? key}) : super(key: key);

  void _selectReflection(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      AppRoutes.reflectionDetail,
      arguments: reflection,
    )
        .then((result) {
      if (result == null) {
        print('Sem resultado!');
      } else {
        print('O nome da reflexão é $result.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectReflection(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.asset(
                    reflection.imagePath,
                    height: 210,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: const Color.fromARGB(138, 76, 175, 80),
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      reflection.title,
                      style: const TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Visibility(
                visible: reflection.day == 0 ? false : true,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.calendar_today),
                        const SizedBox(width: 6),
                        Text(reflection.day.toString()),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.calendar_month),
                        const SizedBox(width: 6),
                        Text(reflection.monthText),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.label_outline),
                        const SizedBox(width: 6),
                        Text(reflection.tagText),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
