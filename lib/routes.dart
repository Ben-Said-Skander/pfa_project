import 'package:get/get.dart';
import 'package:pfa_application_1/bindings/blog_bindings.dart';
import 'package:pfa_application_1/bindings/medicine_description.dart';
import 'package:pfa_application_1/bindings/medicines_bindings.dart';
import 'package:pfa_application_1/bindings/pharmacy_bindings.dart';
import 'package:pfa_application_1/bindings/register_bindings.dart';
import 'package:pfa_application_1/bindings/user_bindings.dart';

import 'package:pfa_application_1/core/constants/routes.dart';
import 'package:pfa_application_1/splash_screen.dart';

import 'package:pfa_application_1/view/screens/blog/personal_article_details.dart';
import 'package:pfa_application_1/view/screens/blog/search_articles.dart';
import 'package:pfa_application_1/view/screens/blog/user_articles.dart';

import 'package:pfa_application_1/view/screens/medicine%20description/medicine_description.dart';
import 'package:pfa_application_1/view/screens/onboarding_page.dart';
import 'package:pfa_application_1/view/screens/reminders/medicine_details.dart';
import 'package:pfa_application_1/view/screens/reminders/reminder.dart';
import 'package:pfa_application_1/view/screens/reset%20password/forget_password.dart';
import 'package:pfa_application_1/view/screens/reset%20password/reset_password.dart';
import 'package:pfa_application_1/view/screens/reset%20password/verify_code.dart';

import 'package:pfa_application_1/view/screens/search%20page/search_page.dart';

import 'package:pfa_application_1/view/screens/update%20profile/updateEmail.dart';
import 'package:pfa_application_1/view/screens/update%20profile/updateName.dart';
import 'package:pfa_application_1/view/screens/update%20profile/updatePhone.dart';

import 'view/screens/home.dart';

import 'view/screens/blog/add_new_blog.dart';
import 'view/screens/blog/blog.dart';
import 'view/screens/blog/help_blog.dart';
import 'view/screens/blog/missing_drug_blog.dart';
import 'view/screens/blog/see_all.dart';
import 'view/screens/blog/blog_details.dart';

import 'view/screens/reminders/add_new_medicine.dart';
import 'view/screens/settings.dart';
import 'view/screens/signIn.dart';
import 'view/screens/signUp.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
  GetPage(name: AppRoute.home, page: () => const Home(), bindings: [
    BlogBindings(),
    MedicinesBindings(),
    MedicineDescriptionBindings(),
    PharmaciesBindings()
  ]),
  GetPage(
    name: AppRoute.splash,
    page: () => const SplashScreen(),
  ),
  /********************************************************** */
  /********************************************************** */
  GetPage(
      name: AppRoute.details,
      page: () => const Details(),
      binding: MedicinesBindings()),
  /********************************************************** */
  GetPage(
      name: AppRoute.addMedicine,
      page: () => const AddMedicine(),
      binding: MedicinesBindings()),
  /********************************************************** */
  GetPage(
      name: AppRoute.reminder,
      page: () => const Reminders(),
      binding: MedicinesBindings()),
  /********************************************************** */
  GetPage(
      name: AppRoute.searchPage,
      page: () => const SearchPage(),
      binding: PharmaciesBindings()),
  /********************************************************** */
  GetPage(
      name: AppRoute.signIn,
      page: () => const SignIn(),
      binding: UserBindings()),
  /********************************************************** */
  GetPage(
      name: AppRoute.signup,
      page: () => const SignUp(),
      binding: RegisterBindings()),
  /********************************************************** */
  GetPage(
      name: AppRoute.settings,
      page: () => const Settings(),
      binding: UserBindings()),
  /********************************************************** */
  GetPage(
      name: AppRoute.blog,
      page: () => const BlogPage(),
      binding: BlogBindings()),
  /********************************************************** */
  GetPage(
      name: AppRoute.helpBlog,
      page: () => const HelpBlog(),
      binding: BlogBindings()),
  /********************************************************** */
  GetPage(
      name: AppRoute.missingBlog,
      page: () => const MissingBlog(),
      binding: BlogBindings()),
  /********************************************************** */
  GetPage(
      name: AppRoute.blogdetails,
      page: () => const BlogDetails(),
      binding: BlogBindings()),
  /********************************************************** */
  GetPage(
      name: AppRoute.addBlog,
      page: () => const AddBlog(),
      binding: BlogBindings()),
  /********************************************************** */
  GetPage(
      name: AppRoute.seeAll,
      page: () => const SeeAll(),
      binding: BlogBindings()),
  /********************************************************** */

  GetPage(
      name: AppRoute.userArticle,
      page: () => const UserArticle(),
      binding: BlogBindings()),
  /********************************************************** */
  GetPage(
      name: AppRoute.forgotPassword,
      page: () => const ForgotPassword(),
      binding: UserBindings()),
  /********************************************************** */
  GetPage(
      name: AppRoute.resetPasswrod,
      page: () => const ResetPassword(),
      binding: UserBindings()),
  /********************************************************** */
  GetPage(
      name: AppRoute.verifyCode,
      page: () => const VerifyCode(),
      binding: UserBindings()),
  /********************************************************** */
  GetPage(
      name: AppRoute.medicineDescription,
      page: () => const MedicineDescriptionPage(),
      binding: MedicineDescriptionBindings()),
  /********************************************************** */
  GetPage(
      name: AppRoute.personalArticleDetails,
      page: () => const PersonalArticleDetails(),
      binding: BlogBindings()),

  /********************************************************** */
  GetPage(
      name: AppRoute.searchArticles,
      page: () => const SearchArticles(),
      binding: BlogBindings()),

  /********************************************************** */
  GetPage(
      name: AppRoute.updateEmail,
      page: () => const UpdateEmail(),
      binding: UserBindings()),
  /********************************************************** */
  GetPage(
      name: AppRoute.updateName,
      page: () => const UpdateName(),
      binding: UserBindings()),
  /********************************************************** */
  GetPage(
      name: AppRoute.updatePhone,
      page: () => const UpdatePhone(),
      binding: UserBindings()),
  /********************************************************** */
];
