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
        $page = $this->ev->get('page')?$this->ev->get('page'):1;
        $search = $this->ev->get('search');
        $u = '';
        if($search)
        {
            foreach($search as $key => $arg)
            {
                $u .= "&search[{$key}]={$arg}";
            }
        }
//        $args[]=array('AND',"system_custom = :system_custom",'system_custom',1);
        if(strlen($search['case_type']))$args[] = array('AND',"case_type = :case_type",'case_type',$search['case_type']);
        if(strlen($search['case_name']))$args[] = array('AND',"case_name LIKE :case_name",'case_name','%'.$search['case_name'].'%');
        if(strlen($search['organ_type']))$args[] = array('AND',"organ_type = :organ_type",'organ_type',$search['organ_type']);

        $cases = $this->sound->getSoundCaseList($page,10,$args);
        $this->tpl->assign('cases',$cases);
        $this->tpl->assign('search',$search);
        $this->tpl->assign('u',$u);
        $this->tpl->assign('page',$page);

        $this->tpl->display('soundcase');
    }

    private function chageState(){
        $state = $this->ev->get("state");
        $sound_case_id = $this->ev->get("sound_case_id");
        if($state=="false") $args['if_use']=0;
        else $args['if_use']=1;
        $this->sound->changeSoundCaseState($args,$sound_case_id);
    }
}

?>