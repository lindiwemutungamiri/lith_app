import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lith_app/screens/patient_dashboard/training/components/Model/youtube_model.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YogaPage extends StatefulWidget {
  YogaPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _YogaPageState createState() => _YogaPageState();
}

class _YogaPageState extends State<YogaPage> {
  YoutubePlayerController? _ytbPlayerController;
  List<YoutubeModel> videosList = [
    YoutubeModel(id: 1, youtubeId: '3U7nqqUVVME'),
    YoutubeModel(id: 2, youtubeId: 'gXuq4M5rU9E'),
    YoutubeModel(id: 3, youtubeId: 'aioF1tV3ZMk'),
    YoutubeModel(id: 4, youtubeId: 'T819lx3W5So'),
    YoutubeModel(id: 5, youtubeId: 'U-d2AHW1xVc'),
  ];

  @override
  void initState() {
    super.initState();

    _setOrientation([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      setState(() {
        _ytbPlayerController = YoutubePlayerController(
          initialVideoId: videosList[0].youtubeId,
          params: const YoutubePlayerParams(
            showFullscreenButton: true,
          ),
        );
      });
    });
  }

  @override
  void dispose() {
    super.dispose();

    _setOrientation([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    _ytbPlayerController?.close();
  }

  _setOrientation(List<DeviceOrientation> orientations) {
    SystemChrome.setPreferredOrientations(orientations);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Relaxation',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.cyan,
        elevation: 1,
      ),
      body: SafeArea(
        child: Column(
          children: [
            _buildYtbView(),
            _buildMoreVideoTitle(),
            _buildMoreVideosView(),
          ],
        ),
      ),
    );
  }

  _buildYtbView() {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: _ytbPlayerController != null
          ? YoutubePlayerIFrame(controller: _ytbPlayerController)
          : Center(child: CircularProgressIndicator()),
    );
  }

  _buildMoreVideoTitle() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 10, 182, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Text(
            'More Videos',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }

  _buildMoreVideosView() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: ListView.builder(
            itemCount: videosList.length,
            physics: AlwaysScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  final _newCode = videosList[index].youtubeId;
                  _ytbPlayerController?.load(_newCode);
                  _ytbPlayerController?.stop();
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 5,
                  margin: EdgeInsets.symmetric(vertical: 7),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        Positioned(
                          child: CachedNetworkImage(
                            imageUrl:
                                "https://img.youtube.com/vi/${videosList[index].youtubeId}/0.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          child: Align(
                            alignment: Alignment.center,
                            child: Image.asset(
                              "assets/ytbPlayBotton.png",
                              height: 30,
                              width: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
