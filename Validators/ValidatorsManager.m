//
//  ValidatorsManager.m
//  Copyright (c) 2013 WeezLabs, Inc. All rights reserved.
//

#import "ValidatorsManager.h"
#import "InputValidator.h"

@implementation ValidatorsManager

- (void)validateWithValidators:(NSArray *)validators error:(NSError *__autoreleasing *)error {
	for (InputValidator *validator in validators) {
		if (![validator validateError:error]) {
			break;
		}
	}
}

@end
