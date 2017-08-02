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

    private function index(){
        $this->tpl->display("discern");
    }

    private function add(){
        $case_type = $this->ev->get("case_type");
        $this->tpl->assign("caset_type",$case_type);
        $this->tpl->display("discernadd");
    }
}

?>