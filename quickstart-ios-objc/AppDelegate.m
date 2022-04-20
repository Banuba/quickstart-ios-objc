#import "AppDelegate.h"

#import "BanubaClientToken.h"
#import <BNBSdkApi/BNBSdkApi-Swift.h>
#import <BNBSdkCore/BNBSdkCore.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication*)application
    didFinishLaunchingWithOptions:(NSDictionary*)launchOptions
{
    [BanubaSdkManager
        initializeWithResourcePath:@[[NSBundle.mainBundle.bundlePath stringByAppendingString:@"/bnb-resources"],
                                     [NSBundle.mainBundle.bundlePath stringByAppendingString:@"/effects"]]
                 clientTokenString:BNB_CLIENT_TOKEN
                          logLevel:BNBSeverityLevelInfo];
    return YES;
}


@end
