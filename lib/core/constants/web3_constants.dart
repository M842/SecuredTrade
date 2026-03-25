import 'package:web3dart/web3dart.dart';

class Web3Constants {
  static const String rpcUrl = "https://rpc-testnet.ozonescan.com/";
  static const String chianId = "eip155:10120";

  static const String secureTradeAbiJson =
      "assets/abi/iSecuredTradeSystemAbi.json";
  static const String secureTradeORCAbiJson =
      "assets/abi/iSecuredTradeSystemOrcAbi.json";
  static const String secureTradeNestedAbiJson =
      "assets/abi/iSecuredTradeSystemNestedAbi.json";

  static const String contractAddress =
      "0x250f1148511182e4Fa1a200Bd0d9E885A3259574";

  static String nestedContractAddress =
      "0xffe5b6bab760b0f07ceda9770ed1b735c078fcc0";

  static String minimumStakeContractFunction = "minimumStake";

  static String buyContractFunction = "buy";
  static String getUserIdContractFunction = "UserToId";
  static String getTotalBuysContractFunction = "getTotalBuys";
  static String getBuysIdContractFunction = "getBuyId";
  static String buyNodesContractFunction = "nodes";
  static String getPayoutContractFunction = "payouts";

  static String getBalanceContractFunction = "balanceOf";
  static String getIdsContractFunction = "ids";
  static String getNamesContractFunction = "names";
  static String getUriContractFunction = "uri";

  static String getSubscribedContractFunction = "subscribed";
  static String burnNFTsContractFunction = "onTokenBurnByForce";

  static String getIsSubscribedContractFunction = "isNode";
}
