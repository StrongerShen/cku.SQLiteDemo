//
//  ViewController.m
//  SQLiteDemo
//
//  Created by Stronger Shen on 13/4/27.
//  Copyright (c) 2013年 MobileIT. All rights reserved.
//

#import "ViewController.h"
#import "myDB.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize flag;
@synthesize textCustNo, textCustName, textCustTel, textCustEmail, textCustAddr;
@synthesize dictCust;

- (void)addNewCustOK:(id)sender
{
    [[myDB sharedInstance] insertCustNo:textCustNo.text
                            andCustName:textCustName.text
                             andCustTel:textCustTel.text
                           andCustEmail:textCustEmail.text
                            andCustAddr:textCustAddr.text];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)editCustOK:(id)sender
{
    [[myDB sharedInstance] updateCustNo:textCustNo.text
                            andCustName:textCustName.text
                             andCustTel:textCustTel.text
                           andCustEmail:textCustEmail.text
                            andCustAddr:textCustAddr.text];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIBarButtonItem *btnOK;
    if (flag==1) {
        self.title = @"Add Customer";
        btnOK = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(addNewCustOK:)];
    }
    else if (flag==2)
    {
        self.title = @"Edit Customer";
        btnOK = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(editCustOK:)];
    }
    self.navigationItem.rightBarButtonItem = btnOK;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    textCustNo.text = [dictCust objectForKey:@"cust_no"];
    textCustName.text = [dictCust objectForKey:@"cust_name"];
    textCustTel.text = [dictCust objectForKey:@"cust_tel"];
    textCustEmail.text = [dictCust objectForKey:@"cust_email"];
    textCustAddr.text = [dictCust objectForKey:@"cust_addr"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}














@end
