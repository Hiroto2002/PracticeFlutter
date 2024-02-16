## 責務について
アプリの型定義のクラスを管理します。
あと、model配下にuiフォルダを切って、UIの状態を表すuiステートのモデルを格納しています。
Viewはこのuiステートを監視して、表示を切り替えるような設計思想です。

### todo
イミュータブルな思想のため、freezedを使用しています。
freezedで自動生成されたファイルも格納されています。

