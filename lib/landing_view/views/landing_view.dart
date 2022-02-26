import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jyuk/landing_view/views/events_list_view.dart';
import 'package:jyuk/landing_view/views/featured_list_view.dart';
import 'package:jyuk/home_screen/widgets/section_view.dart';
import 'package:jyuk/landing_view/views/video_items.dart';
import 'package:video_player/video_player.dart';

class LandingView extends StatelessWidget {
  const LandingView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      CupertinoSliverNavigationBar(
        brightness: Theme.of(context).brightness,
        backgroundColor: Colors.transparent,
        largeTitle: const Text(
          "Jesus Youth UK",
        ),
        stretch: true,
      ),
      const SliverList(
          delegate: SliverChildListDelegate.fixed([
        SectionView(
          child: FeaturedListView(),
          height: 464,
        ),
        SectionView(child: EventsListView(), height: 364),
        SectionView(child: VideoListView(), height: 400),
        SectionView(child: EventsListView(), height: 364),
        SizedBox(
          height: 200,
        )
      ]))
    ]);
  }
}

class VideoListView extends StatelessWidget {
  const VideoListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 400,
      color: Colors.black,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: MediaQuery.of(context).size.width * (9 / 16),
              child: VideoItems(
                videoPlayerController: VideoPlayerController.asset(
                  'assets/video.mp4',
                ),
                looping: true,
                autoplay: true,
                fullScreen: false,
                thumbnailDuration: const Duration(seconds: 5),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 230,
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                  child: Container(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                          Colors.transparent,
                          Colors.blueGrey,
                          Colors.black
                        ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 32.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(bottom: 8.0, left: 16),
                                child: Text(
                                  "Videos",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  height: 158,
                                  child: ListView.builder(
                                      itemCount: 3,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (_, index) {
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Container(
                                              height: 148.5,
                                              width: 264,
                                              decoration: const BoxDecoration(
                                                color: Colors.black,
                                              ),
                                              child: VideoItems(
                                                videoPlayerController:
                                                    VideoPlayerController.asset(
                                                  'assets/video.mp4',
                                                ),
                                                looping: false,
                                                autoplay: false,
                                                fullScreen: true,
                                                thumbnailDuration: Duration(
                                                    seconds: 10 * index + 10),
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                              )
                            ]),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
