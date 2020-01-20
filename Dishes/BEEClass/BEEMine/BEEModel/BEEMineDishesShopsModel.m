//
//  BEEMineDishesShopsModel.m
//  Dishes
//
//  Created by Roddick on 2019/11/28.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import "BEEMineDishesShopsModel.h"

@implementation BEEMineDishesShopsModel

+(NSString *)jsonStringWithNSDictionary:(NSDictionary *)dic
{
    NSError * error ;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString;
    if (!jsonData) {
        NSLog(@"=======error====$%@",error);
    }else{
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    jsonString = [jsonString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    return jsonString ;
}

@end
