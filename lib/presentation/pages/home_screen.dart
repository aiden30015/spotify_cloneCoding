import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spotify_clone/presentation/providers/home_provider.dart';
import 'package:spotify_clone/presentation/widgets/top_button.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedTopButtonProvider);

    final texts = ['전체', '음악', '팟캐스트'];
    final actions = [
      () {
        ref.read(selectedTopButtonProvider.notifier).state = 0;
      },
      () {
        ref.read(selectedTopButtonProvider.notifier).state = 1;
      },
      () {
        ref.read(selectedTopButtonProvider.notifier).state = 2;
      },
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 60),
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                spacing: 10,
                children: [
                  TopButton(
                    text: '이',
                    color: Colors.blue,
                    textColor: Colors.black,
                    onPressed: () {},
                  ),
                  ...List.generate(texts.length, (index) {
                    return TopButton(
                      text: texts[index],
                      color: selectedIndex == index ? Colors.green : Colors.grey,
                      textColor: selectedIndex == index ? Colors.black : Colors.white,
                      onPressed: actions[index],
                    );
                  }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
