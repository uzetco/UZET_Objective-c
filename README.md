# UZET_Objective-c
Use this UZET Objective c payment gateway to enable clients of your App to pay using UZET gateway.


## Usage

If you're using UZETCreateUrlPayment, you can call import it into your tweaks.

```objective-c
#import "UZETCreateUrlPayment.h"

```


Make sure you've set up the macros in UZETCreateUrlPayment.m beforehand.



```objective-c
NSString *UZET_Url   = @"";
NSString *UZET_Key   = @"";
NSString *UZET_Email = @"";
```

Calling it is even easier.

How To Use V1 WithOut Client Deatils


```objective-c
NSString *UZET_Product              = @"Order 10#"; // Name Product
NSString *UZET_Total                = @"10"; // Amount USD 
NSString *UZET_callback_url         = @"https://yourdomen.com/uzet/callback"; // After Payment Completed will back the your url


NSString * PaymentUrl = [UZETCreateUrlPayment 
CreatePaymentUrlWithOutClientDeatils:UZET_Product
Total:UZET_Total
callback_url:UZET_callback_url
];

NSLog(@"Payment Url is : %@",PaymentUrl);

```


How To Use V2 With Client Deatils


```objective-c
NSString *UZET_Product              = @"Order 10#"; // Name Product
NSString *UZET_amount               = @"10"; // Amount USD 
NSString *UZET_callback_url         = @"https://yourdomen.com/uzet/callback"; // After Payment Completed will back the your url
NSString *UZET_customer_email       = @"email@email.com"; // Email Customer
NSString *UZET_billing_street1      = @"Dubae"; // Billing Street 1
NSString *UZET_billing_city         = @"Dubae"; // Customer City
NSString *UZET_billing_state        = @"Dubae Street "; // Billing State
NSString *UZET_billing_country      = @"AE";// Customer Country  like AE - IQ - FR etc...
NSString *UZET_billing_postcode     = @"10013"; // Customer ZIP Code
NSString *UZET_customer_givenName   = @"Azozz"; // Customer First Name
NSString *UZET_customer_surname     = @"ALFiras"; // Customer Last Name
NSString *UZET_customer_phonenumber = @"9647719675127"; // Customer Phone Number


NSString * PaymentUrl = [UZETCreateUrlPayment 
CreatePaymentLink:UZET_Product
amount:UZET_amount
callback_url:UZET_callback_url
customer_email:UZET_customer_email
billing_street1:UZET_billing_street1
billing_city:UZET_billing_city
billing_state:UZET_billing_state
billing_country:UZET_billing_country
billing_postcode:UZET_billing_postcode
customer_givenName:UZET_customer_givenName
customer_surname:UZET_customer_surname
customer_phonenumber:UZET_customer_phonenumber
];

NSLog(@"Payment Url is : %@",PaymentUrl);

```
