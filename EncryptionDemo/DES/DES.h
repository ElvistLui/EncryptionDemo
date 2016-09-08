//
//  DES.h
//  EncryptionDemo
//
//  Created by Elvist on 16/9/7.
//  Copyright © 2016年 Elvist. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DES : NSObject

/**
 *  DES加密（安全性很低）
 *
 *  @param plainText 被加密的数据
 *  @param key       加密算法的工作秘钥
 *
 *  @return 加密结果
 */
+ (NSString *)encryptUseDES:(NSString *)plainText key:(NSString *)key;

/**
 *  DES解密
 *
 *  @param cipherText 被解密的数据
 *  @param key        解密算法的工作秘钥
 *
 *  @return 解密结果
 */
+ (NSString *)decryptUseDES:(NSString *)cipherText key:(NSString *)key;

@end
