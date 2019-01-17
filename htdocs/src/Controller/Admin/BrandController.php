<?php

namespace App\Controller\Admin;

use App\Entity\Brand;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AdminController as BaseAdminController;

class BrandController extends BaseAdminController
{
    /**
     * @return Brand
     */
    protected function createNewBrandEntity()
    {
        $brand = new Brand();
        $brand->setActivity(true);
        $brand->setSort(500);
        return $brand;
    }
}