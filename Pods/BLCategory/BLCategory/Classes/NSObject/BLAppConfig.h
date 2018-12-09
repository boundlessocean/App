//
//  BLAppConfig.h
//  Pods
//
//  Created by boundlessocean on 2018/10/26.
//

#ifndef BLAppConfig_h
#define BLAppConfig_h

// LOG
#ifndef __OPTIMIZE__
#define NSLog(...) NSLog(__VA_ARGS__)
#else
#define NSLog(...) {}
#endif



// WEAKSELF STRONGSELF
#define WEAKSELF @Self_Weak
#define STRONGSELF @Self_Strong
#define STRONGLY_SELF __strong typeof(self_weak) strongSelf = self_weak;
#define Self_Weak autoreleasepool {} __weak typeof(self) self_weak = self;
#define Self_Strong autoreleasepool {} __strong typeof(self_weak) self = self_weak;




// SINGLETION
#define MT_SINGLETION(__clazz) \
+ (__clazz *)sharedInstance;

#define MT_DEF_SINGLETION(__clazz) \
+ (__clazz *)sharedInstance \
{\
static dispatch_once_t once; \
static __clazz * __singletion;\
dispatch_once(&once,^{__singletion = [[__clazz alloc] init];});\
return __singletion;\
}




// GET_PARAMETERS
#define GET_PARAMETERS(CODE)\
^(id type,...){\
va_list argsList;\
va_start(argsList, type);\
id arg;\
while ((arg = va_arg(argsList, id)))\
{switch ([type integerValue])CODE};\
va_end(argsList);\
}\

#define GET_PARAMETERS_BKID(CODE)\
^id(id type,...){\
va_list argsList;\
va_start(argsList, type);\
id arg;\
while ((arg = va_arg(argsList, id)))\
{switch ([type integerValue])CODE};\
return nil;\
va_end(argsList);\
}\

#define GET_PARAMETERS_DEFAULT(CODE)\
^(id type,...){\
va_list argsList;\
va_start(argsList, type);\
id arg;\
while ((arg = va_arg(argsList, id))){\
switch ([type integerValue]){\
default:{\
CODE;\
break;\
}}};\
va_end(argsList);\
}\




#endif /* BLAppConfig_h */
