<?php

namespace App\Repository;

use App\Entity\Product;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Symfony\Bridge\Doctrine\RegistryInterface;

/**
 * @method Product|null find($id, $lockMode = null, $lockVersion = null)
 * @method Product|null findOneBy(array $criteria, array $orderBy = null)
 * @method Product[]    findAll()
 * @method Product[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ProductRepository extends ServiceEntityRepository
{
    public function __construct(RegistryInterface $registry)
    {
        parent::__construct($registry, Product::class);
    }

    /**
     * @param $count
     * @return mixed
     */
    public function findByCount($count)
    {
        return $this->createQueryBuilder('p')
            ->andWhere('p.activity = 1')
            ->orderBy('p.sort', 'ASC')
            ->setMaxResults($count)
            ->getQuery()
            ->getResult();
    }

    /**
     * @param $code
     * @return mixed
     * @throws \Doctrine\ORM\NonUniqueResultException
     */
    public function findByCode($code)
    {
        return $this->createQueryBuilder('p')
            ->andWhere('p.activity = 1')
            ->andWhere('p.code = :code')
            ->setParameter('code', $code)
            ->getQuery()
            ->getOneOrNullResult();
    }

    /**
     * @param $category
     * @param $filter
     * @param $page
     * @param $limit
     * @return mixed
     */
    public function findByCategory($category, $filter, $page, $limit)
    {
        $query = $this->createQueryBuilder('p')
            ->andWhere('p.activity = 1')
            ->andWhere('p.category = :categoryId')
            ->setParameter('categoryId', $category);

        $stringFilter = "";
        $propCount = 0;

        foreach ($filter as $propertyId => $values) {
            if (!empty($values)) {
                if ($stringFilter !== "") {
                    $stringFilter .= " or ";
                }
                $stringFilter .= "(pv.property=$propertyId and (";
                foreach ($values as $key => $value) {
                    if ($key != 0) {
                        $stringFilter .= " or ";
                    }
                    $stringFilter .= "pv.value='$value'";
                }
                $stringFilter .= '))';
                $propCount++;
            }
        }

        if ($stringFilter !== "") {
            $query->innerJoin('p.properties', 'pv')
                ->andWhere($stringFilter)
                ->groupBy('p.id')
                ->having("count(p.id)=$propCount");
        }

        $countQuery = clone $query;

        $query->setFirstResult(($page - 1) * $limit)
            ->setMaxResults($limit);
        $result = ['products' => $query->getQuery()->getResult()];

        $countQuery->select('count(p.id)')
            ->groupBy('p.id');

        $result['count'] = $countQuery->getQuery()->getScalarResult();
        return $result;
    }

    /**
     * @param $brand
     * @param $page
     * @param $limit
     * @return mixed
     */
    public function findByBrand($brand, $page, $limit)
    {
        $query = $this->createQueryBuilder('p')
            ->andWhere('p.activity = 1')
            ->andWhere('p.brand = :brand')
            ->setParameter('brand', $brand);

        $countQuery = clone $query;

        $query->setFirstResult(($page - 1) * $limit)
            ->setMaxResults($limit);
        $result = ['products' => $query->getQuery()->getResult()];

        $countQuery->select('count(p.id)');

        $result['count'] = $countQuery->getQuery()->getScalarResult();
        return $result;
    }
}
