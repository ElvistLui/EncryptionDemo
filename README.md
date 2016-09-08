# AES、DES、MD5加密

```
/**
 *  AES加密
 *
 *  @param message 被加密的数据
 *  @param key     密钥
 *  @param iv      向量
 *
 *  @return 加密结果
 */
+ (NSString *)encrypt:(NSString *)message key:(NSString *)key;
+ (NSString *)encrypt:(NSString *)message key:(NSString *)key iv:(NSString *)iv;

/**
 *  AES解密
 *
 *  @param base64EncodedString 被解密的数据
 *  @param key                 密钥
 *  @param iv                  向量
 *
 *  @return 解密结果
 */
+ (NSString *)decrypt:(NSString *)base64EncodedString key:(NSString *)key;
+ (NSString *)decrypt:(NSString *)base64EncodedString key:(NSString *)key iv:(NSString *)iv;
```
```
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
```
```
/**
 *  MD5加密
 *
 *  @param string、data 需要被加密的数据
 *
 *  @return 加密结果
 */
+ (NSString *)md5encryptionWithString:(NSString *)string;
+ (NSString *)md5encryptionWithData:(NSData *)data;
```