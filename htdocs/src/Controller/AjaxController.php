<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\JsonResponse;
use App\Entity\Category;
use App\Entity\Brand;


class AjaxController extends AbstractController
{
    /**
     * @Route("/has/", name="hasProducts", methods={"GET"})
     * @param Request $request
     * @return JsonResponse
     */
    public function actionHasProducts(Request $request)
    {
        $em = $this->getDoctrine()->getManager();

        if ($request->query->has('categoryId')) {
            $id = $request->get('categoryId');
            $repo = $em->getRepository(Category::class);
        } else if ($request->query->has('brandId')) {
            $id = $request->get('brandId');
            $repo = $em->getRepository(Brand::class);
        } else {
            return new JsonResponse(['status' => 'fail']);
        }

        $entity = $repo->find($id);

        if ($entity->getProducts()->isEmpty()) {
            $delete = true;
        } else {
            $delete = false;
        }

        return new JsonResponse([
            'status' => 'success',
            'delete' => $delete
        ]);
    }
}
