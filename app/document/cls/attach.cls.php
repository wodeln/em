<?php

class attach_document
{
	public $G;

	public function __construct(&$G)
	{
		$this->G = $G;
		$this->pdosql = $this->G->make('pdosql');
		$this->db = $this->G->make('pepdo');
		$this->pg = $this->G->make('pg');
		$this->ev = $this->G->make('ev');
	}

	//按页获取附件列表
	//参数：无
	//返回值：附件列表
	public function getAttachList($args,$page,$number = PN)
	{
		$data = array(
			'select' => false,
			'table' => 'attach',
			'query' => $args,
			'index' => 'attid'
		);
		$r = $this->db->listElements($page,$number,$data);
		return $r;
	}

	//根据ID获取附件信息
	//参数：附件ID
	//返回值：该附件信息数组
	public function getAttachById($attid)
	{
		$data = array(false,'attach',array(array('AND',"attid = :attid",'attid',$attid)));
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetch($sql);
	}

	public function addAttach($args)
	{
		$args['attinputtime'] = TIME;
		$data = array('attach',$args);
		$sql = $this->pdosql->makeInsert($data);
		$this->db->exec($sql);
		return $this->db->lastInsertId();
	}

	//修改附件信息
	//参数：附件ID,要修改的信息
	//返回值：true
	public function modifyAttach($attid,$args)
	{
		$data = array('attach',$args,array(array('AND',"attid = :attid",'attid',$attid)));
		$sql = $this->pdosql->makeUpdate($data);
		$this->db->exec($sql);
		return true;
	}

	//删除附件
	//参数：附件ID
	//返回值：受影响的记录数
	public function delAttach($attid)
	{
		$data = array('attach',array(array('AND',"attid = :attid",'attid',$attid)));
		$sql = $this->pdosql->makeDelete($data);
		$this->db->exec($sql);
		return $this->db->affectedRows();
	}

	public function addAttachtype($args)
	{
		$data = array('attachtype',$args);
		$sql = $this->pdosql->makeInsert($data);
		$this->db->exec($sql);
		return $this->db->lastInsertId();
	}

	public function getAllowAttachExts()
	{
		$exts = array();
		$r = $this->getAttachtypeList();
		foreach($r as $p)
		{
			$tmp = explode(',',$p['attachexts']);
			if(count($tmp))
			{
				foreach($tmp as $tp)
				{
					if($tp)
					$exts[] = $tp;
				}
			}
		}
		return $exts;
	}

	public function getAttachtypeList()
	{
		$data = array(false,'attachtype',1);
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetchAll($sql,'atid');
	}

	public function getAttachtypeByName($attachtype)
	{
		$data = array(false,'attachtype',array(array('AND',"attachtype = :attachtype",'attachtype',$attachtype)));
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetch($sql);
	}

	public function getAttachtypeById($atid)
	{
		$data = array(false,'attachtype',array(array('AND',"atid = :atid",'atid',$atid)));
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetch($sql);
	}

	public function modifyAttachtypeById($args,$atid)
	{
		$data = array('attachtype',$args,array(array('AND',"atid = :atid",'atid',$atid)));
		$sql = $this->pdosql->makeUpdate($data);
		$this->db->exec($sql);
		return true;
	}

	public function delAttachtypeById($atid)
	{
		$data = array('attachtype',array(array('AND',"atid = :atid",'atid',$atid)));
		$sql = $this->pdosql->makeDelete($data);
		$this->db->exec($sql);
		return $this->db->affectedRows();
	}

    /**
	 * 根据课件名称查询课件对象
     * @param $course_name 课件名称
     * @return 课件对象
     */
	public function getCourseByName($course_name,$course_id=null){
		if($course_id==null){
            $data = array(false,'custom_course',array(array('AND',"course_name = :course_name",'course_name',$course_name)));
		}else{
            $data = array(false,'custom_course',
				array(array('AND',"course_name = :course_name",'course_name',$course_name),
                    array('AND',"custom_course_id != :custom_course_id",'custom_course_id',$course_id)

				));
		}

        $sql = $this->pdosql->makeSelect($data);
        return $this->db->fetch($sql);
	}

    /**
	 * 插入课件
     * @param $args 表单数据
     * @return 插入课件的主键ID
     */
	public function insertCourse($args){
        $data = array('custom_course',$args);
        $sql = $this->pdosql->makeInsert($data);
        $this->db->exec($sql);
        return $this->db->lastInsertId();
	}

    /**
	 * 获取自定义课件列表
     * @param $args 搜索条件
     * @param $page 当前页码
     * @param int $number 每页显示数量
     * @return 自定义课件对象list
     */
	public function getCourseList($args,$page,$number = PN){
        $data = array(
            'select' => false,
            'table' => 'custom_course',
            'query' => $args,
            'index' => 'custom_course_id'
        );
        $r = $this->db->listElements($page,$number,$data);
        return $r;
	}

	public function getCourseById($course_id){
        $data = array(false,'custom_course',array(array('AND',"custom_course_id = :custom_course_id",'custom_course_id',$course_id)));
        $sql = $this->pdosql->makeSelect($data);
        return $this->db->fetch($sql);
	}

	public function updateCourse($args,$course_id){
        $data = array('custom_course',$args,array(array('AND',"custom_course_id = :custom_course_id",'custom_course_id',$course_id)));
        $sql = $this->pdosql->makeUpdate($data);
        $this->db->exec($sql);
	}
}

?>
