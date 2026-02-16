import 'package:securedtrade/config/path_config.dart';

customProgressLoading(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => ProgressDialog(),
    barrierDismissible: false,
  ).then((value) {
    print(value);
  });
}

class ProgressDialog extends StatefulWidget {
  @override
  _ProgressDialogState createState() => _ProgressDialogState();
}

class _ProgressDialogState extends State<ProgressDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Row(
        children: <Widget>[
          Expanded(child: Container()),
          Container(
            padding: EdgeInsets.all(16),
            child: CircularProgressIndicator(
              strokeWidth: 4.5,
              color: AppColors.primary,
            ),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
          ),
          Expanded(child: Container()),
        ],
      ),
    );
  }
}
