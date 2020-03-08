%hook AdFullScreenVC
    - (void)updateMottoText{};
    - (void)showExitUIWaitSecond:(float)arg1
    {
        return %orig(0);
    }
    - (void)doFinishedFlashWithAnimate:(_Bool)arg1
    {
        return %orig(YES);
    }
    - (void)startExitWithWaitSecond:(long long)arg1
    {
        return %orig(0);
    }
    -(_Bool)waitClose
    {
        return NO;
    }
%end

%hook AdViewHelp
    - (void)updateAdContent{};
%end

%hook RewardManager
    - (void)handleAddHour:(long long)arg1 netDate:(id)arg2
    {
        return %orig(11,arg2);
    }
    - (id)validDateInfo
    {
        return @"去广告：糖醋丶炒排骨";
    }
%end
