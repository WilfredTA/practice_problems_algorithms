# Problem source: https://leetcode.com/problems/longest-increasing-subsequence/description/

# Given an array of integers, find the longest increasing subsequence

# General: Given an array of integers, find the longest increasing sunsequence from index 0 to N

# Question: How can the longest increasing subsequence from 0 to N be derived from sub problems?

# lis(n) == lis(n-1) + 1 || lis(n-1)

# if n == 0, then single element array -> return 1

# if nums[n-1] < nums[n], then lis(n) == lis(n-1) + 1
# Otherwise, lis(n) == lis(n - 1)


# With new_start
def length_of_lis(nums)
  return 0 if nums.length < 1
  lis(nums, nums.length - 1)
end

def lis(nums, end_idx, new_start = Float::INFINITY)
  if end_idx == 0
    return 1
  end
  
  if nums[end_idx] > nums[end_idx - 1] && new_start > nums[end_idx - 1]
    new_start = nums[end_idx - 1]
    lis(nums, end_idx - 1, new_start) + 1
  else
    lis(nums, end_idx-1, new_start)
  end  
end

p length_of_lis([10, 9, 2, 5, 3, 7, 101, 18]) # Should be 4
p length_of_lis([4,10,4,3,8,9]) # Should be 3


p length_of_lis([1,3,6,7,9,4,10,5,6]) # Returns 5 but should return 6


# Without new_start

def length_of_lis(nums)
  return 0 if nums.length < 1
  lis(nums, nums.length - 1)
end

def lis(nums, end_idx)
  if end_idx < 1
    return 1
  end
  
  if nums[end_idx] > nums[end_idx - 1]
    lis(nums, end_idx - 1) + 1
  else
    lis(nums, end_idx-1)
  end  
end

p length_of_lis([10, 9, 2, 5, 3, 7, 101, 18]) # Should be 4
p length_of_lis([4,10,4,3,8,9]) # Returns 4 should return 3


p length_of_lis([1,3,6,7,9,4,10,5,6]) # Returns 7 but should return 6


# Solved with top down recursion 

def length_of_lis(nums)
  return 0 if nums.length < 1
  lis(nums, nums.length - 1)
end

def lis(nums, end_idx, last_added = Float::INFINITY)
  if end_idx < 0
    return 0
  end
  
  option1 = 0
  current_val = nums[end_idx]
  
  if nums[end_idx] < last_added
    option1 = lis(nums, end_idx - 1, current_val) + 1
  end
   option2 = lis(nums, end_idx-1, last_added)
  
  [option1, option2].max
end

p length_of_lis([10, 9, 2, 5, 3, 7, 101, 18]) # Should be 4
p length_of_lis([4,10,4,3,8,9]) # Returns 4 should return 3


p length_of_lis([1,3,6,7,9,4,10,5,6]) # Returns 7 but should return 6


