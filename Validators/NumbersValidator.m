//
//  NumbersValidator.m
//  Copyright (c) 2013 WeezLabs, Inc. All rights reserved.
//

#import "NumbersValidator.h"

NSString *const kNumbersValidatorRegex = @"[0-9]+";
NSString *const kNumbersValidatorDescription = @"Input validation failed.";
NSString *const kNumbersValidatorReason = @"Please enter a valid decimal value.";
NSString *const kNumbersEmptyValidatorReason = @"This field can not be empty.";

@implementation NumbersValidator

#pragma mark - Initialization

- (id)initWithInput:(NSString *)inputString
			   validatorType:(NumbersValidatorType)validatorType {
	return [self initWithInput:inputString
				 validatorType:validatorType
					  maxValue:nil
					  minValue:nil];
}

- (id)initWithInput:(NSString *)inputString
	  validatorType:(NumbersValidatorType)validatorType
		   maxValue:(NSNumber *)maxValue
		   minValue:(NSNumber *)minValue {
	if (self = [super initWithInput:inputString]) {
		_validatorType = validatorType;
		_maxValue = maxValue;
		_minValue = minValue;
	}
	
	return self;
}

#pragma mark - Overridden methods

- (BOOL)validateError:(NSError *__autoreleasing *)error {
	BOOL validationResult = YES;
	
	if (!self.input || [self.input isEqualToString:@""]) {
		NSDictionary *userInfo = @{ NSLocalizedDescriptionKey:kEmptyValidatorDescription, NSLocalizedFailureReasonErrorKey:kNumbersEmptyValidatorReason };
		*error = [NSError errorWithDomain:kErrorDomain code:1001 userInfo:userInfo];
		validationResult = NO;
	}
	else {
		if (self.validatorType == NumbersValidatorTypeDecimal) {
			NSMutableCharacterSet *notDigits = [[[NSCharacterSet decimalDigitCharacterSet] invertedSet] mutableCopy];
			[notDigits removeCharactersInString:@"."];
			if ([self.input rangeOfCharacterFromSet:notDigits].location != NSNotFound) {
				NSDictionary *userInfo = @{ NSLocalizedDescriptionKey:kNumbersValidatorDescription, NSLocalizedFailureReasonErrorKey:kNumbersValidatorReason };
				*error = [NSError errorWithDomain:kErrorDomain code:1001 userInfo:userInfo];
			}
			validationResult = NO;
		}
		
		if (self.minValue &&
			[self.input doubleValue] < self.minValue.doubleValue) {
			NSDictionary *userInfo = @{ NSLocalizedDescriptionKey:kNumbersValidatorDescription, NSLocalizedFailureReasonErrorKey:self.minValueErrorDescription };
			*error = [NSError errorWithDomain:kErrorDomain code:1001 userInfo:userInfo];
			
			validationResult = NO;
		} else if (self.maxValue &&
				   [self.input doubleValue] > self.maxValue.doubleValue) {
			NSDictionary *userInfo = @{ NSLocalizedDescriptionKey:kNumbersValidatorDescription, NSLocalizedFailureReasonErrorKey:self.maxValueErrorDescription };
			*error = [NSError errorWithDomain:kErrorDomain code:1001 userInfo:userInfo];
			
			validationResult = NO;
		}
	}
	
	return validationResult;
}

#pragma mark - Lazy getters

- (NSString *)maxValueErrorDescription {
	if (!_maxValueErrorDescription) {
		_maxValueErrorDescription = [NSString stringWithFormat:@"Please, enter a value is less than %@", self.maxValue.stringValue];
	}
	
	return _maxValueErrorDescription;
}

- (NSString *)minValueErrorDescription {
	if (!_minValueErrorDescription) {
		_minValueErrorDescription = [NSString stringWithFormat:@"Please, enter a value is greater than %@", self.minValue];
	}
	
	return _minValueErrorDescription;
}

@end
