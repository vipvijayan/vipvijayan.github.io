import 'package:flutter_themer/exports/exports.dart';

class ResolutionUI extends StatelessWidget {
  const ResolutionUI({super.key});

  @override
  Widget build(BuildContext context) {
    final previewAppState = context.watch<PreviewAppState>();
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      height: 120,
      width: 300,
      child: Column(
        children: [
          const MainTitle(
            title: 'Device Resolution',
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 80,
                child: TextFormField(
                  initialValue: '${previewAppState.width.toInt()}',
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    hintText: 'WIDTH',
                  ),
                  onChanged: (value) {
                    if (value.isEmpty) {
                      value = '0';
                    }
                    previewAppState.tempWidth = double.parse(value);
                  },
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.w100,
                      ),
                ),
              ),
              const SizedBox(width: 20),
              // Text(
              //   'X',
              //   style: Theme.of(context).textTheme.titleSmall,
              // ),
              const VerticalDivider(),
              const SizedBox(width: 20),
              SizedBox(
                width: 80,
                child: TextFormField(
                  initialValue: '${previewAppState.height.toInt()}',
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(hintText: 'HEIGHT'),
                  onChanged: (value) {
                    if (value.isEmpty) {
                      value = '0';
                    }
                    previewAppState.tempHeight = double.parse(value);
                  },
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.w100,
                      ),
                ),
              ),
              const SizedBox(width: 20),
              IconButton(
                  onPressed: () async {
                    if (previewAppState.tempHeight > 600 &&
                        previewAppState.tempWidth > 300) {
                      previewAppState.setDeviceDimens();
                      previewAppState.setResInputShow(
                        !previewAppState.showResolutionInput,
                      );
                    }
                  },
                  icon: const Icon(Icons.check)),
            ],
          ),
        ],
      ),
    );
  }
}
