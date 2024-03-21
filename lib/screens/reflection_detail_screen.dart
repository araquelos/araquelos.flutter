import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import '../models/reflection.dart';

class ReflectionDetailScreen extends StatelessWidget {
  final bool Function(Reflection) isReflectionDay;

  const ReflectionDetailScreen(this.isReflectionDay, {Key? key}) : super(key: key);

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
    final player = AudioPlayer();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      /*await player.setAudioSource(AudioSource.uri(Uri.parse("asset:///audios/oracao.m4a")));*/
      await player.setAudioSource(AudioSource.uri(Uri.parse(
          "https://dc572.4shared.com/img/RvhzCFRPjq/f10ca6b7/dlink__2Fdownload_2FRvhzCFRPjq_2Foracao.mp3_3Fsbsr_3Df11d1fda0bc304a2a5ae4c1fcaa9a30fb0d_26bip_3DMTc5LjE3Ni4yMzMuMTE0_26lgfp_3D52_26bip_3DMTc5LjE3Ni4yMzMuMTE0/preview.mp3")));
      if (reflection.day == 0) {
        await player.play();
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(reflection.title),
        titleSpacing: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 230,
              width: double.infinity,
              child: Image.asset(
                reflection.imagePath,
                fit: BoxFit.cover,
              ),
            ),
            _createSectionTitle(context,
                reflection.day != 0 ? 'Reflexão do Dia ${reflection.day}/${reflection.monthInt}' : 'Oração Diária'),
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
      floatingActionButton: Visibility(
        visible: reflection.day == 0 ? false : true,
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          mini: true,
          child: Icon(
            isReflectionDay(reflection) ? Icons.cake : Icons.cake_outlined,
            color: Colors.green,
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
