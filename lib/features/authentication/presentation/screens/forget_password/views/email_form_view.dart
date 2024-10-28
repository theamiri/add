import 'package:aidra_drive/core/extension/string_extensions.dart';
import 'package:aidra_drive/core/shared/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmailFormView extends StatefulWidget {
  const EmailFormView({
    super.key,
  });

  @override
  State<EmailFormView> createState() => _EmailFormViewState();
}

class _EmailFormViewState extends State<EmailFormView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const Spacer(flex: 1),
          Text(
            'Reset Password',
            style: Theme.of(context).textTheme.displayLarge?.copyWith(),
          ),
          SizedBox(height: 50.sp),
          CustomTextFormField(
            hintText: 'Email',
            controller: _emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Email is required';
              } else if (!value.isValidEmail) {
                return 'Enter a valid email address';
              }
              return null;
            },
            suffixIcon: const Icon(Icons.mail_outline),
          ),
          SizedBox(height: 25.sp),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  FocusScope.of(context).unfocus();
                }
              },
              child: const Text('Reset'),
            ),
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
