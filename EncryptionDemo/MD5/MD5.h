//
//  MD5.h
//  EncryptionDemo
//
//  Created by Elvist on 16/9/7.
//  Copyright © 2016年 Elvist. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MD5 : NSObject

/**
 *  MD5加密
 *
 *  @param string、data 需要被加密的数据
 *
 *  @return 加密结果
 */
+ (NSString *)md5encryptionWithString:(NSString *)string;
+ (NSString *)md5encryptionWithData:(NSData *)data;

@end
