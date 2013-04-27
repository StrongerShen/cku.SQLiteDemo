//
//  myDB.m
//
//  Created by 志宗 沈 on 12/7/23.
//  Copyright (c) 2012年 MIT. All rights reserved.
//

#import "myDB.h"
#import "FMDatabase.h"

static NSString *kDateTimeFormat = @"yyyy-MM-dd HH:mm:ss";

myDB *sharedInstance;

@implementation myDB


- (void)loadDB
{
    NSURL *appUrl = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    NSString *dbPath = [[appUrl path] stringByAppendingPathComponent:@"mydatabase.sqlite"];
    _db = [FMDatabase databaseWithPath:dbPath];
    
    if (![_db open]) {        
        NSLog(@"Could not open db");        
        return ;        
    }  
}

- (id)init
{
    self = [super init];
    if(self)
    {
        [self loadDB];
    }
    return self;
}

+ (myDB*)sharedInstance
{
    if(sharedInstance == nil)
    {
        sharedInstance = [[myDB alloc] init];        
    }
    return sharedInstance;
}

#pragma mark - added methods

- (id)queryCust
{
    NSMutableArray* items = [NSMutableArray arrayWithCapacity:0];
    
    FMResultSet *rs = [_db executeQuery:@"select cust_no, cust_name, cust_tel, cust_addr, cust_email from cust order by cust_no"];
    
    while ([rs next]) {
        NSString *cust_nox = [rs stringForColumn:@"cust_no"];
        NSString *cust_name = [rs stringForColumn:@"cust_name"];
        NSString *cust_tel = [rs stringForColumn:@"cust_tel"];
        NSString *cust_addr = [rs stringForColumn:@"cust_addr"];
        NSString *cust_email = [rs stringForColumn:@"cust_email"];
        
        [items addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:
                          cust_nox, @"cust_no",
                          cust_name, @"cust_name",
                          cust_tel, @"cust_tel",
                          cust_addr, @"cust_addr",
                          cust_email, @"cust_email",
                          nil ]];
    }
    [rs close];
    return items;
}

- (id)queryCustName:(NSString *)custname
{
    NSMutableArray* items = [NSMutableArray arrayWithCapacity:0];
    
    NSString *query = [NSString stringWithFormat:@"%@%%", custname];
    
    NSString *queryString = [NSString stringWithFormat:@"select cust_no, cust_name, cust_tel, cust_addr, cust_email from cust where cust_name like ? order by cust_no"];
    
    FMResultSet *rs = [_db executeQuery:queryString, query];
    
    while ([rs next]) {
        NSString *cust_no = [rs stringForColumn:@"cust_no"];
        NSString *cust_name = [rs stringForColumn:@"cust_name"];
        NSString *cust_tel = [rs stringForColumn:@"cust_tel"];
        NSString *cust_addr = [rs stringForColumn:@"cust_addr"];
        NSString *cust_email = [rs stringForColumn:@"cust_email"];
        
        [items addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:
                          cust_no, @"cust_no",
                          cust_name, @"cust_name",
                          cust_tel, @"cust_tel",
                          cust_addr, @"cust_addr",
                          cust_email, @"cust_email",
                          nil ]];
    }
    [rs close];
    return items;
}

- (void)insertCustNo:(NSString *)custno andCustName:(NSString *)custname andCustTel:(NSString *)custtel andCustEmail:(NSString *)custemail andCustAddr:(NSString *)custaddr
{
    // 需要加上判斷，如果 custno, custname 沒有輸入，不可以儲存
    if (![_db executeUpdate:@"INSERT INTO cust (cust_no, cust_name, cust_tel, cust_addr, cust_email) VALUES (?,?,?,?,?)",
          custno, custname, custtel, custaddr, custemail ])
    {
        NSLog(@"Could not insert data: %@", [_db lastErrorMessage]);
    }
}

- (void)updateCustNo:(NSString *)custno andCustName:(NSString *)custname andCustTel:(NSString *)custtel andCustEmail:(NSString *)custemail andCustAddr:(NSString *)custaddr
{
    if (![_db executeUpdate:@"UPDATE cust set cust_name=?, cust_tel=?, cust_addr=?, cust_email=? WHERE cust_no=?",
          custname, custtel, custaddr, custemail, custno])
    {
        NSLog(@"Could not update data: %@", [_db lastErrorMessage]);
    }
}

- (void)deleteCustNo:(NSString *)custno
{
    if(![_db executeUpdate:@"delete from cust where cust_no=?", custno])
    {
        NSLog(@"Could not delete data: %@", [_db lastErrorMessage]);
    }
}


@end
