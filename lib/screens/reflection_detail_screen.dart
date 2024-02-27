import 'package:flutter/material.dart';
import '../models/reflection.dart';

class ReflectionDetailScreen extends StatelessWidget {
  final bool Function(Reflection) isReflectionDay;

  const ReflectionDetailScreen(this.isReflectionDay, {Key? key})
      : super(key: key);

  Widget _createSectionTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  Widget _createSectionContainer(Widget child) {
    return Container(
      width: 350,
      height: 350,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final reflection = ModalRoute.of(context)!.settings.arguments as Reflection;

    return Scaffold(
      appBar: AppBar(
        title: Text(reflection.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.asset(
                reflection.imagePath,
                fit: BoxFit.cover,
              ),
            ),
            _createSectionTitle(context,
                'Reflexão do Dia ${reflection.day}/${reflection.monthInt}'),
            _createSectionContainer(ListView.builder(
              itemCount: reflection.paragraphs.length,
              itemBuilder: (ctx, index) {
                return Column(
                  children: [
                    ListTile(
                      titleAlignment: ListTileTitleAlignment.top,
                      iconColor: Theme.of(context).colorScheme.primary,
                      leading: const Icon(
                        Icons.label_important,
                      ),
                      title: Text(reflection.paragraphs[index]),
                    ),
                    const Divider(),
                  ],
                );
              },
            )),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Icon(
          isReflectionDay(reflection) ? Icons.cake : Icons.cake_outlined,
          color: Colors.green,
        ),
        onPressed: () {},
      ),
    );
  }
}
