import 'package:flutter/material.dart';
import 'package:learing_flutter/utils/colors.dart';
import 'package:learing_flutter/utils/dimensions.dart';
import 'package:learing_flutter/widgets/small_text.dart';

class ExpandableText extends StatefulWidget {
  final String text;

  const ExpandableText({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  //** late key used for init any variable for after getting the value */

  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;

  double textHeight = Dimensions.screenHeight / 5.63;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    int textLength = widget.text.length;
    if (textLength > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf = widget.text.substring(textHeight.toInt() + 1, textLength);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallText(
              size: Dimensions.fontSize16,
              text: firstHalf,
              color: AppColors.paraColor,
            )
          : Column(
              children: [
                SmallText(
                  height: 1.8,
                  size: Dimensions.fontSize16,
                  text: hiddenText
                      ? (firstHalf + "...")
                      : (firstHalf + secondHalf),
                  color: AppColors.paraColor,
                ),
                InkWell(
                  onTap: (() => {
                        setState(() => {hiddenText = !hiddenText})
                      }),
                  child: Row(
                    children: [
                      SmallText(
                        text: "Show more",
                        color: AppColors.mainColor,
                      ),
                      Icon(
                        hiddenText
                            ? Icons.arrow_drop_down
                            : Icons.arrow_drop_up,
                        color: AppColors.mainColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
