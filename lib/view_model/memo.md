## 責務について
アプリのUIステートを保持し、画面に表示するデータを変換する役割を持つクラスを管理します。
Repositoryで定義した関数を呼び出し、データを加工し、自身が保持しているuiステートを更新するようにします。
uiステートを更新されればViewが持っているbuild関数が呼ばれて自動的に表示が変わるイメージです。
ViewModelに定義している関数はViewから呼ばれるようにしています。