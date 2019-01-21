
#import "RNMarketingCloud.h"
#import <React/RCTConvert.h>

#import <MarketingCloudSDK/MarketingCloudSDK.h>

@implementation RNMarketingCloud

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}
RCT_EXPORT_MODULE()




RCT_REMAP_METHOD(initializePushManager, initializePushManager:(NSDictionary *)etPushConfig resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject)
{
    // configure the Marketing Cloud SDK
    NSError *error = nil;
    BOOL success = [[MarketingCloudSDK sharedInstance] sfmc_configure:&error];
    if (success == YES) {
        // The SDK has been fully configured and is ready for use!
        
        // turn on logging for debugging.  Not recommended for production apps.
        [[MarketingCloudSDK sharedInstance] sfmc_setDebugLoggingEnabled:YES];
        
        // Great place for setting the contact key, tags and attributes since you know the SDK is setup and ready.
        [[MarketingCloudSDK sharedInstance] sfmc_setContactKey:@"user@mycompany.com"];
        [[MarketingCloudSDK sharedInstance] sfmc_addTag:@"Hiking Supplies"];
        [[MarketingCloudSDK sharedInstance] sfmc_setAttributeNamed:@"FavoriteTeamName" value:@"favoriteTeamName"];
        
        // application specific setup for notifications in general - not specific to MarketingCloudSDK per se.
        // requestAuthorizationWithOptions can be called now or later but the call to registerForRemoteNotifications has to be called after [[MarketingCloudSDK sharedInstance] sfmc_configure:&error]
        dispatch_async(dispatch_get_main_queue(), ^{
            if (@available(iOS 10, *)) {
                // set the UNUserNotificationCenter delegate - the delegate must be set here in didFinishLaunchingWithOptions
                [UNUserNotificationCenter currentNotificationCenter].delegate = self;
                
                [[UNUserNotificationCenter currentNotificationCenter] requestAuthorizationWithOptions:UNAuthorizationOptionAlert | UNAuthorizationOptionSound | UNAuthorizationOptionBadge
                                                                                    completionHandler:^(BOOL granted, NSError * _Nullable error) {
                                                                                        if (error == nil) {
                                                                                            if (granted == YES) {
                                                                                                dispatch_async(dispatch_get_main_queue(), ^{
                                                                                                    [[UIApplication sharedApplication] registerForRemoteNotifications];
                                                                                                });
                                                                                            }
                                                                                        }
                                                                                    }];
            }
            else {
#if __IPHONE_OS_VERSION_MIN_REQUIRED < 100000
                UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:
                                                        UIUserNotificationTypeBadge |
                                                        UIUserNotificationTypeSound |
                                                        UIUserNotificationTypeAlert
                                                                                         categories:nil];
                [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
#endif
                [[UIApplication sharedApplication] registerForRemoteNotifications];
            }
        });
    }
    else {
        //  MarketingCloudSDK sfmc_configure failed
        os_log_debug(OS_LOG_DEFAULT, "MarketingCloudSDK sfmc_configure failed with error = %@", error);
    }
   
    
    resolve(@"successful");
}

@end
  
