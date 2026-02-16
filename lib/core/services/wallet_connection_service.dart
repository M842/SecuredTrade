import 'package:reown_appkit/reown_appkit.dart';
import 'package:flutter/material.dart';

class WalletConnectService {
  late final ReownAppKitModal appKitModal;
  late final ReownAppKit appKit;

  String? chainID, topic, address;

  //d8c3c8765c383efadd53e57fd3d7faa8
  initializeWallet(BuildContext context) async {
    appKit = ReownAppKit(
      core: ReownCore(projectId: "7f6c6821b45b28ce57e6811a6c2c85f4"),
      metadata: const PairingMetadata(
        name: 'Secure Trade',
        description:
            'Turn your creativity into digital assets and start earning today!',
        url: 'https://securetrade.com/',
        icons: ['https://securetrade.com/logo.png'],
      ),
    );
    appKitModal = ReownAppKitModal(
      logLevel: LogLevel.error,
      context: context,
      projectId: '7f6c6821b45b28ce57e6811a6c2c85f4',
      metadata: const PairingMetadata(
        name: 'Secure Trade',
        description:
            'Turn your creativity into digital assets and start earning today!',
        url: 'https://securetrade.com/',
        icons: ['https://securetrade.com/logo.png'],
      ),
      enableAnalytics: true,
      disconnectOnDispose: true | false,
    );

    // Register here the event callbacks on the service you'd like to use. See `Events` section.

    await appKitModal.init();
  }

  Future<String?> connect() async {
    await appKitModal.openModalView();
    if (appKitModal.isConnected) {
      address = appKitModal.session!.getAddress("eip155")!;
      topic = appKitModal.session!.topic!;
      return appKitModal.session!.getAddress("eip155");
    }
    return null;
    // wallet address
  }

  Future<void> disconnect() async {
    await appKitModal.disconnect();
  }
}
