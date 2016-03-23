//
//  NJDateBase.m
//  Sqlite3
//
//  Created by Mr nie on 15/7/22.
//  Copyright (c) 2015年 Mr nie. All rights reserved.
//

#import "NJDateBase.h"
#import "NJDB.h"
#import "NJPersonModel.h"


@implementation NJDateBase

// 数据库表的结构要在bundle里面修改，改完之后能传给新的 document

// 增删改查
// 添加
+ (void)insertWithMesg:(NJPersonModel *)mesg
{
    //1. 获得数据库指针对象
    sqlite3 * db = [NJDB openDataBase];
    //2. 书写数据库语句
    NSString * str = [NSString stringWithFormat:@"insert into person(name, age) values('%@',%ld)",mesg.name, mesg.age];
    //3. 执行数据库语句
    int result = sqlite3_exec(db, [str UTF8String], NULL, NULL, NULL);
    
    if (result == SQLITE_OK)
    {
        NSLog(@"插入成功");
    }else {
        NSLog(@"插入失败");
    }
}
//  删除个体
+ (void)deleteWithMesg:(NSInteger)mesg
{
    sqlite3 * db = [NJDB openDataBase];
    NSString * str = [NSString stringWithFormat:@"delete from person where id = %d",(int)mesg];
    int result = sqlite3_exec(db, [str UTF8String], NULL, NULL, NULL);
    
    if (result == SQLITE_OK) {
        NSLog(@"删除个体成功");
    }else{
        NSLog(@"删除个体失败");
    }
    
}

// 删除所有
+ (void)deleteAll
{
    sqlite3 * db = [NJDB openDataBase];
    NSString * str = [NSString stringWithFormat:@"delete from person"];
    int result = sqlite3_exec(db, [str UTF8String], NULL, NULL, NULL);
    
    if (result == SQLITE_OK) {
        NSLog(@"删除所有数据成功");
    }else{
        NSLog(@"删除所有数据失败");
    }
}

// 查询个体
+ (NSInteger)selectWithMesg:(NSInteger)mesg
{
    // 获得数据库指针
    sqlite3 * db = [NJDB openDataBase];
    
    // 制作 sqlite 替身
    sqlite3_stmt * stmt = nil;
    /* 类似于拷贝，操作不会影响数据库,在替身里面操作 */
    
    // 数据库语句
    NSString * str = [NSString stringWithFormat:@"select * from person where id = %d",(int)mesg];// 查询所有
    // 根据数据库语句，把从db中查询到的内容赋值给替身
    int result = sqlite3_prepare_v2(db, [str UTF8String], -1, &stmt, NULL);
    
    if (result == SQLITE_OK) {
        // 根据stmt中的内容一条一条获取里面的数据
        if (sqlite3_step(stmt) == SQLITE_ROW) {
            // 把每一条数据的每一个列取出来
            int imageid = sqlite3_column_int(stmt, 0);
            // 清除替身
            sqlite3_finalize(stmt);
            
            NSLog(@"查询消息为%d", result);
            return imageid;
        }
    }
    NSLog(@"没有查询的消息");
    // 查不到返回nil
    return 0;
}

+ (NSMutableArray *)selectAll
{
    sqlite3 *dbPoint  = [NJDB openDataBase];
    sqlite3_stmt *stmt = nil;
    int result = sqlite3_prepare_v2(dbPoint, "select * from person", -1, &stmt, NULL);
    if (SQLITE_OK == result) {

        // 查找所有的数据
        // 所有在while循环中的数据都是符合搜索条件的
        // 在循环体中获取每一条数据的值
        
        NSMutableArray *arr = [NSMutableArray array];
        while (SQLITE_ROW == sqlite3_step(stmt)) {
            
            
            int age = sqlite3_column_int(stmt, 0);
            
            const unsigned char *name = sqlite3_column_text(stmt, 1);
            NSString *nameStr = [NSString stringWithUTF8String:(const char *)name];
            
//            图片存储路径
//            const unsigned char *leftImagePath = sqlite3_column_text(stmt, 3);
//            NSString *leftImagePathStr = [NSString stringWithUTF8String:(const char *)leftImagePath];
            
            NJPersonModel *model = [[NJPersonModel alloc] init];
            model.age = age;
            model.name = nameStr;
            [arr addObject:model];
        }
        
        sqlite3_finalize(stmt);
        // 将装满 model对象/字典的 数组返回
        return arr;
    }
    return [NSMutableArray array];
    
}
@end
