import 'package:securedtrade/config/path_config.dart';


class ItemTrendingNews extends StatelessWidget {
  final String title,img;
  const ItemTrendingNews({super.key,required this.title,
  required this.img});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                child: Text(
                  title,
                  style: getDmSansTextStyle(
                      fontSize: 16, color: Color(0xff343A40)),
                ),
              ),
              SizedBox(height: 0, width: 15),
              Image.asset(
                img,
                height: 65,
                width: 94,
              ),
              SizedBox(height: 0, width: 5),
            ],
          ),
          Row(
            children: [
              Text(
                "Coindesk",
                style: getDmSansTextStyle(
                    fontSize: 10,
                    color: Color(0xff6C757D),
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 0, width: 10),
              Text(
                "12 hrs ago",
                style: getDmSansTextStyle(
                    fontSize: 10,
                    color: Color(0xff6C757D),
                    fontWeight: FontWeight.w500),
              ),
            ],
          )
        ],
      ),
    );;
  }
}
