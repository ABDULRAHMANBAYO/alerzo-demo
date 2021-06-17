import 'package:alerzo_demo/core/error_respons.dart';
import 'package:alerzo_demo/core/post.dart';
import 'package:alerzo_demo/data/post_repository.dart';
import 'package:alerzo_demo/styles/home.dart';
import 'package:alerzo_demo/utils/assets_colors.dart';
import 'package:alerzo_demo/utils/assets_images.dart';
import 'package:alerzo_demo/utils/string_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _animationDuration = 600;
  late double height, width;
  PostRepository _postRepository = PostRepository();
  List<PostDetail> posts = [];

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: AnimatedPadding(
        duration: Duration(milliseconds: _animationDuration),
        padding: EdgeInsets.only(
            left: width * 0.04, right: width * 0.04, top: height * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(StringResources.WELCOME_NAME, style: nameTextStyle(width)),
                SvgPicture.asset(AssetResources.HAND_EMOJI)
              ],
            ),
            Text(StringResources.INFORMATION,
                style: informationTextStyle(height, width)),
            Expanded(child: postDetail())
          ],
        ),
      ),
    );
  }

  Widget buildContent(id, title, body) => AnimatedPadding(
        duration: Duration(milliseconds: _animationDuration),
        padding: EdgeInsets.symmetric(vertical: width * 0.02),
        child: SizedBox(
          height: width * 0.4,
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: AnimatedPadding(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.04, vertical: width * 0.02),
              duration: Duration(milliseconds: _animationDuration),
              child: Column(
                children: [
                  Expanded(flex: 1, child: rowContent(StringResources.ID, id)),
                  Expanded(
                      flex: 1, child: rowContent(StringResources.TITLE, title)),
                  Expanded(
                      flex: 3, child: rowContent(StringResources.BODY, body))
                ],
              ),
            ),
          ),
        ),
      );

  Widget rowContent(String title, String body) => Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(flex: 1, child: Text(title, style: titleTextStyle(width))),
            Expanded(
                flex: 6,
                child: Text(body,
                    style: subTitleTextStyle(width),
                    textAlign: TextAlign.justify))
          ]);

  Widget postDetail() => FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data is SessionError) {
            var error = snapshot.data as SessionError;
            return buildError(error.error);
          } else {
            posts = snapshot.data as List<PostDetail>;
            return ListView.builder(
              itemCount: posts.length,
              padding: EdgeInsets.symmetric(vertical: height * 0.01),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return buildContent(posts[index].id.toString(),
                    posts[index].title, posts[index].body);
              },
            );
          }
        } else if (snapshot.hasError) {
          return buildError(snapshot.error.toString());
        }
        return progressIndidcator();
      },
      future: _postRepository.getPost());
  Widget buildError(String error) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, color: Colors.red, size: 60),
          Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text('$error',
                  style: subTitleTextStyle(width),
                  textAlign: TextAlign.justify))
        ],
      );
  Widget progressIndidcator() => Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  height: 20.0,
                  width: 20.0,
                  child: CircularProgressIndicator(
                      backgroundColor: AssetColors.primaryColor,
                      strokeWidth: 2.0)),
              Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text(StringResources.LOADING,
                      style: subTitleTextStyle(width),
                      textAlign: TextAlign.center))
            ]),
      );
}
