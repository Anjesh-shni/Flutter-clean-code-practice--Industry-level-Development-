import 'package:flutter/material.dart';
import 'package:pos_app/feature/presentation/reusable_widget/small_text.dart';
import '../../../utils/constant/app_colors.dart';

class TextFormFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hinText;
  final TextInputType textInputType;
  final void Function(String value)? onChanged;
  final String titleText;
  const TextFormFieldInput({
    super.key,
    required this.textEditingController,
    this.isPass = false,
    required this.hinText,
    required this.textInputType,
    required this.onChanged,
    required this.titleText,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    final inputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 2, bottom: 5),
          child: SmallText(
            text: titleText,
            size: 12,
            color:AppColor.textWfontgrey,
          ),
        ),
        TextField(
          onChanged: (value) => onChanged!(value),
          controller: textEditingController,
          decoration: InputDecoration(
            hintText: hinText,
            border: inputBorder,
            focusedBorder: inputBorder,
            enabledBorder: inputBorder,
            filled: true,
            hintStyle: TextStyle(
              color: Colors.white.withOpacity(0.4),
              fontSize: 12,
            ),
            contentPadding: const EdgeInsets.all(8.0),
            fillColor: const Color(0xff252837),
          ),
          keyboardType: textInputType,
          obscureText: isPass,
        ),
      ],
    );
  }
}
