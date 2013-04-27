//
//  myDB.h
//
//  Created by 志宗 沈 on 12/7/23.
//  Copyright (c) 2012年 MIT. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FMDatabase;

@interface myDB : NSObject
{
    FMDatabase* _db;
}

+ (myDB *)sharedInstance;

- (id)queryCust;
- (id)queryCustName:(NSString *)custname;
- (void)insertCustNo:(NSString *)custno andCustName:(NSString *)custname andCustTel:(NSString *)custtel andCustEmail:(NSString *)custemail andCustAddr:(NSString *)custaddr;
- (void)updateCustNo:(NSString *)custno andCustName:(NSString *)custname andCustTel:(NSString *)custtel andCustEmail:(NSString *)custemail andCustAddr:(NSString *)custaddr;
- (void)deleteCustNo:(NSString *)custno;

@end
