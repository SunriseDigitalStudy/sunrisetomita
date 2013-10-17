<?php
class Bd_Controller_Plugin_AutoLogin extends Sdx_Controller_Plugin_AutoLogin
{
  /**
  *
  * @return Zend_Auth_Adapter_Interface
  * @param string $cookie
  */
  protected function _getAutoLoginAdapter($token)
  {
    return new Bd_Auth_Adapter_DbAutoLogin($token);
  }
  
  /**
   * ログアウト時に呼ばれます。保存した$tokenの掃除に使って下さい。
   * @param Sdx_User $user
   * @param string $token
   */
  protected function _preClearCookie(Sdx_User $user, $token)
  {
    throw new Sdx_Exception('This method is generated by enable-acl script. Please implement this method.');
  }
  
  /**
   * $tokenとアカウントを関連付けて保存します。
   * @param Sdx_User $user
   * @param string $token
   */
  protected function _saveAutoLoginId(Sdx_User $user, $token)
  {
    throw new Sdx_Exception('This method is generated by enable-acl script. Please implement this method.');
  }
}