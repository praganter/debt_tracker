library auth;

import 'package:debt_tracker/feature/auth/auth_state_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
          const Text('Tittle'),
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

class EmailUserForm extends StatelessWidget {
  const EmailUserForm({
    required this.focusNode,
    required this.tec,
    required this.isEMail,
    this.checkValidity,
    super.key,
  });

  final FocusNode focusNode;
  final bool isEMail;
  final TextEditingController tec;
  final void Function()? checkValidity;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: tec,
      autocorrect: false,
      onEditingComplete: checkValidity,
      keyboardType: isEMail ? TextInputType.emailAddress : TextInputType.text,
      focusNode: focusNode,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelText: isEMail ? 'E-mail' : 'Düzelt artık be adam',
        isDense: true,
        prefixIcon: const Icon(Icons.mail, size: 24),
      ),
    );
  }
}
