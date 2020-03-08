%hook RRPrivilegeModel
- (long long)endTime{
    return 3043052201;
}
%end

%hook RRPlayerUserConfig
- (_Bool)privilegeNoAd{
    return YES;
}
- (unsigned long long)preferedPlayClarity{
    return 3;
}
- (unsigned long long)preferedDownloadClarity{
    return 3;
}
%end

%hook RRPlayerModel
- (unsigned long long)currentClarity{
    return 3;
}
%end

%hook RrmjUser
- (_Bool)hasInvitePrivilege{
    return YES;
}
NSString *score = @"9999999";
NSString *levelStr = @"30";
- (long long)level{
    return 30;
}
%end

%hook V3_AdViewController
- (void)setAdModel:(id *)adModel{}
- (void)setAdView:(id *)adView{}
%end

%hook RRChannelContentPageViewController
- (void)setAdModels:(NSArray *)adModels{}
%end

%hook RRAdManager
- (void)loadLigoAd{}
- (void)setAdViewModel:(id *)adViewModel{}
%end

%hook V3_AdModel
- (void)setAdId:(id *)adId{}
%end

%hook BayesInterstitial
- (void)loadAd{}
%end

%hook RRAdBaseView
- (void)createUI{}
- (void)setAdModel:(id *)adModel{}
%end

%hook RRCycleScrollView
- (void)setAdArray:(NSArray *)adArray{}
%end

%hook RRSeasonViewController
- (void)setAdModel:(id *)adModel{}
- (void)setAdModels:(NSMutableArray *)adModels{}
- (void)setVirtualAD:(id *)virtualAD{}
- (void)setAdView:(id *)adView{}
- (void)reloadAd{}
- (void)showAdViewWithAdModel:(id)arg1{}
%end

%hook RRAdView
- (void)setAdView:(id *)adView{}
- (void)setBanners:(NSArray *)banners{}
%end

%hook RRSeasonDownloadCacheViewController
- (_Bool)privilegeEnable{
    return YES;
}
%end

%hook RRPlayerComponetsSelecteClarity
- (void)afterSelectQuality:(unsigned long long)arg1{
    %orig;
    arg1 = 3;
}
%end
