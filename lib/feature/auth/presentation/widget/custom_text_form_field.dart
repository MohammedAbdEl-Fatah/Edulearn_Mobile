import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_style.dart';
import '../../../../core/theme/extension.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.header,
    required TextEditingController controller,
    required this.isObscure,
    this.validator,
  }) : _controller = controller;
  final String hintText;
  final String header;
  final TextEditingController _controller;
  final String? Function(String?)? validator;
  final bool isObscure;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isVisibility = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(widget.header, style: AppStyle.captionSemiBold),
        SizedBox(height: context.h(8)),
        TextFormField(
          scrollPadding: .zero,
          controller: widget._controller,
          validator: widget.validator,
          cursorColor: AppColors.primaryDefault,
          obscureText: widget.isObscure && isVisibility,
          decoration: InputDecoration(
            suffixIcon: widget.isObscure
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        isVisibility = !isVisibility;
                      });
                    },
                    icon: Icon(
                      isVisibility ? Icons.visibility_off : Icons.visibility,
                      color: AppColors.textMuted,
                    ),
                  )
                : null,

            hintText: widget.hintText,
            hintStyle: AppStyle.caption.copyWith(color: AppColors.textMuted),
            filled: true,
            fillColor: AppColors.backGroundWhite,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.border),
              borderRadius: BorderRadius.circular(16),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.border),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ],
    );
  }
}
