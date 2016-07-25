//
//  HtmlRecognizeVC.m
//  DemoCollection
//
//  Created by Jimmy on 22/7/2016.
//  Copyright © 2016 Tony. All rights reserved.
//

#import "HtmlRecognizeVC.h"
#import "SDImageCache.h"
#import "SDWebImageManager.h"
#import "NSData+ImageContentType.h"

@interface HtmlRecognizeVC()<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *mWebView;


@end


@implementation HtmlRecognizeVC

@synthesize mWebView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [NSURLProtocol registerClass:[RecognizeUrlProtocol class]];
    
    NSString *url = @"http://mp.weixin.qq.com/s?__biz=MzI3ODE1NDU3NQ==&mid=401700261&idx=1&sn=fdbfec9b9b22d370b4666746274b4fd8&scene=1&srcid=0713VKyGDwV2BkAlGgGShlRb#rd";
    NSURLRequest *requeat = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    
    [mWebView loadRequest:requeat];
    mWebView.scalesPageToFit = YES;
    mWebView.delegate = self;
    [mWebView addGestureRecognizer:[[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressWebView:)]];
}

- (void)longPressWebView:(UILongPressGestureRecognizer *)recognizer {
    if (recognizer.state != UIGestureRecognizerStateBegan) {
        return;
    }
    
    CGPoint pressPoint = [recognizer locationInView:mWebView];
    NSString *imgURL = [NSString stringWithFormat:@"document.elementFromPoint(%f, %f).src", pressPoint.x, pressPoint.y];
    NSString *urlToSave = [mWebView stringByEvaluatingJavaScriptFromString:imgURL];
    UIImage *img = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:urlToSave];
    UIImageWriteToSavedPhotosAlbum(img, nil, nil, nil);
    NSLog(urlToSave);
    
}

#pragma mark - WebView Delegate methods
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [webView stringByEvaluatingJavaScriptFromString:@"document.documentElement.style.webkitUserSelect='none';"];
    [webView stringByEvaluatingJavaScriptFromString:@"document.documentElement.style.webkitTouchCallout='none';"];
    
    self.title = [webView stringByEvaluatingJavaScriptFromString:@"document.title;"];
}

- (void)dealloc
{
    [NSURLProtocol unregisterClass:[RecognizeUrlProtocol class]];
}

@end

#define RecognizeProtocolHandlerKey @"URLProtocolHandlerKey"

@interface RecognizeUrlProtocol()

@end

@implementation RecognizeUrlProtocol
{
    NSURLConnection *connection;
    NSMutableData *responseData;
}

+ (BOOL)canInitWithRequest:(NSURLRequest *)request {
    NSString *scheme = [[request URL] scheme];
    if ([scheme caseInsensitiveCompare:@"http"] == NSOrderedSame ||
        [scheme caseInsensitiveCompare:@"https"] == NSOrderedSame) {
        return ![NSURLProtocol propertyForKey:RecognizeProtocolHandlerKey inRequest:request];
    }
    return NO;
}

+ (NSURLRequest *)canonicalRequestForRequest:(NSURLRequest *)request {
    if ([request.URL host].length == 0) {
        return request;
    }
    
    NSMutableURLRequest *mRequest = [request mutableCopy];
//    NSString *originUrlString = [request.URL absoluteString];
//    NSString *originHostString = [request.URL host];
//    NSRange hostRange = [originUrlString rangeOfString:originHostString];
//    if (hostRange.location == NSNotFound) {
//        return request;
//    }
//    //定向到bing搜索主页
//    NSString *ip = @"www.bing.com";
//    
//    // 替换域名
//    NSString *urlString = [originUrlString stringByReplacingCharactersInRange:hostRange withString:ip];
//    NSURL *url = [NSURL URLWithString:urlString];
//    mRequest.URL = url;
    
    return mRequest;
}

+ (BOOL)requestIsCacheEquivalent:(NSURLRequest *)a toRequest:(NSURLRequest *)b {
    return [super requestIsCacheEquivalent:a toRequest:b];
}

- (void)startLoading {
    NSMutableURLRequest *request = [[self request] mutableCopy];
    
    [NSURLProtocol setProperty:@YES forKey:RecognizeProtocolHandlerKey inRequest:request];
    NSLog(@"start loading");
    
    NSString *key = [[SDWebImageManager sharedManager] cacheKeyForURL:self.request.URL];
    UIImage *image = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:key];
    NSData *data = UIImagePNGRepresentation(image);
    if (data) {
        NSURLResponse *response = [[NSURLResponse alloc] initWithURL:request.URL MIMEType:[NSData sd_contentTypeForImageData:data] expectedContentLength:data.length textEncodingName:nil];
        [self.client URLProtocol:self
              didReceiveResponse:response
              cacheStoragePolicy:NSURLCacheStorageNotAllowed];
        
        [self.client URLProtocol:self didLoadData:data];
        [self.client URLProtocolDidFinishLoading:self];
    }else {
        connection = [NSURLConnection connectionWithRequest:request delegate:self];
    }
    
}

- (void)stopLoading {
    NSLog(@"stop loading");
    [connection cancel];
}


#pragma mark - NSURLConnectionDataDelegate mwthods

- (void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    responseData = NSMutableData.new;
    [self.client URLProtocol:self didReceiveResponse:response cacheStoragePolicy:NSURLCacheStorageNotAllowed];
}

- (void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [responseData appendData:data];
    [self.client URLProtocol:self didLoadData:data];
}

- (void) connectionDidFinishLoading:(NSURLConnection *)connection {
    
    [[SDImageCache sharedImageCache] storeImageDataToDisk:responseData forKey:[[SDWebImageManager sharedManager] cacheKeyForURL:self.request.URL]];
    
    [self.client URLProtocolDidFinishLoading:self];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    [self.client URLProtocol:self didFailWithError:error];
}


@end