# 整数の配列 nums と、目標となる合計値 target が与えられます。
# nums の要素のうち、足すと target になる2つの数字のインデックス（添字）を配列で返してください。

# 条件：
# ・同じ要素を2回使うことはできません。
# ・答えは必ず1セット存在すると仮定して構いません。
# ・返すインデックスの順序は問いません。

# 入力例：
nums = [2, 7, 11, 15]
target = 9

# 期待する出力： [0, 1] （なぜなら nums[0] + nums[1] = 2 + 7 = 9 だから）



# ==============================================
# My解答
# ❌ 不正解
# ==============================================

# count = nums.length
# result = []

# count.times do |i|
#   count.times do |j|
#     if i == j
#       # 同一要素は使用不可
#       next
#     else
#       if nums[i] + nums[j] == target
#         result << [i, j]
#       end
#     end
#   end
# end

# p result



# ==============================================
# My解答（再チャレンジ）
# ⚠️ 計算量がO(n^2)なので、配列要素数が1,000だと、その2乗の計算量が必要になってしまう
# ==============================================

# count = nums.length

# (0...count).each do |i|
#   ((i+1)...count).each do |j|
#     # puts "i:#{i}, j:#{j}の組み合わせを処理中"
#     if i == j
#       next
#     else
#       if nums[i] + nums[j] == target
#         p [i, j]
#       end
#     end
#   end
# end


# ==============================================
# 模範解答
# 計算量がO(n)になる解答
# ポイント：ハッシュを使う
# ==============================================

def calc(nums, target)
  memo = {}

  nums.each_with_index do |num, i|
    complement = target - num

    if memo.key?(complement)
      return [memo[complement], i]
    end

    memo[num] = i
  end
end

p calc(nums, target)
