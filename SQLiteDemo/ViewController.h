//
//  ViewController.h
//  SQLiteDemo
//
//  Created by Stronger Shen on 13/4/27.
//  Copyright (c) 2013年 MobileIT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *textCustNo;
@property (strong, nonatomic) IBOutlet UITextField *textCustName;
@property (strong, nonatomic) IBOutlet UITextField *textCustTel;
@property (strong, nonatomic) IBOutlet UITextField *textCustEmail;
@property (strong, nonatomic) IBOutlet UITextField *textCustAddr;

@property (assign, nonatomic) NSInteger flag;  //1=add, 2=edit
@property (strong, nonatomic) NSDictionary *dictCust;

@end
