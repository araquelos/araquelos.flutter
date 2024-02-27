import 'package:flutter/material.dart';
import '../models/reflection.dart';

class MealDetailScreen extends StatelessWidget {
  final Function(Reflection) onToggleFavorite;
  final bool Function(Reflection) isFavorite;

  const MealDetailScreen(this.onToggleFavorite, this.isFavorite, {Key? key}) : super(key: key);

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
    final meal = ModalRoute.of(context)!.settings.arguments as Reflection;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.asset(
                meal.imagePath,
                fit: BoxFit.cover,
              ),
            ),
            _createSectionTitle(context, 'Reflexão'),
            _createSectionContainer(ListView.builder(
              itemCount: meal.paragraphs.length,
              itemBuilder: (ctx, index) {
                return Column(
                  children: [
                    ListTile(
                      titleAlignment: ListTileTitleAlignment.top,
                      iconColor: Theme.of(context).colorScheme.primary,
                      leading: const Icon(
                        Icons.label_important,
                      ),
                      title: Text(meal.paragraphs[index]),
                    ),
                    const Divider(),
                  ],
                );
              },
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(isFavorite(meal) ? Icons.cake : Icons.cake_outlined),
        onPressed: () {
          //onToggleFavorite(meal);
        },
      ),
    );
  }
}
