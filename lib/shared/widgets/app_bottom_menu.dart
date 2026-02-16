import 'package:securedtrade/config/path_config.dart';

class AppBottomMenu extends StatelessWidget {
  final Function(int) onTabTapped;
  final int selectIndex;
  const AppBottomMenu({
    super.key,
    required this.selectIndex,
    required this.onTabTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavBar(
      curentIndex: selectIndex,
      backgroundColor: AppColors.appBarColor,
      onTap: onTabTapped,
      children: [
        // BottomNavBarItem(
        //   title: "Home",
        //   icon: Icons.home_filled,
        // ),
        BottomNavBarItem(
          title: "Home",
          icon: AppStrings.home,
          selectedIcon: AppStrings.filledHome,
        ),
        BottomNavBarItem(
          title: "Spot",
          icon: AppStrings.spotIcon,
          selectedIcon: AppStrings.filledStrategy,
        ),
        BottomNavBarItem(
          title: "Future",
          icon: AppStrings.futureIcon,
          selectedIcon: AppStrings.filledWallet,
        ),

        // BottomNavBarItem(
        //   title: 'FAQ',
        //   icon: FontAwesomeIcons.questionCircle,
        // ),
        BottomNavBarItem(
          title: "Mine",
          icon: AppStrings.filledMine,
          selectedIcon: AppStrings.filledMine,
        ),
      ],
    );
  }

  void onItemTapped(int value) {
    // selectIndex=value;
  }
}

class BottomNavBar extends StatefulWidget {
  final List<BottomNavBarItem> children;
  int curentIndex;
  final Color? backgroundColor;
  final Function(int)? onTap;
  BottomNavBar({
    super.key,
    required this.children,
    this.curentIndex = 0,
    this.backgroundColor,
    required this.onTap,
  });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(8),
          topLeft: Radius.circular(8),
        ),
        color: widget.backgroundColor ?? Theme.of(context).colorScheme.primary,
      ),
      width: double.infinity,
      // margin: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
      height: 65,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          widget.children.length,
          (index) => NavBarItem(
            index: index,
            item: widget.children[index],
            selected: widget.curentIndex == index,
            onTap: () {
              setState(() {
                widget.curentIndex = index;
                widget.onTap!(widget.curentIndex);
              });
            },
          ),
        ),
      ),
    );
  }
}

class NavBarItem extends StatefulWidget {
  final BottomNavBarItem item;
  final int index;
  bool selected;
  final Function onTap;
  final Color? backgroundColor;
  NavBarItem({
    super.key,
    required this.item,
    this.selected = false,
    required this.onTap,
    this.backgroundColor,
    required this.index,
  });

  @override
  State<NavBarItem> createState() => _NavBarItemState();
}

class _NavBarItemState extends State<NavBarItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //addPadding(height: 0, width: 8),
          SizedBox(
            height: 24,
            width: 24,
            child: Image.asset(
              widget.item.icon,
              color: widget.selected ? AppColors.primary : AppColors.grey,
            ),
          ),
          SizedBox(height: 3, width: 0),
          Text(
            widget.item.title,
            style: getDmSansTextStyle(
              fontSize: 13,
              color: widget.selected ? AppColors.primary : AppColors.grey,
              fontWeight: FontWeight.w500,
            ),
          ) /*
                  ),*/,
        ],
      ),
    );
  }
}

class BottomNavBarItem {
  final String title, icon, selectedIcon;

  BottomNavBarItem({
    required this.title,
    required this.icon,
    required this.selectedIcon,
  });
}
