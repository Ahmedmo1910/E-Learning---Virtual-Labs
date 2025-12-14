// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Welcome to Your Dashboard`
  String get welcomeDashboard {
    return Intl.message(
      'Welcome to Your Dashboard',
      name: 'welcomeDashboard',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `Arabic`
  String get arabic {
    return Intl.message('Arabic', name: 'arabic', desc: '', args: []);
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Skip`
  String get skip {
    return Intl.message('Skip', name: 'skip', desc: '', args: []);
  }

  /// `Prev`
  String get prev {
    return Intl.message('Prev', name: 'prev', desc: '', args: []);
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `Get Started`
  String get getStarted {
    return Intl.message('Get Started', name: 'getStarted', desc: '', args: []);
  }

  /// `Empower Your\n Mind with Us`
  String get onBoardingTitle1 {
    return Intl.message(
      'Empower Your\n Mind with Us',
      name: 'onBoardingTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Every great journey begins with curiosity,\nLet’s unlock the power of your mind together.`
  String get onBoardingSubtitle1 {
    return Intl.message(
      'Every great journey begins with curiosity,\nLet’s unlock the power of your mind together.',
      name: 'onBoardingSubtitle1',
      desc: '',
      args: [],
    );
  }

  /// `Unlock Your Learning\n               Potential`
  String get onBoardingTitle2 {
    return Intl.message(
      'Unlock Your Learning\n               Potential',
      name: 'onBoardingTitle2',
      desc: '',
      args: [],
    );
  }

  /// `You already have what it takes — we’ll help you bring it to life.`
  String get onBoardingSubtitle2 {
    return Intl.message(
      'You already have what it takes — we’ll help you bring it to life.',
      name: 'onBoardingSubtitle2',
      desc: '',
      args: [],
    );
  }

  /// `Dive into Your First\n             Lesson!`
  String get onBoardingTitle3 {
    return Intl.message(
      'Dive into Your First\n             Lesson!',
      name: 'onBoardingTitle3',
      desc: '',
      args: [],
    );
  }

  /// `Start your learning adventure today — your future self will thank you!`
  String get onBoardingSubtitle3 {
    return Intl.message(
      'Start your learning adventure today — your future self will thank you!',
      name: 'onBoardingSubtitle3',
      desc: '',
      args: [],
    );
  }

  /// `This field is required`
  String get thisFieldIsRequired {
    return Intl.message(
      'This field is required',
      name: 'thisFieldIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Failed to send OTP`
  String get otpSendFailed {
    return Intl.message(
      'Failed to send OTP',
      name: 'otpSendFailed',
      desc: '',
      args: [],
    );
  }

  /// `OTP verification failed`
  String get otpVerifyFailed {
    return Intl.message(
      'OTP verification failed',
      name: 'otpVerifyFailed',
      desc: '',
      args: [],
    );
  }

  /// `Password reset failed`
  String get resetFailed {
    return Intl.message(
      'Password reset failed',
      name: 'resetFailed',
      desc: '',
      args: [],
    );
  }

  /// `Failed to send OTP`
  String get failedToSendOtp {
    return Intl.message(
      'Failed to send OTP',
      name: 'failedToSendOtp',
      desc: '',
      args: [],
    );
  }

  /// `OTP is incorrect`
  String get otpIncorrect {
    return Intl.message(
      'OTP is incorrect',
      name: 'otpIncorrect',
      desc: '',
      args: [],
    );
  }

  /// `Resetting password failed`
  String get resetPasswordFailed {
    return Intl.message(
      'Resetting password failed',
      name: 'resetPasswordFailed',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPasswordTitle {
    return Intl.message(
      'Reset Password',
      name: 'resetPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPasswordHint {
    return Intl.message(
      'New Password',
      name: 'newPasswordHint',
      desc: '',
      args: [],
    );
  }

  /// `Password is required`
  String get passwordRequired {
    return Intl.message(
      'Password is required',
      name: 'passwordRequired',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters`
  String get passwordMinLength {
    return Intl.message(
      'Password must be at least 8 characters',
      name: 'passwordMinLength',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPasswordButton {
    return Intl.message(
      'Reset Password',
      name: 'resetPasswordButton',
      desc: '',
      args: [],
    );
  }

  /// `Verify OTP`
  String get verifyOtpTitle {
    return Intl.message(
      'Verify OTP',
      name: 'verifyOtpTitle',
      desc: '',
      args: [],
    );
  }

  /// `OTP Code`
  String get otpCodeHint {
    return Intl.message('OTP Code', name: 'otpCodeHint', desc: '', args: []);
  }

  /// `OTP is required`
  String get otpRequired {
    return Intl.message(
      'OTP is required',
      name: 'otpRequired',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get verifyButton {
    return Intl.message('Verify', name: 'verifyButton', desc: '', args: []);
  }

  /// `Account created successfully`
  String get accountCreatedSuccessfully {
    return Intl.message(
      'Account created successfully',
      name: 'accountCreatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Login successfully`
  String get loginSuccessfully {
    return Intl.message(
      'Login successfully',
      name: 'loginSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `OTP sent to {email}`
  String otpSentToEmail(Object email) {
    return Intl.message(
      'OTP sent to $email',
      name: 'otpSentToEmail',
      desc: 'Shown when OTP is sent to user\'s email',
      args: [email],
    );
  }

  /// `OTP verified successfully`
  String get otpVerified {
    return Intl.message(
      'OTP verified successfully',
      name: 'otpVerified',
      desc: '',
      args: [],
    );
  }

  /// `Password changed successfully`
  String get passwordChangedSuccessfully {
    return Intl.message(
      'Password changed successfully',
      name: 'passwordChangedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Logged out successfully`
  String get loggedOutSuccessfully {
    return Intl.message(
      'Logged out successfully',
      name: 'loggedOutSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Password reset successfully`
  String get passwordResetSuccessfully {
    return Intl.message(
      'Password reset successfully',
      name: 'passwordResetSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password ?`
  String get forgetPasswordTitle {
    return Intl.message(
      'Forget Password ?',
      name: 'forgetPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email address and\nwe’ll send a confirmation code`
  String get forgetPasswordSubtitle {
    return Intl.message(
      'Enter your email address and\nwe’ll send a confirmation code',
      name: 'forgetPasswordSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get emailHint {
    return Intl.message('Email', name: 'emailHint', desc: '', args: []);
  }

  /// `Continue`
  String get continueButton {
    return Intl.message('Continue', name: 'continueButton', desc: '', args: []);
  }

  /// `Enter OTP`
  String get enterOtp {
    return Intl.message('Enter OTP', name: 'enterOtp', desc: '', args: []);
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Verify`
  String get verify {
    return Intl.message('Verify', name: 'verify', desc: '', args: []);
  }

  /// `New Password`
  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Change`
  String get change {
    return Intl.message('Change', name: 'change', desc: '', args: []);
  }

  /// `Login failed, please try again`
  String get loginFailed {
    return Intl.message(
      'Login failed, please try again',
      name: 'loginFailed',
      desc: '',
      args: [],
    );
  }

  /// `I Already Have an Account`
  String get alreadyHaveAccount {
    return Intl.message(
      'I Already Have an Account',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message('Sign In', name: 'signIn', desc: '', args: []);
  }

  /// `Login successful`
  String get loginSuccessful {
    return Intl.message(
      'Login successful',
      name: 'loginSuccessful',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcome {
    return Intl.message('Welcome', name: 'welcome', desc: '', args: []);
  }

  /// `Back!`
  String get back {
    return Intl.message('Back!', name: 'back', desc: '', args: []);
  }

  /// `Username or Email`
  String get usernameOrEmail {
    return Intl.message(
      'Username or Email',
      name: 'usernameOrEmail',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Verify Email`
  String get verifyEmailTitle {
    return Intl.message(
      'Verify Email',
      name: 'verifyEmailTitle',
      desc: '',
      args: [],
    );
  }

  /// `OTP Code`
  String get otpCode {
    return Intl.message('OTP Code', name: 'otpCode', desc: '', args: []);
  }

  /// `Email Verified Successfully!`
  String get emailVerifiedSuccess {
    return Intl.message(
      'Email Verified Successfully!',
      name: 'emailVerifiedSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Verification failed`
  String get verificationFailed {
    return Intl.message(
      'Verification failed',
      name: 'verificationFailed',
      desc: '',
      args: [],
    );
  }

  /// `Enter the OTP sent to: {email}`
  String enterOtpp(Object email) {
    return Intl.message(
      'Enter the OTP sent to: $email',
      name: 'enterOtpp',
      desc: '',
      args: [email],
    );
  }

  /// `Failed to receive Notifications`
  String get failedNotifications {
    return Intl.message(
      'Failed to receive Notifications',
      name: 'failedNotifications',
      desc: '',
      args: [],
    );
  }

  /// `Failed to get Profile`
  String get failedGetProfile {
    return Intl.message(
      'Failed to get Profile',
      name: 'failedGetProfile',
      desc: '',
      args: [],
    );
  }

  /// `Failed to get Lessons`
  String get failedGetLessons {
    return Intl.message(
      'Failed to get Lessons',
      name: 'failedGetLessons',
      desc: '',
      args: [],
    );
  }

  /// `Failed to get Schedule`
  String get failedGetSchedule {
    return Intl.message(
      'Failed to get Schedule',
      name: 'failedGetSchedule',
      desc: '',
      args: [],
    );
  }

  /// `Technical`
  String get categoryTechnical {
    return Intl.message(
      'Technical',
      name: 'categoryTechnical',
      desc: '',
      args: [],
    );
  }

  /// `Design`
  String get categoryDesign {
    return Intl.message('Design', name: 'categoryDesign', desc: '', args: []);
  }

  /// `Art`
  String get categoryArt {
    return Intl.message('Art', name: 'categoryArt', desc: '', args: []);
  }

  /// `Marketing`
  String get categoryMarketing {
    return Intl.message(
      'Marketing',
      name: 'categoryMarketing',
      desc: '',
      args: [],
    );
  }

  /// `E-Commerce`
  String get categoryECommerce {
    return Intl.message(
      'E-Commerce',
      name: 'categoryECommerce',
      desc: '',
      args: [],
    );
  }

  /// `All Subjects`
  String get allSubjects {
    return Intl.message(
      'All Subjects',
      name: 'allSubjects',
      desc: '',
      args: [],
    );
  }

  /// `My Schedule`
  String get mySchedule {
    return Intl.message('My Schedule', name: 'mySchedule', desc: '', args: []);
  }

  /// `See All`
  String get seeAll {
    return Intl.message('See All', name: 'seeAll', desc: '', args: []);
  }

  /// `No Notifications Available`
  String get noNotifications {
    return Intl.message(
      'No Notifications Available',
      name: 'noNotifications',
      desc: '',
      args: [],
    );
  }

  /// `New Message`
  String get newMessage {
    return Intl.message('New Message', name: 'newMessage', desc: '', args: []);
  }

  /// `Session {number}`
  String session(Object number) {
    return Intl.message(
      'Session $number',
      name: 'session',
      desc: '',
      args: [number],
    );
  }

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }

  /// `Hi, {name} 👋🏻`
  String greeting(Object name) {
    return Intl.message(
      'Hi, $name 👋🏻',
      name: 'greeting',
      desc: '',
      args: [name],
    );
  }

  /// `Welcome to World of Learning!`
  String get welcomeMessage {
    return Intl.message(
      'Welcome to World of Learning!',
      name: 'welcomeMessage',
      desc: '',
      args: [],
    );
  }

  /// `Failed to get Profile`
  String get failedToGetProfile {
    return Intl.message(
      'Failed to get Profile',
      name: 'failedToGetProfile',
      desc: '',
      args: [],
    );
  }

  /// `Failed to update Profile`
  String get failedToUpdateProfile {
    return Intl.message(
      'Failed to update Profile',
      name: 'failedToUpdateProfile',
      desc: '',
      args: [],
    );
  }

  /// `Logout Failed`
  String get logoutFailed {
    return Intl.message(
      'Logout Failed',
      name: 'logoutFailed',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profileScreenTitle {
    return Intl.message(
      'Profile',
      name: 'profileScreenTitle',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullNameLabel {
    return Intl.message('Full Name', name: 'fullNameLabel', desc: '', args: []);
  }

  /// `Phone Number`
  String get phoneNumberLabel {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumberLabel',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get updateButton {
    return Intl.message('Update', name: 'updateButton', desc: '', args: []);
  }

  /// `Logout`
  String get logoutButton {
    return Intl.message('Logout', name: 'logoutButton', desc: '', args: []);
  }

  /// `Updated Successfully`
  String get updatedSuccessfully {
    return Intl.message(
      'Updated Successfully',
      name: 'updatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Failed to update`
  String get failedToUpdate {
    return Intl.message(
      'Failed to update',
      name: 'failedToUpdate',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get editProfile {
    return Intl.message(
      'Edit Profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `DashBoard`
  String get dashboard {
    return Intl.message('DashBoard', name: 'dashboard', desc: '', args: []);
  }

  /// `Grades`
  String get grades {
    return Intl.message('Grades', name: 'grades', desc: '', args: []);
  }

  /// `Attendence`
  String get attendence {
    return Intl.message('Attendence', name: 'attendence', desc: '', args: []);
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Sign Out`
  String get signOut {
    return Intl.message('Sign Out', name: 'signOut', desc: '', args: []);
  }

  /// `Are you sure you want to sign out?`
  String get signOutConfirmation {
    return Intl.message(
      'Are you sure you want to sign out?',
      name: 'signOutConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Full Name`
  String get fullName {
    return Intl.message('Full Name', name: 'fullName', desc: '', args: []);
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Update Profile`
  String get updateProfile {
    return Intl.message(
      'Update Profile',
      name: 'updateProfile',
      desc: '',
      args: [],
    );
  }

  /// `Failed to get Dashboard`
  String get failedToGetDashboard {
    return Intl.message(
      'Failed to get Dashboard',
      name: 'failedToGetDashboard',
      desc: '',
      args: [],
    );
  }

  /// `Failed to get Grades`
  String get failedToGetGrades {
    return Intl.message(
      'Failed to get Grades',
      name: 'failedToGetGrades',
      desc: '',
      args: [],
    );
  }

  /// `Failed to get Attendance`
  String get failedToGetAttendance {
    return Intl.message(
      'Failed to get Attendance',
      name: 'failedToGetAttendance',
      desc: '',
      args: [],
    );
  }

  /// `Failed to get Lessons`
  String get failedToGetLessons {
    return Intl.message(
      'Failed to get Lessons',
      name: 'failedToGetLessons',
      desc: '',
      args: [],
    );
  }

  /// `Failed to receive Notifications`
  String get failedToGetNotifications {
    return Intl.message(
      'Failed to receive Notifications',
      name: 'failedToGetNotifications',
      desc: '',
      args: [],
    );
  }

  /// `Attendance`
  String get attendance {
    return Intl.message('Attendance', name: 'attendance', desc: '', args: []);
  }

  /// `Lesson 1`
  String get lesson1 {
    return Intl.message('Lesson 1', name: 'lesson1', desc: '', args: []);
  }

  /// `Lesson 2`
  String get lesson2 {
    return Intl.message('Lesson 2', name: 'lesson2', desc: '', args: []);
  }

  /// `Lesson 3`
  String get lesson3 {
    return Intl.message('Lesson 3', name: 'lesson3', desc: '', args: []);
  }

  /// `Lesson 4`
  String get lesson4 {
    return Intl.message('Lesson 4', name: 'lesson4', desc: '', args: []);
  }

  /// `Intro to course`
  String get introToCourse {
    return Intl.message(
      'Intro to course',
      name: 'introToCourse',
      desc: '',
      args: [],
    );
  }

  /// `Dart`
  String get dart {
    return Intl.message('Dart', name: 'dart', desc: '', args: []);
  }

  /// `Dart variables and data types`
  String get dartVariables {
    return Intl.message(
      'Dart variables and data types',
      name: 'dartVariables',
      desc: '',
      args: [],
    );
  }

  /// `Conditions and control flow`
  String get conditions {
    return Intl.message(
      'Conditions and control flow',
      name: 'conditions',
      desc: '',
      args: [],
    );
  }

  /// `Creating Your First Project in Figma`
  String get firstProjectFigma {
    return Intl.message(
      'Creating Your First Project in Figma',
      name: 'firstProjectFigma',
      desc: '',
      args: [],
    );
  }

  /// `Working with Layers and Groups in Figma`
  String get workingLayersFigma {
    return Intl.message(
      'Working with Layers and Groups in Figma',
      name: 'workingLayersFigma',
      desc: '',
      args: [],
    );
  }

  /// `70 Hours`
  String get hours {
    return Intl.message('70 Hours', name: 'hours', desc: '', args: []);
  }

  /// `Completion Certificate`
  String get completionCertificate {
    return Intl.message(
      'Completion Certificate',
      name: 'completionCertificate',
      desc: '',
      args: [],
    );
  }

  /// `Beginner`
  String get beginner {
    return Intl.message('Beginner', name: 'beginner', desc: '', args: []);
  }

  /// `Description`
  String get description {
    return Intl.message('Description', name: 'description', desc: '', args: []);
  }

  /// `Lorem ipsum dolor sit amet consectetur. Quisque drasut frtyhyhp hdhyunbh pellentesqu nec quisque amet proin elit amet...`
  String get courseDescriptionText {
    return Intl.message(
      'Lorem ipsum dolor sit amet consectetur. Quisque drasut frtyhyhp hdhyunbh pellentesqu nec quisque amet proin elit amet...',
      name: 'courseDescriptionText',
      desc: '',
      args: [],
    );
  }

  /// `Instructor`
  String get instructor {
    return Intl.message('Instructor', name: 'instructor', desc: '', args: []);
  }

  /// `William Robert`
  String get instructorName {
    return Intl.message(
      'William Robert',
      name: 'instructorName',
      desc: '',
      args: [],
    );
  }

  /// `Figma Certified`
  String get instructorTitle {
    return Intl.message(
      'Figma Certified',
      name: 'instructorTitle',
      desc: '',
      args: [],
    );
  }

  /// `All Exams :`
  String get allExams {
    return Intl.message('All Exams :', name: 'allExams', desc: '', args: []);
  }

  /// `This course will be available soon`
  String get courseComingSoon {
    return Intl.message(
      'This course will be available soon',
      name: 'courseComingSoon',
      desc: '',
      args: [],
    );
  }

  /// `Loading Video...`
  String get loadingVideo {
    return Intl.message(
      'Loading Video...',
      name: 'loadingVideo',
      desc: '',
      args: [],
    );
  }

  /// `All Grades`
  String get allGrades {
    return Intl.message('All Grades', name: 'allGrades', desc: '', args: []);
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Lessons`
  String get lessons {
    return Intl.message('Lessons', name: 'lessons', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
