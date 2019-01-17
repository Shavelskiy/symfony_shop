<?php

namespace App\Controller;

use App\Entity\Brand;
use App\Entity\Category;
use App\Entity\Product;
use App\Entity\Property;
use App\Entity\PropertyValue;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;

class ProductController extends AbstractController
{
    const TOP_COUNT = 5;

    /**
     * @Route("/products/", name="products")
     */
    public function actionIndex()
    {
        $em = $this->getDoctrine()->getManager();

        $categories = $em->getRepository(Category::class)->findAllActiveRoot();
        $brands = $em->getRepository(Brand::class)->findAllActive();

        return $this->render('/products/index.html.twig', [
            'categories' => $categories,
            'brands' => $brands
        ]);
    }

    /**
     * @Route("/products/{code}", name="productDetail")
     * @param $code int
     * @return \Symfony\Component\HttpFoundation\Response
     */
    public function actionDetail($code)
    {
        $em = $this->getDoctrine()->getManager();

        $categories = $em->getRepository(Category::class)->findAllActive();
        $product = $em->getRepository(Product::class)->findByCode($code);
        $properties = $em->getRepository(PropertyValue::class)->findProductProperties($product);

        return $this->render('/products/detail.html.twig', [
            'categories' => $categories,
            'currentCategory' => $product->getCategory(),
            'product' => $product,
            'properties' => $properties
        ]);
    }

    /**
     * @Route("/category/{categoryId}", name="categoryProducts", methods={"GET"})
     * @param Request $request
     * @param $categoryId
     * @return \Symfony\Component\HttpFoundation\Response
     */
    public function actionCategory(Request $request, $categoryId)
    {
        $em = $this->getDoctrine()->getManager();
        $productRepo = $em->getRepository(Product::class);
        $categoryRepo = $em->getRepository(Category::class);
        $propertyRepo = $em->getRepository(Property::class);
        $propertyValuesRepo = $em->getRepository(PropertyValue::class);

        $category = $categoryRepo->find($categoryId);
        $childCategories = $categoryRepo->findChild($category);
        if ($childCategories) {
            return $this->render('/products/childCategory.html.twig', [
                'categories' => $childCategories,
                'title' => $category->getName()
            ]);
        } else {
            $page = $request->get('page', 1);
            $inputFilter = $request->get('properties');

            $properties = [];
            $filter = [];
            foreach ($propertyRepo->findByCategoryId($categoryId) as $property) {
                $propId = $property->getId();
                $filter[$propId] = [];
                $properties[$propId]['name'] = $property->getName();
                foreach ($propertyValuesRepo->findPropertyValues($property) as $value) {
                    $properties[$propId]['values'][] = $value['value'];
                }
            }

            if ($inputFilter) {
                foreach ($inputFilter as $propId => $values) {
                    foreach ($values as $value => $on) {
                        $filter[$propId][] = $value;
                    }
                }
            }

            $categories = $categoryRepo->findAllActiveRoot();
            $currentCategory = $categoryRepo->find($categoryId);

            $products = $productRepo->findByCategory($currentCategory, $filter, $page, self::TOP_COUNT);

            return $this->render('/products/category.html.twig', [
                'categories' => $categories,
                'properties' => $properties,
                'currentCategory' => $currentCategory,
                'products' => $products['products'],
                'page' => $page,
                'filter' => $filter,
                'inputFilter' => $inputFilter,
                'pageCount' => ceil(count($products['count']) / self::TOP_COUNT)
            ]);
        }
    }

    /**
     * @Route("/brand/{brandId}", name="brandProducts", methods={"GET"})
     * @param Request $request
     * @param $brandId
     * @return \Symfony\Component\HttpFoundation\Response
     */
    public function actionBrand(Request $request, $brandId)
    {
        $page = $request->get('page', 1);

        $em = $this->getDoctrine()->getManager();
        $productRepo = $em->getRepository(Product::class);
        $brandsRepo = $em->getRepository(Brand::class);
        $categoryRepo = $em->getRepository(Category::class);

        $categories = $categoryRepo->findAllActiveRoot();
        $brand = $brandsRepo->find($brandId);

        $products = $productRepo->findByBrand($brand, $page, self::TOP_COUNT);

        return $this->render('/products/brand.html.twig', [
            'categories' => $categories,
            'brand' => $brand,
            'products' => $products['products'],
            'page' => $page,
            'pageCount' => ceil(count($products['count']) / self::TOP_COUNT)
        ]);
    }
}
