part of '../login_tab.dart';

class _ForgotPasswordPopUp extends StatelessWidget {
  const _ForgotPasswordPopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
          child: Column(
            children: [
              Text(
                LoginStrings.resetPwdTitle,
                style: Theme.of(context).textTheme.titleLarge!,
              ),
              const SizedBox(height: 5),
              const Center(
                child:
                    Text(LoginStrings.resetPwdInstruction),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(left: 25, right: 25),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: LoginStrings.email,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        backgroundColor: MyColors.accent,
                        primary: MyColors.white,
                        side: const BorderSide(color: MyColors.accent),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        LoginStrings.resetPwdAction,
                        style: TextStyle(color:MyColors.white,),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Positioned(
          top: -50,
          child: CircleAvatar(
            backgroundColor: MyColors.accent,
            radius: 50,
            child: Icon(
              Icons.email_outlined,
              color: MyColors.white,
              size: 50,
            ),
          ),
        ),
      ],
    );
  }
}
