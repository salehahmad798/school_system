dynamic headers = {
  'Content-Type': 'application/json',
};

headersWithToken(token) {
  return {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token',
  };
}

headersWithTokenJob(token) {
  return {
    'Content-Type': 'multipart/form-data',
    'Authorization': 'Bearer $token',
  };
}

class ApiService {
  static String baseURl = 'https://api.edumat.academy/api';
  // static String imageBaseURl = 'https://feasty.co/';
  // static String imageBaseURl = 'https://foodtruck.wazirafghan.online/';

  // ============================= ADMIN APP ===============================
  static String adminLogin = '$baseURl/admin/login';
  static String adminDashboard = '$baseURl/admin/dashboard';
  static String adminbursaries = '$baseURl/admin/bursaries';
  static String adminschools = '$baseURl/admin/schools';
  static String adminAddSchool = '$baseURl/admin/schools';
  static String adminAddUniversity = '$baseURl/admin/universities';
  static String adminGetUniversity = '$baseURl/admin/universities';
  static String adminAddCollege = '$baseURl/admin/colleges';
  static String adminGetCollege = '$baseURl/admin/colleges';

  static String adminAddOldPaper = '$baseURl/admin/papers';
  static String adminGetOldPaper = '$baseURl/admin/papers';
  // ============================================================





  static String categories = '$baseURl/categories';
  static String addCategory = '$baseURl/categories';
  static String truckOrder = '$baseURl/orders';
  static String addCategoryItem = '$baseURl/category-items';
  static String orderStatusChange = '$baseURl/update-order-status';
  static String cateringOrderStatusChange = '$baseURl/update-catering-status';
  static String dashboardData = '$baseURl/dashboard';
  static String userReview = '$baseURl/user-reviews';
  static String updatePassword = "$baseURl/update-password";
  static String profileUpdate = "$baseURl/update/profile";
  static String truckSchedule = "$baseURl/truck-schedule?truck_user_id=";
  static String addTruckSchedule = "$baseURl/truck-schedule";
}
