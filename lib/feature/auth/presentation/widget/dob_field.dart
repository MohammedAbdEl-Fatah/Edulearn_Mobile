import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_style.dart';
import '../../domain/validation_field.dart';

class DobField extends StatefulWidget {
  final ValueChanged<DateTime> onDateSelected;

  const DobField({super.key, required this.onDateSelected});

  @override
  State<DobField> createState() => _DobFieldState();
}

class _DobFieldState extends State<DobField> {
  Future<void> _pickDob(FormFieldState<DateTime> field) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: field.value ?? DateTime(2000, 1, 1),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      field.didChange(picked);
      widget.onDateSelected(picked);
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    //new widget field test time
    return FormField<DateTime>(
      validator: (date) {
        final dob = date == null ? null : _formatDate(date);
        return ValidationField.isValidFieldDob(dob);
      },
      builder: (field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Date of Birth', style: AppStyle.captionSemiBold),
            const SizedBox(height: 8),
            InkWell(
              onTap: () => _pickDob(field),
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: field.hasError
                        ? Colors.red
                        : AppColors.border.withAlpha(30),
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.calendar_month_outlined),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        field.value == null
                            ? 'Select your date of birth'
                            : _formatDate(field.value!),
                        style: AppStyle.caption.copyWith(
                          color: field.value == null
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
            if (field.hasError) ...[
              const SizedBox(height: 6),
              Text(
                field.errorText!,
                style: const TextStyle(color: Colors.red, fontSize: 12),
              ),
            ],
          ],
        );
      },
    );
  }
}
