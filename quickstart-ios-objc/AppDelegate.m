#import "AppDelegate.h"

#import "BanubaClientToken.h"
#import <BanubaSdk/BanubaSdk-Swift.h>
#import <BanubaEffectPlayer/BanubaEffectPlayer.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication*)application
    didFinishLaunchingWithOptions:(NSDictionary*)launchOptions
{
    [BanubaSdkManager
        initializeWithResourcePath:@[[NSBundle.mainBundle.bundlePath
                                       stringByAppendingString:@"/effects"]]
                 clientTokenString:BNB_CLIENT_TOKEN
                          logLevel:BNBSeverityLevelInfo];
    return YES;
}


@end
