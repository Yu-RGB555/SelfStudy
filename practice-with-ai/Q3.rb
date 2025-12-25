
# ユーザーデータのフィルタリング 以下の「ユーザー情報の配列」があります。
# この中から、「20歳以上」かつ「ステータスが active」のユーザーだけを抽出し、
# その「名前（name）だけの配列」を、「名前のアルファベット順」で返してください。

# 入力データ：
users = [
  { name: "Alice", age: 25, status: "active" },
  { name: "Bob",   age: 17, status: "active" },
  { name: "Charlie", age: 30, status: "inactive" },
  { name: "Dave",  age: 22, status: "active" },
  { name: "Eve",   age: 20, status: "active" },
  { name: "Alex", age: 25, status: "active" }
]

# 期待される出力：
# ["Alice", "Dave", "Eve"]


# ==============================================
# My解答
# eachを使った解答
# ==============================================

# arr = []

# users.each do |user|
#   if user[:age] >= 20 && user[:status] == "active"
#     arr << user[:name]
#   else
#     next
#   end
# end

# p arr.sort_by { |str| -str } ❌・・・String型に対して - は不適切。今回はsort（昇順）で十分。

# === メモ1 ===
# もし、String型に関する昇順/降順を設定する場合、三方比較演算子（<=>）を使う！
# ※ 三方比較演算子（<=>）を使う際は、sort_by ではないので注意！

# p arr.sort { |a, b| b <=> a }


# === メモ2 ===
# Rubyでは、比較演算子は === ではなく、== である



# ==============================================
# My解答(別解)
# メソッドチェーンによる解答
# ==============================================

# p users
#     .select { |user| user[:age] >= 20 && user[:status] == "active" }
#     .map { |user| user[:name] }
#     .sort



# ==============================================
# 別解
# メソッドチェーンによる、より簡潔な解答
# ==============================================

p users
    .filter_map { |user| user[:name] if user[:age] >= 20 && user[:status] == "active" }
    .sort

# === メモ ===
# filter_mapの中で nil または false を返す要素は除外して、新しい配列として作成する