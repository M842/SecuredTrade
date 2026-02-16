import 'package:securedtrade/config/path_config.dart';
class CustomBotAppBar extends StatefulWidget {
  const CustomBotAppBar({super.key});

  @override
  State<CustomBotAppBar> createState() => _CustomBotAppBarState();
}

class _CustomBotAppBarState extends State<CustomBotAppBar> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 205,
      width: double.infinity,
      decoration: BoxDecoration(gradient: AppGradients.primary),

      child: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.only(top: 48.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: Icon(Icons.arrow_back_ios, color: AppColors.white),
              ),
              SizedBox(width: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: ["Strategy\n Details", "Fulfilled\n Orders"]
                    .map((toElement) {
                  final index = [
                    "Strategy\n Details",
                    "Fulfilled\n Orders",
                  ].indexOf(toElement);
                  return Padding(
                    padding: const EdgeInsets.only(left: 35.0),
                    child: Column(
                      children: [
                        Text(
                          toElement,
                          style: getDmSansTextStyle(
                            fontWeight: FontWeight.w500,
                            color: AppColors.white,
                            fontSize: 12.5,

                          ),
                        ),
                        SizedBox(height: 8),
                        selectedIndex == index
                            ? Container(
                          height: 1.5,
                          width: 50,
                          color: AppColors.white,
                        )
                            : SizedBox(),
                      ],
                    ),
                  );
                })
                    .toList(),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
