<?php

/**
 * Created by PhpStorm.
 * User: PVer
 * Date: 2017/7/25
 * Time: 10:59
 */
class action extends app
{

    public function display()
    {
        $action = $this->ev->url(3);
        if (!method_exists($this, $action))
            $action = "index";
        $this->$action();
        exit;
    }

    private function custom()
    {
        $this->tpl->display('custom');
    }

    private function customadd()
    {
        $soundType = $this->ev->get("type");
        if ($this->ev->post('insertCustom')) {
            $args = $this->ev->post('args');
            $args['username'] = $args['mobile'];
            $userbyname = $this->user->getUserByUserName($args['mobile']);
            $userbyemail = $this->user->getUserByEmail($args['useremail']);
            if ($userbyname)
                $errmsg = "这个手机号码已经被注册了";
            if ($userbyemail)
                $errmsg = "这个邮箱已经被注册了";
            if ($errmsg) {
                $message = array(
                    'statusCode' => 300,
                    "message" => "{$errmsg}",
                    "navTabId" => "",
                    "rel" => ""
                );
                exit(json_encode($message));
            }
            $args['userpassword'] = md5("123456");
            $search = $this->ev->get('search');
            $u = '';
            if ($search) {
                foreach ($search as $key => $arg) {
                    $u .= "&search[{$key}]={$arg}";
                }
            }
            $id = $this->user->insertUser($args);
            $message = array(
                'statusCode' => 200,
                "message" => "操作成功",
                "callbackType" => "forward",
                "forwardUrl" => "index.php?user-master-user&page={$page}{$this->u}"
            );
            exit(json_encode($message));
        } else {
            if($soundType==0) $templetName="heartadd";
            if($soundType==1) $templetName="lungadd";
            if($soundType==2) $templetName="bowel";
            $this->tpl->display($templetName);
        }
    }
}

?>