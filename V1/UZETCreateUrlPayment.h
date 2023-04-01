

@interface UZETCreateUrlPayment :  NSObjec 
+(NSString *) CreatePaymentUrlWithOutClientDeatils:(NSString *)Product Total:(NSString *)Total callback_url:(NSString *)callback_url;
@end