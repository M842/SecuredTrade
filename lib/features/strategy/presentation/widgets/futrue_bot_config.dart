import 'package:securedtrade/config/path_config.dart';

class FutureBotConfig extends StatefulWidget {
  final SpotTradeSettingModel? tradeSettingModel;
  const FutureBotConfig({super.key, required this.tradeSettingModel});

  @override
  State<FutureBotConfig> createState() => _FutureBotConfigState();
}

class _FutureBotConfigState extends State<FutureBotConfig> {
  String selectTradeDire = "LONG";

  TextEditingController editRiskTradeController = TextEditingController(
    text: "1.2",
  );

  TextEditingController editLeverageController = TextEditingController(
    text: "2",
  );

  TextEditingController editMultiplierController = TextEditingController(
    text: "10",
  );
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5.0, right: 5, bottom: 5),
          child: AppCustomCard(
            radius: 8,
            topPadding: 5,
            bottomPadding: 10,
            height: 70,
            child: Row(
              children: [
                Text(
                  "Select Trade Direction",
                  style: getDmSansTextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                    fontSize: 16,
                  ),
                ),
                Spacer(),
                Flexible(
                  child: DropdownButtonFormField<String>(
                    value: selectTradeDire,
                    dropdownColor: AppColors.white,
                    style: getDmSansTextStyle(
                      color: AppColors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(bottom: 10),
                    ),
                    items: ["LONG", "SHORT"]
                        .map(
                          (lev) => DropdownMenuItem(
                            value: lev,
                            child: Text(
                              "${lev}",
                              style: getDmSansTextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color: AppColors.black,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectTradeDire = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        futureConfigItemField(
          text: "Risk Per Trade (%)",
          controller: editRiskTradeController,
          suffixText: "%",
        ),
        futureConfigItemField(
          text: "Leverage",
          suffixText: "X",
          controller: editLeverageController,
        ),
        futureConfigItemField(
          text: "ATR Multiplier",

          controller: editMultiplierController,
        ),
      ],
    );
  }

  futureConfigItemField({
    required String text,
    required TextEditingController controller,
    String suffixText = "",
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0, right: 5, bottom: 5),
      child: AppCustomCard(
        radius: 8,
        topPadding: 5,
        bottomPadding: 10,
        height: 81,
        child: Container(
          color: Colors.transparent,
          child: Row(
            children: [
              Text(
                text,
                style: getDmSansTextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                  fontSize: 16,
                ),
              ),
              Spacer(),
              text == "Leverage" || text.contains("ATR")
                  ? Spacer()
                  : SizedBox(),
              Expanded(
                child: AppTextField(
                  suffixText: suffixText,
                  textInputType: TextInputType.number,
                  radius: 4,
                  controller: controller,
                  align: TextAlign.center,
                  fillColor: AppColors.grey4,
                  borderColor: AppColors.grey5,
                  borderWidth: .90,
                  padding: 0,
                  hintText: "1",
                  isPrefixIcon: false,
                  isSuffixIcon: false,
                ),
              ),
              AppSpacing.w8,
            ],
          ),
        ),
      ),
    );
  }
}
