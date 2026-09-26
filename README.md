# abap cloud enviormentの環境

■実装の構造(package)
・zlyz_rap
・-- zlyz_rap_managed001


■zlyz_rap_managed001：rap managed 参照元
・一つテーブルの操作
・managed
・draftを利用する
・参照元：https://github.com/SAP-samples/abap-platform-rap100/tree/main
・対応front:

■zlyz_rap_managechild：rap managed 子供ある
・managed
・draftを利用する
・参照元：https://github.com/SAP-samples/abap-platform-rap110/tree/main
・対応front:ztravelapp


■zlyz_rap_unmanaged：rap unmanaged 子供ある
・unmanaged
・draftを利用する
・参照元：zlyz_rap_managechild
・対応front:ztravelapp_unmanaged



