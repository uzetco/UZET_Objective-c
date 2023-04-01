

@interface UZETCreateUrlPayment :  NSObjec 
+(NSString *) CreatePaymentUrlWithClientDeatils:(NSString *)Product amount:(NSString *)amount callback_url:(NSString *)callback_url customer_email:(NSString *)customer_email billing_street1:(NSString *)billing_street1 billing_city:(NSString *)billing_city billing_state:(NSString *)billing_state billing_country:(NSString *)billing_country billing_postcode:(NSString *)billing_postcode customer_givenName:(NSString *)customer_givenName customer_surname:(NSString *)customer_surname customer_phonenumber:(NSString *)customer_phonenumber;
@end