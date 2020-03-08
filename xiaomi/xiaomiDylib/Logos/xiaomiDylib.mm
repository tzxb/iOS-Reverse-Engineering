#line 1 "/Users/paigu/Documents/xiaomi/xiaomiDylib/Logos/xiaomiDylib.xm"














































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

@class XiaoMiYingShiBTaskViewController; @class XiaoMiYingShiBForTheFirstTimeRedPacketManager; @class NewADApiManager; @class XiaoMiYingShiBForTheFirstTimeRedPacketView; 
static void (*_logos_orig$_ungrouped$XiaoMiYingShiBTaskViewController$viewDidLoad)(_LOGOS_SELF_TYPE_NORMAL XiaoMiYingShiBTaskViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$XiaoMiYingShiBTaskViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL XiaoMiYingShiBTaskViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_meta_orig$_ungrouped$XiaoMiYingShiBForTheFirstTimeRedPacketManager$showLittleRedpacketInView$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id); static void _logos_meta_method$_ungrouped$XiaoMiYingShiBForTheFirstTimeRedPacketManager$showLittleRedpacketInView$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id); static void (*_logos_meta_orig$_ungrouped$XiaoMiYingShiBForTheFirstTimeRedPacketView$show)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static void _logos_meta_method$_ungrouped$XiaoMiYingShiBForTheFirstTimeRedPacketView$show(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$NewADApiManager$requestWithUrl$success$failure$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id, id, id); static id _logos_meta_method$_ungrouped$NewADApiManager$requestWithUrl$success$failure$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id, id, id); 

#line 46 "/Users/paigu/Documents/xiaomi/xiaomiDylib/Logos/xiaomiDylib.xm"

static void _logos_method$_ungrouped$XiaoMiYingShiBTaskViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL XiaoMiYingShiBTaskViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){};


































static void _logos_meta_method$_ungrouped$XiaoMiYingShiBForTheFirstTimeRedPacketManager$showLittleRedpacketInView$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1){
    _logos_meta_orig$_ungrouped$XiaoMiYingShiBForTheFirstTimeRedPacketManager$showLittleRedpacketInView$(self, _cmd, nil);
}



static void _logos_meta_method$_ungrouped$XiaoMiYingShiBForTheFirstTimeRedPacketView$show(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){};







static id _logos_meta_method$_ungrouped$NewADApiManager$requestWithUrl$success$failure$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2, id arg3){
    return _logos_meta_orig$_ungrouped$NewADApiManager$requestWithUrl$success$failure$(self, _cmd, nil,arg2,arg3);
}
static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$XiaoMiYingShiBTaskViewController = objc_getClass("XiaoMiYingShiBTaskViewController"); MSHookMessageEx(_logos_class$_ungrouped$XiaoMiYingShiBTaskViewController, @selector(viewDidLoad), (IMP)&_logos_method$_ungrouped$XiaoMiYingShiBTaskViewController$viewDidLoad, (IMP*)&_logos_orig$_ungrouped$XiaoMiYingShiBTaskViewController$viewDidLoad);Class _logos_class$_ungrouped$XiaoMiYingShiBForTheFirstTimeRedPacketManager = objc_getClass("XiaoMiYingShiBForTheFirstTimeRedPacketManager"); Class _logos_metaclass$_ungrouped$XiaoMiYingShiBForTheFirstTimeRedPacketManager = object_getClass(_logos_class$_ungrouped$XiaoMiYingShiBForTheFirstTimeRedPacketManager); MSHookMessageEx(_logos_metaclass$_ungrouped$XiaoMiYingShiBForTheFirstTimeRedPacketManager, @selector(showLittleRedpacketInView:), (IMP)&_logos_meta_method$_ungrouped$XiaoMiYingShiBForTheFirstTimeRedPacketManager$showLittleRedpacketInView$, (IMP*)&_logos_meta_orig$_ungrouped$XiaoMiYingShiBForTheFirstTimeRedPacketManager$showLittleRedpacketInView$);Class _logos_class$_ungrouped$XiaoMiYingShiBForTheFirstTimeRedPacketView = objc_getClass("XiaoMiYingShiBForTheFirstTimeRedPacketView"); Class _logos_metaclass$_ungrouped$XiaoMiYingShiBForTheFirstTimeRedPacketView = object_getClass(_logos_class$_ungrouped$XiaoMiYingShiBForTheFirstTimeRedPacketView); MSHookMessageEx(_logos_metaclass$_ungrouped$XiaoMiYingShiBForTheFirstTimeRedPacketView, @selector(show), (IMP)&_logos_meta_method$_ungrouped$XiaoMiYingShiBForTheFirstTimeRedPacketView$show, (IMP*)&_logos_meta_orig$_ungrouped$XiaoMiYingShiBForTheFirstTimeRedPacketView$show);Class _logos_class$_ungrouped$NewADApiManager = objc_getClass("NewADApiManager"); Class _logos_metaclass$_ungrouped$NewADApiManager = object_getClass(_logos_class$_ungrouped$NewADApiManager); MSHookMessageEx(_logos_metaclass$_ungrouped$NewADApiManager, @selector(requestWithUrl:success:failure:), (IMP)&_logos_meta_method$_ungrouped$NewADApiManager$requestWithUrl$success$failure$, (IMP*)&_logos_meta_orig$_ungrouped$NewADApiManager$requestWithUrl$success$failure$);} }
#line 99 "/Users/paigu/Documents/xiaomi/xiaomiDylib/Logos/xiaomiDylib.xm"
