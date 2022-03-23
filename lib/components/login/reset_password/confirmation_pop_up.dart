import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../styles/theme.dart';

class ConfirmationPopUp extends StatelessWidget {
  const ConfirmationPopUp({Key? key}) : super(key: key);

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
              Text(AppLocalizations.of(context)!.reset_mail_sent),
              const SizedBox(height: 5),
              Center(
                child: Text(
                  AppLocalizations.of(context)!.reset_mail_instructions,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: SizedBox(
                  width: size.width * 0.4,
                  child: Center(
                    child: Text(
                      AppLocalizations.of(context)!.close_reset.toUpperCase(),
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
              Icons.outgoing_mail,
              size: 50,
            ),
          ),
        ),
      ],
    );
  }
}
