part of 'package:debt_tracker/feature/auth/auth_view.dart';

class PasswordForm extends StatelessWidget {
  const PasswordForm({
    required this.tec,
    required this.focusNode,
    required this.isPasswordObscure,
    required this.onHidePass,
    required this.checkValidity,
    super.key,
  });
  final TextEditingController tec;
  final bool isPasswordObscure;
  final FocusNode focusNode;
  final void Function() onHidePass;
  final void Function() checkValidity;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: tec,
      autocorrect: false,
      onEditingComplete: checkValidity,
      keyboardType: TextInputType.visiblePassword,
      obscureText: isPasswordObscure,
      focusNode: focusNode,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelText: 'Password',
        // filled: true,
        // fillColor: Colors.deepPurpleAccent,
        isDense: true,
        // border: OutlineInputBorder(
        //   borderSide: BorderSide.none,
        //   borderRadius: BorderRadius.circular(10),
        // ),
        prefixIcon: const Icon(Icons.key, size: 24),
        suffixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
          child: GestureDetector(
            onTap: onHidePass,
            child: Icon(
              isPasswordObscure ? Icons.visibility_off_rounded : Icons.visibility_rounded,
              size: 24,
            ),
          ),
        ),
      ),
    );
  }
}
