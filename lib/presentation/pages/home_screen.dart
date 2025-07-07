import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:spotify_clone/presentation/providers/home_provider.dart';
import 'package:spotify_clone/presentation/widgets/top_button.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myAlbum = ref.watch(albumViewModelProvider);
    final selectedIndex = ref.watch(selectedTopButtonProvider);

    // 최초 진입 시 한 번만 loadAlbums 호출 (비동기로 실행)
    useEffect(() {
      Future.microtask(() {
        ref.read(albumViewModelProvider.notifier).loadAlbums();
      });
      return null;
    }, []);

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
        child: Column(
          children: [
            Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.start,
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
            ),
            const SizedBox(height: 16),
            Expanded(
              child: myAlbum.isLoading
                  ? const Center(child: CircularProgressIndicator(color: Colors.white))
                  : myAlbum.error != null
                      ? Center(
                          child: Text(
                            '에러 발생: ${myAlbum.error}',
                            style: const TextStyle(color: Colors.red),
                          ),
                        )
                      : ListView.builder(
                          itemCount: myAlbum.albums.length,
                          itemBuilder: (context, index) {
                            final album = myAlbum.albums[index];
                            return Container(
                              width: 100,
                              height: 100,
                              child: Row(
                                children: [
                                  Text(album.name),
                                ],
                              ),
                            );
                          },
                        ),
            ),
            
          ],
        ),
      ),
    );
  }
}
