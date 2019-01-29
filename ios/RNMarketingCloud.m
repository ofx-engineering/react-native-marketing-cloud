
#import "RNMarketingCloud.h"
#import <React/RCTConvert.h>

#import <MarketingCloudSDK/MarketingCloudSDK.h>

@implementation RNMarketingCloud

RCT_EXPORT_MODULE()


RCT_REMAP_METHOD(setContactKey,
                 contactKey:(NSString *)contactKey
                 resolver1:(RCTPromiseResolveBlock)resolve
                 rejecter1:(RCTPromiseRejectBlock)reject)
{
    RCTLog(@"Setting contact Key with %@", contactKey);
    NSLog(@"SDK State = %@", [[MarketingCloudSDK sharedInstance] sfmc_getSDKState]);
    bool returnValue = [[MarketingCloudSDK sharedInstance] sfmc_setContactKey:contactKey];
    
    if(returnValue){
        resolve(@"true");
    }
    resolve(@"false");
}

RCT_REMAP_METHOD(setTag,
                 tag:(NSString *)tag
                 resolver1:(RCTPromiseResolveBlock)resolve
                 rejecter1:(RCTPromiseRejectBlock)reject)
{
    RCTLog(@"Setting tag with %@", tag);
    bool returnValue = [[MarketingCloudSDK sharedInstance] sfmc_addTag:tag];
    
    if(returnValue){
        resolve([[MarketingCloudSDK sharedInstance] sfmc_tags]);
    }
    resolve(@"false");
}

RCT_REMAP_METHOD(removeTag,
                 tag:(NSString *)tag
                 resolver2:(RCTPromiseResolveBlock)resolve
                 rejecter2:(RCTPromiseRejectBlock)reject)
{
    RCTLog(@"removing tag with %@", tag);
    bool returnValue = [[MarketingCloudSDK sharedInstance] sfmc_removeTag:tag];
    
    if(returnValue){
         resolve([[MarketingCloudSDK sharedInstance] sfmc_tags]);
    }
    resolve(@"false");
}


RCT_REMAP_METHOD(setAttributeNamed,
                 name:(NSString *)name
                 value:(NSString *)value
                 resolver1:(RCTPromiseResolveBlock)resolve
                 rejecter1:(RCTPromiseRejectBlock)reject)
{
    
    bool returnValue = [[MarketingCloudSDK sharedInstance] sfmc_setAttributeNamed:name value:value];
    if(returnValue){
        resolve([[MarketingCloudSDK sharedInstance] sfmc_attributes]);
    }
    resolve(@"false");
}

RCT_REMAP_METHOD(removeAttributeNamed,
                 name:(NSString *)name
                 resolver1:(RCTPromiseResolveBlock)resolve
                 rejecter1:(RCTPromiseRejectBlock)reject)
{
    
    bool returnValue = [[MarketingCloudSDK sharedInstance] sfmc_clearAttributeNamed:name];
    if(returnValue){
         resolve([[MarketingCloudSDK sharedInstance] sfmc_attributes]);
    }
    resolve(@"false");
}



@end
  
