// ────────────────────────────────────────────────────────────────────────────
// AppString – Single source of truth for all UI text in IGHTY Support
// ────────────────────────────────────────────────────────────────────────────

class AppString {
  AppString._();

  // ── General ────────────────────────────────────────────────────────────────
  static const String appName = 'IGHTY Support';
  static const String ok = 'Ok';
  static const String yes = 'Yes';
  static const String no = 'No';
  static const String save = 'Save';
  static const String next = 'Next';
  static const String send = 'Send';
  static const String apply = 'Apply';
  static const String cancel = 'Cancel';
  static const String submit = 'Submit';
  static const String update = 'Update';
  static const String confirm = 'Confirm';
  static const String loading = 'Loading...';
  static const String noDataFound = 'No Data Found!';
  static const String successfully = 'Successfully';
  static const String exit = 'Exit';
  static const String areYouSureExit = 'Are you sure you want to exit the app?';
  static const String english = 'English';

  // ── Splash ─────────────────────────────────────────────────────────────────
  static const String tagLine = 'We are there when \nyou need IT !';

  // ── User Type ──────────────────────────────────────────────────────────────
  static const String admin = 'ADMIN';
  static const String technician = 'TECHNICIAN';

  // ── Auth – Login ───────────────────────────────────────────────────────────
  static const String letsBridge = 'Lets bridge...';
  static const String email = 'Email';
  static const String enterEmail = 'Enter your email';
  static const String password = 'Password';
  static const String enterPassword = 'Enter your password';
  static const String forgotPassword = 'Forgot Password?';
  static const String signIn = 'Sign-in';
  static const String dontHave = "Don't have an account?  ";
  static const String signUp = 'Sign Up';

  // ── Auth – Sign Up ────────────────────────────────────────────────────────
  static const String welcomeToIghty = 'Welcome to Ightysupport';
  static const String name = 'Name *';
  static const String enterName = 'Enter your name';
  static const String emailRequired = 'Email *';
  static const String passwordRequired = 'Password *';
  static const String phoneNumberRequired = 'Phone Number *';
  static const String addressRequired = 'Address *';
  static const String enterAddress = 'Enter your address';
  static const String enterPhoneNumber = 'Enter your number';
  static const String createAnAccount = 'Create An Account';
  static const String alreadyHaveAccount = 'Already Have Account? ';
  static const String signInLink = 'Sign In';
  static const String accountActivationMsg =
      'Hurrah!\nYour account will activated soon.....';
  static const String home = 'Home';

  // ── Validation Messages ────────────────────────────────────────────────────
  static const String pleaseEnterName = 'Please enter your name';
  static const String pleaseEnterEmail = 'Please enter your email';
  static const String pleaseEnterValidEmail = 'Please enter valid email';
  static const String pleaseEnterPassword = 'Please enter your password';
  static const String pleaseEnterConfirmPassword =
      'Please enter confirm password';
  static const String passwordDoesNotMatch = 'Password does not match';
  static const String passwordMinLength =
      'Password must be at least 6 characters long';
  static const String pleaseEnterPhoneNumber = 'Please enter phone number';
  static const String pleaseEnterValidPhone = 'Please enter valid phone number';
  static const String pleaseEnterAddress = 'Please enter address';
  static const String pleaseUploadProfilePic = 'Please upload profile picture';
  static const String pleaseEnterOldPassword = 'Please enter old password';
  static const String pleaseEnterNewPassword = 'Please enter new password';

  // ── Dashboard – Home Tab ───────────────────────────────────────────────────
  static const String helloUser = 'Hello Jon!';
  static const String tasksForToday = 'Your tasks for today';
  static const String todaysTasks = "Today's Tasks";
  static const String allTasks = "All Task's";
  static const String seeAll = 'See All';
  static const String viewTicket = 'View Ticket';
  static const String inProgress = 'in progress';
  static const String checkoutOffice = 'Check-out Office';
  static const String startProject = 'Start Project';
  static const String breakIn = 'Break-In';
  static const String filterByStatus = 'Filter by Status';

  // ── Ticket Detail ──────────────────────────────────────────────────────────
  static const String ticketDetails = 'Ticket Details';
  static const String ticketTitle = 'Ticket Title';
  static const String ticketIdRef = 'Ticket ID /\nReference Number';
  static const String assignedSiteName = 'Assigned\nSite Name';
  static const String description = 'Description';
  static const String assignedDateTime = 'Assigned\nDate & Time';
  static const String expectedCompletionTime = 'Expected\nCompletion\nTime';
  static const String priorityLevel = 'Priority level';
  static const String statusLabel = 'Status';
  static const String viewPdf = 'View PDF';
  static const String materials = 'Materials :';
  static const String issued = 'Issued';
  static const String avail = 'Avail';

  // ── File Upload / Explorer ──────────────────────────────────────────────
  static const String fileUpload = 'File Upload';
  static const String pictures = 'Pictures';
  static const String videos = 'Videos';
  static const String documents = 'Documents';
  static const String uploadFiles = 'Upload Files';

  // ── Dashboard – Bottom Nav ─────────────────────────────────────────────────
  static const String navHome = 'Home';
  static const String navLeaveManagement = 'Leave Management';
  static const String navChat = 'Chat';
  static const String navNotifications = 'Notifications';

  // ── Profile / My Account ──────────────────────────────────────────────────
  static const String myAccount = 'My Account';
  static const String technicianName = 'Technician 1';
  static const String viewProfile = 'View profile';
  static const String editProfileDetails = 'Edit Profile Details';
  static const String policy = 'Policy';
  static const String terms = 'Terms';
  static const String changePassword = 'Change Password';
  static const String newPassword = 'New Password';
  static const String oldPassword = 'Old Password';
  static const String deactivateAccount = 'DeActivate Account';
  static const String logout = 'LogOut';
  static const String areYouSureLogout = 'Are you sure you want to log out?';
  static const String areYouSureDeactivate =
      'Are you sure you want to deactivate your account?';

  // ── Leave Management Tab ──────────────────────────────────────────────────
  static const String leaveManagement = 'Leave Management';
  static const String applyLeave = 'Apply Leave';
  static const String selectLeaveType = 'Select Leave Type';
  static const String leaveType = 'Leave Type';
  static const String leaveDate = 'Leave Date';
  static const String startDate = 'Start Date';
  static const String endDate = 'End Date';
  static const String reasonForLeave = 'Reason for Leave';
  static const String writeReasonForLeave = 'Write reason for leave';
  static const String isHalfDayLeave = 'Is Half Day Leave?';
  static const String leaveReason = 'Reason';
  static const String enterReason = 'Enter reason';
  static const String leaveStatus = 'Status';
  static const String approved = 'Approved';
  static const String pending = 'Pending';
  static const String rejected = 'Rejected';
  static const String noLeaveFound = 'No Leave Found!';
  // Leave Types
  static const String maternityLeave = 'Maternity Leave';
  static const String sickLeave = 'Sick Leave';
  static const String casualLeave = 'Casual Leave';
  static const String earnedLeave = 'Earned Leave';
  static const String paternityLeave = 'Paternity Leave';
  static const String emergencyLeave = 'Emergency Leave';

  // ── Chat Tab ──────────────────────────────────────────────────────────────
  static const String chat = 'Chat';
  static const String letsTalk = "Let's talk...";
  static const String letsDiscuss = "Let's Discuss....";
  static const String messages = 'Messages';
  static const String groups = 'Groups';
  static const String typeAMessage = 'Type a Message';
  static const String writeHere = 'Write here...';
  static const String noChatFound = 'No Chat Found';
  static const String startChat = 'Start Chat';
  static const String message = 'Message';
  static const String enterMessage = 'Enter message';

  // ── Notifications Tab ─────────────────────────────────────────────────────
  static const String notifications = 'Notifications';
  static const String noNotificationsFound = 'No Notifications Found!';

  // ── Common ─────────────────────────────────────────────────────────────────
  static const String noInternetConnection = 'No Internet Connection';
  static const String somethingWentWrong = 'Something went wrong';
  static const String tryAgain = 'Try Again';
}
