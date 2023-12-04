part of 'package:debt_tracker/feature/auth/auth_view.dart';

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
