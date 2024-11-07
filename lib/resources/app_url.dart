class AppUrl {
  static var baseUrl = "http://influenzers.duckdns.org/api";
  static String loginUrl = "$baseUrl/login";
  static String genericSignupUrl = "$baseUrl/signup-via-email";
  static String verifyOtpUrl = "$baseUrl/verify-signup";
  static String countryListUrl = "$baseUrl/countries/list";
  static String uploadImageUrl = "$baseUrl/upload-profile-image";
  static String uploadVideoUrl = "$baseUrl/upload-profile-image";
  static String influencerCategoryUrl = "$baseUrl/category/list";
  static String influencerDetailUrl = "$baseUrl/influencer/detail/by-id/";
  static String influencerVideoTypeListUrl =
      "$baseUrl/influencer/video-type/list/";
  static String influencerAllOrdersListUrl =
      "$baseUrl/video-request/list/influencer";
  static String influencerPendingOrdersListUrl =
      "$baseUrl/video-request/list/influencer/pending";
  static String setInfluencerCategoryUrl = "$baseUrl/influencer/category/add";
  static String influencerUploadVideoUrl = "$baseUrl/request-video";
  static String influencerPriceRangeUrl = "$baseUrl/price-range/list";
  static String influencerAddPriceRangeUrl =
      "$baseUrl/influencer/price-range/add";
  static String influencerAddPriceUrl =
      "$baseUrl/influencer/videotype/price/add/";
  static String influencerVideoTypeUrl = "$baseUrl/video-types/list";
  static String influencerAddVideoTypeUrl = "$baseUrl/influencer/videotype/add";
  static String influencerReviewUrl = "$baseUrl/influencer-detail";
  static String trendingInfluencerUrl = "$baseUrl/trending/list";
  static String giveAwayUrl = "$baseUrl/giveaway/list";
  static String recentlyAddedUrl = "$baseUrl/dashboard/recently-added";
  static String influencersListUrl = "$baseUrl/influencer/list";
  static String influencersListByCategoryUrl =
      "$baseUrl/influencer/list/by/category";
  static String contactUsUrl = "$baseUrl/contact-us/add";
  static String userAddOrderUrl = "$baseUrl/video-request/add";
  static String influencerWaitingvideoUrl =
      "$baseUrl/video-request/list/influencer/inprogress";

  static String userWaitingvideoUrl = "$baseUrl/get/waiting-video/request-video/from-user";

  static String userAllOrdersListUrl = "$baseUrl/get/request-video/from-user";
  static String userPendingOrdersListUrl = "$baseUrl/get/pending/request-video/from-user";
  static String userAcceptOrderUrl = "$baseUrl/requested-video/update-status/";

}
