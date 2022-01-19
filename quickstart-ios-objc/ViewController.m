#import "ViewController.h"
#import <BanubaEffectPlayer/BanubaEffectPlayer.h>
#import <BanubaSdk/BanubaSdk-Swift.h>

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
    self.effectView.effectPlayer = self.sdkManager.effectPlayer;
    [self.sdkManager setRenderTargetWithLayer:(CAEAGLLayer*) self.effectView.layer
                                  contentMode:RenderContentModeResizeAspectFill
                          playerConfiguration:nil];

    [self.sdkManager.input startCamera];

    self.effect = [self.sdkManager loadEffect:@"UnluckyWitch" synchronous:false];
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

- (IBAction)PushTakePhotoButton:(UIButton *)sender {
    [self.sdkManager.input setCameraSessionType:CameraSessionTypeFrontCameraPhotoSession];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.5 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        CameraPhotoSettings *setting = [[CameraPhotoSettings alloc] initWithUseStabilization:true flashMode:AVCaptureFlashModeOff];
        [self.sdkManager makeCameraPhotoWithCameraSettings:setting
                                           flipFrontCamera:true
                                           srcImageHandler:nil
                                                completion:^(UIImage* img) {
            if (img != nil) {
                NSLog(@"Take photo");
                UIImageWriteToSavedPhotosAlbum(img, nil, nil, nil);
            }
            [self.sdkManager.input setCameraSessionType:CameraSessionTypeFrontCameraVideoSession];
        }];
    });
}
@end
