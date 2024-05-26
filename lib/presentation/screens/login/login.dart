import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_app/core/network/cache_helper.dart';
import 'package:flutter_app/core/utils/sizedbox_extension.dart';
import 'package:flutter_app/presentation/cubit/authenticate_cubit.dart';
import 'package:flutter_app/presentation/screens/home/home_screen.dart';
import 'package:flutter_app/presentation/widgets/default_button_widget.dart';
import 'package:flutter_app/presentation/widgets/default_form_field.dart';
import 'package:flutter_app/presentation/widgets/loading.dart';
import 'package:flutter_app/presentation/widgets/login_logo_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/config/localization/app_localizations.dart';
import 'package:flutter_app/config/routes/app_routes.dart';
import 'package:flutter_app/config/routes/navigate_methods.dart';
import 'package:flutter_app/core/global/global_variables.dart';
import 'package:flutter_app/core/utils/app_colors.dart';
import 'package:flutter_app/core/utils/app_strings.dart';
import 'package:flutter_app/core/utils/assets_manager.dart';
import 'package:flutter_app/core/utils/media_extension.dart';
import 'package:flutter_app/core/widgets/message_alert.dart';
import 'package:flutter_app/core/widgets/username_text.dart';
import 'package:flutter_app/core/functions/functions.dart';
import '../../../../../depdency_injection.dart' as di;
import 'package:lottie/lottie.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool hidePassword = true;
  final _formKey = GlobalKey<FormState>();

  void login(var state) {
    if (_formKey.currentState!.validate()) {
      if (state is AuthenticateLoadingState) {
        // SchedulerBinding.instance.addPostFrameCallback((_) {
        //   showDialog(
        //       context: context,
        //       builder: (context) => AlertDialog(
        //             content: Text("jhgfghj"),
        //           ));
        // });
      }
      BlocProvider.of<AuthenticateCubit>(context)
          .login(phoneController.text, passwordController.text);
      if (state is AuthenticateLoginSuccessState) {
        Navigator.pushNamedAndRemoveUntil(
            context, Routes.home, (route) => false);
        CacheHelper.saveData(key: "registered", value: "true");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticateCubit, AuthenticateState>(
      listener: (context, state) {
        if (state is AuthenticateLoginSuccessState) {
          AppFunctions.showsToast(
              text: "تم تسجيل الدخول بنجاح",
              color: AppColors.primary,
              seconds: 3,
              context);
        } else if (state is AuthenticateLoginErrorState) {
          AppFunctions.showsToast(
              text: state.meesage, color: AppColors.red, seconds: 3, context);
        }
      },
      builder: (context, state) {
        var cubit = BlocProvider.of<AuthenticateCubit>(context);
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: const Text(''),
          ),
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // custom widget
                  const LoginLogoWidget(),
                  SizedBox(
                    height: context.height * .07,
                  ),
                  // custom widget
                  DefaultTextFormField(
                    width: context.width * .9,
                    height: context.height * .097,
                    controller: phoneController,
                    hintText: AppStrings.username,
                    type: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppStrings.pleaseEnterName;
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: context.height * .03,
                  ),
                  DefaultTextFormField(
                    width: context.width * .9,
                    height: context.height * .09,
                    controller: passwordController,
                    hintText: AppStrings.password,
                    type: TextInputType.name,
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                        onPressed: () {
                          cubit.changeVisibility();
                        },
                        icon: cubit.visiblity
                            ? Icon(
                                Icons.visibility_off,
                                color: AppColors.primary,
                              )
                            : Icon(Icons.visibility_outlined,
                                color: AppColors.primary)),
                    obscureText: cubit.visiblity,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppStrings.pleaseEnterPassword;
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: context.height * .08,
                  ),
                  // custom button
                  DefaultButton(
                    onPressed: () {
                      login(state);
                    },
                    width: context.width * .85,
                    text: 'تسجيل دخول',
                    textColor: AppColors.white,
                  ),
                  TextButton(
                      style: ButtonStyle(
                          overlayColor: MaterialStateProperty.all(
                              AppColors.grey.withOpacity(.1)),
                          backgroundColor:
                              MaterialStateProperty.all(AppColors.white)),
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.signUp);
                      },
                      child: Text(
                        'إنشاء حساب جديد',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      )),
                  1.ph,
                  if (state is AuthenticateLoadingState)

                    /// custom loading
                    const Loading(),
                  //showDialog(context: context, builder: (context) => const Loading()),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
