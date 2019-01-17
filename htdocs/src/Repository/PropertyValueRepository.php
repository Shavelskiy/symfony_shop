<?php

namespace App\Repository;

use App\Entity\PropertyValue;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Symfony\Bridge\Doctrine\RegistryInterface;

/**
 * @method PropertyValue|null find($id, $lockMode = null, $lockVersion = null)
 * @method PropertyValue|null findOneBy(array $criteria, array $orderBy = null)
 * @method PropertyValue[]    findAll()
 * @method PropertyValue[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class PropertyValueRepository extends ServiceEntityRepository
{
    public function __construct(RegistryInterface $registry)
    {
        parent::__construct($registry, PropertyValue::class);
    }

    /**
     * @param $product
     * @return mixed
     */
    public function findProductProperties($product)
    {
        return $this->createQueryBuilder('p')
            ->andWhere('p.product = :product')
            ->setParameter('product', $product)
            ->getQuery()
            ->getResult();
    }

    public function findPropertyValues($property)
    {
        return $this->createQueryBuilder('p')
            ->select('p.value')
            ->andWhere('p.property = :property')
            ->setParameter('property', $property)
            ->groupBy('p.value')
            ->getQuery()
            ->getResult();
    }
}
