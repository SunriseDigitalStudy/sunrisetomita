<?php
class Bd_Scaffold_Filter_Thread extends Sdx_Scaffold_Filter
{
  public function createFilterForm()
  {
    $form  = new Sdx_Form();
 
    $elem = new Sdx_Form_Element_Text();
    $elem
      ->setName('title');
    $form->setElement($elem);
 
    return $form;
  }
  protected function _selectTitle(Sdx_Db_Select $select, $column, $value, Sdx_Db_Table $table)
  {
    $select->like('title', '%'.$value.'%', $table);
  }
  protected function _selectTagId(Sdx_Db_Select $select, $column, $value, Sdx_Db_Table $table)
  {
    $t_tt = $table->getJoinedTable('ThreadTag');
    $select->add('tag_id', $value, $t_tt);
    $select->having('COUNT(tag_id) = '.count($value));
  }
}
?>
