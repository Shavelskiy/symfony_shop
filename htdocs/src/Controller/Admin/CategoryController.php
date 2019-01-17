<?php

namespace App\Controller\Admin;

use App\Entity\Category;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AdminController as BaseAdminController;
use App\Entity\Property;

class CategoryController extends BaseAdminController
{
    /**
     * @return Category
     */
    protected function createNewCategoryEntity()
    {
        $category = new Category();
        $category->setActivity(true);
        $category->setSort(500);
        return $category;
    }

    /**
     * @param $entity \App\Entity\Category
     * @throws \Doctrine\ORM\ORMException
     * @throws \Doctrine\ORM\OptimisticLockException
     */
    protected function persistCategoryEntity($entity)
    {
        $this->em->persist($entity);
        $props = $entity->getPropertiesNames();
        foreach ($props['edit']['new'] as $name) {
            if ($name != '') {
                $property = new Property();
                $property->setCategory($entity);
                $property->setName($name);
                $this->em->persist($property);
            }
        }

        $this->em->flush();
    }

    /**
     * Allows applications to modify the entity associated with the item being
     * edited before updating it.
     *
     * @param object $entity
     */
    protected function updateCategoryEntity($entity)
    {
        $propertyRepo = $this->em->getRepository(Property::class);
        $props = $entity->getPropertiesNames();

        foreach($props['edit']['old'] as $id => $name) {
            $property  = $propertyRepo->find($id);
            $property->setName($name);
        }

        foreach ($props['edit']['new'] as $name) {
            if ($name != '') {
                $property = new Property();
                $property->setCategory($entity);
                $property->setName($name);
                $this->em->persist($property);
            }
        }

        $this->em->flush();
    }

    /**
     * Allows applications to modify the entity associated with the item being
     * deleted before removing it.
     *
     * @param object $entity
     */
    protected function removeCategoryEntity($entity)
    {
        $this->em->remove($entity);

        foreach ($entity->getProperties() as $property) {
            $this->em->remove($property);
        }

        $this->em->flush();
    }
}
