<?php  
class ControllerModuleSidebarmenu extends Controller {
	protected $category_id = 0;
	protected $path = array();

	protected function index() {

		$this->language->load('module/sidebarmenu');

		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->load->model('catalog/category');
		$this->load->model('catalog/sidebarmenu');

    // sbm_class for items (zvyrazneni nekterych polozek), zadat lze nazev kategorie nebo ID
    // parametry nutno nastavit v sidebarmenu.css
    $GLOBALS['sbm_class'] = array();
    // load custom class
    $sbm_custom_class = $this->model_catalog_sidebarmenu->getSBMclass();  
    foreach ($sbm_custom_class AS $key => $value) {
      $GLOBALS['sbm_class'][$key] = $value;
    } // foreach

    // show products count on categories?
    $products_count = false; // false OR true (show products count) 

    // parametr pouzity v headeru pro zobrazeni poctu produktu v hornim menu: $this->config->get('config_product_count') [0/1]
		// vychozi kategorie, '', zobrazit pocty (true/false)
    $data = array(
      'show_count' => false,
      'url'        => false
    );
    if ( !defined('_POCET') ) {
      define ('_POCET', 'pocet'); // definice parametru
    }    
    if ( isset($_REQUEST[_POCET]) OR $products_count ) {
        $data = array(
          'show_count' => true,
          'url'        => '&' . _POCET . '=1'
        );
    } 

		if (isset($this->request->get['path'])) {
			$this->get_path    = $this->request->get['path'];
			$this->path        = explode('_', $this->request->get['path']);			
			$this->category_id = end($this->path);
		} else {
			$this->get_path    = '';
		}

    $sidebarmenu_cache = false; // caching (false || true)

    // CACHE? (is installed XML?)    
    if ( method_exists($this->cache, "get_html") AND $sidebarmenu_cache ) {
      // Yes: cache is activate (in XML)
      $cache_filename = "sidebarmenu.cat" . '.path.' . ( $this->get_path ? $this->get_path : '0' ) . '.sc.' . ( $data['show_count'] ? '1' : '0' );
      $sidebarmenu_categories = $this->cache->get_html($cache_filename);
      if (!$sidebarmenu_categories) {
        $this->data['category'] = $this->getCategories(0, '', $data);
        $this->cache->set_html($cache_filename, $this->data['category']);
      } else {
        $this->data['category'] = $sidebarmenu_categories;     
      }
    } else {
      // No: cache is disabled
      $this->data['category'] = $this->getCategories(0, '', $data);
    }

		//important
		$this->id = 'sidebarmenu';

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/sidebarmenu.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/sidebarmenu.tpl';
		} else {
			$this->template = 'default/template/module/sidebarmenu.tpl';
		}

		$this->render();

  } // index

	protected function getCategories($parent_id, $current_path = '', $data = array() ) {
		static $layer = 0; 
		static $u1    = false; // osetreni pro pripad, ze kategorie nejsou ihned v layer 0 
		$category_id  = array_shift($this->path);

		$output = '';

		$results = $this->model_catalog_category->getCategories($parent_id);

		if ($results) { 
			if ($layer > 0 AND $u1) {
				$output .=  "\n" . '<ul>' . "\n";        
			} else {
				$output .= '<ul id="nav">' . "\n";        
				$u1 = true;
			}
			$layer ++;			
    }
		$isfirst = 0;
       
    foreach ($results as $result) {	
      
      $a_class    = '';
      $classname = '';
      
      if (!$current_path) {
				$new_path = $result['category_id'];
			} else {
				$new_path = $current_path . '_' . $result['category_id'];
			}

      if ( $new_path == $this->get_path ) {
        $a_class .= ' aktivni'; 
      }     

      // ID aktualni kategorie
      if ($this->get_path != '') {
        $aktualni_kategorie = explode('_', $this->get_path);
		    $category_id1 = $aktualni_kategorie[0];
      } else {
        $category_id1 = 0;
      }
      
      // jedna se o otevrenou kategorii ?
      $children  = '';
      if ($category_id1 == $result['category_id']) {
				// zobrazi statickou otevrenou kategorii se sub-category
        $children = $this->getCategories_Children($result['category_id'], $new_path, $data);
        $children_float = false;
      } else {
        // zborazi floating sub-category
        $children = $this->getCategories($result['category_id'], $new_path, $data);
        $children_float = true;
        // odrazka pro sub-category
        if ($children) {$classname .= ' sub_cat';}        
      }

			// oznaceni prvni polozky
			if ($layer > 0) {
				if ($isfirst == 0) {
					$classname .= ' first';
				}
				$isfirst ++;
			}

      $url  = ( $data['url'] ? $data['url'] : '');
      $href = $this->url->link('product/category', 'path=' . $new_path . $url);
     
      if ($this->category_id == $result['category_id']) {
		    $li_class = ' class="onSelectedLi' . $classname . '"'; 
      } else {		    
		    $li_class = ( $classname ? ' class="' . $classname . '"' : "" );
			}

      // zvyrazneni dle nazvu kategorie nebo ID kategorie
      $a_class .= $this->model_catalog_sidebarmenu->is_hightlight_cat($result);

      // ma se zobrazit pocet category ?       
      if ( $data['show_count'] ) {
        $total = ' <em>(' . $this->model_catalog_product->getTotalProducts(array('filter_category_id' => $result['category_id'], 'filter_sub_category' => true)) . ')</em>';
      } else {
        $total = '';
      }

      $output .= '<li' . $li_class . '><a' . ($a_class ? ' class="' . $a_class . '"' : '') . ' href="' . $href . '">' . $result['name'] .$total. '</a>';
      // 'title="' . $result['meta_description'] . '"'
			
      if ($children_float) { 
        $output .= $children;
      }
        
      $output .= '</li>' . "\n"; 
      
      if (!$children_float) { 
        $output .= $children;
      }

    } // foreach

 
		if ($results) {
			$output .= '</ul>' . "\n";
		}

		return $output;
	} // getCategories
  
  protected function getCategories_Children($parent_id, $current_path = '', $data = array() ) {

    $output = '';

    $results = $this->model_catalog_category->getCategories($parent_id);

    if ($results) {
      $output .= "\n" . '<div class="subcat">' . "\n";
    }

    foreach ($results as $result) {
      
      $a_class = '';

      $new_path = $current_path . '_' . $result['category_id'];      
      if ( $new_path == $this->get_path ) {
        $a_class .= ' aktivni';
      }

      // zvyrazneni dle nazvu kategorie nebo ID kategorie
      $a_class .= $this->model_catalog_sidebarmenu->is_hightlight_cat($result);

      $url  = ( $data['url'] ? $data['url'] : '');
      $href = $this->url->link('product/category', 'path=' . $new_path . $url);

      // ma se zobrazit pocet sub-category ?
      if ( $data['show_count'] ) {
        $total = ' <em>(' . $this->model_catalog_product->getTotalProducts(array('filter_category_id' => $result['category_id'], 'filter_sub_category' => true)) . ')</em>';
      } else {
        $total = '';      
      }

      $output .= "\t" . '<div><a' . ($a_class ? ' class="' . $a_class . '"' : '') . ' href="'. $href . '">' . $result['name'] . $total . '</a></div>' . "\n";
      
      // sub-cat 2.level (static)
      $results2 = $this->model_catalog_category->getCategories($result['category_id']);
      if ($results2) {
        foreach ($results2 as $result2) {
          $a_class = '';
          $new_path2 = $new_path . '_' . $result2['category_id'];
          if ( $new_path2 == $this->get_path ) {
            $a_class .= ' aktivni';
          }           
          $href = $this->url->link('product/category', 'path=' . $new_path2 . $url);
          $output .= '<div class="s2"><a' . ($a_class ? ' class="' . $a_class . '"' : '') . ' href="'. $href . '">' . $result2['name'] . '</a></div>';
        }        
      } // if results2      
      
    } // foreach

    if ($results) {
      $output .= '</div>' . "\n";
    }

    return $output;

  } // getCategories_Children
  		
}
?>