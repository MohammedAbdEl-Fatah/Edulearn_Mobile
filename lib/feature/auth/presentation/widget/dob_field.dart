import 'package:edulearn_mobile/core/theme/app_colors.dart';
import 'package:edulearn_mobile/core/theme/app_style.dart';
import 'package:flutter/material.dart';

class DobField extends StatefulWidget {
  const DobField({super.key});

  @override
  State<DobField> createState() => _DobFieldState();
}

class _DobFieldState extends State<DobField> {
  DateTime? selectedDob;

  Future<void> _pickDob() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000, 1, 1),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() => selectedDob = picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Date of Birth', style: AppStyle.captionSemiBold),
        const SizedBox(height: 8),
        InkWell(
          onTap: _pickDob,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.border.withAlpha(30)),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Icon(Icons.calendar_month_outlined),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    selectedDob == null
                        ? 'Select your date of birth'
                        : '${selectedDob!.day.toString().padLeft(2, '0')}/'
                              '${selectedDob!.month.toString().padLeft(2, '0')}/'
                              '${selectedDob!.year}',
                    style: AppStyle.caption.copyWith(
                      color: selectedDob == null
                          ? AppColors.textGray
                          : AppColors.textDark,
                    ),
                  ),
                ),
                const Icon(Icons.keyboard_arrow_down),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
