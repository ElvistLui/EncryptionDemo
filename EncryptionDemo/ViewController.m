//
//  ViewController.m
//  EncryptionDemo
//
//  Created by Elvist on 16/9/7.
//  Copyright © 2016年 Elvist. All rights reserved.
//

#import "ViewController.h"

#define kDESKey @"deskey"    // DES加解密的工作秘钥

#define kAESKey @"59edfd78958951626662b7c547d24387" // 1234567890123456
#define kAESIv  @"1!@23#%^87zhqJIY"

@interface ViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UITextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self initView];
}

#pragma mark - 初始化视图
- (void)initView
{
    self.title = @"加密Demo";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"MD5" style:UIBarButtonItemStylePlain target:self action:@selector(didClickedMD5BarButtonItem:)];
    
    UIBarButtonItem *encrypt = [[UIBarButtonItem alloc] initWithTitle:@"DES加密" style:UIBarButtonItemStylePlain target:self action:@selector(didClickedDESEncryptBarButtonItem:)];
    UIBarButtonItem *decrypt = [[UIBarButtonItem alloc] initWithTitle:@"DES解密" style:UIBarButtonItemStylePlain target:self action:@selector(didClickedDESDecryptBarButtonItem:)];
    self.navigationItem.rightBarButtonItems = @[encrypt, decrypt];
    
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 20, self.view.frame.size.width - 20, 40)];
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    self.textField.delegate = self;
    [self.view addSubview:self.textField];
    
    self.textView = [[UITextView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(self.textField.frame) + 20, CGRectGetWidth(self.textField.frame), self.view.frame.size.height / 3)];
    self.textView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.textView.layer.borderWidth = 0.5;
    self.textView.editable = NO;
    [self.view addSubview:self.textView];
    
    NSArray *nameArray = @[@"AES加密", @"AES解密"];
    for (int i = 0; i < 2; i++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(10 + 110 * i, CGRectGetMaxY(self.textView.frame) + 10, 100, 40);
        button.tag = i;
        button.layer.borderColor = [UIColor lightGrayColor].CGColor;
        button.layer.borderWidth = 0.5;
        [button setTitle:nameArray[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(didClickedAESButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
}

#pragma mark - 
// MD5加密
- (void)didClickedMD5BarButtonItem:(UIBarButtonItem *)sender
{
    [self.textField resignFirstResponder];
    
    NSString *result = [MD5 md5encryptionWithString:self.textField.text];
//    NSString *result = [CocoaSecurity md5:self.textField.text].hex;
    self.textView.text = [NSString stringWithFormat:@"MD5加密结果：\n%@", result];
}
// DES加密
- (void)didClickedDESEncryptBarButtonItem:(UIBarButtonItem *)sender
{
    [self.textField resignFirstResponder];
    NSString *result = [DES encryptUseDES:self.textField.text key:kDESKey];
    self.textView.text = [NSString stringWithFormat:@"DES加密结果：\n%@", result];
}
// DES解密
- (void)didClickedDESDecryptBarButtonItem:(UIBarButtonItem *)sender
{
    [self.textField resignFirstResponder];
    if (self.textView.text.length > 8) {
        
        NSString *result = [DES decryptUseDES:[self.textView.text substringFromIndex:9] key:kDESKey];
        self.textView.text = [NSString stringWithFormat:@"DES解密结果：\n%@", result];
    }
}
// AES加解密
- (void)didClickedAESButton:(UIButton *)sender
{
    [self.textField resignFirstResponder];
    if (sender.tag) {
        
        // 解密
        if (self.textView.text.length > 8) {
            
            NSString *result = [AESCrypt decrypt:[self.textView.text substringFromIndex:9] key:kAESKey iv:kAESIv];
            self.textView.text = [NSString stringWithFormat:@"AES解密结果：\n%@", result];
        }
    } else {
        
        // 加密
        NSString *result = [AESCrypt encrypt:self.textField.text key:kAESKey iv:kAESIv];
        self.textView.text = [NSString stringWithFormat:@"AES加密结果：\n%@", result];
    }
}

#pragma mark -
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if ([string isEqualToString:@" "]) {
        
        return NO;
    }
    self.textView.text = @"";
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

#pragma mark -
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
