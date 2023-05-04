class Config_api {
  static const String appName = "แจ้งเตือน";
  static const String apiURL = "3.112.27.15:8080";
  static const String loginAPI = "/api/v1/auth/authenticate";
  static const String registerAPI = "/api/v1/auth/register";
  static const String searchAPI = "/api/v1/search";
  static const String userProfileAPI = "/api/v1/customer/self";
  static const String userAddress = '/api/v1/customer/addresses';
  static const String productDetailAPI = "/api/v1/product";
  static const String poppularProductAPI = "/api/v1/popular";
  static const String recommendProductAPI = "/api/v1/recommend";
  static const String addProductToCartAPI = "/api/v1/cart/add";
  static const String deleteProductInCartAPI = "/api/v1/cart/add";
  static const String showProductInCartAPI = "/api/v1/cart/request";
  static const String getCouponMacthVendorAPI = "/api/v1/coupon/available";
  static const String getCouponofSpecificVendorAPI = "/api/v1/coupon/available";
  static const String collectCouponAPI = "api/v1/coupon/2";
  static const String processOrderAPI = "api/v1/order/process";
  static const String getOrderAPI = "api/v1/order/orders";
  static const String getOrderDetailAPI = "/api/v1/order/2";
  static const String getVendorDetailAPI = "/api/v1/vendor/";
  static const String getCategoryAPI = "/api/v1/category/";
}
