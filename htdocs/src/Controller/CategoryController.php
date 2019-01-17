<?php

namespace App\Controller;

use App\Entity\Category;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\JsonResponse;

class CategoryController extends AbstractController
{
    /**
     * @Route("/category/tree", name="categorySelect", methods={"GET"})
     */
    public function actionGetCategoriesSelect(Request $request)
    {
        $repository = $this->getDoctrine()->getManager()->getRepository(Category::class);

        $result = [];

        $html = "";
        foreach ($repository->findAllRoot() as $category) {
            $html .= $this->categoryBlock($category, 0, $repository);
        }

        $result['data'] = $html;
        return new JsonResponse($result);
    }

    private function categoryBlock($category, $level, $repo)
    {
        $name = $category->getName();
        $childCategories = $repo->findChild($category);

        $result = "";
        $space = "";
        for ($i = 0; $i < $level * 2; $i++) {
            $space .= "&nbsp;";
        }

        if ($childCategories) {
            $result = "<option disabled>$name</option>";
            foreach ($childCategories as $category) {
                $result .= $this->categoryBlock($category, $level + 1, $repo);
            }
        } else {
            $value = $category->getId();
            $result .= "<option value='$value'>$name</option>";
        }

        return $result;
    }
}
