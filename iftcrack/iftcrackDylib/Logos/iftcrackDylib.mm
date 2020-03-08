#line 1 "/Users/paigu/Documents/iftcrack/iftcrackDylib/Logos/iftcrackDylib.xm"

#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class RewardManager; @class AdFullScreenVC; @class AdViewHelp; 
static void (*_logos_orig$_ungrouped$AdFullScreenVC$updateMottoText)(_LOGOS_SELF_TYPE_NORMAL AdFullScreenVC* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AdFullScreenVC$updateMottoText(_LOGOS_SELF_TYPE_NORMAL AdFullScreenVC* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AdFullScreenVC$showExitUIWaitSecond$)(_LOGOS_SELF_TYPE_NORMAL AdFullScreenVC* _LOGOS_SELF_CONST, SEL, float); static void _logos_method$_ungrouped$AdFullScreenVC$showExitUIWaitSecond$(_LOGOS_SELF_TYPE_NORMAL AdFullScreenVC* _LOGOS_SELF_CONST, SEL, float); static void (*_logos_orig$_ungrouped$AdFullScreenVC$doFinishedFlashWithAnimate$)(_LOGOS_SELF_TYPE_NORMAL AdFullScreenVC* _LOGOS_SELF_CONST, SEL, _Bool); static void _logos_method$_ungrouped$AdFullScreenVC$doFinishedFlashWithAnimate$(_LOGOS_SELF_TYPE_NORMAL AdFullScreenVC* _LOGOS_SELF_CONST, SEL, _Bool); static void (*_logos_orig$_ungrouped$AdFullScreenVC$startExitWithWaitSecond$)(_LOGOS_SELF_TYPE_NORMAL AdFullScreenVC* _LOGOS_SELF_CONST, SEL, long long); static void _logos_method$_ungrouped$AdFullScreenVC$startExitWithWaitSecond$(_LOGOS_SELF_TYPE_NORMAL AdFullScreenVC* _LOGOS_SELF_CONST, SEL, long long); static _Bool (*_logos_orig$_ungrouped$AdFullScreenVC$waitClose)(_LOGOS_SELF_TYPE_NORMAL AdFullScreenVC* _LOGOS_SELF_CONST, SEL); static _Bool _logos_method$_ungrouped$AdFullScreenVC$waitClose(_LOGOS_SELF_TYPE_NORMAL AdFullScreenVC* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AdViewHelp$updateAdContent)(_LOGOS_SELF_TYPE_NORMAL AdViewHelp* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AdViewHelp$updateAdContent(_LOGOS_SELF_TYPE_NORMAL AdViewHelp* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$RewardManager$handleAddHour$netDate$)(_LOGOS_SELF_TYPE_NORMAL RewardManager* _LOGOS_SELF_CONST, SEL, long long, id); static void _logos_method$_ungrouped$RewardManager$handleAddHour$netDate$(_LOGOS_SELF_TYPE_NORMAL RewardManager* _LOGOS_SELF_CONST, SEL, long long, id); static id (*_logos_orig$_ungrouped$RewardManager$validDateInfo)(_LOGOS_SELF_TYPE_NORMAL RewardManager* _LOGOS_SELF_CONST, SEL); static id _logos_method$_ungrouped$RewardManager$validDateInfo(_LOGOS_SELF_TYPE_NORMAL RewardManager* _LOGOS_SELF_CONST, SEL); 

#line 1 "/Users/paigu/Documents/iftcrack/iftcrackDylib/Logos/iftcrackDylib.xm"

    static void _logos_method$_ungrouped$AdFullScreenVC$updateMottoText(_LOGOS_SELF_TYPE_NORMAL AdFullScreenVC* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){};

    static void _logos_method$_ungrouped$AdFullScreenVC$showExitUIWaitSecond$(_LOGOS_SELF_TYPE_NORMAL AdFullScreenVC* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, float arg1) {
        return _logos_orig$_ungrouped$AdFullScreenVC$showExitUIWaitSecond$(self, _cmd, 0);
    }

    static void _logos_method$_ungrouped$AdFullScreenVC$doFinishedFlashWithAnimate$(_LOGOS_SELF_TYPE_NORMAL AdFullScreenVC* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, _Bool arg1) {
        return _logos_orig$_ungrouped$AdFullScreenVC$doFinishedFlashWithAnimate$(self, _cmd, YES);
    }

    static void _logos_method$_ungrouped$AdFullScreenVC$startExitWithWaitSecond$(_LOGOS_SELF_TYPE_NORMAL AdFullScreenVC* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, long long arg1) {
        return _logos_orig$_ungrouped$AdFullScreenVC$startExitWithWaitSecond$(self, _cmd, 0);
    }

    static _Bool _logos_method$_ungrouped$AdFullScreenVC$waitClose(_LOGOS_SELF_TYPE_NORMAL AdFullScreenVC* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
        return NO;
    }



    static void _logos_method$_ungrouped$AdViewHelp$updateAdContent(_LOGOS_SELF_TYPE_NORMAL AdViewHelp* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){};




    static void _logos_method$_ungrouped$RewardManager$handleAddHour$netDate$(_LOGOS_SELF_TYPE_NORMAL RewardManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, long long arg1, id arg2) {
        return _logos_orig$_ungrouped$RewardManager$handleAddHour$netDate$(self, _cmd, 11,arg2);
    }

    static id _logos_method$_ungrouped$RewardManager$validDateInfo(_LOGOS_SELF_TYPE_NORMAL RewardManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
        return @"去广告：糖醋丶炒排骨";
    }

static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$AdFullScreenVC = objc_getClass("AdFullScreenVC"); MSHookMessageEx(_logos_class$_ungrouped$AdFullScreenVC, @selector(updateMottoText), (IMP)&_logos_method$_ungrouped$AdFullScreenVC$updateMottoText, (IMP*)&_logos_orig$_ungrouped$AdFullScreenVC$updateMottoText);MSHookMessageEx(_logos_class$_ungrouped$AdFullScreenVC, @selector(showExitUIWaitSecond:), (IMP)&_logos_method$_ungrouped$AdFullScreenVC$showExitUIWaitSecond$, (IMP*)&_logos_orig$_ungrouped$AdFullScreenVC$showExitUIWaitSecond$);MSHookMessageEx(_logos_class$_ungrouped$AdFullScreenVC, @selector(doFinishedFlashWithAnimate:), (IMP)&_logos_method$_ungrouped$AdFullScreenVC$doFinishedFlashWithAnimate$, (IMP*)&_logos_orig$_ungrouped$AdFullScreenVC$doFinishedFlashWithAnimate$);MSHookMessageEx(_logos_class$_ungrouped$AdFullScreenVC, @selector(startExitWithWaitSecond:), (IMP)&_logos_method$_ungrouped$AdFullScreenVC$startExitWithWaitSecond$, (IMP*)&_logos_orig$_ungrouped$AdFullScreenVC$startExitWithWaitSecond$);MSHookMessageEx(_logos_class$_ungrouped$AdFullScreenVC, @selector(waitClose), (IMP)&_logos_method$_ungrouped$AdFullScreenVC$waitClose, (IMP*)&_logos_orig$_ungrouped$AdFullScreenVC$waitClose);Class _logos_class$_ungrouped$AdViewHelp = objc_getClass("AdViewHelp"); MSHookMessageEx(_logos_class$_ungrouped$AdViewHelp, @selector(updateAdContent), (IMP)&_logos_method$_ungrouped$AdViewHelp$updateAdContent, (IMP*)&_logos_orig$_ungrouped$AdViewHelp$updateAdContent);Class _logos_class$_ungrouped$RewardManager = objc_getClass("RewardManager"); MSHookMessageEx(_logos_class$_ungrouped$RewardManager, @selector(handleAddHour:netDate:), (IMP)&_logos_method$_ungrouped$RewardManager$handleAddHour$netDate$, (IMP*)&_logos_orig$_ungrouped$RewardManager$handleAddHour$netDate$);MSHookMessageEx(_logos_class$_ungrouped$RewardManager, @selector(validDateInfo), (IMP)&_logos_method$_ungrouped$RewardManager$validDateInfo, (IMP*)&_logos_orig$_ungrouped$RewardManager$validDateInfo);} }
#line 35 "/Users/paigu/Documents/iftcrack/iftcrackDylib/Logos/iftcrackDylib.xm"
