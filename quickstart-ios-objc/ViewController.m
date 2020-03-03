#import "ViewController.h"
#import <BanubaEffectPlayer/BanubaEffectPlayer.h>
#import <BanubaSdk/BanubaSdk-Swift.h>

@interface ViewController ()

@property(strong, nonatomic) BanubaSdkManager* sdkManager;
@property(weak, nonatomic) IBOutlet EffectPlayerView* effectView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (!self.sdkManager) {
        self.sdkManager = [BanubaSdkManager new];
    }

    [self.sdkManager setupWithConfiguration:[EffectPlayerConfinguration new]];
    self.effectView.effectPlayer = self.sdkManager.effectPlayer;
    [self.sdkManager setRenderTargetWithLayer:(CAEAGLLayer*) self.effectView.layer
                          playerConfiguration:nil];

    [self.sdkManager.input startCamera];

    [self.sdkManager.effectPlayer loadEffect:@"UnluckyWitch"];
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
