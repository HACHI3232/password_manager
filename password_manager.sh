#!/bin/bash

# パスワードファイルの定義
password_file="passwords.txt"

# パスワードマネージャーへようこそメッセージ
echo "パスワードマネージャーへようこそ！"

while true; do
  # メニューの表示と選択肢の入力
  echo "次の選択肢から入力してください(Add Password/Get Password/Exit)："
  read choice

  case "$choice" in
    "Add Password")
      # サービス名、ユーザー名、パスワードの入力
      read -p "サービス名を入力してください： " service_name
      read -p "ユーザー名を入力してください： " username
      read -p "パスワードを入力してください： " password

      # サービス名、ユーザー名、パスワードをファイルに保存
      echo "サービス名:$service_name ユーザー名:$username パスワード:$password" >> "$password_file"
      echo "パスワードの追加は成功しました。"
      ;;
    "Get Password")
      # サービス名の入力
      read -p "サービス名を入力してください： " service_name

      # ファイルから該当する情報を検索して表示
      if grep -q "サービス名:$service_name" "$password_file"; then
        echo "サービス名：$service_name"
        grep "サービス名:$service_name" "$password_file" | sed 's/サービス名://;s/ユーザー名:/ ユーザー名:/;s/パスワード:/ パスワード:/'
      else
        echo "そのサービスは登録されていません。"
      fi
      ;;
    "Exit")
      echo "Thank you!"
      exit 0
      ;;
    *)
      echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
      ;;
  esac
done
