def make_diagonal_lines
  # 斜めの2列を二次元配列にするために、空の配列を2つ代入
  diagonal_lines = [[], []]
  $bingo_card.each_with_index do |row, i|
    # 左上から右下に伸びる列の配列を作成
    diagonal_lines[0].push(row[i])
    # 左下から右上に伸びる列の配列を作成
    diagonal_lines[1].push(row[- i - 1])
  end
  return diagonal_lines
end

def bingo?(lines)
  lines.each do |line|
    # ビンゴカードの中に同一の単語は存在しないので、配列（line）の値が1種類(nilのみ)であればビンゴと判定出来るため、下記のように実装
    if line.uniq.length == 1
      return true
      break
    end
  end
  return false
end

def bingo_horizontal?
  horizontal_lines = $bingo_card
  bingo?(horizontal_lines)
end

def bingo_vertical?
  vertical_lines = $bingo_card.transpose
  bingo?(vertical_lines)
end

def bingo_diagonal?
  diagonal_lines = make_diagonal_lines
  bingo?(diagonal_lines)
end

# ビンゴカードを二次元配列にするために、空の配列を代入
$bingo_card = []
line_count = gets.chomp.to_i

line_count.times do |i|
  $bingo_card.push(gets.chomp.split(" "))
end

word_count = gets.chomp.to_i
 
word_count.times do |i|
  word = gets.chomp
  # 選ばれた単語がビンゴカードに含まれていたら、単語の代わりにnilを代入
  $bingo_card.each do |row|
    row[row.index(word)] = nil if row.include?(word)
  end
end

if bingo_horizontal? || bingo_vertical? || bingo_diagonal?
  puts "yes"
else
  puts "no"
end
