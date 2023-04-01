
// UZET Objective-c APi WithOut Client Deatils
// https://github.com/uzetco/UZET_Objective-c

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UZETCreateUrlPayment.h"


@implementation UZETCreateUrlPayment
+(NSString *) CreatePaymentUrlWithOutClientDeatils:(NSString *)Product Total:(NSString *)Total callback_url:(NSString *)callback_url{

dispatch_semaphore_t sema = dispatch_semaphore_create(0);

// this info's will get from your email README.pdf
NSString *UZET_Url   = @"";
NSString *UZET_Key   = @"";
NSString *UZET_Email = @"";

NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:UZET_Url]
cachePolicy:NSURLRequestUseProtocolCachePolicy
timeoutInterval:60.0];
NSDictionary *headers = @{
@"Content-Type": @"application/x-www-form-urlencoded",
@"Developer": @"UZET Payment"
};

[request setAllHTTPHeaderFields:headers];
NSMutableData *postData = [[NSMutableData alloc] initWithData:[[NSString stringWithFormat:@"email=%@",UZET_Email] dataUsingEncoding:NSUTF8StringEncoding]];
[postData appendData:[[NSString stringWithFormat:@"&Publishable_Key=%@",UZET_Key] dataUsingEncoding:NSUTF8StringEncoding]];
[postData appendData:[[NSString stringWithFormat:@"&Product=%@",Product] dataUsingEncoding:NSUTF8StringEncoding]];
[postData appendData:[[NSString stringWithFormat:@"&Total=%@",Total] dataUsingEncoding:NSUTF8StringEncoding]];
[postData appendData:[[NSString stringWithFormat:@"&callback_url=%@",callback_url] dataUsingEncoding:NSUTF8StringEncoding]];
[request setHTTPBody:postData];
[request setHTTPMethod:@"POST"];

NSURLSession *session = [NSURLSession sharedSession];
NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
if (error) {
NSLog(@"%@", error);
dispatch_semaphore_signal(sema);
} else {
NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
NSError *parseError = nil;
NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];
NSLog(@"%@",responseDictionary);
NSString* PaymentUrl = responseDictionary[@"url"];

NSLog(@"Payment url is : %@",PaymentUrl);

if(PaymentUrl !=nil){
return PaymentUrl;
} else {
return @"Unknow";
}
dispatch_semaphore_signal(sema);
}
}];
[dataTask resume];
dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
}
@end 
