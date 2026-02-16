import 'package:securedtrade/config/path_config.dart';

class SelectBidLine extends StatelessWidget {
  const SelectBidLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 5, bottom: 5),
      child: Row(
        children: List.generate(
          5,
          (index) => Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    ContainerBg(
                      backgroundColor: index == 0
                          ? AppColors.primary.withOpacity(.2)
                          : Color(0xffCDD5E9),
                      height: 16,
                      width: 16,
                      radius: 16,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ContainerBg(
                          height: 8,
                          width: 8,
                          radius: 8,
                          backgroundColor: index == 0
                              ? Color(0xff4E31B6)
                              : Color(0xff111112),
                          child: SizedBox(),
                        ),
                      ),
                    ),
                    Expanded(
                      child: index == 4
                          ? SizedBox()
                          : ContainerBg(
                              backgroundColor: Color(0xffCDD5E9),
                              child: SizedBox(),
                              height: 1,
                            ),
                    ),
                  ],
                ),
                SizedBox(height: 3, width: 0),
                Row(
                  children: [
                    Text(
                      (index == 0
                              ? 0
                              : index == 1
                              ? 25
                              : index == 2
                              ? 50
                              : index == 3
                              ? 75
                              : 100)
                          .toString(),
                      style: getDmSansTextStyle(
                        fontWeight: FontWeight.w400,
                        color: Color(0xff111112),
                        fontSize: 14,
                      ),
                    ),
                    Expanded(
                      child: index == 4
                          ? SizedBox()
                          : ContainerBg(
                              backgroundColor: Colors.transparent,
                              child: SizedBox(),
                              height: 1,
                            ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ).toList(),
      ),
    );
  }
}
