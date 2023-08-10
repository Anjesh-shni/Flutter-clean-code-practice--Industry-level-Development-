import 'package:flutter/material.dart';
import 'package:pos_app/feature/presentation/reusable_widget/small_text.dart';
import 'package:pos_app/utils/constant/app_colors.dart';

class PassFormFieldInput extends StatefulWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hinText;
  final TextInputType textInputType;
  final void Function(String value)? onChanged;
  final String titleText;
  const PassFormFieldInput({
    super.key,
    required this.textEditingController,
    this.isPass = false,
    required this.hinText,
    required this.textInputType,
    required this.onChanged,
    required this.titleText,
  });

  @override
  State<PassFormFieldInput> createState() => _PassFormFieldInputState();
}

class _PassFormFieldInputState extends State<PassFormFieldInput> {
  bool _isObs = true;
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
            text: widget.titleText,
            size: 12,
            color: AppColor.textWfontgrey
          ),
        ),
        TextField(
          onChanged: (value) => widget.onChanged!(value),
          controller: widget.textEditingController,
          decoration: InputDecoration(
            hintText: widget.hinText,
            border: inputBorder,
            focusedBorder: inputBorder,
            enabledBorder: inputBorder,
            filled: true,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _isObs = !_isObs;
                });
              },
              child: _isObs
                  ? const Icon(
                      Icons.visibility,
                      color: Colors.grey,
                      size: 14,
                    )
                  : const Icon(
                      Icons.visibility_off,
                      color: Colors.grey,
                      size: 14,
                    ),
            ),
            hintStyle: TextStyle(
              color: Colors.white.withOpacity(0.4),
              fontSize: 12,
            ),
            contentPadding: const EdgeInsets.all(8.0),
            fillColor: const Color(0xff252837),
          ),
          keyboardType: widget.textInputType,
          obscureText: _isObs,
        ),
      ],
    );
  }
}
