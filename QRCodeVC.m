//
//  QRCodeVC.m
//  DemoCollection
//
//  Created by Jimmy on 24/7/2016.
//  Copyright © 2016 Tony. All rights reserved.
//

#import "QRCodeVC.h"
#import "ScanView.h"
#import "ScanBackgroundView.h"
#import "View+MASAdditions.h"
#import <AVFoundation/AVFoundation.h>

#define WIDTH_SCREEN        [UIScreen mainScreen].bounds.size.width
#define HEIGHT_SCREEN       [UIScreen mainScreen].bounds.size.height

@interface QRCodeVC()<AVCaptureMetadataOutputObjectsDelegate>

@property (strong,nonatomic) AVCaptureVideoPreviewLayer *cameraLayer;
@property (strong,nonatomic) AVCaptureSession *scanSession;

@end

@implementation QRCodeVC
{
    ScanView *scanView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    scanView = [ScanView new];
    
    [self.view addSubview:scanView];
    [scanView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.centerY.mas_equalTo(self.view).mas_offset(-55);
        make.width.and.height.mas_equalTo(0);
    }];
    
    ScanBackgroundView *backgroundView = ScanBackgroundView.new;
    [self.view addSubview:backgroundView];
    [backgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    backgroundView.mContentView = scanView;
    
    self.view.backgroundColor = [UIColor blackColor];
    [self.view.layer insertSublayer:self.cameraLayer atIndex:0];
}

- (void)viewDidAppear:(BOOL)animated {
    CGFloat width = self.view.frame.size.width * 0.6;
    CGFloat height = width;
    CGRect rect = CGRectMake(scanView.frame.origin.y / HEIGHT_SCREEN,scanView.frame.origin.x / WIDTH_SCREEN, scanView.frame.size.height / HEIGHT_SCREEN, scanView.frame.size.width / WIDTH_SCREEN);
    [self.scanSession.outputs[0] setRectOfInterest:rect];
    [self startCodeReading];
    
    [UIView animateWithDuration:0.3 animations:^{
        [scanView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(width);
            make.height.mas_equalTo(height);
        }];
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {

    }];
    
}

-(AVCaptureSession *)scanSession
{
    
    if (_scanSession == nil) {
        AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
        
        NSError *error = nil;
        AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:device error:&error];
        if (error) {//没有摄像头
            return nil;
        }
        AVCaptureMetadataOutput *output = [[AVCaptureMetadataOutput alloc]init];
        [output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
        
        AVCaptureSession *session = [[AVCaptureSession alloc]init];
        if ([session canSetSessionPreset:AVCaptureSessionPreset1920x1080]) {
            [session setSessionPreset:AVCaptureSessionPreset1920x1080];
        }else if([session canSetSessionPreset:AVCaptureSessionPreset1280x720]){
            [session setSessionPreset:AVCaptureSessionPreset1280x720];
        }else{
            [session setSessionPreset:AVCaptureSessionPresetPhoto];
        }
        
        if ([session canAddInput:input]) {
            [session addInput:input];
        }
        
        if ([session canAddOutput:output]) {
            [session addOutput:output];
        }
        [output setMetadataObjectTypes:@[AVMetadataObjectTypeEAN13Code,AVMetadataObjectTypeEAN8Code,AVMetadataObjectTypeCode128Code,AVMetadataObjectTypeQRCode]];
        _scanSession = session;
    }
    return _scanSession;
}


-(AVCaptureVideoPreviewLayer *)cameraLayer
{
    if (_cameraLayer == nil) {
        _cameraLayer = [AVCaptureVideoPreviewLayer layerWithSession:self.scanSession];
        [_cameraLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
        [_cameraLayer setFrame:self.view.layer.bounds];
    }
    return _cameraLayer;
}

-(void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
    if (metadataObjects.count > 0) {
        [self stopCodeReading];
        AVMetadataMachineReadableCodeObject *obj = metadataObjects[0];
        NSString *scanCode = obj.stringValue;
        NSLog([NSString stringWithFormat:@"🐶🐶🐶%@", scanCode]);
    }
}

/**
 *  开始扫描
 */
-(void)startCodeReading
{
    [scanView startScan];
    [self.scanSession startRunning];
    
}

/**
 * 停止扫描
 *
 */
-(void)stopCodeReading
{
    [scanView stopScan];
    [self.scanSession stopRunning];
}

@end
