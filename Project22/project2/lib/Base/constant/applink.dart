class Applink {
  //Server
  static const String serverlink = "http://10.0.2.2/fixme";
  //test
  static const String test = "$serverlink/test.php";

  //---------------------Admin-----------------------
  //login php
  static const String adminlogin = "$serverlink/Admin/adminAuth/login.php";
  //admin pages php
  static const String dispalyworkerifon =
      "$serverlink/Admin/adminworkerinfo.php";
  static const String dispalyContractorinfo =
      "$serverlink/Admin/admincontractorinfo.php";
  static const String acceptWorkerInSystem =
      "$serverlink/Admin/adminacceptworker.php";
  static const String deleteWorker = "$serverlink/Admin/admindeletworker.php";
  static const String acceptContractor =
      "$serverlink/Admin/adminacceptcontractor.php";
  static const String deleteContractor =
      "$serverlink/Admin/admindeletecontractor.php";
  //---------------------customer-----------------------
  // ---------------auth
  static const String customerSignin = "$serverlink/User/userAuth/signin.php";
  static const String customerVerifySignin =
      "$serverlink/User/userAuth/verifycodesign.php";
  static const String customerLogin = "$serverlink/User/userAuth/login.php";
  static const String customerErOpenAccount =
      "$serverlink/User/userAuth/flseattempts.php";
  static const String customerVerifycodeErOpenAccount =
      "$serverlink/User/userAuth/reopenaccunt.php";
  static const String customerresendverficode =
      "$serverlink/User/userAuth/resendverficode.php";
  //-----forget password
  static const String customerforgetpass =
      "$serverlink/User/userAuth/forgetpassword/checkemail.php";
  static const String customerforgetpassverifycode =
      "$serverlink/User/userAuth/forgetpassword/verifycode.php";
  static const String customerrestpass =
      "$serverlink/User/userAuth/forgetpassword/restpassword.php";

  //----------------home
  static const String customerHome = "$serverlink/User/home.php";
  static const String customerWorkerCate = "$serverlink/User/workerview.php";
  static const String resetuseratmmpts =
      "$serverlink/User/resetuseratmmpts.php";
  static const String viewworkerrating =
      "$serverlink/User/viewworkerrating.php";
  //--------------search
  static const String customerSearch = "$serverlink/User/searchpage.php";

  //--------------Address
  static const String customerAddAddress =
      "$serverlink/User/address/userinseraddress.php";
  static const String customerViewAddress =
      "$serverlink/User/address/userviewaddress.php";
  static const String customerDeleteaddress =
      "$serverlink/User/address/userdeleteaddress.php";

  //-----------Request
  static const String userinsertRequset =
      "$serverlink/User/request/addrequest.php";
  static const String usercheckout = "$serverlink/User/request/checkout.php";
  static const String userorderpage = "$serverlink/User/request/myorders.php";
  static const String userdeleteorder =
      "$serverlink/User/request/deleteorder.php";
  static const String completedorders =
      "$serverlink/User/request/completedorders.php";
  static const String ratingworker = "$serverlink/User/request/rating.php";
//-------------chat
  static const String newchat = "$serverlink/newchat.php";

  //-------------------------Worker------------------------------------
  //----------------------auth
  static const String workerLogin = "$serverlink/Worker/workerAuth/login.php";
  static const String workerSignin = "$serverlink/Worker/workerAuth/signin.php";
  static const String workercategoriesSignup =
      "$serverlink/Worker/workerAuth/workercategories.php";
  static const String workercheckemail =
      "$serverlink/Worker/workerAuth/forgetpassword/checkemail.php";
  static const String workerverfiycoderestpass =
      "$serverlink/Worker/workerAuth/forgetpassword/verfiycoderestpass.php";
  static const String workerrestpassword =
      "$serverlink/Worker/workerAuth/forgetpassword/restpassword.php";
  static const String workerresendverfiycode =
      "$serverlink/Worker/workerAuth/forgetpassword/resendverfiycode.php";
  static const String workerverifycodesiginup =
      "$serverlink/Worker/workerAuth/verifycodesiginup.php";

  //-------------------unblock account
  static const String workerunaccount =
      "$serverlink/Worker/unblockaccount/checkemail.php";
  static const String workerunaccountverfiy =
      "$serverlink/Worker/unblockaccount/verifycode.php";
  static const String workerresendverifycode =
      "$serverlink/Worker/workerAuth/resendverifycode.php";
  static const String workerrresetuseratmmpts =
      "$serverlink/Worker/resetuseratmmpts.php";

  //----------------Worker chat
  static const String workerHomeChat = "$serverlink/Worker/chat/home.php";
  //-----------------Worker home
  static const String workerhome = "$serverlink/Worker/request/request.php";
  static const String workeracceptrequest =
      "$serverlink/workeracceptrequest.php";
  static const String workerrejectrequest =
      "$serverlink/Worker/request/rejectrequest.php";

  //--------------Worker profile
  static const String workereditprofile = "$serverlink/Worker/editprofile.php";
  static const String workereacceptedrquest =
      "$serverlink/Worker/request/acceptedrequest.php";
  static const String workeredone =
      "$serverlink/Worker/request/finshrequest.php";

//-------------------------Contractor------------------------------------
//---------------------auth
  static const String contractorSignin =
      "$serverlink/Contractor/contractorAuth/signin.php";
  static const String contractorLogin =
      "$serverlink/Contractor/contractorAuth/login.php";
  static const String contractorverifycodesginup =
      "$serverlink/Contractor/contractorAuth/verifycodesginup.php";
  static const String contractorresendverifycode =
      "$serverlink/Contractor/contractorAuth/resendverifycode.php";
  static const String contractorchechemailunblock =
      "$serverlink/Contractor/contractorAuth/unblockaccount/checkemail.php";
  static const String contractorverifycodeunblock =
      "$serverlink/Contractor/contractorAuth/unblockaccount/verifycode.php";
//-------------------forgetpassword
  static const String contractorcheckemailforget =
      "$serverlink/Contractor/contractorAuth/forgetpassword/checkemail.php";
  static const String contractorverifycodeforget =
      "$serverlink/Contractor/contractorAuth/forgetpassword/verifycode.php";
  static const String contractorrestpassword =
      "$serverlink/Contractor/contractorAuth/forgetpassword/restpassword.php";
//----------------------home
  static const String contractorHome = "$serverlink/Contractor/home/home.php";
  static const String contractorNotifications =
      "$serverlink/Contractor/home/notifications.php";

  static const String contractorSearchPage =
      "$serverlink/Contractor/home/search.php";
//-------------------Profile
  static const String contractorEditProfile =
      "$serverlink/Contractor/editprofile.php";
  static const String contractorOngoinorders =
      "$serverlink/Contractor/viewrequest.php";

  //testchat
  static const String testchat = "$serverlink/testchatuserhome.php";
  static const String testgetmasseges = "$serverlink/testgetmessage.php";
  static const String testchatadd = "$serverlink/testchatmessages.php";
  static const String lastmessage = "$serverlink/lastmessage.php";
  static const String unreadmessage = "$serverlink/unreadmessage.php";
  static const String readthemessages = "$serverlink/readthemessages.php";
}
