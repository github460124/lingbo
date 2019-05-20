import 'package:flutter/material.dart';
import 'package:flutter_ijkplayer/flutter_ijkplayer.dart';

class MonitorPage extends StatefulWidget {
  final int index;

  const MonitorPage({Key key, this.index}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MonitorPageState();
  }
}

class MonitorPageState extends State<MonitorPage> {
  IjkMediaController mediaController = IjkMediaController();


  @override
  void initState() {
    super.initState();
    _playInput(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          height: 400,
          child: IjkPlayer(
            mediaController: mediaController,
          ),
        ),
      ),
    );
  }
  String text;
  void _playInput(int index) async {

    switch (index) {
      case 1:
        text = 'rtsp://admin:qj237bw859z@172.16.0.23/h264/ch1/main/av_stream';
        break;
      case 2:
        text = 'rtsp://admin:qj237bw859z@172.16.0.33/h264/ch1/main/av_stream';
        break;
      case 3:
        text = 'rtsp://admin:qj237bw859z@172.16.0.20/h264/ch1/main/av_stream';
        break;
      case 4:
        text = 'rtsp://admin:qj237bw859z@172.16.0.21/h264/ch1/main/av_stream';
        break;
      default:
        text = "wangzhiweikong";
        print(text);
        break;
    }

    var option1 = IjkOption(
        IjkOptionCategory.format, "fflags", "nobuffer"); // category, key ,value
    var option3 = IjkOption(IjkOptionCategory.format, "rtsp_transport", "tcp");
    var option4 =
        IjkOption(IjkOptionCategory.format, "rtsp_flags", "prefer_tcp");
    var option5 = IjkOption(IjkOptionCategory.player, "videotoolbox", 0);
    var option10 = IjkOption(IjkOptionCategory.player, "fps", 24);

    var option6 =
        IjkOption(IjkOptionCategory.format, "allowed_media_types", 'video');
    var option7 = IjkOption(IjkOptionCategory.format, "max-buffer-size", 1020);
    var option9 = IjkOption(IjkOptionCategory.format, "infbuf", 1);

    mediaController.setIjkPlayerOptions(
      [TargetPlatform.iOS, TargetPlatform.android],
      [
        option1,
        //option2,
        option3,
        option4,
        option5,
        option6,
        option7,
        //option8,
        option9,
        //loption10,
        //option11,
        /*option12,
        option13,
        option14,
        option15,
        option16,*/
      ].toSet(),
    );
    await mediaController.setNetworkDataSource(text, autoPlay: true);
  }

  @override
  void dispose() {
    super.dispose();
    mediaController.dispose();
  }
}
