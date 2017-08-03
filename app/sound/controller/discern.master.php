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

        $page=$this->ev->post('page');
        if($this->ev->get('insertDiscern')) {
            $args = $this->ev->post('args');
            $discernSound = $this->ev->post('to');
            $discern = $this->sound->getDiscernByNameType($args['discern_name'],$args['organ_type']);
            if ($discern) {
                $errmsg = "该分类下已有 " . $args['discern_name'] . " 套餐";
            }
            if(count($discernSound)==0) $errmsg = "请正确选择鉴别病例声音";
            if ($errmsg) {
                $message = array(
                    'statusCode' => 300,
                    "message" => "{$errmsg}",
                    "navTabId" => "",
                    "rel" => ""
                );
                exit(json_encode($message));
            }


            $search = $this->ev->get('search');
            $u = '';
            if ($search) {
                foreach ($search as $key => $arg) {
                    $u .= "&search[{$key}]={$arg}";
                }
            }
            $discernId = $this->sound->insertDiscern($args);
            $this->sound->addDiscernSound($discernSound, $discernId);
            $message = array(
                'statusCode' => 200,
                "message" => "操作成功",
                "callbackType" => "forward",
                "forwardUrl" => "index.php?sound-master-discern&page={$page}{$this->u}"
            );
            exit(json_encode($message));
        }else{
            $organ_type = $this->ev->get("organ_type");
            $this->tpl->assign("organ_type",$organ_type);
            $this->tpl->display("discernadd");
        }
    }

    private function getCase(){
        $case_type= $this->ev->post("case_type");
        $organ_type= $this->ev->post("organ_type");;
        $case_name = $this->ev->post("case_name");
        if(strlen($case_type))$args[] = array('AND',"case_type = :case_type",'case_type',$case_type);
        if(strlen($organ_type))$args[] = array('AND',"organ_type = :organ_type",'organ_type',$organ_type);
        if(strlen($case_name))$args[] = array('AND',"case_name LIKE :case_name",'case_name','%'.$case_name.'%');
        $caseList = $this->sound->getCaseListByInfo($args);
        foreach ($caseList as $k=>$v){
            $str = "";
            foreach ($v['positions'] as $key=>$value){
                $str.=$value['play_position'].",";
            }
            $caseList[$k]['positions'] = substr($str,0,strlen($str)-1) ;
        }
        exit(json_encode($caseList));
    }
}

?>