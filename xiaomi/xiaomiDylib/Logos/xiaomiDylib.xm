%hook XiaoMiYingShiBTaskViewController
- (void)viewDidLoad{};
%end

%hook XiaoMiYingShiBForTheFirstTimeRedPacketManager
+ (void)showLittleRedpacketInView:(id)arg1{
    %orig(nil);
}
%end

%hook XiaoMiYingShiBForTheFirstTimeRedPacketView
+ (void)show{};
%end

%hook NewADApiManager
+ (id)requestWithUrl:(id)arg1 success:(id)arg2 failure:(id)arg3{
    return %orig(nil,arg2,arg3);
}
%end

//%hook XiaoMiYingShiBTaskViewController
//- (void)viewDidLoad{};
//%end
//
//%hook XiaoMiYingShiBMeViewController
//- (void)requestAd{};
//%end
//
//%hook XHLaunchAd
//- (void)setupLaunchAd{};
//%end
//
//%hook XiaoMiYingShiBDetailADManager
//- (void)requestDetailAD{};
//- (void)setBeforePlayADModel:(id)beforePlayADModel{};
//- (void)setEndPlayADModel:(id)endPlayADModel{};
//- (void)setMovieDetailADModel:(id)movieDetailADModel{};
//- (void)setPauseADModel:(id)pauseADModel{};
//%end
//
//%hook XiaoMiYingShiBTableScreenADView
//+ (void)showWithAdModel:(id)arg1{};
//- (void)setAdImageView:(id)adImageView{};
//%end
//
//%hook NewADModel
//- (void)setOther:(id)other{};
//- (void)setWeigh:(id)weigh{};
//- (void)setAd_image:(id)ad_image{};
//- (void)setAd_url:(id)ad_url{};
//- (void)setJump_type:(id)jump_type{};
//- (void)setAd_type:(id)ad_type{};
//- (void)setTitle:(id)title{};
//%end
//
//%hook UserManager
//- (_Bool)isLogin
//{
//    return YES;
//}
//%end
//
//%hook XiaoMiYingShiBTabBarController
//- (void)showAlertForInvalideToken{};
//%end


//%hook XiaoMiYingShiBMeViewController
//- (void)requestAd{};
//%end
//
//%hook XHLaunchAd
//- (void)setupLaunchAd{};
//%end
//
//%hook XiaoMiYingShiBDetailADManager
//- (void)requestDetailAD{};
//- (void)setBeforePlayADModel:(id)beforePlayADModel{};
//- (void)setEndPlayADModel:(id)endPlayADModel{};
//- (void)setMovieDetailADModel:(id)movieDetailADModel{};
//- (void)setPauseADModel:(id)pauseADModel{};
//%end
//
//%hook XiaoMiYingShiBTableScreenADView
//+ (void)showWithAdModel:(id)arg1{};
//- (void)setAdImageView:(id)adImageView{};
//%end
//
//%hook NewADModel
//- (void)setOther:(id)other{};
//- (void)setWeigh:(id)weigh{};
//- (void)setAd_image:(id)ad_image{};
//- (void)setAd_url:(id)ad_url{};
//- (void)setJump_type:(id)jump_type{};
//- (void)setAd_type:(id)ad_type{};
//- (void)setTitle:(id)title{};
//%end
//


//%hook XiaoMiYingShiBTabBarController
//- (void)showAlertForInvalideToken{};
//%end


