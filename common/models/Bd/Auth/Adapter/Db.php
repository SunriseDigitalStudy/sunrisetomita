<?php
/**
 * データベースを使うログインに使用します。使わない場合はSdx_Auth_Adapterを継承して下さい。
 **/
class Bd_Auth_Adapter_Db extends Sdx_Auth_Adapter_Db2
{
  /**
   * 入力されたログインID
   * @var string
   */
  private $_login_id;

  /**
   * 生パスワード
   * @var string
   */
  private $_password;

  /**
   * コンストラクタ
   * @param string $login_id 入力されたログインID
   * @param string $password 生パスワード
   */
  public function __construct($login_id, $password)
  {
    $this->_login_id = $login_id;
    $this->_password = $password;
  } 

  /**
   * アカウントのデータを検索して返す
   * この段階ではまだパスワードチェックはしません。
   * @return boolean|mixed
   */
  protected function _find()
  {
    throw new Sdx_Exception('This method is generated by enable-acl script. Please implement this method.');
  }

  /**
   * パスワードが一致しているか検証する
   * @param mixed $account
   * @return bool|array セッションの保持されてSdx_Userから取得可能になります。例：array('login_id'=>'xxxx', 'role'=>'xxx')
   */
  protected function _auth($account)
  {
    throw new Sdx_Exception('This method is generated by enable-acl script. Please implement this method.');
  }

}