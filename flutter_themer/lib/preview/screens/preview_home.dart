import 'package:flutter_themer/exports/exports.dart';

class PreviewHomeScreen extends StatelessWidget {
  const PreviewHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 900,
            width: 480,
            decoration: const BoxDecoration(
                // image: DecorationImage(
                //   image: AssetImage("assets/images/iphone_14.png"),
                //   fit: BoxFit.fill,
                // ),
                ),
            padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40.0),
              child: Container(
                height: 600,
                width: 300,
                // margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: DefaultTabController(
                  length: 3,
                  initialIndex: 0,
                  child: Scaffold(
                    appBar: AppBar(
                      title: const Text('Title'),
                      bottom: const TabBar(
                        tabs: [
                          Tab(icon: Icon(Icons.directions_car)),
                          Tab(icon: Icon(Icons.directions_bike)),
                          Tab(icon: Icon(Icons.directions_bike)),
                        ],
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
