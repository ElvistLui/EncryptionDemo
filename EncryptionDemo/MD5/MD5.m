//
//  MD5.m
//  EncryptionDemo
//
//  Created by Elvist on 16/9/7.
//  Copyright © 2016年 Elvist. All rights reserved.
//

#import "MD5.h"
#import "CommonCrypto/CommonDigest.h"

@implementation MD5

+ (NSString *)md5encryptionWithString:(NSString *)string
{
    return [self md5encryptionWithData:[string dataUsingEncoding:NSUTF8StringEncoding]];
}

+ (NSString *)md5encryptionWithData:(NSData *)data
{
    unsigned char *result;
    result = malloc(CC_MD5_DIGEST_LENGTH);
    
    CC_MD5([data bytes], (CC_LONG)[data length], result);
    
    NSString *digest = [[NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
                         result[0], result[1], result[2], result[3],
                         result[4], result[5], result[6], result[7],
                         result[8], result[9], result[10], result[11],
                         result[12], result[13], result[14], result[15]
                         ] lowercaseString];    // 默认返回字符串全部小写
    free(result);
    
    return digest;
}

@end
