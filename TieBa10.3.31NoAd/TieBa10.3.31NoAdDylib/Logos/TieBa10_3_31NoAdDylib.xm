%hook TBCSplashLaunchADView
    - (void)setSplashView:(id)splashView{};
%end

%hook TBCLaunchADViewController
    - (void)startShowADWithAdType:(id)arg1{};
    - (void)setSplashView:(id)splashView{};
    - (void)setVideoLaunchView:(id)videoLaunchView{};
    - (void)setMobAdSplash:(id)mobAdSplash{};
    - (void)setDelegate:(id)delegate{};
%end

%hook TBCLegoVideoAdCardCell
    - (void)setObject:(id)arg1{};
%end

%hook TBCAdCriusContainerView
    - (void)setPromotionItem:(id)promotionItem{};
    - (void)setContainer:(id)container{};
    - (double)heightForObject:(id)arg1
    {
        return 0;
    }
%end

%hook TBCLegoAdCard
    - (id)initWithFrame:(id)arg1
    {
        return nil;
    }
%end

%hook TBCLegoAdCardItem
    - (id)initWithJsonData:(id)arg1
    {
        return nil;
    }
%end

%hook CriusContainerView
    - (id)init
    {
        return nil;
    }
%end

%hook TBCHomePageViewController
    - (void)setupTableHeaderView:(id)arg1{};
    - (_Bool)autoPlay:(id)arg1
    {
        return false;
    }
%end

%hook TBCNewPBCell
    - (void)clickTailView{};
%end

%hook TBCNewFPFirstFloorCell
    - (void)clickBubbleView{};
    - (void)clickTailView{};
%end

%hook TBCHomeVideoMiddleViewController
    - (void)setVideosModel:(id)videosModel{};
    - (void)setAdvController:(id)advController{};
%end

%hook TBCAdCriusManager
    - (void)setCriusFactory:(id)criusFactory{};
%end

%hook TBCPhotoBrowser
- (void)addAdvertisementPhoto{};
%end
