import 'package:reown_appkit/reown_appkit.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart' as http;

class Web3Service {
  late Web3Client _client;

  Web3Service(String rpcUrl) {
    _client = Web3Client(rpcUrl, http.Client());
  }

  DeployedContract _loadContract(String abi, String contractAddress) {
    return DeployedContract(
      ContractAbi.fromJson(abi, ""),
      EthereumAddress.fromHex(contractAddress),
    );
  }

  Future<List<dynamic>> getContract({
    required String abi,
    required String contractAddress,
    required String functionName,
    required List<dynamic> params,
  }) async {
    final contract = _loadContract(abi, contractAddress);
    final function = contract.function(functionName);
    final result = await _client.call(
      contract: contract,
      function: function,
      params: params,
    );

    return result;
  }
}

//final web3 = Web3Service("https://bsc-dataseed.binance.org/");
// final result = await web3.callReadFunction(
//   abi: tokenAbi,
//   contractAddress: tokenAddress,
//   functionName: "balanceOf",
//   params: [EthereumAddress.fromHex(userAddress)],
// );
