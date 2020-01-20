//
//  BEEHelpTool.m
//  Dishes
//
//  Created by Roddick on 2019/12/2.
//  Copyright © 2019 Roddick. All rights reserved.
//

#import "BEEHelpTool.h"

@implementation BEEHelpTool
+ (NSArray *)arrayWithJson:(NSString *)jsonPath {
    NSURL *url   = [[NSBundle mainBundle] URLForResource:jsonPath withExtension:@"json"];
    NSData *data = [NSData dataWithContentsOfURL:url];
    if (!data) {
        return @[];
    }
    NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    return array;
}
@end
