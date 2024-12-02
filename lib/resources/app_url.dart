class AppUrl {
  static var baseUrl = "http://influenzers.waapsdeveloper.co/api";
  static String loginUrl = "$baseUrl/login";
  static String genericSignupUrl = "$baseUrl/signup-via-email";
  static String verifyOtpUrl = "$baseUrl/verify-signup";
  static String countryListUrl = "$baseUrl/countries/list";
  static String uploadImageUrl = "$baseUrl/upload-profile-image";
  static String uploadVideoUrl = "$baseUrl/upload-profile-image";
  static String influencerCategoryUrl = "$baseUrl/category/list";
  static String updateInfluencerCategoryUrl =
      "$baseUrl/influencer/category/update";
  static String editInfluencerProfileUrl = "$baseUrl/influencer/profile/edit";

  static String searchInfluencerUrl = "$baseUrl/search-influencers";

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
  static String verifyPasswordUrl = "$baseUrl/verify-password";
  static String deleteAccountUrl = "$baseUrl/delete/account";
  static String logoutAccountUrl = "$baseUrl/logout";
  static String userEditProfileUrl = "$baseUrl/user/profile/edit";
  static String changePasswordUrl = "$baseUrl/change-password";

  static String userAddOrderUrl = "$baseUrl/video-request/add";
  static String influencerWaitingvideoUrl =
      "$baseUrl/video-request/list/influencer/waiting-video";
  static String influencerCompletedVideoListUrl =
      "$baseUrl/video-request/list/influencer/competed-video";

  static String influencerRejectedOrderListUrl =
      "$baseUrl/get/rejected/request-videos";
  // "$baseUrl/video-request/list/influencer/rejected";

  static String userWaitingvideoUrl =
      "$baseUrl/get/waiting-video/request-video/from-user";

  static String userAllOrdersListUrl = "$baseUrl/get/request-video/from-user";
  static String userCompletedOrdersListUrl =
      "$baseUrl/get/completed/request-video/from-user";
  static String userRejectedOrdersListUrl =
      "$baseUrl/get/rejected-by-user/request-video/from-user";

  static String userPendingOrdersListUrl =
      "$baseUrl/get/pending/request-video/from-user";
  // static String userAcceptOrderUrl = "$baseUrl/requested-video/update-status/";
  static String influencerAcceptOrderUrl =
      "$baseUrl/video-request/update-status/";
  static String influencerActiveHistoryUrl =
      "$baseUrl/video-request/list/influencer/activity-history/";
  static String userActiveHistoryUrl = "$baseUrl/get-activity-history/";

  static String influencerUploadUserVideoUrl = "$baseUrl/upload-video-request";

  static String userAcceptVideoOrderUrl =
      "$baseUrl/requested-video/update-status/";
  static String userReviewUrl = "$baseUrl/review/add";

  static String adminPendingInfluencersUrl =
      "$baseUrl/admin/pending-influencer";
  static String adminApprovedInfluencersUrl =
      "$baseUrl/admin/approved-influencer";
  static String adminRejectedInfluencersUrl =
      "$baseUrl/admin/cancelled-influencer";
  static String adminChangeInfluencerStatusUrl =
      "$baseUrl/admin/update-status/";


      static String adminRejectedOrderListUrl =
      "$baseUrl/admin/rejected/orders";

      static String adminCompletedOrderListUrl ="$baseUrl/admin/completed/orders";
      static String adminRefundOrderListUrl ="$baseUrl/admin/completed/orders";


      static String adminChangeOrderStatusUrl =
      "$baseUrl/admin/request/video/update-status/";
}
