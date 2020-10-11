import 'package:flutter/material.dart';
import 'package:vayfee/data/discovery.dart';
import 'package:vayfee/theme/colors.dart';
import 'package:video_player/video_player.dart';

class DiscoveryPage extends StatefulWidget {
  @override
  _DiscoveryPageState createState() => _DiscoveryPageState();
}

class _DiscoveryPageState extends State<DiscoveryPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: posts.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();

    _tabController.dispose();
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return RotatedBox(
      quarterTurns: 1,
      child: TabBarView(
          controller: _tabController,
          children: List.generate(posts.length, (index) {
            return RotatedBox(
              quarterTurns: -1,
              child: VideoPlayerItem(
                size: size,
                name: posts[index]['name'],
                fullName: posts[index]['fullName'],
                videoUrl: posts[index]['videoUrl'],
                profileImg: posts[index]['profileImg'],
                caption: posts[index]['caption'],
                isLoved: posts[index]['isLoved'],
                isUnLoved: posts[index]['isUnLoved'],
                lovedCount: posts[index]['lovedCount'],
                unLovedCount: posts[index]['unLovedCount'],
                timeAgo: posts[index]['timeAgo'],
                tag: posts[index]['tag'],
                mention: posts[index]['mention'],
                isSaved: posts[index]['isSaved'],
              ),
            );
          })),
    );
  }

  @override
  Widget build(BuildContext context) {
    return getBody();
  }
}

class VideoPlayerItem extends StatefulWidget {
  final String name;
  final String fullName;
  final String videoUrl;
  final String profileImg;
  final String caption;
  final String timeAgo;
  final String tag;
  final String mention;
  final isLoved;
  final isUnLoved;
  final int lovedCount;
  final int unLovedCount;
  final isSaved;

  const VideoPlayerItem({
    Key key,
    @required this.size,
    this.name,
    this.fullName,
    this.profileImg,
    this.caption,
    this.timeAgo,
    this.tag,
    this.mention,
    this.isLoved,
    this.isUnLoved,
    this.lovedCount,
    this.unLovedCount,
    this.isSaved,
    this.videoUrl,
  }) : super(key: key);

  final Size size;

  @override
  _VideoPlayerItemState createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem>
    with SingleTickerProviderStateMixin {
  VideoPlayerController _videoPlayerController;
  bool isShowingPlaying = false;
  @override
  void initState() {
    super.initState();

    _videoPlayerController = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((value) {
        _videoPlayerController.play();
        setState(() {
          isShowingPlaying = false;
        });
      });
  }

  @override
  void dispose() {
    super.dispose();

    _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _videoPlayerController.value.isPlaying
              ? _videoPlayerController.pause()
              : _videoPlayerController.play();
        });
      },
      child: Container(
        width: widget.size.width,
        height: widget.size.height,
        child: Stack(
          children: [
            Container(
              width: widget.size.width,
              height: widget.size.height,
              child: Stack(
                children: [
                  VideoPlayer(_videoPlayerController),
                  _videoPlayerController.value.isPlaying
                      ? Container()
                      : Center(
                          child: Icon(
                            Icons.play_arrow,
                            size: 80,
                            color: white.withOpacity(0.5),
                          ),
                        ),
                ],
              ),
            ),
            Container(
              width: widget.size.width,
              height: widget.size.height,
              child: SafeArea(
                child: Column(
                  children: [
                    Text(
                      'Sizin için öneriliyor',
                      style: TextStyle(
                        color: white.withOpacity(0.5),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Flexible(
                      child: Row(
                        children: [
                          LeftPanel(
                            size: widget.size,
                            name: widget.name,
                            fullName: widget.fullName,
                            profileImg: widget.profileImg,
                            caption: widget.caption,
                            timeAgo: widget.timeAgo,
                            tag: widget.tag,
                            mention: widget.mention,
                          ),
                          RightPanel(
                            size: widget.size,
                            isLoved: widget.isLoved,
                            isUnLoved: widget.isUnLoved,
                            lovedCount: widget.lovedCount,
                            unLovedCount: widget.unLovedCount,
                            isSaved: widget.isSaved,
                          ),
                        ],
                      ),
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

class RightPanel extends StatelessWidget {
  final isLoved;
  final isUnLoved;
  final int lovedCount;
  final int unLovedCount;
  final isSaved;

  const RightPanel({
    Key key,
    @required this.size,
    this.isLoved,
    this.isUnLoved,
    this.lovedCount,
    this.unLovedCount,
    this.isSaved,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 47,
              height: 200,
              decoration: BoxDecoration(
                color: white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(23),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 12,
                  bottom: 12,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          isLoved == true
                              ? 'assets/system_icons/liked.png'
                              : 'assets/system_icons/like.png',
                          width: 34,
                          height: 34,
                        ),
                        Text(
                          lovedCount >= 1000
                              ? (lovedCount ~/ 1000).toString() + 'B'
                              : lovedCount.toString(),
                          style: TextStyle(
                            color: isLoved == true ? Colors.red : white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset(
                          isUnLoved == false
                              ? 'assets/system_icons/dislike.png'
                              : 'assets/system_icons/dislike_active.png',
                          width: 34,
                          height: 34,
                        ),
                        Text(
                          unLovedCount >= 1000
                              ? (unLovedCount ~/ 1000).toString() + 'B'
                              : unLovedCount.toString(),
                          style: TextStyle(
                            color:
                                isUnLoved == true ? buttonFollowColor : white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      isSaved == true
                          ? 'assets/system_icons/saved.png'
                          : 'assets/system_icons/save.png',
                      width: 34,
                      height: 34,
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

class LeftPanel extends StatelessWidget {
  final String name;
  final String fullName;
  final String profileImg;
  final String caption;
  final String timeAgo;
  final String tag;
  final String mention;

  const LeftPanel({
    Key key,
    @required this.size,
    this.name,
    this.fullName,
    this.profileImg,
    this.caption,
    this.timeAgo,
    this.tag,
    this.mention,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.83,
      height: size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            profileImg,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          fullName,
                          style: TextStyle(
                            color: white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '@' + name,
                          style: TextStyle(
                            color: white.withOpacity(0.6),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              width: MediaQuery.of(context).size.width - 86,
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: caption,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    TextSpan(
                      text: mention == '' ? '' : ' @' + mention,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                      ),
                    ),
                    TextSpan(
                      text: tag == '' ? '' : ' #' + tag,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(
              left: 15,
              bottom: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  timeAgo,
                  style: TextStyle(
                    color: white.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
