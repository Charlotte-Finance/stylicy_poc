import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../styles/theme.dart';
import 'confirmation_pop_up.dart';

class ResetPasswordPopUp extends StatelessWidget {
  const ResetPasswordPopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(AppLocalizations.of(context)!.reset_pwd),
              const SizedBox(height: 5),
              Center(
                child: Text(
                  AppLocalizations.of(context)!.reset_pwd_instructions,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                  left: 25,
                  right: 25,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    labelText:
                        AppLocalizations.of(context)!.email_form.toUpperCase(),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  showModalBottomSheet(
                      isScrollControlled: true,
                      enableDrag: false,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      context: context,
                      builder: (builder) {
                        return const ConfirmationPopUp();
                      });
                },
                child: SizedBox(
                  width: size.width * 0.4,
                  child: Center(
                    child: Text(
                      AppLocalizations.of(context)!
                          .reset_pwd_button
                          .toUpperCase(),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
        Positioned(
          top: -50,
          child: CircleAvatar(
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            backgroundColor: Theme.of(context).colorScheme.primary,
            radius: 50,
            child: const Icon(
              Icons.email_outlined,
              size: 50,
            ),
          ),
        ),
      ],
    );
  }
}
