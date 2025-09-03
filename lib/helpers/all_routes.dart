import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:samfost_app/features/auth/forgot_password/presentation/forgot_password_screen.dart';
import 'package:samfost_app/features/auth/login/presentation/login_screen.dart';
import 'package:samfost_app/features/auth/password_changed/presentation/password_changed_screen.dart';
import 'package:samfost_app/features/auth/reset_password/presentation/reset_password_screen.dart';
import 'package:samfost_app/features/auth/sign_up/presentation/sign_up_screen.dart';
import 'package:samfost_app/features/auth/verify_otp/presentation/verify_otp_screen.dart';
import 'package:samfost_app/features/create_journal_flow/activities/presentation/activities_screen.dart';
import 'package:samfost_app/features/create_journal_flow/create_ai_cahrt/presentation/create_ai_cahrt_screen.dart';
import 'package:samfost_app/features/create_journal_flow/create_journal/presentation/create_journal_screen.dart';
import 'package:samfost_app/features/create_journal_flow/experience/presentation/experience_screen.dart';
import 'package:samfost_app/features/create_journal_flow/inspriation/presentation/inspriation_screen.dart';
import 'package:samfost_app/features/create_journal_flow/journey_partner/presentation/journey_partner_screen.dart';
import 'package:samfost_app/features/create_journal_flow/journey_setup_confirmation/presentation/journey_setup_confirmation_screen.dart';
import 'package:samfost_app/features/create_journal_flow/name_of_trip/presentation/name_of_trip_screen.dart';
import 'package:samfost_app/features/create_journal_flow/place/presentation/place_screen.dart';
import 'package:samfost_app/features/create_journal_flow/place_option/presentation/place_option_screen.dart';
import 'package:samfost_app/features/home_flow/ai_chat/presentation/ai_chat_screen.dart';
import 'package:samfost_app/features/home_flow/home_navigation_screen.dart';
import 'package:samfost_app/features/journaling/ai_generated_journal_story/presentation/ai_generated_journal_story_screen.dart';
import 'package:samfost_app/features/journaling/first_memory_saved/presentation/first_memory_saved_screen.dart';
import 'package:samfost_app/features/manual_first_journaling/jornal_ai_chart/presentation/jornal_ai_chart_screen.dart';
import 'package:samfost_app/features/manual_first_journaling/journal_memory/presentation/journal_memory.dart';
import 'package:samfost_app/features/manual_first_journalings_second_part/ai_tree_journal_strory/presentation/ai_three_menually_journal_story_screen.dart';
import 'package:samfost_app/features/manual_first_journalings_second_part/manual_activites/presentation/manual_activites_screen.dart';
import 'package:samfost_app/features/manual_first_journalings_second_part/manual_create_journal/presentation/manual_create_journal_screen.dart';
import 'package:samfost_app/features/manual_first_journalings_second_part/manual_experence/presentation/manual_experence_screen.dart';
import 'package:samfost_app/features/manual_first_journalings_second_part/manual_first/presentation/manual_first_screen.dart';
import 'package:samfost_app/features/manual_first_journalings_second_part/manual_first_journal/presentation/manual_first_journal_screen.dart';
import 'package:samfost_app/features/manual_first_journalings_second_part/manual_inspriation/presentation/manual_inspriation_screen.dart';
import 'package:samfost_app/features/manual_first_journalings_second_part/manual_journal_partner/presentation/manual_journal_partner_screen.dart';
import 'package:samfost_app/features/manual_first_journalings_second_part/manual_name_of_trip/presentation/manual_name_of_trip_screen.dart';
import 'package:samfost_app/features/manual_first_journalings_second_part/manual_place/presentation/manual_place_screen.dart';
import 'package:samfost_app/features/manual_first_journalings_second_part/manual_place_option/presentation/manual_place_option_screen.dart';
import 'package:samfost_app/features/manual_first_journalings_second_part/manual_setup_condition/presentation/manual_setup_condition_screen.dart';
import 'package:samfost_app/features/other/presentation/error_screen.dart';
import 'package:samfost_app/features/profile_settings/eidt_personal_information/presentation/eidt_personal_information_screen.dart';
import 'package:samfost_app/features/profile_settings/helper_center/presentation/helper_center_screen.dart';
import 'package:samfost_app/features/profile_settings/journal_reminder/presentation/journal_reminder_screen.dart';
import 'package:samfost_app/features/profile_settings/notification/presentation/notification_screen.dart';
import 'package:samfost_app/features/profile_settings/update_password/presentation/update_password_screen.dart';
import 'package:samfost_app/features/subscription/subcription_after_free/presentation/subcription_after_free_screen.dart';
import 'package:samfost_app/features/subscription/subscription/presentation/subscription_screen.dart';
import 'package:samfost_app/features/user_flow/designed_for_pace/presentation/designed_for_pace_screen.dart';
import 'package:samfost_app/features/user_flow/intro_profile_setup/presentation/intro_profile_setup_screen.dart';
import 'package:samfost_app/features/user_flow/onboarding_qustion_one/presentation/onboarding_qustion_one_screen.dart';
import 'package:samfost_app/features/user_flow/onboarding_qustion_two/presentation/onboarding_qustion_two_screen.dart';
import 'package:samfost_app/features/user_flow/remember_it_all/presentation/remember_it_all_screen.dart';
import 'package:samfost_app/features/user_flow/reminder/presentation/user_reminder_screen.dart';
import 'package:samfost_app/features/user_flow/right_place/presentation/right_place_screen.dart';
import 'package:samfost_app/features/user_flow/subscription_pop_up/presentation/subscription_pop_up_screen.dart';
import 'package:samfost_app/features/user_three_create_journal/jornal_three_genaret_ai_story/presentation/jornal_three_genaret_ai_story_screen.dart';
import 'package:samfost_app/features/user_three_create_journal/journal_activites/presentation/journal_activites_screen.dart';
import 'package:samfost_app/features/user_three_create_journal/journal_ai_chart/presentation/journal_three_ai_chart_screen.dart';
import 'package:samfost_app/features/user_three_create_journal/journal_confirmation/presentation/journal_confirmation_screen.dart';
import 'package:samfost_app/features/user_three_create_journal/journal_experience/presentation/journal_experience_screen.dart';
import 'package:samfost_app/features/user_three_create_journal/journal_inspiration/presentation/journal_inspiration_screen.dart';
import 'package:samfost_app/features/user_three_create_journal/journal_place/presentation/journal_place_screen.dart';
import 'package:samfost_app/features/user_three_create_journal/journal_subcription_pop_up/presentation/journal_subcription_pop_up_screen.dart';
import 'package:samfost_app/features/user_three_create_journal/manual_journal/presentation/manual_journal_screen.dart';
import 'package:samfost_app/features/user_three_create_journal/name_of_trip_journal/presentation/name_of_trip_journal_screen.dart';
import 'package:samfost_app/features/user_three_create_journal/partner_journey/presentation/partner_journey_screen.dart';
import 'package:samfost_app/features/user_three_create_journal/trip_journal/presentation/trip_journal_screen.dart';
import 'package:samfost_app/features/user_three_create_journal/trip_start_place/presentation/trip_start_place_screen.dart';
import 'package:samfost_app/loading_screen.dart';
import '../features/home_flow/badeges/presentation/see_all_badges.dart';

import '../features/home_flow/journals/presentation/journal_journey_details.dart';

import '../features/other/presentation/offline_screen.dart';
import '../features/profile_settings/profile/presentation/delete_account_screen.dart';
import '../features/user_flow/onboarding_qustion_three/presentation/onboarding_qustion_three_screen.dart';
import '../features/home_flow/journals/presentation/journal_details_screen.dart';



final class Routes {
  static final Routes _routes = Routes._internal();

  Routes._internal();

  static Routes get instance => _routes;

  static const String navigationScreen = '/navigationScreen';
  static const String aiThreeMenuallyJournalStoryScreen = '/aiThreeMenuallyJournalStoryScreen';
  static const String updatePasswordScreen = '/updatePasswordScreen';
  static const String onboardingQustionOneScreen =
      '/onboardingQustionOneScreen';
  static const String rightPlaceScreen = '/rightPlaceScreen';
  static const String onboardingQustionTwoScreen =
      '/onboardingQustionTwoScreen';
  static const String designedForPaceScreen = '/designedForPaceScreen';
  static const String onboardingQustionThreeScreen =
      '/onboardingQustionThreeScreen';
  static const String introProfileSetupScreen = '/introProfileSetupScreen';
  static const String rememberItAllScreen = '/rememberItAllScreen';
  static const String sbscriptionPopUpScreen = '/sbscriptionPopUpScreen';
  static const String userReminderScreen = '/userReminderScreen';
  static const String subscriptionPopUpScreen = '/subscriptionPopUpScreen';
  static const String createJournalScreen = '/createJournalScreen';
  static const String dottedScreen = '/dottedScreen';
  static const String nameOfTripScreen = '/nameOfTripScreen';
  static const String placeScreen = '/placeScreen';
  static const String placeOptionScreen = '/placeOptionScreen';
  static const String journeyPartnerScreen = '/journeyPartnerScreen';
  static const String inspriationScreen = '/inspriationScreen';
  static const String experienceScreen = '/experienceScreen';
  static const String activitiesScreen = '/activitiesScreen';
  static const String journeySetupConfirmationScreen = '/journeySetupConfirmationScreen';
  static const String onboardingTwoScreen = '/onboardingTwoScreen';
  static const String loginScreen = '/loginScreen';
  static const String firstMemorySavedScreen = '/firstMemorySavedScreen';
  static const String aiGeneratedJournalStoryScreen = '/aiGeneratedJournalStoryScreen';
  static const String subscriptionScreen = '/subscriptionScreen';
  static const String subcriptionAfterFreeScreen = '/subcriptionAfterFreeScreen';
  static const String forgotPasswordScreen = '/forgotPasswordScreen';
  static const String resetPasswordScreen = '/resetPasswordScreen';
  static const String verifyOtpScreen = '/verifyOtpScreen';
  static const String passwordChangedScreen = '/passwordChangedScreen';
  static const String userIntroOnboardingProfileScreen = '/userIntroOnboardingProfileScreen';
  static const String journalingQuestionOneScreen = '/journalingQuestionOneScreen';
  static const String journeyRightPlaceScreen = '/journeyRightPlaceScreen';
  static const String journalingQuestionTwoScreen = '/journalingQuestionTwoScreen';
  static const String journalDesignedPaceScreen = '/journalDesignedPaceScreen';
  static const String journalingQuestionThreeScreen = '/journalingQuestionThreeScreen';
  static const String journeyRememberScreen = '/journeyRememberScreen';
  static const String unforgettableReminderScreen = '/unforgettableReminderScreen';
  static const String tripJournalScreen = '/tripJournalScreen';
  static const String nameOfTripJournalScreen = '/nameOfTripJournalScreen';
  static const String journalPlaceScreen = '/journalPlaceScreen';
  static const String tripStartPlaceScreen = '/tripStartPlaceScreen';
  static const String partnerJourneyScreen = '/partnerJourneyScreen';
  static const String journalInspirationScreen = '/journalInspirationScreen';
  static const String journalExperienceScreen = '/journalExperienceScreen';
  static const String journalActivitesScreen = '/journalActivitesScreen';
  static const String journalConfirmationScreen = '/journalConfirmationScreen';
  static const String journalSubcriptionPopUpScreen = '/journalSubcriptionPopUpScreen';
  static const String homeScreen = '/homeScreen';
  static const String journalDetailsScreen = '/journalDetailsScreen';
  static const String aiChatScreen = '/aiChatScreen';
  static const String manualJournalScreen = '/manualJournalScreen';
  static const String journalMemoryScreen = '/journalMemoryScreen';
  static const String manualFirstScreen = '/manualFirstScreen';
  static const String jornalAiChartScreen = '/jornalAiChartScreen';
  static const String editPersonalInformationScreen = '/editPersonalInformationScreen';
  static const String notificationScreen = '/notificationScreen';
  static const String journalReminderScreen = '/journalReminderScreen';
  static const String helperCenterScreen = '/helperCenterScreen';
  static const String signUpScreen = '/signUpScreen';
  static const String manualPlaceScreen = '/manualPlaceScreen';
  static const String manualPlaceOptionScreen = '/manualPlaceOptionScreen';
  static const String manualActivitesScreen = '/manualActivitesScreen';
  static const String jornalThreeGenaretAiStoryScreen = '/jornalThreeGenaretAiStoryScreen';

  static const String seeAllBadges = '/seeAllBadges';
 static const String manualExperenceScreen = '/manualExperenceScreen';

  static const String JournalJourneyDetails = '/JournalJourneyDetails';
  static const String createAiCahrtScreen = '/createAiCahrtScreen';
  static const String manualCreateJournalScreen = '/manualCreateJournalScreen';
  static const String manualNameOfTripScreen = '/manualNameOfTripScreen';
  static const String manualJournalPartnerScreen = '/manualJournalPartnerScreen';
  static const String manualInspriationScreen = '/manualInspriationScreen';
  static const String manualSetupConditionScreen = '/manualSetupConditionScreen';
  static const String manualFirstJournalScreen = '/manualFirstJournalScreen';
  static const String journalAiChartScreen = '/journalAiChartScreen';

  static const String deleteAccountScreen = '/deleteAccountScreen';
  static const String journalThreeAiChartScreen = '/journalThreeAiChartScreen';
  static const String errorScreen = '/errorScreen';
  static const String offlineScreen = '/offlineScreen';
  static const String loadingScreen = '/loadingScreen';

}

final class RouteGenerator {
  static final RouteGenerator _routeGenerator = RouteGenerator._internal();

  RouteGenerator._internal();

  static RouteGenerator get instance => _routeGenerator;

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.updatePasswordScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: UpdatePasswordScreen(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(
            builder: (context) => UpdatePasswordScreen(),
          );
        }

      case Routes.onboardingQustionOneScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: OnboardingQuestionOneScreen(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(
            builder: (context) => OnboardingQuestionOneScreen(),
          );
        }

        case Routes.aiThreeMenuallyJournalStoryScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: AiThreeMenuallyJournalStoryScreen(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(
            builder: (context) => AiThreeMenuallyJournalStoryScreen(),
          );
        }



        case Routes.aiGeneratedJournalStoryScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: AiGeneratedJournalStoryScreen(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(
            builder: (context) => AiGeneratedJournalStoryScreen(),
          );
        }

        case Routes.signUpScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: SignUpScreen(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(
            builder: (context) => SignUpScreen(),
          );
        }

      case Routes.onboardingQustionTwoScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: OnboardingQustionTwoScreen(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(
            builder: (context) => OnboardingQustionTwoScreen(),
          );
        }



      case Routes.designedForPaceScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: DesignedForPaceScreen(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(
            builder: (context) => DesignedForPaceScreen(),
          );
        }

      case Routes.onboardingQustionThreeScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: OnboardingQustionThreeScreen(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(
            builder: (context) => OnboardingQustionThreeScreen(),
          );
        }

      case Routes.introProfileSetupScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: IntroProfileSetupScreen(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(
            builder: (context) => IntroProfileSetupScreen(),
          );
        }

      case Routes.rememberItAllScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: RememberItAllScreen(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(
            builder: (context) => RememberItAllScreen(),
          );
        }

      case Routes.sbscriptionPopUpScreen: // check spelling
      case Routes.subscriptionPopUpScreen: // duplicate resolved
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: SubscriptionPopUpScreen(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(
            builder: (context) => SubscriptionPopUpScreen(),
          );
        }

      case Routes.userReminderScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: UserReminderScreen(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(
            builder: (context) => UserReminderScreen(),
          );
        }

      case Routes.createJournalScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: CreateJournalScreen(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(
            builder: (context) => CreateJournalScreen(),
          );
        }


      case Routes.placeScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: PlaceScreen(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(builder: (context) => PlaceScreen());
        }

   case Routes.createAiCahrtScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: CreateAiCahrtScreen(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(builder: (context) => CreateAiCahrtScreen());
        }

      case Routes.nameOfTripScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: NameOfTripScreen(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(builder: (context) => NameOfTripScreen());
        }

      case Routes.placeOptionScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: PlaceOptionScreen(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(builder: (context) => PlaceOptionScreen());
        }

      case Routes.homeScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: HomeNavigationScreen(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(
            builder: (context) => HomeNavigationScreen(),
          );
        }

      case Routes.journalDetailsScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: JournalDetailsScreen(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(
            builder: (context) => JournalDetailsScreen(),
          );
        }

      case Routes.journeyPartnerScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: JourneyPartnerScreen(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(
            builder: (context) => JourneyPartnerScreen(),
          );
        }

      case Routes.inspriationScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: InspriationScreen(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(
            builder: (context) => InspriationScreen(),
          );
        }

      case Routes.experienceScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: ExperienceScreen(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(
            builder: (context) => ExperienceScreen(),
          );
        }

      case Routes.activitiesScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: ActivitiesScreen(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(
            builder: (context) => ActivitiesScreen(),
          );
        }

      case Routes.journeySetupConfirmationScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: JourneySetupConfirmationScreen(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(
            builder: (context) => JourneySetupConfirmationScreen(),
          );
        }

      case Routes.loginScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: LoginScreen(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(
            builder: (context) => LoginScreen(),
          );
        }

      case Routes.firstMemorySavedScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: FirstMemorySavedScreen(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(
            builder: (context) => FirstMemorySavedScreen(),
          );
        }

      case Routes.subscriptionScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: SubscriptionScreen(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(
            builder: (context) => SubscriptionScreen(),
          );
        }

      case Routes.subcriptionAfterFreeScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: SubcriptionAfterFreeScreen(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(
            builder: (context) => SubcriptionAfterFreeScreen(),
          );
        }

      case Routes.forgotPasswordScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: ForgotPasswordScreen(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(
            builder: (context) => ForgotPasswordScreen(),
          );
        }

        case Routes.manualPlaceOptionScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: ManualPlaceOptionScreen(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(
            builder: (context) => ManualPlaceOptionScreen(),
          );
        }

        case Routes.manualJournalPartnerScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: ManualJournalPartnerScreen(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(
            builder: (context) => ManualJournalPartnerScreen(),
          );
        }


        case Routes.jornalThreeGenaretAiStoryScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: JornalThreeGenaretAiStoryScreen(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(
            builder: (context) => JornalThreeGenaretAiStoryScreen(),
          );
        }

      case Routes.resetPasswordScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: ResetPasswordScreen(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(
            builder: (context) => ResetPasswordScreen(),
          );
        }

        case Routes.manualInspriationScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: ManualInspriationScreen(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(
            builder: (context) => ManualInspriationScreen(),
          );
        }


        case Routes.manualExperenceScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: ManualExperenceScreen(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(
            builder: (context) => ManualExperenceScreen(),
          );
        }


 case Routes.manualActivitesScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: ManualActivitesScreen(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(
            builder: (context) => ManualActivitesScreen(),
          );
        }

        case Routes.manualSetupConditionScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: ManualSetupConditionScreen(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(
            builder: (context) => ManualSetupConditionScreen(),
          );
        }

      case Routes.verifyOtpScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: VerifyOtpScreen(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(
            builder: (context) => VerifyOtpScreen(),
          );
        }



      case Routes.passwordChangedScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: PasswordChangedScreen(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(
            builder: (context) => PasswordChangedScreen(),
          );
        }



      case Routes.rightPlaceScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: RightPlaceScreen(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(
            builder: (context) => RightPlaceScreen(),
          );
        }

        case Routes.journalThreeAiChartScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: JournalThreeAiChartScreen(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(
            builder: (context) => JournalThreeAiChartScreen(),
          );
        }

      case Routes.tripJournalScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: TripJournalScreen(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(
            builder: (context) => TripJournalScreen(),
          );
        }

      case Routes.nameOfTripJournalScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: NameOfTripJournalScreen(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(
            builder: (context) => NameOfTripJournalScreen(),
          );
        }


        case Routes.manualFirstJournalScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: ManualFirstJournalScreen(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(
            builder: (context) => ManualFirstJournalScreen(),
          );
        }

        case Routes.manualFirstScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: ManualFirstScreen(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(
            builder: (context) => ManualFirstScreen(),
          );
        }

      case Routes.journalPlaceScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: JournalPlaceScreen(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(
            builder: (context) => JournalPlaceScreen(),
          );
        }

      case Routes.tripStartPlaceScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: TripStartPlaceScreen(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(
            builder: (context) => TripStartPlaceScreen(),
          );
        }

      case Routes.partnerJourneyScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: PartnerJourneyScreen(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(
            builder: (context) => PartnerJourneyScreen(),
          );
        }

      case Routes.journalInspirationScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: JournalInspirationScreen(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(
            builder: (context) => JournalInspirationScreen(),
          );
        }

      case Routes.journalExperienceScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: JournalExperienceScreen(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(
            builder: (context) => JournalExperienceScreen(),
          );
        }

      case Routes.journalActivitesScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: JournalActivitesScreen(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(
            builder: (context) => JournalActivitesScreen(),
          );
        }

      case Routes.journalConfirmationScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: JournalConfirmationScreen(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(
            builder: (context) => JournalConfirmationScreen(),
          );
        }

      case Routes.journalSubcriptionPopUpScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: JournalSubcriptionPopUpScreen(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(
            builder: (context) => JournalSubcriptionPopUpScreen(),
          );
        }

        case Routes.manualJournalScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: ManualJournalScreen(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(
            builder: (context) => ManualJournalScreen(),
          );
        }


        case Routes.journalMemoryScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: JournalMemoryScreen(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(
            builder: (context) => JournalMemoryScreen(),
          );
        }

        case Routes.notificationScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: NotificationScreen(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(
            builder: (context) => NotificationScreen(),
          );
        }

        case Routes.jornalAiChartScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: JornalAiChartScreen(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(
            builder: (context) => JornalAiChartScreen(),
          );
        }

        case Routes.journalReminderScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: JournalReminderScreen(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(
            builder: (context) => JournalReminderScreen(),
          );
        }

        case Routes.helperCenterScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: HelperCenterScreen(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(
            builder: (context) => HelperCenterScreen(),
          );
        }

        case Routes.editPersonalInformationScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: EditPersonalInformationScreen(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(
            builder: (context) => EditPersonalInformationScreen(),
          );
        }

        case Routes.manualCreateJournalScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: ManualCreateJournalScreen(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(
            builder: (context) => ManualCreateJournalScreen(),
          );
        }

        case Routes.manualNameOfTripScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: ManualNameOfTripScreen(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(
            builder: (context) => ManualNameOfTripScreen(),
          );
        }



      case Routes.aiChatScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: AiChatScreen(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(builder: (context) => AiChatScreen());
        }

        case Routes.manualPlaceScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: ManualPlaceScreen(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(builder: (context) => ManualPlaceScreen());
        }


      case Routes.seeAllBadges:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: SeeAllBadges(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(builder: (context) => SeeAllBadges());
        }

      case Routes.JournalJourneyDetails:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: JournalJourneyDetails(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(builder: (context) => JournalJourneyDetails());

        }

      case Routes.deleteAccountScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: DeleteAccountScreen(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(builder: (context) => DeleteAccountScreen());

        }

      case Routes.errorScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: ErrorScreen(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(builder: (context) => ErrorScreen());
        }

      case Routes.offlineScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: OfflineScreen(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(builder: (context) => OfflineScreen());
        }

      case Routes.loadingScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: Loading(),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(builder: (context) => Loading());
        }

      default:
        return null;
    }
  }
}
class FadedTransitionRoute extends PageRouteBuilder {
  final Widget widget;
  @override
  final RouteSettings settings;

  FadedTransitionRoute({required this.widget, required this.settings})
    : super(
        settings: settings,
        reverseTransitionDuration: const Duration(milliseconds: 1),
        pageBuilder:
            (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) {
              return widget;
            },
        transitionDuration: const Duration(milliseconds: 1),
        transitionsBuilder:
            (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child,
            ) {
              return FadeTransition(
                opacity: CurvedAnimation(parent: animation, curve: Curves.ease),
                child: child,
              );
            },
      );
}

class ScreenTitle extends StatelessWidget {
  final Widget widget;

  const ScreenTitle({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: .5, end: 1),
      duration: const Duration(milliseconds: 500),
      curve: Curves.bounceIn,
      builder: (context, value, child) {
        return Opacity(opacity: value, child: child);
      },
      child: widget,
    );
  }
}
