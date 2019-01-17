<?php

namespace App\Repository;

use App\Entity\Category;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Symfony\Bridge\Doctrine\RegistryInterface;

/**
 * @method Category|null find($id, $lockMode = null, $lockVersion = null)
 * @method Category|null findOneBy(array $criteria, array $orderBy = null)
 * @method Category[]    findAll()
 * @method Category[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class CategoryRepository extends ServiceEntityRepository
{
    public function __construct(RegistryInterface $registry)
    {
        parent::__construct($registry, Category::class);
    }

    /**
     * @return mixed
     */
    public function findAllActiveRoot()
    {
        return $this->createQueryBuilder('c')
            ->andWhere('c.activity = 1')
            ->andWhere('c.parentCategory is null')
            ->orderBy('c.sort', 'ASC')
            ->getQuery()
            ->getResult();
    }

    /**
     * @return mixed
     */
    public function findAllRoot()
    {
        return $this->createQueryBuilder('c')
            ->andWhere('c.parentCategory is null')
            ->orderBy('c.sort', 'ASC')
            ->getQuery()
            ->getResult();
    }

    /**
     * @return mixed
     */
    public function findAllActive()
    {
        return $this->createQueryBuilder('c')
            ->andWhere('c.activity = 1')
            ->orderBy('c.sort', 'ASC')
            ->getQuery()
            ->getResult();
    }

//    /**
//     * @param $categoryId
//     * @return mixed
//     */
//    public function findChild($category)
//    {
//        return $this->createQueryBuilder('c')
//            ->andWhere('c.activity = 1')
//            ->orderBy('c.sort', 'ASC')
//            ->andWhere('c.parentCategory = :category')
//            ->setParameter('category', $category)
//            ->getQuery()
//            ->getResult();
//    }

    /**
     * @param $categoryId
     * @return mixed
     */
    public function findChild($category)
    {
        return $this->createQueryBuilder('c')
            ->orderBy('c.sort', 'ASC')
            ->andWhere('c.parentCategory = :category')
            ->setParameter('category', $category)
            ->getQuery()
            ->getResult();
    }
}
