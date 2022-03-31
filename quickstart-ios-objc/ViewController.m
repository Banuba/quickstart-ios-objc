#import "ViewController.h"
#import <BNBSdkApi/BNBSdkApi-Swift.h>
#import <BNBSdkCore/BNBSdkCore.h>

@interface ViewController ()

@property(strong, nonatomic) BanubaSdkManager* sdkManager;
@property(strong, nonatomic) BNBEffect* effect;
@property(weak, nonatomic) IBOutlet EffectPlayerView* effectView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (!self.sdkManager) {
        self.sdkManager = [BanubaSdkManager new];
    }

    [self.sdkManager setupWithConfiguration:[EffectPlayerConfiguration new]];
    [self.sdkManager setRenderTargetWithView:self.effectView playerConfiguration:nil];

    [self.sdkManager.input startCamera];

    self.effect = [self.sdkManager loadEffect:@"TrollGrandma" synchronous:false];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.sdkManager startEffectPlayer];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.sdkManager stopEffectPlayer];
}

@end
