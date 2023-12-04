import 'package:debt_tracker/product/service/auth_service.dart';
import 'package:debt_tracker/product/utility/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

mixin AuthMixin<T extends ConsumerStatefulWidget> on ConsumerState<T> {
  final TextEditingController eMailTec = TextEditingController();
  final TextEditingController nameTec = TextEditingController();
  final TextEditingController passwordTec = TextEditingController();
  bool isPasswordObscured = true;
  final FocusNode eMailFocusNode = FocusNode();
  final FocusNode nameFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  bool isDatasValid = true;
  bool isRegister = false;

  @override
  void dispose() {
    eMailTec.dispose();
    nameTec.dispose();
    passwordTec.dispose();
    eMailFocusNode.dispose();
    nameFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  void obscurePassword() {
    setState(() {
      isPasswordObscured = !this.isPasswordObscured;
      if (passwordFocusNode.hasPrimaryFocus) {
        return;
      }
      passwordFocusNode.canRequestFocus = false;
    });
  }

  void checkEmailValidity() {
    var bBool = false;
    if (eMailTec.text.isNotEmpty) {
      bBool = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(eMailTec.text);
    }
    if (bBool == false) {
      CustomToast.showToast('Check your email.');
      isDatasValid = false;
    } else {
      isDatasValid = true;
    }
  }

  void checkPasswordValidity() {
    final password = passwordTec.text;
    if (password.isEmpty) {
      CustomToast.showToast('Şifre boş amk');
      isDatasValid = false;
    }
    if (password.length < 8) {
      CustomToast.showToast('Şifre 8 karakterden kısa.');
    } else {
      isDatasValid = true;
    }
  }

  void register() {
    setState(() {
      isRegister = true;
    });
  }

  Future<void> login() async {
    await AuthService.login(eMailTec.text, passwordTec.text);
  }
}
