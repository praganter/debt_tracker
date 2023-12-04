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
          const Spacer(),
          const Icon(Icons.language_rounded, size: 150),
          const Spacer(),
          DecoratedBox(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(45),
                topRight: Radius.circular(45),
              ),
              color: Colors.deepOrange,
            ),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    TrText(
                      isRegister ? LocaleKeys.auth_register : LocaleKeys.auth_login,
                      textScaler: const TextScaler.linear(3),
                    ),
                    if (isRegister)
                      EmailUserForm(
                        focusNode: nameFocusNode,
                        tec: nameTec,
                        isEMail: false,
                      ),
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
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: TrText(LocaleKeys.auth_forget_password),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        if (!isRegister)
                          ElevatedButton(
                            onPressed: () async {
                              await login();
                            },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                            child: TrText(
                              LocaleKeys.auth_login,
                            ),
                          ),
                        ElevatedButton(
                          onPressed: register,
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                          child: TrText(
                            LocaleKeys.auth_register,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
