@j_win = 0       #ジャンケンの勝敗を格納（1がプレイヤー、2が相手の勝利）

#↓↓↓↓↓↓↓↓↓↓関数メソッド↓↓↓↓↓↓↓↓↓↓
#ジャンケンにて選択した手の表示、勝敗確認を含む
def hands_check(num,e_num)
    check = 0       #あいこでなければ1に書き換え
    while check == 0 do
        case num
        when 1
            puts "あなたの選択した手：グー"
        when 2
            puts "あなたの選択した手：チョキ"
        when 3
            puts "あなたの選択した手：パー"
        when 0
            puts "ゲームを終わります。"
            exit
        end

        #相手の手を表示
        case e_num
        when 1
            e_text = "グー"
        when 2
            e_text = "チョキ"
        when 3
            e_text = "パー"
        end

        puts "相手が選択した手：#{e_text}"

        #あいこの場合は再入力
        if num == e_num
            puts "あいこです。再度手を選択してください。"
            puts "1：グー、2：チョキ、3：パー"
            puts "ゲームを終了する場合、0 を入力してください。"
            num = gets.chomp.to_i
            e_num = rand(1..3).to_i
        else
            check = 1
        end
    end

    #勝敗の確認
    jwin_check(num,e_num)
end

#ジャンケンの勝敗を確認するメソッド
def jwin_check(num,e_num)
    case num
    when 1      #グーを選んだ場合
        case e_num
        when 2      #相手の手がチョキ
            @j_win = 1
        when 3      #相手の手がパー
            @j_win = 2
        end
    when 2      #チョキを選んだ場合
        case e_num
        when 1      #相手の手がグー
            @j_win = 2
        when 3      #相手の手がパー
            @j_win = 1
        end
    when 3      #パーを選んだ場合
        case e_num
        when 1      #相手の手がグー
            @j_win = 1
        when 2      #相手の手がチョキ
            @j_win = 2
        end
    end

    case @j_win
    when 1
        puts "あなたはジャンケンに勝ちました。"
    when 2
        puts "あなたはジャンケンに負けました。"
    end
end

#あっち向いてホイの方向を確認するメソッド
def direction_check(num,e_num)
    check = 0       #入力が正常であれば1に書き換え
    while check == 0 do
        case num
        when 1
            puts "あなたの選択した方向：上"
            check = 1
        when 2
            puts "あなたの選択した方向：右"
            check = 1
        when 3
            puts "あなたの選択した方向：左"
            check = 1
        when 4
            puts "あなたの選択した方向：下"
            check =1
        when 0
            puts "ゲームを終了します。"
            exit
        else
            puts "該当の選択肢はありませんでした。"
            puts "半角数字にて 1：上、2：右、3：左、4：下 の中から選択してください。"
            puts "ゲームをやめる場合には、0 を入力してください。"
            num = gets.chomp.to_i
        end
    end

    case e_num
    when 1
        puts "相手の選択した方向：上"
    when 2
        puts "相手の選択した方向：右"
    when 3
        puts "相手の選択した方向：左"
    when 4
        puts "相手の選択した方向：下"
    end
end
#↑↑↑↑↑↑↑↑↑↑メソッド↑↑↑↑↑↑↑↑↑↑


puts "ジャンケンを開始します。"
puts "ジャンケンの勝敗決定後、あっち向いてホイが行われます。"
puts "尚、入力は半角でお願いいたします。"
puts "■■■■■■■■■■■■"

result = 0         #勝敗を格納（0が勝敗が決定していない状態、1が決定した状態）

while result == 0 do

    puts "あなたの出すジャンケンの手を決定してください。"
    puts "1：グー、2：チョキ、3：パー     ゲームをやめる：0"

    player_hands = gets.chomp.to_i
    enemy_hands = rand(1..3).to_i        #相手の手を1〜3の乱数で決定

    #0123以外の数値の場合、入力をやり直す
    unless player_hands == 0 || player_hands == 1 || player_hands == 2 || player_hands == 3 then
        puts "該当の選択肢はありませんでした。"
        puts "半角数字にて 1：グー、2：チョキ、3：パー の中から選択してください。"
        puts "ゲームを終了する場合、0 を入力してください。"
        player_hands = gets.chomp.to_i
    end

    #入力された値を確認
    hands_check(player_hands,enemy_hands)

    #あっち向いてホイの開始
    puts "あっち向いてホイを開始します。"
    puts "方向を指定してください。"
    puts "1：上、2：右、3：左、4：下     ゲームをやめる：0"
    player_direction = gets.chomp.to_i
    enemy_direction = rand(1..4).to_i

    #入力された値を確認
    direction_check(player_direction,enemy_direction)
    
    #勝敗確認
    if player_direction == enemy_direction
        case @j_win
        when 1
            puts "あなたの勝ちです！"
            result = 1
        when 2
            puts "あなたの負けです！！"
            result = 1
        end
    else
        case @j_win
        when 1
            puts "回避されました。"
        when 2
            puts "回避しました。"
        end

        puts "ジャンケンに戻ります。"
        @j_win = 0
    end
end





