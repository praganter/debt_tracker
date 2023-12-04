library auth;

import 'package:debt_tracker/core/localization/export.dart';
import 'package:debt_tracker/feature/auth/auth_state_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'widget/email_name_form.dart';
part 'widget/password_form.dart';

class AuthView extends ConsumerStatefulWidget {
  const AuthView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AuthViewState();
}

class _AuthViewState extends ConsumerState<AuthView> with AuthMixin<AuthView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TrText(LocaleKeys.auth_login),
          EmailUserForm(
            focusNode: eMailFocusNode,
            tec: eMailTec,
            isEMail: true,
            checkValidity: checkEmailValidity,
          ),
          PasswordForm(
            tec: passwordTec,
            isPasswordObscure: isPasswordObscured,
            focusNode: passwordFocusNode,
            onHidePass: obscurePassword,
            checkValidity: checkPasswordValidity,
          ),
        ],
      ),
    );
  }
}
