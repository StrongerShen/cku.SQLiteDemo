//
//  MainTableViewController.h
//  SQLiteDemo
//
//  Created by Stronger Shen on 13/4/27.
//  Copyright (c) 2013年 MobileIT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainTableViewController : UITableViewController <UISearchBarDelegate>
{
    UIBarButtonItem *addButton;
    NSMutableArray *custs;
}
@property (strong, nonatomic) IBOutlet UISearchBar *tableSearchBar;

@end
