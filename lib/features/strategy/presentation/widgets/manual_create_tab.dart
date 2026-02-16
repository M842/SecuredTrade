import 'package:securedtrade/config/path_config.dart';
import 'package:securedtrade/features/strategy/data/models/margin_config_model.dart';
import 'package:securedtrade/features/strategy/data/models/margin_limit_model.dart';
import 'package:securedtrade/features/strategy/data/models/trade_setting_model.dart';
import 'package:securedtrade/features/strategy/domain/entities/margin_config.dart';
import 'package:securedtrade/features/strategy/domain/entities/margin_limit.dart';
import 'package:securedtrade/features/strategy/domain/entities/trade_setting.dart';
import 'package:securedtrade/features/strategy/presentation/widgets/strategy_mode_dialog.dart';

class ManualCreateTab extends StatefulWidget {
  final String symbol;
  const ManualCreateTab({super.key, required this.symbol});

  @override
  State<ManualCreateTab> createState() => _ManualCreateTabState();
}

class _ManualCreateTabState extends State<ManualCreateTab> {
  TextEditingController editFirstBuyController = TextEditingController(
    text: "12",
  );

  TextEditingController editMarginLimitController = TextEditingController(
    text: "7",
  );

  TextEditingController editProfitRadioController = TextEditingController(
    text: "1.4",
  );

  TextEditingController editProfitRadioCallbackController =
      TextEditingController(text: "0.2");

  TextEditingController editBuyCallbackController = TextEditingController(
    text: "0.5",
  );
  TextEditingController editSubPosTakeProfitCallbackController =
      TextEditingController(text: "0.5");

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        AppCustomCard(
          radius: 7,
          height: 70,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              children: [
                Text(
                  "My Template",
                  style: getDmSansTextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: AppColors.black,
                  ),
                ),
                Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Text(
                        "Choose a strategy setting",
                        style: getDmSansTextStyle(
                          fontSize: 14,
                          color: AppColors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: 20,
                        color: AppColors.black,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        //Strategy
        SizedBox(height: 4),
        AppCustomCard(
          radius: 7,
          height: 70,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              children: [
                Text(
                  "Strategy Mode",
                  style: getDmSansTextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(width: 5),
                Icon(Icons.error, size: 20, color: AppColors.grey),

                Expanded(
                  child: TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (c) {
                          return StrategyModeDialog();
                        },
                      );
                    },
                    child: Row(
                      children: [
                        Flexible(
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            "Whole Warehouse Mode",
                            style: getDmSansTextStyle(
                              fontSize: 14,
                              color: AppColors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(width: 4),
                        Icon(
                          Icons.keyboard_arrow_down,
                          size: 20,
                          color: AppColors.black,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        AppCustomCard(
          height: 230,
          radius: 8,
          child: Column(
            children: [
              Row(
                children: [
                  headingTextView(title: "First Buy in Amount"),
                  Spacer(),

                  Expanded(
                    child: AppTextField(
                      suffixText: "USDT ",
                      radius: 4,
                      controller: editFirstBuyController,
                      align: TextAlign.center,
                      fillColor: AppColors.grey4,
                      borderColor: AppColors.grey5,
                      borderWidth: 0,
                      padding: 0,
                      hintText: "0",
                      isPrefixIcon: false,
                      isSuffixIcon: false,
                    ),
                  ),
                ],
              ),
              dividerLine(),

              Row(
                children: [
                  headingTextView(title: "Enable Opening Double"),
                  Spacer(),
                  Switch(
                    value: false,
                    activeThumbColor: AppColors.white,
                    inactiveTrackColor: AppColors.white,
                    activeColor: AppColors.secondary,
                    activeTrackColor: AppColors.primary,
                    inactiveThumbColor: AppColors.primary,

                    onChanged: (onChanged) {},
                  ),
                ],
              ),
              dividerLine(),

              Row(
                children: [
                  headingTextView(title: "AI Margin Call"),
                  Spacer(),
                  Switch(
                    value: true,
                    activeThumbColor: AppColors.white,
                    inactiveTrackColor: AppColors.primary,
                    activeColor: AppColors.secondary,
                    activeTrackColor: AppColors.primary,
                    inactiveThumbColor: AppColors.primary,

                    onChanged: (onChanged) {},
                  ),
                ],
              ),
            ],
          ),
        ),

        AppCustomCard(
          height: 600,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text(
                "Parameter Settings",
                style: getDmSansTextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: 12),

              dividerLine(),

              Row(
                children: [
                  headingTextView(title: "Margin call limit"),
                  Spacer(),

                  Expanded(
                    child: AppTextField(
                      suffixText: "",
                      radius: 4,
                      controller: editMarginLimitController,
                      align: TextAlign.center,
                      fillColor: AppColors.grey4,
                      borderColor: AppColors.grey5,
                      borderWidth: 0,
                      padding: 0,
                      hintText: "0",
                      isPrefixIcon: false,
                      isSuffixIcon: false,
                    ),
                  ),
                ],
              ),
              dividerLine(),
              Row(
                children: [
                  headingTextView(title: "Whole position take \nprofit radio"),
                  Spacer(),

                  Expanded(
                    child: AppTextField(
                      suffixText: "%",
                      radius: 4,
                      controller: editProfitRadioController,
                      align: TextAlign.center,
                      fillColor: AppColors.grey4,
                      borderColor: AppColors.grey5,
                      borderWidth: 0,
                      padding: 0,
                      hintText: "1.4",
                      isPrefixIcon: false,
                      isSuffixIcon: false,
                    ),
                  ),
                ],
              ),
              dividerLine(),
              Row(
                children: [
                  headingTextView(
                    title: "Whole position take \nprofit callback",
                  ),
                  Spacer(),
                  Icon(Icons.error, color: AppColors.grey, size: 18),
                  SizedBox(width: 4),
                  Expanded(
                    child: AppTextField(
                      suffixText: "%",
                      radius: 4,
                      align: TextAlign.center,
                      fillColor: AppColors.grey4,
                      borderColor: AppColors.grey5,
                      borderWidth: 0,
                      padding: 0,
                      controller: editProfitRadioCallbackController,
                      hintText: "0.2",
                      isPrefixIcon: false,
                      isSuffixIcon: false,
                    ),
                  ),
                ],
              ),
              dividerLine(),
              Row(
                children: [
                  headingTextView(title: "Margin configuration"),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      context.push(AppRoutePaths.marginConfig);
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.black2,
                      size: 18,
                    ),
                  ),
                ],
              ),
              dividerLine(),
              Row(
                children: [
                  headingTextView(title: "Buy in callback"),
                  Icon(Icons.error, color: AppColors.grey, size: 18),
                  Spacer(),

                  SizedBox(width: 4),
                  Expanded(
                    child: AppTextField(
                      suffixText: "%",
                      radius: 4,
                      controller: editBuyCallbackController,
                      align: TextAlign.center,
                      fillColor: AppColors.grey4,
                      borderColor: AppColors.grey5,
                      borderWidth: 0,
                      padding: 0,
                      hintText: "0.5",
                      isPrefixIcon: false,
                      isSuffixIcon: false,
                    ),
                  ),
                ],
              ),

              dividerLine(),
              Row(
                children: [
                  headingTextView(
                    title: "Distributed and Take\nProfit Allocation",
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.black2,
                      size: 18,
                    ),
                  ),
                ],
              ),
              dividerLine(),
              Row(
                children: [
                  headingTextView(title: "Sub-position take-profit\n callback"),
                  Spacer(),
                  Icon(Icons.error, color: AppColors.grey),
                  SizedBox(width: 7),
                  Expanded(
                    child: AppTextField(
                      suffixText: "%",
                      radius: 4,
                      align: TextAlign.center,
                      fillColor: AppColors.grey4,
                      borderColor: AppColors.grey5,
                      borderWidth: 0,
                      padding: 0,
                      controller: editSubPosTakeProfitCallbackController,
                      hintText: "0.3",
                      isPrefixIcon: false,
                      isSuffixIcon: false,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        AppButton(
          text: "Save",
          onPressed: () {
            TradeSetting rq = TradeSetting(
              tradingMode: TradingMode.spot,
              subTradingMode: SubTradingMode.martingale,
              symbol: widget.symbol,
              strategyPeriod: StrategyPeriod.cycle,
              strategyMode: StrategyMode.wholeWarehouseMode,
              switchOnMarginCall: true,
              initialBuyInPrice: 0.0,
              aiMarginCall: true,
              firstBuyInAmount: double.parse(
                editFirstBuyController.text.toString(),
              ),
              marginCallLimit: editMarginLimitController.text,
              marginCallDropPercent: 3.6,
              takeProfitRatio: double.parse(editProfitRadioController.text),
              earningsCallbackPercent: double.parse(
                editProfitRadioCallbackController.text,
              ),
              buyInCallbackPercent: double.parse(
                editBuyCallbackController.text,
              ),
              marginConfigLimits: [
                MarginConfigModel(marginCallDropPercentage: 3.6, times: 2),
                MarginConfigModel(marginCallDropPercentage: 12.5, times: 4),
                MarginConfigModel(marginCallDropPercentage: 3.6, times: 8),
                MarginConfigModel(marginCallDropPercentage: 12.5, times: 16),
                MarginConfigModel(marginCallDropPercentage: 3.6, times:32),
                MarginConfigModel(marginCallDropPercentage: 3.6, times: 64),
                MarginConfigModel(marginCallDropPercentage: 12.5, times: 128),
              ],
            );
            final setting = rq.toModel();
            print(setting.toJson());
          },
        ),
        SizedBox(height: 15),
      ],
    );
  }

  dividerLine() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10),
      child: ContainerBg(
        backgroundColor: AppColors.grey5,
        width: double.infinity,
        height: 1,
        child: SizedBox(),
      ),
    );
  }

  headingTextView({required String title}) {
    return Text(
      title,
      style: getDmSansTextStyle(
        fontSize: 14,
        color: AppColors.black,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
