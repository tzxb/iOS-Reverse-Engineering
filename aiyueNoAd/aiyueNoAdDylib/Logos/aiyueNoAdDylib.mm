#line 1 "/Users/paigu/Documents/aiyueNoAd/aiyueNoAdDylib/Logos/aiyueNoAdDylib.xm"

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

@class RewardManager; 
static _Bool (*_logos_orig$_ungrouped$RewardManager$valid)(_LOGOS_SELF_TYPE_NORMAL RewardManager* _LOGOS_SELF_CONST, SEL); static _Bool _logos_method$_ungrouped$RewardManager$valid(_LOGOS_SELF_TYPE_NORMAL RewardManager* _LOGOS_SELF_CONST, SEL); static id (*_logos_orig$_ungrouped$RewardManager$validDateInfo)(_LOGOS_SELF_TYPE_NORMAL RewardManager* _LOGOS_SELF_CONST, SEL); static id _logos_method$_ungrouped$RewardManager$validDateInfo(_LOGOS_SELF_TYPE_NORMAL RewardManager* _LOGOS_SELF_CONST, SEL); 

#line 1 "/Users/paigu/Documents/aiyueNoAd/aiyueNoAdDylib/Logos/aiyueNoAdDylib.xm"

static _Bool _logos_method$_ungrouped$RewardManager$valid(_LOGOS_SELF_TYPE_NORMAL RewardManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
    return YES;
}

static id _logos_method$_ungrouped$RewardManager$validDateInfo(_LOGOS_SELF_TYPE_NORMAL RewardManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return @"糖醋丶炒排骨破解";
}

static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$RewardManager = objc_getClass("RewardManager"); MSHookMessageEx(_logos_class$_ungrouped$RewardManager, @selector(valid), (IMP)&_logos_method$_ungrouped$RewardManager$valid, (IMP*)&_logos_orig$_ungrouped$RewardManager$valid);MSHookMessageEx(_logos_class$_ungrouped$RewardManager, @selector(validDateInfo), (IMP)&_logos_method$_ungrouped$RewardManager$validDateInfo, (IMP*)&_logos_orig$_ungrouped$RewardManager$validDateInfo);} }
#line 10 "/Users/paigu/Documents/aiyueNoAd/aiyueNoAdDylib/Logos/aiyueNoAdDylib.xm"
