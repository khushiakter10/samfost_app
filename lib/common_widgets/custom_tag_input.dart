import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samfost_app/common_widgets/custom_image_view.dart';
import 'package:textfield_tags/textfield_tags.dart';

class CountryTagField extends StatelessWidget {
  final List<String> suggestions;
  final StringTagController<String> controller;
  final String hintText;
  final String? Function(String)? validator;
  final String suffixIconAsset;
  final double distanceToField;

  const CountryTagField({
    super.key,
    required this.suggestions,
    required this.controller,
    required this.hintText,
    required this.suffixIconAsset,
    required this.distanceToField,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldTags<String>(
      textfieldTagsController: controller,
      initialTags: [],
      textSeparators: const [' ', ','],
      letterCase: LetterCase.normal,
      validator: validator ?? (String tag) {
        if (!suggestions.contains(tag)) {
          return "Invalid input";
        }
        return null;
      },
      inputFieldBuilder: (context, inputFieldValues) {
        return Autocomplete<String>(
          optionsBuilder: (TextEditingValue textEditingValue) {
            if (textEditingValue.text.isEmpty) {
              return const Iterable<String>.empty();
            }
            return suggestions.where((String country) {
              return country.toLowerCase().contains(
                textEditingValue.text.toLowerCase(),
              );
            });
          },
          fieldViewBuilder: (context, textEditingController, focusNode, onFieldSubmitted) {
            if (inputFieldValues.tags.isNotEmpty) {
              textEditingController.clear();
            }
            return TextField(
              controller: textEditingController,
              focusNode: focusNode,
              style: const TextStyle(fontSize: 16),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                fillColor: const Color(0xFFF8F8F8),
                filled: true,
                hintText: hintText,
                hintStyle: const TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey,
                ),
                suffixIcon: Transform.scale(
                  scale: 0.60,
                  child: CustomImageView(
                    imagePath: suffixIconAsset,
                    height: 24.h,
                  ),
                ),
                border: InputBorder.none,
                prefixIconConstraints: BoxConstraints(maxWidth: distanceToField * 0.74),
                prefixIcon: inputFieldValues.tags.isNotEmpty
                    ? SingleChildScrollView(
                  controller: inputFieldValues.tagScrollController,
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: inputFieldValues.tags.map((String tagData) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xFFE8E8E8),
                        ),
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        child: Row(
                          children: [
                            Text(
                              tagData,
                              style: const TextStyle(
                                color: Color(0xFF181818),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(width: 4),
                            InkWell(
                              child: const Icon(Icons.cancel, size: 14, color: Colors.grey),
                              onTap: () => inputFieldValues.onTagRemoved(tagData),
                            )
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                )
                    : null,
              ),
              onChanged: inputFieldValues.onTagChanged,
              onSubmitted: inputFieldValues.onTagSubmitted,
            );
          },
          onSelected: (String selection) {
            inputFieldValues.onTagSubmitted(selection);
          },
        );
      },
    );
  }
}
