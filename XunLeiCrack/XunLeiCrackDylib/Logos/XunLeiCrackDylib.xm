%hook UserInfo
- (_Bool)isYearVip{
	return YES;
}
- (int)vipType{
	return 5;
}
- (id)nickName{
	return @"糖醋丶炒排骨";
}
- (long long)vipTypeInMemberSDK{
	return 5;
}
%end

%hook XLMemberVIPInfo
- (id)expireDate{
	return @"20930209";
}
- (id)isVip{
	return @"1";
}
- (id)isYear{
	return @"1";
}
- (id)vipLevel{
	return @"9";
}
%end

%hook VIPActivity
- (unsigned long long)vipType{
	return 5;
}
%end

%hook HomePageVC
- (void)viewDidLoad{};
%end

%hook TDFollowListViewController
- (void)loadFollowList{};
- (void)loadGroupList{};
%end
