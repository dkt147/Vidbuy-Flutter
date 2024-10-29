class AppUrl {
  static var baseUrl = "http://influenzers.duckdns.org/api";
  static String loginUrl = "$baseUrl/login";
  static String genericSignupUrl = "$baseUrl/signup-via-email";
  static String verifyOtpUrl = "$baseUrl/verify-signup";
  static String countryListUrl = "$baseUrl/countries/list";

  static String influencerCategoryUrl = "$baseUrl/category/list";
  static String setInfluencerCategoryUrl = "$baseUrl/influencer/category/add";
  static String influencerPriceRangeUrl = "$baseUrl/price-range/list";
  static String influencerAddPriceRangeUrl =
      "$baseUrl/influencer/price-range/add";
  static String influencerAddPriceUrl =
      "$baseUrl/influencer/videotype/price/add/";
  static String influencerVideoTypeUrl = "$baseUrl/video-types/list";
  static String influencerAddVideoTypeUrl = "$baseUrl/influencer/videotype/add";
  static String influencerReviewUrl = "$baseUrl/influencer-detail";
  static String trendingInfluencerUrl = "$baseUrl/trending/list";

}
