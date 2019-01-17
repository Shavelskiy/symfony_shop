<?php

namespace App\Controller\Admin;

use App\Entity\Product;
use App\Entity\Property;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AdminController as BaseAdminController;
use App\Entity\PropertyValue;
use Symfony\Component\HttpFoundation\File\UploadedFile;

class ProductController extends BaseAdminController
{
    /**
     * @return Product
     */
    protected function createNewProductsEntity()
    {
        $product = new Product();
        $product->setActivity(true);
        $product->setSort(500);
        return $product;
    }

    /**
     * @var $entity Product
     * @param $entity
     * @throws \Doctrine\ORM\ORMException
     * @throws \Doctrine\ORM\OptimisticLockException
     */
    protected function persistProductsEntity($entity)
    {
        $entity->setPicture($this->savePicture($entity->getPictureFile()));
        $this->em->persist($entity);

        $propertyRepo = $this->em->getRepository(Property::class);
        $props = $entity->getPropertiesValues();

        foreach ($props['edit'] as $propId => $value) {
            if ($value != '') {
                $property = new PropertyValue();
                $property->setProduct($entity);
                $property->setProperty($propertyRepo->find($propId));
                $property->setValue($value);
                $this->em->persist($property);
            }
        }
        $this->em->flush();
    }

    /**
     * Allows applications to modify the entity associated with the item being
     * edited before updating it.
     *
     * @var $entity Product
     * @param object $entity
     */
    protected function updateProductsEntity($entity)
    {
        $picture = $entity->getPictureFile();
        if ($picture) {
            $this->deletePicture($entity->getPicture());
            $entity->setPicture($this->savePicture($entity->getPictureFile()));
        }

        $propertyValuesRepo = $this->em->getRepository(PropertyValue::class);
        $propertyRepo = $this->em->getRepository(Property::class);
        $props = $entity->getPropertiesValues();

        foreach ($props['edit']['old'] as $id => $value) {
            $propertyValue = $propertyValuesRepo->find($id);
            if ($value != '') {
                $propertyValue->setValue($value);
            } else {
                $this->em->remove($propertyValue);
            }
        }

        if (isset($props['edit']['new'])) {
            foreach ($props['edit']['new'] as $id => $value) {
                $property = $propertyRepo->find($id);
                if ($value != '') {
                    $propertyValue = new PropertyValue();
                    $propertyValue->setProduct($entity);
                    $propertyValue->setProperty($property);
                    $propertyValue->setValue($value);
                    $this->em->persist($propertyValue);
                }
            }
        }

        $this->em->flush();
    }

    /**
     * Allows applications to modify the entity associated with the item being
     * deleted before removing it.
     *
     * @var $entity Product
     * @param object $entity
     */
    protected function removeProductsEntity($entity)
    {
        $this->em->remove($entity);

        $this->deletePicture($entity->getPicture());

        foreach ($entity->getProperties() as $property) {
            $this->em->remove($property);
        }

        $this->em->flush();
    }


    /**
     * @param $file UploadedFile
     * @return string
     */
    private function savePicture($file)
    {
        if ($file) {
            $pictureName = time() . '.' . $file->guessExtension();
            $file->move('../../../../data/uploads/products/', $pictureName);
            return $pictureName;
        }
    }

    private function deletePicture($picture)
    {
        if ($picture) {
            unlink("../../../..$picture");
        }
    }
}