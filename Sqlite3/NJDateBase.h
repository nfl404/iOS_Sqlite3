//
//  NJDateBase.h
//  Sqlite3
//
//  Created by Mr nie on 15/7/22.
//  Copyright (c) 2015年 Mr nie. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NJPersonModel;

@interface NJDateBase : NSObject

/*!
 *  储存数据
 *
 *  @param mesg 数据已NJPersonModel类型进行存储
 */
+ (void)insertWithMesg:(NJPersonModel *)mesg;
/*!
 *  删除单个数据
 *
 *  @param mesg 数据对象id
 */
+ (void)deleteWithMesg:(NSInteger)mesg;
/*!
 *  删除所有的数据
 */
+ (void)deleteAll;
/*!
 *  查找单个数据
 *
 *  @param mesg 数据对象id
 *
 *  @return 查找的数据
 */
+ (NSInteger)selectWithMesg:(NSInteger)mesg;
/*!
 *  查找所有数据
 *
 *  @return 返回存储NJPersonModel类型数据的可变数组
 */
+ (NSMutableArray *)selectAll;

@end
