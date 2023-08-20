require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます
 
puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"
 
memo_type = gets.to_i # ユーザーの入力値を取得し、数字へ変換しています

# if文を使用して続きを作成していきましょう。
# 「memo_type」の値（1 or 2）によって処理を分岐させていきましょう。


if memo_type == 1
    puts "拡張子を除いたファイルを入力してください"
    title = gets.chomp

    puts "メモしたい内容を記入してください"
    puts "完了したらCtrl + Dをおします"
    memo = $stdin.read
    
    CSV.open("#{title}.csv",'w') do |csv|
    csv << ["#{memo}"]
    
    end
elsif memo_type == 2
    puts "編集するファイルを入力してください"
    title = gets.chomp
    
    puts "メモしたい内容を記入してください"
    puts "完了したらCtrl + Dをおします"
    memo = CSV.read("#{title}.csv")
    memo.each do |line|
    puts line
    
    end
    
    add = $stdin.read
    CSV.open("#{title}.csv","a") do |csv|
    csv << ["#{add}"]
    
    end

else 
    puts "終了します"

end    
    