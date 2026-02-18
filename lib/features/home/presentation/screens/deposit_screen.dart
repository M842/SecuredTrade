import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:securedtrade/config/path_config.dart';

class DepositNftScreen extends StatelessWidget {
  const DepositNftScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppAppBar(title: "Deposit"),
      body: _qrCodeView(context),
    );
  }

  Widget _qrCodeView(BuildContext context) => Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    margin: EdgeInsets.only(top: 6, left: 16, right: 16, bottom: 8),
    padding: EdgeInsets.only(top: 6, left: 16, right: 16, bottom: 8),
    child: Column(
      children: [
        SizedBox(height: 20, width: 0),
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: QrImageView(
            data: "0xc1B1d9BBE4cB7aACFd784AAA1AF3e0102EBb32E8",
            version: QrVersions.auto,
            size: 240.0,
          ),
        ),
        SizedBox(height: 8),
        LinearProgressIndicator(backgroundColor: AppColors.white),
        SizedBox(height: 20, width: 0),
        Text(
          'Scan or copy the below address to PAY',
          textAlign: TextAlign.center,
          style: getOutfitTextStyle(
            color: AppColors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 16),
        Text(
          '0xc1B1d9BBE4cB7aACFd784AAA1AF3e0102EBb32E8',
          textAlign: TextAlign.center,
          style: getOutfitTextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: AppColors.black,
          ),
        ),
        SizedBox(height: 25, width: 0),
        Container(
          height: 50,
          padding: EdgeInsets.only(left: 16, right: 16),

          decoration: BoxDecoration(
            gradient: AppGradients.primary,
            color: AppColors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(25),
          ),
          // width: MediaQuery.of(context).size.width/2,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton.icon(
                onPressed: () {
                  Clipboard.setData(
                    ClipboardData(
                      text: "0xc1B1d9BBE4cB7aACFd784AAA1AF3e0102EBb32E8",
                    ),
                  );
                  SnackbarHelper.show(context, message: 'Address copied');
                },
                icon: Icon(Icons.copy),
                label: Text('Copy'),
              ),
              Container(
                width: 1,
                color: AppColors.primary,
                margin: EdgeInsets.all(4),
              ),
              TextButton.icon(
                onPressed: () {
                  // Share.share(_address);
                },
                icon: Icon(CupertinoIcons.arrowshape_turn_up_right_fill),
                label: Text('Share'),
              ),
            ],
          ),
        ),
      ],
    ),
    /*      decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),*/
  );
}
