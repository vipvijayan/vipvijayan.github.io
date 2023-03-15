import 'package:flutter_themer/utils/exports.dart';

class Loading extends StatelessWidget {
  const Loading({super.key, this.loading = false});
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: loading,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
