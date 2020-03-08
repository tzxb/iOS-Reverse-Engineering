%hook NMVideoAdEvent
    - (void)setAdVideo:(id)adVideo{};
    - (void)setAdvertisement:(id)advertisement{};
%end

%hook NMImageAdEvent
    - (void)setAdvertisement:(id)advertisement{};
%end

%hook NMAdvertisement
    - (void)setAdText:(NSString *)adText{};
    - (void)setAdUrl:(NSString *)adUrl{};
%end

%hook NMBanner
    - (void)setAdvertisement:(id)advertisement{};
%end

%hook NMSearchAdvertisementCell
    - (void)setAdvertisement:(id)advertisement{};
%end

%hook NMTopPlaylistInfoView
    - (void)setAdvertisement:(id)advertisement{};
%end

%hook NMCommentReplyList
    - (void)setAdvertisement:(id)advertisement{};
%end

%hook NMDailySongView
    - (void)setAdvertisement:(id)advertisement{};
%end

%hook NMMyPlayListAdWithDescTableViewCell
    - (void)setAdvertisement:(id)advertisement{};
%end

%hook NMVideoDetailDescView
    - (void)setAdvertisement:(id)advertisement{};
%end

%hook NMPlaylistAdLinkView
    - (void)setAdvertisement:(id)advertisement{};
%end

%hook NMDailySongHeaderView
    - (void)setAdvertisement:(id)advertisement{};
%end

%hook NMCommentBannerData
    - (void)setAdvertisement:(id)advertisement{};
%end

%hook NMVideoDetailView
    - (void)setAdvertisement:(id)advertisement{};
%end

%hook NMVideoAdPatchView
    - (void)setAdvertisement:(id)advertisement{};
%end

%hook NMVideoTimelineAdBottomView
    - (void)setAdvertisement:(id)advertisement{};
%end

%hook NMMyPlayListViewController
    - (void)setAdvertisement:(id)advertisement{};
%end

%hook NMVideoAdBannerView
    - (void)setAdvertisement:(id)advertisement{};
%end

%hook NMVideoTimelineImageAdContent
    - (void)setAdvertisement:(id)advertisement{};
%end

%hook NMDiscoverRecommendDataGroup
    - (void)setAdvertisement:(id)advertisement{};
%end

%hook NMPlaylistDetailView
    - (void)setAdvertisement:(id)advertisement{};
%end

%hook NMResourceCoverView
    - (void)setAdvertisement:(id)advertisement{};
%end

%hook NMPlaylistInfoView
    - (void)setAdvertisement:(id)advertisement{};
%end

%hook NMMyPlayListAdTableViewCell
    - (void)setAdvertisement:(id)advertisement{};
%end

%hook NMRecommendResourceUserView
    - (void)setAdvertisement:(id)advertisement{};
%end

%hook NMDiscoveryEssentialEntrance
    - (void)setAdvertisement:(id)advertisement{};
%end

%hook NMVideoDetailDescUserView
    - (void)setAdvertisement:(id)advertisement{};
%end

%hook NMLaunchAdViewManager
    - (void)showAd{};
    - (void)setAdView:(id)adView{};
    - (void)showVideoAd{};
    - (void)setAd:(id)ad{};
%end

%hook NTESBugrptJailbreakCheck
    + (_Bool)isTheApplicationTamperedWith
    {
        return false;
    }
    + (_Bool)isTheApplicationCracked
    {
        return false;
    }
    + (_Bool)isTheDeviceJailbroken
    {
        return false;
    }
    + (int)filesExistCheck
    {
        return 0;
    }
    + (int)symbolicLinkCheck
    {
        return 0;
    }
    + (int)systemCheck
    {
        return 0;
    }
    + (int)fstabCheck
    {
        return 0;
    }
    + (int)plistCheck
    {
        return 0;
    }
    + (int)inaccessibleFilesCheck
    {
        return 0;
    }
    + (int)cydiaCheck
    {
        return 0;
    }
    + (int)urlCheck
    {
        return 0;
    }
%end

%hook NTESBugrptDeviceUtil
    + (_Bool)isJailBrokenDevice
    {
        return false;
    }
    + (_Bool)isRoot
    {
        return false;
    }
%end

%hook ANSMetadata
    - (_Bool)isJailbroken
    {
        return false;
    }
    - (_Bool)computeIsJailbroken
    {
        return false;
    }
%end

%hook NETESCSSystemJailBreak
    - (void)setLoadBinarys:(NSArray *)loadBinarys{};
%end

%hook NMSongPrivilege
    - (long long)payed
    {
        return 1;
    }
    - (_Bool)isPayed
    {
        return true;
    }
    - (_Bool)isVipSong
    {
        return false;
    }
    - (_Bool)isDownloadNeedVipSong
    {
        return false;
    }
    - (_Bool)isPlayOnlySong
    {
        return false;
    }
    - (_Bool)isLimitFree
    {
        return false;
    }
    - (_Bool)isPreSellSong
    {
        return false;
    }
    - (_Bool)isFakePrivilege
    {
        return false;
    }
    - (_Bool)isExclusiveSong
    {
        return false;
    }
    - (_Bool)isPermanentBuy
    {
        return true;
    }
    + (id)fakePrivilege:(id)arg1
    {
        return nil;
    }
    - (_Bool)isNoOrNearlyNoCopyrightSong
    {
        return false;
    }
%end

%hook NMUser
    - (_Bool)isAuthRedV
    {
        return true;
    }
    - (unsigned long long)userType
    {
        return 2;
    }
%end

%hook NMMVPrivilege
    - (_Bool)isFakePrivilege
    {
        return false;
    }
    - (_Bool)canPlay
    {
        return true;
    }
    - (_Bool)canDownload
    {
        return true;
    }
    - (_Bool)isPayed
    {
        return true;
    }
    - (_Bool)isFeeMV
    {
        return false;
    }
%end

%hook NMSong
    - (_Bool)isFreeEncryptedDownloadSong
    {
        return true;
    }
    - (_Bool)isUnavailableMusic
    {
        return false;
    }
    - (_Bool)canEnableMusic
    {
        return true;
    }
    - (_Bool)canPlayOnline
    {
        return true;
    }
    - (_Bool)canPlayMusic
    {
        return true;
    }
    - (_Bool)canDownloadMusic
    {
        return true;
    }
    - (_Bool)canSubMusic
    {
        return true;
    }
    - (_Bool)isInSongLib
    {
        return true;
    }
    - (_Bool)isUnsupportedCloudSong
    {
        return false;
    }
    - (_Bool)isPlayOnlySong
    {
        return false;
    }
    - (_Bool)isFeeSong
    {
        return true;
    }
    - (_Bool)isFeeSongPaid
    {
        return true;
    }
    - (_Bool)hasFeeIssue
    {
        return false;
    }
    - (_Bool)canPlayLocally
    {
        return true;
    }
%end

%hook NMSongUrlInfo
    - (long long)payed
    {
        return 1;
    }
    - (_Bool)isFreeEncryptSong
    {
        return true;
    }
    - (_Bool)isFeeSong
    {
        return true;
    }
    - (_Bool)downloadNeedEncrypt
    {
        return false;
    }
    - (_Bool)isPermanentBuy
    {
        return true;
    }
%end

%hook NMShortVideoUrlInfo
    - (_Bool)needPay
    {
        return false;
    }

%end

%hook NMMLogMusicPicker
    - (_Bool)needCopyrightCheck
    {
        return false;
    }
%end

%hook NMAlarmRingInfo
    - (_Bool)isForVip
    {
        return false;
    }
    - (_Bool)isDeletedByServer
    {
        return false;
    }
%end

%hook NMEffectMusic
    - (_Bool)isVipBanner
    {
        return true;
    }
%end

%hook NMUserPrivilege
    - (_Bool)isBlackVIP
    {
        return true;
    }
    - (_Bool)annualVIP
    {
        return true;
    }
    - (long long)musicPackageVipCode
    {
        return 123456;
    }
    - (long long)blackVIPVipCode
    {
        return 123456;
    }
    - (double)musicPackageExpireTime
    {
        return 123456;
    }
    - (double)blackVIPExpireTime
    {
        return 3044761039;
    }
    - (long long)redVipAnnualCount
    {
        return 123456;
    }
    - (_Bool)isNearlyExpiredIn7Days
    {
        return false;
    }
    - (_Bool)isWhatEverMusicPackageOrBlackVIP
    {
        return true;
    }
    - (_Bool)isVIPExpired
    {
        return false;
    }
    - (_Bool)isBlackVIPExpired
    {
        return false;
    }
    - (_Bool)isBlackVIPNearlyExpired
    {
        return false;
    }
    - (_Bool)isMusicPackageNearlyExpired
    {
        return false;
    }
    - (_Bool)isMusicPackageExpired
    {
        return false;
    }
    - (_Bool)isWhatEverMusicPackage
    {
        return true;
    }
    - (_Bool)isDeluxeMusicPackage
    {
        return true;
    }
    - (_Bool)isNormalMusicPackage
    {
        return true;
    }
%end

%hook NMDiscoveryContent
    - (_Bool)isVipBanner
    {
        return true;
    }
%end

%hook NMSkinTheme
    - (_Bool)isForVip
    {
        return false;
    }
%end

%hook NMPlayEffect
    + (_Bool)isBlackVIPOnly
    {
        return false;
    }
%end

%hook NMDjProgramPrivilege
    - (_Bool)isMemberPrivilege
    {
        return false;
    }
    - (_Bool)payed
    {
        return true;
    }
%end

%hook NMNewDownloadManager
    - (void)checkNonVipUserDownloadDigital:(id)arg1 continueBlock:(id)arg2{};
%end

