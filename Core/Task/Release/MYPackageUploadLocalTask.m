//
//  MYPackageUploadLocalTask.m
//  Package
//
//  Created by Whirlwind on 16/5/19.
//  Copyright © 2016年 taobao. All rights reserved.
//

#import "MYPackageUploadLocalTask.h"
#import "MYPackageServer.h"

@implementation MYPackageUploadLocalTask

- (NSString *)name {
    return @"上传文件到本地服务器";
}

- (BOOL)launch {
    if (![super launch]) {
        return NO;
    }

    NSError *error;
    if (![MYPackageServer publishLocalFolder:self.config.lipoDir serverPath:self.config.serverPath error:&error]) {
        self.errorMessage = [error localizedDescription];
        return NO;
    }
    return YES;
}

@end
