//
//  NJDB.m
//  Sqlite3
//
//  Created by Mr nie on 15/7/22.
//  Copyright (c) 2015年 Mr nie. All rights reserved.
//

#import "NJDB.h"
#import <sqlite3.h>

static sqlite3 * dbpoint = nil;// 定义数据库指针对象，只有一个
@implementation NJDB

+ (sqlite3 *)openDataBase
{
    // 如果数据库存在，则不再创建新的对象
    if (dbpoint) {
        return dbpoint;
    }
    //  先将数据库文件从bundle包拷贝到documents包中
    //  只拷贝一次，避免覆盖
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);// 获得文件夹路径
    NSString * path = [paths lastObject];// 获得路径
    path = [NSString stringWithFormat:@"%@/%@",path,@"person.db"];//  创建document文以及路径,表名
    
    NSLog(@"文件路径为:%@", path);
    // 文件管理类NSFileManager
    if (![[NSFileManager defaultManager] fileExistsAtPath:path])//根据文件的路径来判断文件是否存在
    {   // 拷贝,将bundle文件夹的文件内容拷贝到document
        
        NSString * sourcepath = [[NSBundle mainBundle]pathForResource:@"Person" ofType:@"rdb"];// 找到路径(数据库)
        
        [[NSFileManager defaultManager] copyItemAtPath:sourcepath  toPath:path error:NULL];// 拷贝数据库，到path（document）
    }
    // 根据路径打开数据库，并获得数据库只针对象
    
    sqlite3_open([path UTF8String], &dbpoint);
    return dbpoint;
}
// 关闭
+ (void)close
{
    sqlite3_close(dbpoint);
}

@end
