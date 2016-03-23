//
//  NJDB.h
//  Sqlite3
//
//  Created by Mr nie on 15/7/22.
//  Copyright (c) 2015年 Mr nie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface NJDB : NSObject
/*!
 *  创建数据库，数据库文件从bundle包拷贝到documents包中
 *
 *  @return 数据库指针
 */
+ (sqlite3 *)openDataBase;

/*!
 *  关闭数据库
 */
+ (void)close;

@end
