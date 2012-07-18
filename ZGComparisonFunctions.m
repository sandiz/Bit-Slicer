/*
 * This file is part of Bit Slicer.
 *
 * Bit Slicer is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 
 * Bit Slicer is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 
 * You should have received a copy of the GNU General Public License
 * along with Bit Slicer.  If not, see <http://www.gnu.org/licenses/>.
 * 
 * Created by Mayur Pawashe on 8/18/10.
 * Copyright 2010 zgcoder. All rights reserved.
 */

#import "ZGComparisonFunctions.h"

BOOL lessThanFunction(ZGSearchArguments *searchArguments, const void *value1, const void *value2, ZGVariableType type, ZGMemorySize size, void *unused)
{
	BOOL isLessThan = NO;
	
	switch (type)
	{
		case ZGPointer:
			if (size == sizeof(int32_t))
			{
				goto INT32_LESS_THAN;
			}
			else if (size == sizeof(int64_t))
			{
				goto INT64_LESS_THAN;
			}
			break;
		case ZGInt8:
			isLessThan = *((int8_t *)value1) < *((int8_t *)value2);
			if (searchArguments->rangeValue && isLessThan)
			{
				isLessThan = *((int8_t *)value1) > *((int8_t *)searchArguments->rangeValue);
			}
			break;
		case ZGInt16:
			isLessThan = *((int16_t *)value1) < *((int16_t *)value2);
			if (searchArguments->rangeValue && isLessThan)
			{
				isLessThan = *((int16_t *)value1) > *((int16_t *)searchArguments->rangeValue);
			}
			break;
		case ZGInt32:
		INT32_LESS_THAN:
			isLessThan = *((int32_t *)value1) < *((int32_t *)value2);
			if (searchArguments->rangeValue && isLessThan)
			{
				isLessThan = *((int32_t *)value1) > *((int32_t *)searchArguments->rangeValue);
			}
			break;
		case ZGInt64:
		INT64_LESS_THAN:
			isLessThan = *((int64_t *)value1) < *((int64_t *)value2);
			if (searchArguments->rangeValue && isLessThan)
			{
				isLessThan = *((int64_t *)value1) > *((int64_t *)searchArguments->rangeValue);
			}
			break;
		case ZGFloat:
			isLessThan = *((float *)value1) < *((float *)value2);
			if (searchArguments->rangeValue && isLessThan)
			{
				isLessThan = *((float *)value1) > *((float *)searchArguments->rangeValue);
			}
			break;
		case ZGDouble:
			isLessThan = *((double *)value1) < *((double *)value2);
			if (searchArguments->rangeValue && isLessThan)
			{
				isLessThan = *((double *)value1) > *((double *)searchArguments->rangeValue);
			}
			break;
		default:
			break;
	}
	
	return isLessThan;
}

BOOL greaterThanFunction(ZGSearchArguments *searchArguments, const void *value1, const void *value2, ZGVariableType type, ZGMemorySize size, void *unused)
{
	BOOL isGreaterThan = NO;
	
	switch (type)
	{
		case ZGPointer:
			if (size == sizeof(int32_t))
			{
				goto INT32_GREATER_THAN;
			}
			else if (size == sizeof(int64_t))
			{
				goto INT64_GREATER_THAN;
			}
			break;
		case ZGInt8:
			isGreaterThan = *((int8_t *)value1) > *((int8_t *)value2);
			if (searchArguments->rangeValue && isGreaterThan)
			{
				isGreaterThan = *((int8_t *)value1) < *((int8_t *)searchArguments->rangeValue);
			}
			break;
		case ZGInt16:
			isGreaterThan = *((int16_t *)value1) > *((int16_t *)value2);
			if (searchArguments->rangeValue && isGreaterThan)
			{
				isGreaterThan = *((int16_t *)value1) < *((int16_t *)searchArguments->rangeValue);
			}
			break;
		case ZGInt32:
		INT32_GREATER_THAN:
			isGreaterThan = *((int32_t *)value1) > *((int32_t *)value2);
			if (searchArguments->rangeValue && isGreaterThan)
			{
				isGreaterThan = *((int32_t *)value1) < *((int32_t *)searchArguments->rangeValue);
			}
			break;
		case ZGInt64:
		INT64_GREATER_THAN:
			isGreaterThan = *((int64_t *)value1) > *((int64_t *)value2);
			if (searchArguments->rangeValue && isGreaterThan)
			{
				isGreaterThan = *((int64_t *)value1) < *((int64_t *)searchArguments->rangeValue);
			}
			break;
		case ZGFloat:
			isGreaterThan = *((float *)value1) > *((float *)value2);
			if (searchArguments->rangeValue && isGreaterThan)
			{
				isGreaterThan = *((float *)value1) < *((float *)searchArguments->rangeValue);
			}
			break;
		case ZGDouble:
			isGreaterThan = *((double *)value1) > *((double *)value2);
			if (searchArguments->rangeValue && isGreaterThan)
			{
				isGreaterThan = *((double *)value1) < *((double *)searchArguments->rangeValue);
			}
			break;
		default:
			break;
	}
	
	return isGreaterThan;
}

BOOL equalFunction(ZGSearchArguments *searchArguments, const void *value1, const void *value2, ZGVariableType type, ZGMemorySize size, void *extraData)
{
	BOOL isEqual = NO;
	
	switch (type)
	{
		case ZGPointer:
			if (size == sizeof(int32_t))
			{
				goto INT32_EQUAL_TO;
			}
			else if (size == sizeof(int64_t))
			{
				goto INT64_EQUAL_TO;
			}
			break;
		case ZGInt8:
			isEqual = *((int8_t *)value1) == *((int8_t *)value2);
			break;
		case ZGInt16:
			isEqual = *((int16_t *)value1) == *((int16_t *)value2);
			break;
		case ZGInt32:
		INT32_EQUAL_TO:
			isEqual = *((int32_t *)value1) == *((int32_t *)value2);
			break;
		case ZGInt64:
		INT64_EQUAL_TO:
			isEqual = *((int64_t *)value1) == *((int64_t *)value2);
			break;
		case ZGFloat:
			isEqual = ABS(*((float *)value1) - *((float *)value2)) <= searchArguments->epsilon;
			break;
		case ZGDouble:
			isEqual = ABS(*((double *)value1) - *((double *)value2)) <= searchArguments->epsilon;
			break;
		case ZGUTF8String:
			// size - 1 to not include for the NULL character,
			// or size to include for the NULL terminator
			if (searchArguments->sensitive)
			{
				isEqual = (memcmp(value1, value2, (size_t)(size - searchArguments->disregardNullTerminator)) == 0);
			}
			else
			{
				isEqual = (strncasecmp(value1, value2, (size_t)(size - searchArguments->disregardNullTerminator)) == 0);
			}
			break;
		case ZGUTF16String:
			if (!searchArguments->disregardNullTerminator)
			{
				size -= sizeof(unichar);
				// Check for the existing null terminator
				if (*((unichar *)(value1 + size)) != 0)
				{
					break;
				}
			}
			
			if (searchArguments->sensitive)
			{
				isEqual = (memcmp(value1, value2, (size_t)size) == 0);
			}
			else
			{
				UCCompareText(*((CollatorRef *)extraData), value1, ((size_t)size) / sizeof(unichar), value2, ((size_t)size) / sizeof(unichar), (Boolean *)&isEqual, NULL);
			}
			break;
		case ZGByteArray:
			if (!extraData)
			{
				isEqual = (memcmp(value1, value2, (size_t)size) == 0);
			}
			else
			{
				unsigned char *byteArrayFlags = extraData;
				const unsigned char *value1Array = value1;
				const unsigned char *value2Array = value2;
				
				isEqual = YES;
				
				unsigned int byteIndex;
				for (byteIndex = 0; byteIndex < size; byteIndex++)
				{
					if (!(byteArrayFlags[byteIndex] & 0xF0) && ((value1Array[byteIndex] & 0xF0) != (value2Array[byteIndex] & 0xF0)))
					{
						isEqual = NO;
						break;
					}
					
					if (!(byteArrayFlags[byteIndex] & 0x0F) && ((value1Array[byteIndex] & 0x0F) != (value2Array[byteIndex] & 0x0F)))
					{
						isEqual = NO;
						break;
					}
				}
			}
			break;
	}
	
	return isEqual;
}

BOOL notEqualFunction(ZGSearchArguments *searchArguments, const void *value1, const void *value2, ZGVariableType type, ZGMemorySize size, void *collator)
{
	return !equalFunction(searchArguments, value1, value2, type, size, collator);
}

BOOL equalPlusFunction(ZGSearchArguments *searchArguments, const void *value1, const void *value2, ZGVariableType type, ZGMemorySize size, void *offset)
{
	switch (type)
	{
		case ZGPointer:
			if (size == sizeof(int32_t))
			{
				goto INT32_EQUAL_TO_PLUS;
			}
			else if (size == sizeof(int64_t))
			{
				goto INT64_EQUAL_TO_PLUS;
			}
			break;
		case ZGInt8:
			{
				int8_t compareValue = *((int8_t *)value2) + *((int8_t *)offset);
				return equalFunction(searchArguments, value1, &compareValue, type, size, NULL);
			}
		case ZGInt16:
			{
				int16_t compareValue = *((int16_t *)value2) + *((int16_t *)offset);
				return equalFunction(searchArguments, value1, &compareValue, type, size, NULL);
			}
		case ZGInt32:
		INT32_EQUAL_TO_PLUS:
			{
				int32_t compareValue = *((int32_t *)value2) + *((int32_t *)offset);
				return equalFunction(searchArguments, value1, &compareValue, type, size, NULL);
			}
		case ZGInt64:
		INT64_EQUAL_TO_PLUS:
			{
				int64_t compareValue = *((int64_t *)value2) + *((int64_t *)offset);
				return equalFunction(searchArguments, value1, &compareValue, type, size, NULL);
			}
		case ZGFloat:
			{
				float compareValue = *((float *)value2) + *((float *)offset);
				return equalFunction(searchArguments, value1, &compareValue, type, size, NULL);
			}
		case ZGDouble:
			{
				double compareValue = *((double *)value2) + *((double *)offset);
				return equalFunction(searchArguments, value1, &compareValue, type, size, NULL);
			}
		default:
			break;
	}
	
	return NO;
}

BOOL notEqualPlusFunction(ZGSearchArguments *searchArguments, const void *value1, const void *value2, ZGVariableType type, ZGMemorySize size, void *offset)
{
    return !equalPlusFunction(searchArguments, value1, value2, type, size, offset);
}
