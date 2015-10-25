//
//  NSString+TXExtension.m
//  BSBDJ
//
//  Created by TimXu on 10/21/15.
//  Copyright © 2015 TimXu. All rights reserved.
//

#import "NSString+TXExtension.h"

@implementation NSString (TXExtension)

- (unsigned long long)fileSize
{
    NSFileManager *mgr = [NSFileManager defaultManager];
    
    BOOL isDirectory = NO;
    
    BOOL exits = [mgr fileExistsAtPath:self isDirectory:&isDirectory];
    
    if (!exits) return 0;
    
    if (isDirectory) {
        unsigned long long fileSize = 0;
        
        NSDirectoryEnumerator *enumerator = [mgr enumeratorAtPath:self];
        for (NSString* subpath in enumerator) {
            NSString *fullPath = [self stringByAppendingPathComponent:subpath];
            fileSize += [mgr attributesOfItemAtPath:fullPath error:nil].fileSize;
        }
        return  fileSize;
    }
    
    return [mgr attributesOfItemAtPath:self error:nil].fileSize;
}
@end
