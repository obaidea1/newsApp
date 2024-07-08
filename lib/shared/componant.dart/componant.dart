import 'package:flutter/material.dart';
import 'package:newsapp/modules/web_view/webViewScreen.dart';

Widget NewsBlock(newsdata,BuildContext context) {
  return InkWell(
    onTap: (){
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>WebViewScreen(url: newsdata['url']),),);
    },
    child: Padding(
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 25,
      ),
      child: Row(
        children: [
          Container(
            width: 140,
            height: 110,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(
                  image: NetworkImage(newsdata['urlToImage'] != null
                      ? "${newsdata['urlToImage']}"
                      : "https://as2.ftcdn.net/v2/jpg/03/24/14/35/1000_F_324143588_Jk9uwkSlhuSEyrGWkuQT7MM6mFbCayIj.jpg"),
                )),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              height: 85,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Text(
                    "${newsdata['title']}",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    softWrap: true,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  )),
                  Text("${newsdata['publishedAt']}"),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Widget SeperateBlock() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 25),
    child: Container(
      color: Colors.grey,
      height: 1,
    ),
  );
}

Widget NewsBuilder(list,BuildContext context) => ListView.separated(
        physics: const BouncingScrollPhysics(),
        primary: true,
        separatorBuilder: (context, index) => SeperateBlock(),
        itemCount: list.length,
        itemBuilder: (context, index) {
          return NewsBlock(list[index],context);
        },

);

Widget defaultTextField({
  required TextEditingController controller,
  required Widget label,
  required TextInputType type,
  required String? Function(String?)? validate,
  IconData? prefix,
  bool? isObscure,
  double? size,
  void Function(String)? onChange,
  void Function(String)? onSubmitted,
}) {
  return TextFormField(
    controller: controller,
    obscureText: isObscure ?? false,
    decoration: InputDecoration(
      label: label,
      prefixIcon: Icon(prefix),
      border: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
    onChanged: onChange,
    onFieldSubmitted: onSubmitted,
    keyboardType: type,
    validator: validate,
    style: TextStyle(fontSize: size??16.0),
  );
}
