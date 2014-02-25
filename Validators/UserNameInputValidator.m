//
//  UserNameInputValidator.m
//  Copyright (c) 2013 WeezLabs, Inc. All rights reserved.
//

#import "UserNameInputValidator.h"

NSString *const kUserNameValidatorRegex = @"[A-Z0-9a-z._%+-]{1,50}";
NSString *const kUserNameValidatorDescription = @"Input validation failed.";
NSString *const kUserNameValidatorReason = @"Username must be under 50 characters, with no spaces.";
NSString *const kEmptyUserNameValidatorReason = @"Username must be provided.";

@implementation UserNameInputValidator

- (BOOL)validateError:(NSError *__autoreleasing *)error {
	if([self.input isEqualToString:@""])
	{
		NSDictionary *userInfo = @{NSLocalizedDescriptionKey:kEmptyValidatorDescription,NSLocalizedFailureReasonErrorKey:kEmptyUserNameValidatorReason};
		*error = [NSError errorWithDomain:kErrorDomain code:1001 userInfo:userInfo];
		return NO;
	}
	NSError *regError = nil;
	NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:kUserNameValidatorRegex options:NSRegularExpressionAnchorsMatchLines error:&regError];
	NSUInteger numberOfMatches = [regex numberOfMatchesInString:self.input options:NSMatchingAnchored range:NSMakeRange(0, [self.input length])];
	// if there is not a single match
	// then return an error and NO
	if (numberOfMatches != 1) {
		if (error != nil) {
			NSDictionary *userInfo = @{NSLocalizedDescriptionKey: kUserNameValidatorDescription,NSLocalizedFailureReasonErrorKey: kUserNameValidatorReason};
			*error = [NSError errorWithDomain:kErrorDomain code:1001 userInfo:userInfo];
		}
		return NO;
	}
	return YES;
}

@end
