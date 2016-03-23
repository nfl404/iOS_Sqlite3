//
//  AppDelegate.m
//  Sqlite3
//
//  Created by Mr nie on 15/7/22.
//  Copyright (c) 2015年 Mr nie. All rights reserved.
//

#import "AppDelegate.h"
#import "NJDB.h"
#import "NJDateBase.h"
#import "NJPersonModel.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //打开数据库
    [NJDB openDataBase];
    
    //删除数据
    {
//        [NJDateBase deleteAll];
    }
    
    //读取数据
    {
        [NJDateBase selectAll];
        NSLog(@"数据信息为 %@", [NJDateBase selectAll]);
    }
    
    //存储数据
    {
        
        NSMutableArray * arr = [[NSMutableArray alloc] initWithObjects:@{@"name": @"张三", @"age": @"23"}, @{@"name":@"李四", @"age":@"25"},@{@"name": @"张三", @"age": @"23"},@{@"name": @"熊三", @"age": @"43"}, nil];
        
        NSMutableArray *array = [[NSMutableArray alloc] init];
        for (NSDictionary *dic in arr) {
            NJPersonModel *model = [[NJPersonModel alloc] init];
            [model setValuesForKeysWithDictionary:dic];
            [NJDateBase insertWithMesg:model];
            [array addObject:model];
        }
    }
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
