//
//  NSString+ATools.m
//  DemoPlus
//
//  Created by 王力 on 15/8/8.
//  Copyright © 2015年 王力. All rights reserved.
//

#import "NSString+ATools.h"
#import <CommonCrypto/CommonDigest.h>
@implementation NSString (ATools)

+(BOOL) checkIsNullString:(NSString *)checkString{
    BOOL isNullString = YES;
    if (checkString && ![checkString isKindOfClass:[NSNull class]] &&![checkString isEqualToString:@"<null>"] && ![checkString isEqualToString:@"(null)"] && ![checkString isEqualToString:@""]&& ![checkString isEqualToString:@"<nil>"]) {
        isNullString = NO;
    }
    return isNullString;
}

+(BOOL) checkIsChineseString:(NSString *)checkString{
    NSString *match=@"(^[\u4e00-\u9fa5]+$)";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF matches %@", match];
    return [predicate evaluateWithObject:self];
}

+(BOOL) checkIsPhoneString:(NSString *) phone{
    NSString *regex = @"^((13[0-9])|(147)|(15[0-9])|(17[0-9])|(18[0-9]))\\d{8}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:phone];
}
+ (BOOL) validateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}
+(BOOL) checkIsEqualString:(NSString *)_strString1 withCompareString:(NSString *)_strString2{
    return [_strString1 isEqualToString:_strString2];
}

+(NSString *) md5:(NSString *) inputString
{
    if ([NSString checkIsNullString:inputString]) {
        return nil;
    }
    const char *cStr = [inputString UTF8String];
    unsigned char digest[16];
    CC_MD5( cStr, (CC_LONG)strlen(cStr), digest ); // This is the md5 call
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    return  output;
}

+(NSData *) jsonDataWithNSDictionary:(NSDictionary *)dict{
    NSError *error = nil;
    NSData *requestBody = [NSJSONSerialization dataWithJSONObject:dict options:0 error:&error];
    if(error == nil)
    {
        NSLog(@"Serialization body: %@",dict);
    }else {
        NSLog(@"Serialization Eror: %@",error);
    }
    return requestBody;
}

+(id) jsonObjectWithData:(NSData *) data{
    NSError *error = nil;
    id jsonObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    if(error == nil)
    {
        NSLog(@"Serialization body: %@",jsonObject);
    }else {
        NSLog(@"Serialization Eror: %@",error);
    }
    return jsonObject;
}

+(NSString *) jsonStringWithNSDictionary:(NSDictionary *) dict{
    NSData *jsonData = [NSString jsonDataWithNSDictionary:dict];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonString;
}

+(id) jsonObjectWithNSString:(NSString *) jsonString{
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    id jsonObject = [NSString jsonObjectWithData:jsonData];
    return jsonObject;
}
+(NSString *) replaceSpaceWithEmpty:(NSString *) empty{
    NSString *strUrl = [empty stringByReplacingOccurrencesOfString:@" " withString:@""];
    return strUrl;
}
@end
