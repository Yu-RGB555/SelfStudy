# 「データに紐づく数値を集計する」問題

# 以下の売上データ（ハッシュの配列）があります。
# これを使用して、「各カテゴリーごとの合計売上金額」を算出し、
# 「金額が大きい順」に並べたハッシュを作成してください。

# 入力データ：
sales_data = [
  { category: "Electronics", amount: 50000 },
  { category: "Books",       amount: 1500 },
  { category: "Electronics", amount: 30000 },
  { category: "Books",       amount: 2500 },
  { category: "Food",        amount: 800 }
]

# 期待する出力データ：
# { "Electronics" => 80000, "Books" => 40000, "Food" => 800 }


# ==============================================
# My解答
# ==============================================

hash = Hash.new(0)

sales_data.each do |data|
  hash[data[:category]] += data[:amount]
end

p hash.sort_by { |category, amount| -amount}.to_h