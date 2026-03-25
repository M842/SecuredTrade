import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:reown_appkit/reown_appkit.dart';
import 'package:securedtrade/core/constants/web3_constants.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as httpClient;

class Web3Service {
  late Web3Client _client;

  Web3Service(String rpcUrl) {
    _client = Web3Client(rpcUrl, Client());
  }

  Future<DeployedContract> loadContract(
    String contractAbi,
    String contractAddress,
  ) async {
    String abi = await rootBundle.loadString(contractAbi);
    final abiJson = jsonDecode(abi);
    final abi2 = jsonEncode(abiJson);
    return DeployedContract(
      ContractAbi.fromJson(abi2, ""),
      EthereumAddress.fromHex(contractAddress),
    );
  }

  Future<List<dynamic>> getContract({
     String abi=Web3Constants.secureTradeAbiJson,
     String contractAddress=Web3Constants.contractAddress,
    required String functionName,
    required List<dynamic> params,
  }) async {
    final contract = await loadContract(abi, contractAddress);
    //final function = contract.function(functionName);

    final function = contract.functions
        .where((f) => f.name == functionName)
        .toList();

    if (function.isEmpty) {
      throw Exception("Function $functionName not found in ABI");
    }
    final result = await _client.call(
      contract: contract,
      function: function.first,
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
