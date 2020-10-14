import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:vayfee/data/post.dart';
import 'package:vayfee/data/story.dart';
import 'package:vayfee/data/user.dart';
import 'package:vayfee/theme/colors.dart';
import 'package:vayfee/widgets/story_item.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return getBody();
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 12,
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 20,
                      left: 15,
                      bottom: 10,
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: 65,
                          height: 65,
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(16),
                                    topRight: Radius.circular(16),
                                    bottomRight: Radius.circular(36),
                                    bottomLeft: Radius.circular(16),
                                  ),
                                ),
                                width: 65,
                                height: 65,
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(16),
                                      topRight: Radius.circular(16),
                                      bottomRight: Radius.circular(36),
                                      bottomLeft: Radius.circular(16),
                                    ),
                                    child: CachedNetworkImage(
                                      fadeInCurve: Curves.easeInCirc,
                                      fadeInDuration:
                                          Duration(milliseconds: 600),
                                      fit: BoxFit.cover,
                                      imageUrl: profile,
                                      progressIndicatorBuilder: (context, url,
                                              downloadProgress) =>
                                          CircularProgressIndicator(
                                              value: downloadProgress.progress),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 0,
                                bottom: 0,
                                child: Container(
                                  width: 22,
                                  height: 22,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: buttonFollowColor,
                                  ),
                                  child: Icon(
                                    Icons.add,
                                    color: white,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        SizedBox(
                          width: 70,
                          child: Text(
                            name,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: List.generate(
                      stories.length,
                      (index) {
                        return StoryItem(
                          img: stories[index]['img'],
                          name: stories[index]['name'],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            color: white.withOpacity(0.3),
          ),
          Column(
              children: List.generate(
            posts.length,
            (index) {
              return PostItem(
                name: posts[index]['name'],
                fullName: posts[index]['fullName'],
                profileImg: posts[index]['profileImg'],
                postImg: posts[index]['postImg'],
                caption: posts[index]['caption'],
                isLoved: posts[index]['isLoved'],
                isUnLoved: posts[index]['isUnLoved'],
                lovedCount: posts[index]['lovedCount'],
                unLovedCount: posts[index]['unLovedCount'],
                commentCount: posts[index]['commentCount'],
                timeAgo: posts[index]['timeAgo'],
                tag: posts[index]['tag'],
                mention: posts[index]['mention'],
                isSaved: posts[index]['isSaved'],
              );
            },
          )),
        ],
      ),
    );
  }
}

class PostItem extends StatelessWidget {
  final String profileImg;
  final String fullName;
  final String name;
  final String timeAgo;
  final String caption;
  final String mention;
  final String tag;
  final String postImg;
  final isLoved;
  final isUnLoved;
  final int lovedCount;
  final int unLovedCount;
  final int commentCount;
  final isSaved;
  const PostItem({
    Key key,
    this.profileImg,
    this.fullName,
    this.name,
    this.timeAgo,
    this.caption,
    this.mention,
    this.tag,
    this.postImg,
    this.isLoved,
    this.isUnLoved,
    this.lovedCount,
    this.unLovedCount,
    this.commentCount,
    this.isSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
              Row(
                children: [
                  Text(
                    timeAgo,
                    style: TextStyle(
                      color: white,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Image.asset(
                    'assets/system_icons/options_horizontal.png',
                    width: 19,
                    height: 19,
                    color: white,
                  ),
                  SizedBox(
                    width: 10,
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
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 15,
          ),
          child: Container(
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: MediaQuery.of(context).size.width - 82,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: 200,
                      maxHeight: MediaQuery.of(context).size.height - 200,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: CachedNetworkImage(
                        fadeInCurve: Curves.easeInCirc,
                        fadeInDuration: Duration(milliseconds: 600),
                        fit: BoxFit.cover,
                        imageUrl: postImg,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                CircularProgressIndicator(
                                    value: downloadProgress.progress),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 200,
                  width: 47,
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
                              width: 24,
                              height: 24,
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
                              width: 24,
                              height: 24,
                            ),
                            Text(
                              unLovedCount >= 1000
                                  ? (unLovedCount ~/ 1000).toString() + 'B'
                                  : unLovedCount.toString(),
                              style: TextStyle(
                                color: isUnLoved == true
                                    ? buttonFollowColor
                                    : white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Image.asset(
                          'assets/system_icons/comment.png',
                          width: 24,
                          height: 24,
                        ),
                        Image.asset(
                          isSaved == true
                              ? 'assets/system_icons/saved.png'
                              : 'assets/system_icons/save.png',
                          width: 24,
                          height: 24,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Divider(
          color: white.withOpacity(0.3),
        ),
      ],
    );
  }
}
