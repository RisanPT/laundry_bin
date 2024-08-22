import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'genarated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en')
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Laundry bin'**
  String get appName;

  /// No description provided for @splashScreenFirstHeading.
  ///
  /// In en, this message translates to:
  /// **'Ready To Get Started'**
  String get splashScreenFirstHeading;

  /// No description provided for @splashScreenScondHeading.
  ///
  /// In en, this message translates to:
  /// **'Set Location'**
  String get splashScreenScondHeading;

  /// No description provided for @splashScreenThirdHeading.
  ///
  /// In en, this message translates to:
  /// **'Finest Cleaning'**
  String get splashScreenThirdHeading;

  /// No description provided for @splashFirstSubTitle.
  ///
  /// In en, this message translates to:
  /// **'Enjoy clean, fresh clothes with Laundry Bin. Schedule your first pickup now!'**
  String get splashFirstSubTitle;

  /// No description provided for @splashSecondSubTitle.
  ///
  /// In en, this message translates to:
  /// **'It is super easy to set your location through our custom map'**
  String get splashSecondSubTitle;

  /// No description provided for @splashThirdSubTitle.
  ///
  /// In en, this message translates to:
  /// **'Give your premium clothes the premium care'**
  String get splashThirdSubTitle;

  /// No description provided for @splashSkip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get splashSkip;

  /// No description provided for @withphone.
  ///
  /// In en, this message translates to:
  /// **'Continue With Phone Number'**
  String get withphone;

  /// No description provided for @withgoogle.
  ///
  /// In en, this message translates to:
  /// **'Continue With Google'**
  String get withgoogle;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Log In'**
  String get login;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @registerPageHeading.
  ///
  /// In en, this message translates to:
  /// **'Hey There !\n Welcome'**
  String get registerPageHeading;

  /// No description provided for @enterName.
  ///
  /// In en, this message translates to:
  /// **'Enter Name'**
  String get enterName;

  /// No description provided for @enterEmailOrNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter Email ID or Phone Number'**
  String get enterEmailOrNumber;

  /// No description provided for @enterPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get enterPassword;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get confirmPassword;

  /// No description provided for @alreadyAc.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyAc;

  /// No description provided for @continueFor.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueFor;

  /// No description provided for @enteremailid.
  ///
  /// In en, this message translates to:
  /// **'Enter Email ID'**
  String get enteremailid;

  /// No description provided for @loginPageHeading.
  ///
  /// In en, this message translates to:
  /// **'Welcome back! Glad to see you, Again!'**
  String get loginPageHeading;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPassword;

  /// No description provided for @dontHaveAc.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get dontHaveAc;

  /// No description provided for @registerNow.
  ///
  /// In en, this message translates to:
  /// **'Register Now'**
  String get registerNow;

  /// No description provided for @otpPageHeading.
  ///
  /// In en, this message translates to:
  /// **'We have sent\n You An OTP'**
  String get otpPageHeading;

  /// No description provided for @dontReceiveOtp.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t receive OTP?'**
  String get dontReceiveOtp;

  /// No description provided for @resendOtp.
  ///
  /// In en, this message translates to:
  /// **'RESEND OTP'**
  String get resendOtp;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @forgotPasswordHeading.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPasswordHeading;

  /// No description provided for @forgotPasswordSubTitle.
  ///
  /// In en, this message translates to:
  /// **'Don\'t worry! It occurs. Please enter the email or phone number linked with your account.'**
  String get forgotPasswordSubTitle;

  /// No description provided for @sendOtp.
  ///
  /// In en, this message translates to:
  /// **'Send OTP'**
  String get sendOtp;

  /// No description provided for @rememberPassword.
  ///
  /// In en, this message translates to:
  /// **'Remember Password ?'**
  String get rememberPassword;

  /// No description provided for @otpVerificationHeading.
  ///
  /// In en, this message translates to:
  /// **'OTP Verification'**
  String get otpVerificationHeading;

  /// No description provided for @otpVerificationSubTitle.
  ///
  /// In en, this message translates to:
  /// **'Enter the verification code we just sent on\n your email address.'**
  String get otpVerificationSubTitle;

  /// No description provided for @verify.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get verify;

  /// No description provided for @didntReceivedCode.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t received code?'**
  String get didntReceivedCode;

  /// No description provided for @resend.
  ///
  /// In en, this message translates to:
  /// **'Resend'**
  String get resend;

  /// No description provided for @newPasswordHeading.
  ///
  /// In en, this message translates to:
  /// **'Create new password'**
  String get newPasswordHeading;

  /// No description provided for @newPasswordSubTitle.
  ///
  /// In en, this message translates to:
  /// **'Your new password must be unique from those previously used.'**
  String get newPasswordSubTitle;

  /// No description provided for @enterNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter new password'**
  String get enterNewPassword;

  /// No description provided for @resetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get resetPassword;

  /// No description provided for @passwordChangedHeading.
  ///
  /// In en, this message translates to:
  /// **'Password Changed!'**
  String get passwordChangedHeading;

  /// No description provided for @passwordChangedSubTitle.
  ///
  /// In en, this message translates to:
  /// **'Your password has been\n changed successfully.'**
  String get passwordChangedSubTitle;

  /// No description provided for @backToLogin.
  ///
  /// In en, this message translates to:
  /// **'Back to Login'**
  String get backToLogin;

  /// No description provided for @homeHeading.
  ///
  /// In en, this message translates to:
  /// **'Hello'**
  String get homeHeading;

  /// No description provided for @washing.
  ///
  /// In en, this message translates to:
  /// **'Washing'**
  String get washing;

  /// No description provided for @ironing.
  ///
  /// In en, this message translates to:
  /// **'Ironing'**
  String get ironing;

  /// No description provided for @washAndIron.
  ///
  /// In en, this message translates to:
  /// **'Wash & Iron'**
  String get washAndIron;

  /// No description provided for @dryClean.
  ///
  /// In en, this message translates to:
  /// **'Dry Clean'**
  String get dryClean;

  /// No description provided for @allselectedProduct.
  ///
  /// In en, this message translates to:
  /// **'{allselectedCount}Items'**
  String allselectedProduct(Object allselectedCount);

  /// No description provided for @proceed.
  ///
  /// In en, this message translates to:
  /// **'Proceed'**
  String get proceed;

  /// No description provided for @instruction.
  ///
  /// In en, this message translates to:
  /// **'Instructions'**
  String get instruction;

  /// No description provided for @enterNotes.
  ///
  /// In en, this message translates to:
  /// **'Enter notes here'**
  String get enterNotes;

  /// No description provided for @summary.
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get summary;

  /// No description provided for @pickupPoint.
  ///
  /// In en, this message translates to:
  /// **'Pickup Point'**
  String get pickupPoint;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @office.
  ///
  /// In en, this message translates to:
  /// **'Office'**
  String get office;

  /// No description provided for @pickUp.
  ///
  /// In en, this message translates to:
  /// **'Pick Up '**
  String get pickUp;

  /// No description provided for @dateFormat.
  ///
  /// In en, this message translates to:
  /// **'DD-MM-YY'**
  String get dateFormat;

  /// No description provided for @slot.
  ///
  /// In en, this message translates to:
  /// **'Slot'**
  String get slot;

  /// No description provided for @delivery.
  ///
  /// In en, this message translates to:
  /// **'Delivery'**
  String get delivery;

  /// No description provided for @collectFromStore.
  ///
  /// In en, this message translates to:
  /// **'Collect from store'**
  String get collectFromStore;

  /// No description provided for @expectedDelivery.
  ///
  /// In en, this message translates to:
  /// **'Expected Delivery :'**
  String get expectedDelivery;

  /// No description provided for @expressDelivery.
  ///
  /// In en, this message translates to:
  /// **'Express Delivery'**
  String get expressDelivery;

  /// No description provided for @coupon.
  ///
  /// In en, this message translates to:
  /// **'Coupon'**
  String get coupon;

  /// No description provided for @enteCode.
  ///
  /// In en, this message translates to:
  /// **'Ente code'**
  String get enteCode;

  /// No description provided for @applyCode.
  ///
  /// In en, this message translates to:
  /// **'APPLY CODE'**
  String get applyCode;

  /// No description provided for @receipt.
  ///
  /// In en, this message translates to:
  /// **'Receipt'**
  String get receipt;

  /// No description provided for @deliveryCharge.
  ///
  /// In en, this message translates to:
  /// **'Delivery Charge'**
  String get deliveryCharge;

  /// No description provided for @tax.
  ///
  /// In en, this message translates to:
  /// **'Tax'**
  String get tax;

  /// No description provided for @couponReduction.
  ///
  /// In en, this message translates to:
  /// **'Coupon Reduction'**
  String get couponReduction;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @paymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Payment method'**
  String get paymentMethod;

  /// No description provided for @cod.
  ///
  /// In en, this message translates to:
  /// **'COD'**
  String get cod;

  /// No description provided for @creditCard.
  ///
  /// In en, this message translates to:
  /// **'Credit Card'**
  String get creditCard;

  /// No description provided for @upi.
  ///
  /// In en, this message translates to:
  /// **'UPI'**
  String get upi;

  /// No description provided for @offer.
  ///
  /// In en, this message translates to:
  /// **'Offers'**
  String get offer;

  /// No description provided for @offerFor.
  ///
  /// In en, this message translates to:
  /// **'Free delivery on every orders for {monthcount}months'**
  String offerFor(Object monthcount);

  /// No description provided for @gpay.
  ///
  /// In en, this message translates to:
  /// **'Google pay'**
  String get gpay;

  /// No description provided for @upiId.
  ///
  /// In en, this message translates to:
  /// **'{id}@ybl'**
  String upiId(Object id);

  /// No description provided for @phonepe.
  ///
  /// In en, this message translates to:
  /// **'Phonepe'**
  String get phonepe;

  /// No description provided for @addUpi.
  ///
  /// In en, this message translates to:
  /// **'Or add UPI ID'**
  String get addUpi;

  /// No description provided for @enterUPIID.
  ///
  /// In en, this message translates to:
  /// **'Enter UPI ID'**
  String get enterUPIID;

  /// No description provided for @saveForFuture.
  ///
  /// In en, this message translates to:
  /// **'Save for future'**
  String get saveForFuture;

  /// No description provided for @payment.
  ///
  /// In en, this message translates to:
  /// **'Pay ₹'**
  String get payment;

  /// No description provided for @locationSearch.
  ///
  /// In en, this message translates to:
  /// **'Search for your location'**
  String get locationSearch;

  /// No description provided for @adjust.
  ///
  /// In en, this message translates to:
  /// **'Move the pin to adjust'**
  String get adjust;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @editOnMap.
  ///
  /// In en, this message translates to:
  /// **'Edit on Map'**
  String get editOnMap;

  /// No description provided for @addressDetails.
  ///
  /// In en, this message translates to:
  /// **'Apartment/ building/ flat name'**
  String get addressDetails;

  /// No description provided for @floorNumber.
  ///
  /// In en, this message translates to:
  /// **'Floor number'**
  String get floorNumber;

  /// No description provided for @contactDetails.
  ///
  /// In en, this message translates to:
  /// **'Contact details'**
  String get contactDetails;

  /// No description provided for @saveFor.
  ///
  /// In en, this message translates to:
  /// **'Save For'**
  String get saveFor;

  /// No description provided for @other.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get other;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @confirmMSG.
  ///
  /// In en, this message translates to:
  /// **'Your Booking is Confirmed'**
  String get confirmMSG;

  /// No description provided for @backToHome.
  ///
  /// In en, this message translates to:
  /// **'Back To home'**
  String get backToHome;

  /// No description provided for @order.
  ///
  /// In en, this message translates to:
  /// **'Orders'**
  String get order;

  /// No description provided for @allOrders.
  ///
  /// In en, this message translates to:
  /// **'All Orders'**
  String get allOrders;

  /// No description provided for @onGoing.
  ///
  /// In en, this message translates to:
  /// **'On-going'**
  String get onGoing;

  /// No description provided for @details.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get details;

  /// No description provided for @tracking.
  ///
  /// In en, this message translates to:
  /// **'Tracking'**
  String get tracking;

  /// No description provided for @completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completed;

  /// No description provided for @addRating.
  ///
  /// In en, this message translates to:
  /// **'Add Rating'**
  String get addRating;

  /// No description provided for @cancelled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get cancelled;

  /// No description provided for @userID.
  ///
  /// In en, this message translates to:
  /// **'Id: {userid}'**
  String userID(Object userid);

  /// No description provided for @status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// No description provided for @bookingAccepted.
  ///
  /// In en, this message translates to:
  /// **'Booking Accepted'**
  String get bookingAccepted;

  /// No description provided for @pickup.
  ///
  /// In en, this message translates to:
  /// **'Pickup'**
  String get pickup;

  /// No description provided for @reschedule.
  ///
  /// In en, this message translates to:
  /// **'Reschedule'**
  String get reschedule;

  /// No description provided for @deliveryExpress.
  ///
  /// In en, this message translates to:
  /// **'Delivery (Express)'**
  String get deliveryExpress;

  /// No description provided for @cancelBooking.
  ///
  /// In en, this message translates to:
  /// **'Cancel Booking'**
  String get cancelBooking;

  /// No description provided for @itemCount.
  ///
  /// In en, this message translates to:
  /// **'x{itemCount}'**
  String itemCount(Object itemCount);

  /// No description provided for @deliveryTime.
  ///
  /// In en, this message translates to:
  /// **'Estimated delivery time'**
  String get deliveryTime;

  /// No description provided for @orderStatus.
  ///
  /// In en, this message translates to:
  /// **'Order Status'**
  String get orderStatus;

  /// No description provided for @pickedup.
  ///
  /// In en, this message translates to:
  /// **'Picked up'**
  String get pickedup;

  /// No description provided for @outOfDelivery.
  ///
  /// In en, this message translates to:
  /// **'Out for delivery'**
  String get outOfDelivery;

  /// No description provided for @feedbackHeading.
  ///
  /// In en, this message translates to:
  /// **'How satisfied were you with your experience'**
  String get feedbackHeading;

  /// No description provided for @feedBackWrite.
  ///
  /// In en, this message translates to:
  /// **'Enter Feedback here'**
  String get feedBackWrite;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @cancelHeading.
  ///
  /// In en, this message translates to:
  /// **'Are You Sure'**
  String get cancelHeading;

  /// No description provided for @cancelSubTitle.
  ///
  /// In en, this message translates to:
  /// **'Do You want to cancel This Booking'**
  String get cancelSubTitle;

  /// No description provided for @yesCancel.
  ///
  /// In en, this message translates to:
  /// **'Yes, Cancel'**
  String get yesCancel;

  /// No description provided for @cancelReasonHeadind.
  ///
  /// In en, this message translates to:
  /// **'Tell us your reason for cancelling'**
  String get cancelReasonHeadind;

  /// No description provided for @changeInPlans.
  ///
  /// In en, this message translates to:
  /// **'Change in Plans'**
  String get changeInPlans;

  /// No description provided for @emergencies.
  ///
  /// In en, this message translates to:
  /// **'Emergencies'**
  String get emergencies;

  /// No description provided for @travelPlans.
  ///
  /// In en, this message translates to:
  /// **'Travel Plans'**
  String get travelPlans;

  /// No description provided for @budgetConstraints.
  ///
  /// In en, this message translates to:
  /// **'Budget Constraints'**
  String get budgetConstraints;

  /// No description provided for @unsatisfactoryServiceExperience.
  ///
  /// In en, this message translates to:
  /// **'Unsatisfactory Service Experience'**
  String get unsatisfactoryServiceExperience;

  /// No description provided for @availabilityOfAlternatives.
  ///
  /// In en, this message translates to:
  /// **'Availability of Alternatives'**
  String get availabilityOfAlternatives;

  /// No description provided for @personalHealthIssues.
  ///
  /// In en, this message translates to:
  /// **'Personal Health Issues'**
  String get personalHealthIssues;

  /// No description provided for @qualityConcerns.
  ///
  /// In en, this message translates to:
  /// **'Quality Concerns'**
  String get qualityConcerns;

  /// No description provided for @changeInLaundryVolume.
  ///
  /// In en, this message translates to:
  /// **'Change in Laundry Volume'**
  String get changeInLaundryVolume;

  /// No description provided for @bookingCancelHeading.
  ///
  /// In en, this message translates to:
  /// **'Booking Cancelled'**
  String get bookingCancelHeading;

  /// No description provided for @bookingCancelSubTitle.
  ///
  /// In en, this message translates to:
  /// **'Your  booking successfully cancelled see you next time !'**
  String get bookingCancelSubTitle;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @editProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit profile'**
  String get editProfile;

  /// No description provided for @history.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get history;

  /// No description provided for @contactUs.
  ///
  /// In en, this message translates to:
  /// **'Contact us'**
  String get contactUs;

  /// No description provided for @dashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboard;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @faq.
  ///
  /// In en, this message translates to:
  /// **'FAQ'**
  String get faq;

  /// No description provided for @aboutUs.
  ///
  /// In en, this message translates to:
  /// **'About Us'**
  String get aboutUs;

  /// No description provided for @reviews.
  ///
  /// In en, this message translates to:
  /// **'Reviews'**
  String get reviews;

  /// No description provided for @privacypolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy policy'**
  String get privacypolicy;

  /// No description provided for @logOut.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logOut;

  /// No description provided for @message.
  ///
  /// In en, this message translates to:
  /// **'Message....'**
  String get message;

  /// No description provided for @overview.
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get overview;

  /// No description provided for @totalBookings.
  ///
  /// In en, this message translates to:
  /// **'Total bookings'**
  String get totalBookings;

  /// No description provided for @yourReviews.
  ///
  /// In en, this message translates to:
  /// **'Your Reviews'**
  String get yourReviews;

  /// No description provided for @couponDiscount.
  ///
  /// In en, this message translates to:
  /// **'Coupon Discount'**
  String get couponDiscount;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'+Add'**
  String get add;

  /// No description provided for @firstQuestion.
  ///
  /// In en, this message translates to:
  /// **'What laundry services do you offer?'**
  String get firstQuestion;

  /// No description provided for @firstQuestionAns.
  ///
  /// In en, this message translates to:
  /// **'We offer comprehensive laundry services, including wash, dry, and fold options for various garments and linens. Our experienced team ensures top-quality.'**
  String get firstQuestionAns;

  /// No description provided for @secondQuestion.
  ///
  /// In en, this message translates to:
  /// **'How long does it take to get iron done?'**
  String get secondQuestion;

  /// No description provided for @secondQuestionAns.
  ///
  /// In en, this message translates to:
  /// **'Typically, ironing services are completed within 24 hours, depending on the volume and specifics of your order. Our goal is to ensure your clothes are ready promptly while maintaining our high-quality standards'**
  String get secondQuestionAns;

  /// No description provided for @thirdQuestion.
  ///
  /// In en, this message translates to:
  /// **'Do you offer pickup and delivery?'**
  String get thirdQuestion;

  /// No description provided for @thirdQuestionAns.
  ///
  /// In en, this message translates to:
  /// **'Yes, we offer convenient pickup and delivery services to make your laundry experience seamless. Sit back and relax while we take care of the rest!'**
  String get thirdQuestionAns;

  /// No description provided for @fourthQuestion.
  ///
  /// In en, this message translates to:
  /// **'What are your pricing options?'**
  String get fourthQuestion;

  /// No description provided for @fourthQuestionAns.
  ///
  /// In en, this message translates to:
  /// **'Our pricing options are designed to fit your needs and budget. We offer competitive rates based on the type and quantity of items you need laundered or ironed. Please visit our app or website for detailed pricing information tailored to your specific requirements'**
  String get fourthQuestionAns;

  /// No description provided for @fifthQuestion.
  ///
  /// In en, this message translates to:
  /// **'How do you ensure the safety laundry?'**
  String get fifthQuestion;

  /// No description provided for @fifthQuestionAns.
  ///
  /// In en, this message translates to:
  /// **'We prioritize the safety of your laundry through rigorous procedures and high standards. Our experienced team follows strict guidelines for sorting, washing, and handling garments. We use quality products and equipment, ensuring thorough cleaning while preserving fabric integrity. Additionally, our facilities are regularly sanitized to maintain cleanliness and hygiene. Your garments are in safe hands with us.'**
  String get fifthQuestionAns;

  /// No description provided for @sixthQuestion.
  ///
  /// In en, this message translates to:
  /// **'Do you provide eco-friendly options?'**
  String get sixthQuestion;

  /// No description provided for @sixthQuestionAns.
  ///
  /// In en, this message translates to:
  /// **'Yes, we offer eco-friendly options to align with your sustainability goals. Our services include eco-conscious detergents and methods that reduce environmental impact while ensuring effective cleaning. We are committed to providing choices that support both your laundry needs and our planet\'s well-being.'**
  String get sixthQuestionAns;

  /// No description provided for @aboutes.
  ///
  /// In en, this message translates to:
  /// **'At Laundrybin, we are passionate about providing top-quality laundry services tailored to meet the unique needs of our customers. With years of experience in the industry, our dedicated team is committed to delivering impeccable results and exceptional customer service. From wash, dry, and fold services to specialized treatments for delicate fabrics, we handle each garment with the utmost care and attention to detail. Our state-of-the-art equipment and eco-friendly practices ensure that your laundry is not only clean but also handled responsibly. Conveniently located in the heart of {Location}, we strive to make the laundry process hassle-free and efficient for everyone. Trust us with your laundry needs, and experience the difference here. we understand that convenience is key in today\'s fast-paced world. That\'s why we offer convenient pickup and delivery services, ensuring that your laundry experience fits seamlessly into your busy schedule. Our friendly and professional staff are here to assist you every step of the way, whether you have special requests or simply need advice on garment care. As a locally owned and operated business, we take pride in serving our community with integrity and reliability. Discover the ease and satisfaction of outsourcing your laundry to {shopeName}, where quality meets convenience.'**
  String aboutes(Object Location, Object shopeName);

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy policy'**
  String get privacyPolicy;

  /// No description provided for @dataPrivacy.
  ///
  /// In en, this message translates to:
  /// **'Data Privacy and Protection'**
  String get dataPrivacy;

  /// No description provided for @detailsOfDataPrivacy.
  ///
  /// In en, this message translates to:
  /// **'At Laundrybin, we take your privacy seriously and are committed to protecting your personal information. Any data collected, such as your name, contact details, and laundry preferences, is used solely for the purpose of providing our laundry services and improving your customer experience. We do not share your information with third parties unless required by law or with your explicit consent. Our website may use cookies to enhance your browsing experience, but these do not collect personally identifiable information. We employ industry-standard security measures to safeguard your data against unauthorized access, alteration, or disclosure. By using our services, you consent to the collection and use of your information as outlined in this privacy policy.'**
  String get detailsOfDataPrivacy;

  /// No description provided for @informationPrivacy.
  ///
  /// In en, this message translates to:
  /// **'Information Collection and Usage'**
  String get informationPrivacy;

  /// No description provided for @detailsOfInformationPrivacy.
  ///
  /// In en, this message translates to:
  /// **'At {shopName}, we collect personal information from you when you use our services or interact with our website. This information may include your name, contact details, payment information, and preferences. We use this information to provide and improve our laundry services, personalize your experience, and communicate with you about your orders. Rest assured, we never sell or share your information with third parties for marketing purposes without your consent. Your privacy and security are our top priorities.'**
  String detailsOfInformationPrivacy(Object shopName);

  /// No description provided for @myReviews.
  ///
  /// In en, this message translates to:
  /// **'My Reviews'**
  String get myReviews;

  /// No description provided for @editReview.
  ///
  /// In en, this message translates to:
  /// **'Edit Review'**
  String get editReview;

  /// No description provided for @andAbove.
  ///
  /// In en, this message translates to:
  /// **'and above'**
  String get andAbove;

  /// No description provided for @logoutHeading.
  ///
  /// In en, this message translates to:
  /// **'Are You Sure'**
  String get logoutHeading;

  /// No description provided for @logoutSubTitle.
  ///
  /// In en, this message translates to:
  /// **'Do You want to Log out ?'**
  String get logoutSubTitle;

  /// No description provided for @yesLogout.
  ///
  /// In en, this message translates to:
  /// **'Yes, Log out'**
  String get yesLogout;

  /// No description provided for @profileDetails.
  ///
  /// In en, this message translates to:
  /// **'Profile Details'**
  String get profileDetails;

  /// No description provided for @addEmailID.
  ///
  /// In en, this message translates to:
  /// **'Add Email ID'**
  String get addEmailID;

  /// No description provided for @enterPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter Phone Number'**
  String get enterPhoneNumber;

  /// No description provided for @deleteProfilePic.
  ///
  /// In en, this message translates to:
  /// **'Delete Profile Pic'**
  String get deleteProfilePic;

  /// No description provided for @changeProfilePic.
  ///
  /// In en, this message translates to:
  /// **'Change Profile Pc'**
  String get changeProfilePic;

  /// No description provided for @orders.
  ///
  /// In en, this message translates to:
  /// **'Orders'**
  String get orders;

  /// No description provided for @newOrders.
  ///
  /// In en, this message translates to:
  /// **'New'**
  String get newOrders;

  /// No description provided for @inProgressOrders.
  ///
  /// In en, this message translates to:
  /// **'In Progress'**
  String get inProgressOrders;

  /// No description provided for @readyForDeliveryOrders.
  ///
  /// In en, this message translates to:
  /// **'Ready'**
  String get readyForDeliveryOrders;

  /// No description provided for @completedOrders.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get completedOrders;

  /// No description provided for @itemsCount.
  ///
  /// In en, this message translates to:
  /// **'Items'**
  String get itemsCount;

  /// No description provided for @totalAmount.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get totalAmount;

  /// No description provided for @addoffersbtntxt.
  ///
  /// In en, this message translates to:
  /// **'Add Offers'**
  String get addoffersbtntxt;

  /// No description provided for @offertabtitle.
  ///
  /// In en, this message translates to:
  /// **'Offers'**
  String get offertabtitle;

  /// No description provided for @coupontabtitle.
  ///
  /// In en, this message translates to:
  /// **'Coupons'**
  String get coupontabtitle;

  /// No description provided for @addimage.
  ///
  /// In en, this message translates to:
  /// **'Add Image'**
  String get addimage;

  /// No description provided for @offerdescription.
  ///
  /// In en, this message translates to:
  /// **'Offer Description'**
  String get offerdescription;

  /// No description provided for @offerdetails.
  ///
  /// In en, this message translates to:
  /// **'Offer Details'**
  String get offerdetails;

  /// No description provided for @percentage.
  ///
  /// In en, this message translates to:
  /// **'Percentage'**
  String get percentage;

  /// No description provided for @amount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get amount;

  /// No description provided for @offerpercentage.
  ///
  /// In en, this message translates to:
  /// **'Offer Percentage'**
  String get offerpercentage;

  /// No description provided for @offeramount.
  ///
  /// In en, this message translates to:
  /// **'Offer Amount'**
  String get offeramount;

  /// No description provided for @enterpercentage.
  ///
  /// In en, this message translates to:
  /// **'Enter Percentage'**
  String get enterpercentage;

  /// No description provided for @enteramount.
  ///
  /// In en, this message translates to:
  /// **'Enter Amount'**
  String get enteramount;

  /// No description provided for @selectall.
  ///
  /// In en, this message translates to:
  /// **'Select All'**
  String get selectall;

  /// No description provided for @deselectall.
  ///
  /// In en, this message translates to:
  /// **'Deselect All'**
  String get deselectall;

  /// No description provided for @services.
  ///
  /// In en, this message translates to:
  /// **'Services'**
  String get services;

  /// No description provided for @cloths.
  ///
  /// In en, this message translates to:
  /// **'Cloths'**
  String get cloths;

  /// No description provided for @addCloths.
  ///
  /// In en, this message translates to:
  /// **'Add Cloths'**
  String get addCloths;

  /// No description provided for @addService.
  ///
  /// In en, this message translates to:
  /// **'Add Service'**
  String get addService;

  /// No description provided for @serviceTitle.
  ///
  /// In en, this message translates to:
  /// **'Service Title'**
  String get serviceTitle;

  /// No description provided for @clothsAvailable.
  ///
  /// In en, this message translates to:
  /// **'Cloths Available'**
  String get clothsAvailable;

  /// No description provided for @instructions.
  ///
  /// In en, this message translates to:
  /// **'Instructions'**
  String get instructions;

  /// No description provided for @instructionsDetails.
  ///
  /// In en, this message translates to:
  /// **'Here you can add instructions that users can select while using this service.\n\nEach instruction should have a title and atleast two options that the user can select. Each option can have an extra amount that needs to be paid by user to apply the instruction'**
  String get instructionsDetails;

  /// No description provided for @instructionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get instructionsTitle;

  /// No description provided for @instructionsOptions.
  ///
  /// In en, this message translates to:
  /// **'Options'**
  String get instructionsOptions;

  /// No description provided for @instructionsOption.
  ///
  /// In en, this message translates to:
  /// **'Option'**
  String get instructionsOption;

  /// No description provided for @instructionsOptionremove.
  ///
  /// In en, this message translates to:
  /// **'Tap and hold an option to remove it'**
  String get instructionsOptionremove;

  /// No description provided for @instructionsaddbutton.
  ///
  /// In en, this message translates to:
  /// **'Add instruction'**
  String get instructionsaddbutton;

  /// No description provided for @instructionsremovebutton.
  ///
  /// In en, this message translates to:
  /// **'Remmove instruction'**
  String get instructionsremovebutton;

  /// No description provided for @emptyIntructions.
  ///
  /// In en, this message translates to:
  /// **'No instructions Added'**
  String get emptyIntructions;

  /// No description provided for @editService.
  ///
  /// In en, this message translates to:
  /// **'Edit Service'**
  String get editService;

  /// No description provided for @deleteService.
  ///
  /// In en, this message translates to:
  /// **'Delete Service'**
  String get deleteService;

  /// No description provided for @savebutton.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get savebutton;

  /// No description provided for @imageAddWidget.
  ///
  /// In en, this message translates to:
  /// **'Add Image'**
  String get imageAddWidget;

  /// No description provided for @textfieldsearch.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get textfieldsearch;

  /// No description provided for @textfieldTitle.
  ///
  /// In en, this message translates to:
  /// **'Enter Title Here'**
  String get textfieldTitle;

  /// No description provided for @textfieldDescription.
  ///
  /// In en, this message translates to:
  /// **'Enter Description Here'**
  String get textfieldDescription;

  /// No description provided for @hintTextforexample.
  ///
  /// In en, this message translates to:
  /// **'e.g:Water'**
  String get hintTextforexample;

  /// No description provided for @hintTextforOption.
  ///
  /// In en, this message translates to:
  /// **'Option Name'**
  String get hintTextforOption;

  /// No description provided for @couponTitle.
  ///
  /// In en, this message translates to:
  /// **'Coupon Title'**
  String get couponTitle;

  /// No description provided for @couponHeading.
  ///
  /// In en, this message translates to:
  /// **'Add Coupon'**
  String get couponHeading;

  /// No description provided for @couponSubTitle.
  ///
  /// In en, this message translates to:
  /// **'Enter Coupon Code'**
  String get couponSubTitle;

  /// No description provided for @couponCode.
  ///
  /// In en, this message translates to:
  /// **'Coupon Code'**
  String get couponCode;

  /// No description provided for @apply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get apply;

  /// No description provided for @couponApplied.
  ///
  /// In en, this message translates to:
  /// **'Coupon Applied'**
  String get couponApplied;

  /// No description provided for @couponNotApplied.
  ///
  /// In en, this message translates to:
  /// **'Coupon Not Applied'**
  String get couponNotApplied;

  /// No description provided for @couponNotAvailable.
  ///
  /// In en, this message translates to:
  /// **'Coupon Not Available'**
  String get couponNotAvailable;

  /// No description provided for @couponExpired.
  ///
  /// In en, this message translates to:
  /// **'Coupon Expired'**
  String get couponExpired;

  /// No description provided for @couponInvalid.
  ///
  /// In en, this message translates to:
  /// **'Coupon Invalid'**
  String get couponInvalid;

  /// No description provided for @couponInvalidMessage.
  ///
  /// In en, this message translates to:
  /// **'Coupon Invalid. Please Enter Valid Coupon Code'**
  String get couponInvalidMessage;

  /// No description provided for @couponAmount.
  ///
  /// In en, this message translates to:
  /// **'Coupon Amount'**
  String get couponAmount;

  /// No description provided for @couponType.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get couponType;

  /// No description provided for @couponPercentage.
  ///
  /// In en, this message translates to:
  /// **'Coupon Percentage'**
  String get couponPercentage;

  /// No description provided for @freeDelivery.
  ///
  /// In en, this message translates to:
  /// **'Free Delivery'**
  String get freeDelivery;

  /// No description provided for @couponHintPercentage.
  ///
  /// In en, this message translates to:
  /// **'Enter Percentage'**
  String get couponHintPercentage;

  /// No description provided for @couponHintAmount.
  ///
  /// In en, this message translates to:
  /// **'Enter Amount'**
  String get couponHintAmount;

  /// No description provided for @couponHintTitle.
  ///
  /// In en, this message translates to:
  /// **'Enter Coupon Title'**
  String get couponHintTitle;

  /// No description provided for @couponHintDescription.
  ///
  /// In en, this message translates to:
  /// **'Enter Coupon Description'**
  String get couponHintDescription;

  /// No description provided for @couponHintCode.
  ///
  /// In en, this message translates to:
  /// **'Enter Coupon Code'**
  String get couponHintCode;

  /// No description provided for @couponHintType.
  ///
  /// In en, this message translates to:
  /// **'Select Coupon Type'**
  String get couponHintType;

  /// No description provided for @couponCount.
  ///
  /// In en, this message translates to:
  /// **'count'**
  String get couponCount;

  /// No description provided for @selectOption.
  ///
  /// In en, this message translates to:
  /// **'Select an Option'**
  String get selectOption;

  /// No description provided for @greater.
  ///
  /// In en, this message translates to:
  /// **'GreaterThan'**
  String get greater;

  /// No description provided for @less.
  ///
  /// In en, this message translates to:
  /// **'LessThan'**
  String get less;

  /// No description provided for @equal.
  ///
  /// In en, this message translates to:
  /// **'EqualTo'**
  String get equal;

  /// No description provided for @and.
  ///
  /// In en, this message translates to:
  /// **'and'**
  String get and;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'or'**
  String get or;

  /// No description provided for @couponAppliedMessage.
  ///
  /// In en, this message translates to:
  /// **'Coupon Applied Successfully'**
  String get couponAppliedMessage;

  /// No description provided for @couponNotAppliedMessage.
  ///
  /// In en, this message translates to:
  /// **'Coupon Not Applied'**
  String get couponNotAppliedMessage;

  /// No description provided for @couponNotAvailableMessage.
  ///
  /// In en, this message translates to:
  /// **'Coupon Not Available'**
  String get couponNotAvailableMessage;

  /// No description provided for @couponExpiredMessage.
  ///
  /// In en, this message translates to:
  /// **'Coupon Expired'**
  String get couponExpiredMessage;

  /// No description provided for @valid.
  ///
  /// In en, this message translates to:
  /// **'Valid Till -'**
  String get valid;

  /// No description provided for @get.
  ///
  /// In en, this message translates to:
  /// **'Get'**
  String get get;

  /// No description provided for @off.
  ///
  /// In en, this message translates to:
  /// **'OFF'**
  String get off;

  /// No description provided for @hintValue.
  ///
  /// In en, this message translates to:
  /// **'Enter value here'**
  String get hintValue;

  /// No description provided for @conditions.
  ///
  /// In en, this message translates to:
  /// **'Conditions'**
  String get conditions;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
