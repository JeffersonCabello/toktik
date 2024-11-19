import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/infrastructure/repositories/video_posts_repository_impl.dart';

class DiscoverProvider extends ChangeNotifier {
  final VideoPostsRepositoryImpl videoPostRepository;

  bool initialLoading = true;
  List<VideoPost> videos = [];

  DiscoverProvider({required this.videoPostRepository});

  Future<void> loadNextPage() async {
    //todo: Cargar videos
    //await Future.delayed(const Duration(seconds: 2));
    //final List<VideoPost> newVideos = videoPosts
    //  .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
    //.toList();

    final newVideos = await videoPostRepository.getTrendingVideosByPage(1);

    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}
