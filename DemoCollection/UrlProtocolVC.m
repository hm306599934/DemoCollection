//
//  UrlProtocolVC.m
//  DemoCollection
//
//  Created by Jimmy on 22/7/2016.
//  Copyright © 2016 Tony. All rights reserved.
//

#import "UrlProtocolVC.h"

#define URLProtocolHandlerKey @"URLProtocolHandlerKey"

@interface UrlProtocolVC()

@property (weak, nonatomic) IBOutlet UIWebView *mWebView;

@end

@implementation UrlProtocolVC

@synthesize mWebView;

-(void)viewDidLoad {
    [super viewDidLoad];
    
    [NSURLProtocol registerClass:[HMUrlProtocol class]];
    
    NSURL* url = [NSURL URLWithString:@"http://www.baidu.com"];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    [mWebView loadRequest:request];
}

- (void)dealloc
{
    [NSURLProtocol unregisterClass:[HMUrlProtocol class]];
}

@end


@interface HMUrlProtocol()

@end

@implementation HMUrlProtocol
{
    NSURLConnection *connection;
}

+ (BOOL)canInitWithRequest:(NSURLRequest *)request {
    NSString *scheme = [[request URL] scheme];
    if ([scheme caseInsensitiveCompare:@"http"] == NSOrderedSame ||
        [scheme caseInsensitiveCompare:@"https"] == NSOrderedSame) {
        return ![NSURLProtocol propertyForKey:URLProtocolHandlerKey inRequest:request];
    }
    return NO;
}

+ (NSURLRequest *)canonicalRequestForRequest:(NSURLRequest *)request {
    if ([request.URL host].length == 0) {
        return request;
    }
    
    NSMutableURLRequest *mRequest = [request mutableCopy];
    NSString *originUrlString = [request.URL absoluteString];
    NSString *originHostString = [request.URL host];
    NSRange hostRange = [originUrlString rangeOfString:originHostString];
    if (hostRange.location == NSNotFound) {
        return request;
    }
    //定向到bing搜索主页
    NSString *ip = @"www.bing.com";
    
    // 替换域名
    NSString *urlString = [originUrlString stringByReplacingCharactersInRange:hostRange withString:ip];
    NSURL *url = [NSURL URLWithString:urlString];
    mRequest.URL = url;
    
    return mRequest;
}

+ (BOOL)requestIsCacheEquivalent:(NSURLRequest *)a toRequest:(NSURLRequest *)b {
    return [super requestIsCacheEquivalent:a toRequest:b];
}

- (void)startLoading {
    NSMutableURLRequest *request = [[self request] mutableCopy];
    
    [NSURLProtocol setProperty:@YES forKey:URLProtocolHandlerKey inRequest:request];
    NSLog(@"start loading");
    connection = [NSURLConnection connectionWithRequest:request delegate:self];
}

- (void)stopLoading {
    NSLog(@"stop loading");
    [connection cancel];
}


#pragma mark - NSURLConnectionDataDelegate mwthods

- (void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    [self.client URLProtocol:self didReceiveResponse:response cacheStoragePolicy:NSURLCacheStorageNotAllowed];
}

- (void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [self.client URLProtocol:self didLoadData:data];
}

- (void) connectionDidFinishLoading:(NSURLConnection *)connection {
    [self.client URLProtocolDidFinishLoading:self];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    [self.client URLProtocol:self didFailWithError:error];
}


@end