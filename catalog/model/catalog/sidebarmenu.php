<?php
class ModelCatalogSidebarmenu extends Model {

	public function getSBMclass() {

    $sbm_custom_class = array(

      // category_name OR category_id => css class

      // MK Premium
      'Botanica'    => 'sbm_common',
      'Fashion'     => 'sbm_common',      
      'India'       => 'sbm_common',
      'Lazio'       => 'sbm_common',
      'Manufactura' => 'sbm_common',
      'Unistone'    => 'sbm_common',
      'Vanity'      => 'sbm_common',
      'Venezia'     => 'sbm_common',
      'Wenge'       => 'sbm_common',
      'Wood'        => 'sbm_common',
      
      // RAKO News 2015
      'Air'        => 'sbm_news',
      'Board'      => 'sbm_news',
      'Brickstone' => 'sbm_news',
      'Fresh'      => 'sbm_news',
      'Grain'      => 'sbm_news',
      'Charme'     => 'sbm_news',
      'Random'     => 'sbm_news',
      'Soft'       => 'sbm_news',
      'Tendence'   => 'sbm_news',
      
      // RAKO Object
      'Color One'         => 'sbm_object',
      'Color Two'         => 'sbm_object',
      'Pool'              => 'sbm_object',
      'Taurus Color'      => 'sbm_object',
      'Taurus Double'     => 'sbm_object',
      'Taurus Granit'     => 'sbm_object',
      'Taurus Industrial' => 'sbm_object',
      'Taurus Porfyr'     => 'sbm_object',

      // TZU - Textilni zkusebni ustav (Nitarna)
      'Pøíze Daniela' => 'sbm_tzu',
      'Pøíze Hela' => 'sbm_tzu',
      'Pøíze Kaèenka' => 'sbm_tzu',
      'Pøíze Kaèka' => 'sbm_tzu',
      'Pøíze Kája' => 'sbm_tzu',
      'Pøíze Katka' => 'sbm_tzu',
      //'Pøíze Lenka' => 'sbm_tzu',
      'Pøíze Nela' => 'sbm_tzu',
      'Pøíze Panda' => 'sbm_tzu',
      'Pøíze Silva' => 'sbm_tzu',
      'Pøíze Snìhurka' => 'sbm_tzu',

    );

		return $sbm_custom_class;

	} // getSBMclass
  
  // overeni polozky, zda ma byt zvyraznena 
  public function is_hightlight_cat($result) {

    $is_hlc = '';

    if ( isset($result['name']) ) {

      $hlc[] = $result['name'];
      if (isset($result['category_id'])) {
        $hlc[] = $result['category_id'];
        $hlc[] = $result['category_id'] . '|' . $result['name'];
      }

      foreach ($hlc as $value) {
        if ( isset($GLOBALS['sbm_class'][$value]) ) {
          $is_hlc .= ' ' . $GLOBALS['sbm_class'][$value];
        }
      } // foreach
      
    } // if

    return $is_hlc;

  } // is_hightlight_cat   

}
?>
