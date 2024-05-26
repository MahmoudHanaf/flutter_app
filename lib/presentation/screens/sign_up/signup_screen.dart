import 'package:flutter/material.dart';
import 'package:flutter_app/config/routes/app_routes.dart';
import 'package:flutter_app/core/functions/functions.dart';
import 'package:flutter_app/core/network/cache_helper.dart';
import 'package:flutter_app/core/utils/app_colors.dart';
import 'package:flutter_app/core/utils/app_strings.dart';
import 'package:flutter_app/core/utils/media_extension.dart';
import 'package:flutter_app/core/utils/sizedbox_extension.dart';
import 'package:flutter_app/presentation/cubit/authenticate_cubit.dart';
import 'package:flutter_app/presentation/widgets/default_button_widget.dart';
import 'package:flutter_app/presentation/widgets/default_form_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  List levels = [
    "الصف الأول الثانوى",
    "الصف الثانى الثانوى",
    "الصف الثالث الثانوى"
  ];

  void signUp(var state, int level) {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<AuthenticateCubit>(context).signUp(nameController.text,
          phoneController.text, passwordController.text, level);
      if (state is AuthenticateSignUpSuccessState) {
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
        if (state is AuthenticateSignUpSuccessState) {
          AppFunctions.showsToast(
              text: "تم إنشاء حسابك بنجاح",
              color: AppColors.primary,
              seconds: 3,
              context);
        } else if (state is AuthenticateSignUpErrorState) {
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
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "إنشاء حساب",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.secondColor,
                          fontWeight: FontWeight.w800,
                          fontSize: 20),
                    ),
                  ),

                  SizedBox(
                    height: context.height * .06,
                  ),
                  // custom widget
                  Center(
                    child: DefaultTextFormField(
                      width: context.width * .9,
                      height: context.height * .097,
                      controller: nameController,
                      hintText: AppStrings.username,
                      type: TextInputType.name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppStrings.pleaseEnterName;
                        }
                        return null;
                      },
                    ),
                  ),
                  10.ph,
                  Center(
                    child: DefaultTextFormField(
                      width: context.width * .9,
                      height: context.height * .097,
                      controller: phoneController,
                      hintText: AppStrings.phoneNumber,
                      type: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppStrings.pleaseEnterName;
                        }
                        return null;
                      },
                    ),
                  ),
                  10.ph,
                  Center(
                    child: DefaultTextFormField(
                      width: context.width * .9,
                      height: context.height * .097,
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
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      width: context.width * .9,
                      height: context.height * .061,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(10)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                            autofocus: true,
                            borderRadius: BorderRadius.circular(10),
                            isDense: true,
                            padding: EdgeInsetsDirectional.symmetric(
                                horizontal: 15, vertical: 10),
                            elevation: 2,
                            hint: cubit.dropDownValue == null
                                ? Text(
                                    'برجاء إختيار المستوى الدراسى',
                                  )
                                : Text(
                                    cubit.dropDownValue ??
                                        'برجاء إختيار المستوى الدراسى',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(color: AppColors.blackColor),
                                  ),
                            isExpanded: true,
                            iconSize: 30.0,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: AppColors.blackColor),
                            items: levels.map(
                              (val) {
                                return DropdownMenuItem<String>(
                                  value: val,
                                  child: Text(val),
                                );
                              },
                            ).toList(),
                            onChanged: (val) {
                              cubit.changeDropDownValue(
                                  val ?? 'برجاء إختيار المستوى الدراسى');
                            }),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: context.height * .08,
                  ),
                  Center(
                    child: DefaultButton(
                      onPressed: () {
                        // login(state);
                        //cubit.signUp("mahmoud", "0101254859", "12222", 3);
                        signUp(state, 1);
                      },
                      width: context.width * .85,
                      text: 'إنشاء حساب',
                      textColor: AppColors.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'لديك حساب بالفعل ؟',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      TextButton(
                          style: ButtonStyle(
                              overlayColor: MaterialStateProperty.all(
                                  AppColors.grey.withOpacity(.1)),
                              backgroundColor:
                                  MaterialStateProperty.all(AppColors.white)),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'تسجيل الدخول',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.secondColor),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
