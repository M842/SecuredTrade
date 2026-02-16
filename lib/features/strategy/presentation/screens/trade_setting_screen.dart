import 'dart:math';

import 'package:flutter/material.dart';
import 'package:securedtrade/config/path_config.dart';
import 'package:securedtrade/features/strategy/presentation/bloc/strategy_bloc.dart';
import 'package:securedtrade/features/strategy/presentation/bloc/strategy_event.dart';
import 'package:securedtrade/features/strategy/presentation/widgets/manual_create_tab.dart';
import 'package:securedtrade/features/strategy/presentation/widgets/smart_create_tab.dart';

class TradeSettingScreen extends StatefulWidget {
  final String symbol;
  const TradeSettingScreen({super.key, required this.symbol});

  @override
  State<TradeSettingScreen> createState() => _TradeSettingScreenState();
}

class _TradeSettingScreenState extends State<TradeSettingScreen> {
  bool isMarginListShow = false;
  int tabSelected = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppAppBar(title: "Trade Setting", isSuffixIcon: false),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 5),
            Row(
              children: List.generate(
                2,
                (index) => Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        tabSelected = index;
                      });
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        children: [
                          Text(
                            index == 0 ? "Smart Create" : "Manually Create",
                            style: getDmSansTextStyle(
                              fontSize: 14,
                              color: AppColors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 4),
                          ContainerBg(
                            backgroundColor: index == tabSelected
                                ? AppColors.primary
                                : Colors.transparent,
                            height: 3,
                            width: 40,
                            child: SizedBox(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            tabSelected == 0
                ? SmartCreateTab()
                : ManualCreateTab(symbol: widget.symbol),
          ],
        ),
      ),
    );
  }
}
