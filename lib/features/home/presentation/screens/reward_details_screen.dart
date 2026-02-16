import 'package:securedtrade/config/path_config.dart';
import 'package:securedtrade/features/home/data/models/reward_model.dart';
import 'package:securedtrade/features/home/presentation/widgets/reward_list_item.dart';
import 'package:securedtrade/shared/widgets/app_tabs_view.dart';

class RewardDetailScreen extends StatefulWidget {
  const RewardDetailScreen({super.key});

  @override
  State<RewardDetailScreen> createState() => _RewardDetailScreenState();
}

class _RewardDetailScreenState extends State<RewardDetailScreen> {
  List<RewardModel> allRewardList = [
    RewardModel(
      date: '05/24',
      type: 'Profit',
      amount: '4,650.2502',
      year: "2023",
    ),
    RewardModel(date: '12-12', type: 'Loss', amount: '650.11230', year: "2022"),
    RewardModel(date: '05-01', type: 'Profit', amount: '40.0842', year: "2023"),
    RewardModel(date: '27-04', type: 'Profit', amount: '60.2540', year: "2021"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8F9FA),
      appBar: AppAppBar(title: "Reward Detail", appBarColor: Color(0xffF8F9FA)),
      body: AppRewardDetailTabs(
        tabBarView: rewardTabsList.isEmpty
            ? NoDataFound(text: 'No Data Found', height: 4.2)
            : ListView.builder(
                itemCount: allRewardList.length,
                itemBuilder: (BuildContext context, int index) {
                  RewardModel m = allRewardList[index];
                  return RewardListItem(data: m);
                },
              ),
      ),
    );
  }
}
