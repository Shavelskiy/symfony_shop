<?php

namespace App\Controller;

use App\Entity\Property;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\JsonResponse;


class PropertyController extends AbstractController
{
    /**
     * @Route("/category/properties/", name="categoryProperties", methods={"GET"})
     */
    public function actionGetCategoryProperties(Request $request)
    {
        $repository = $this->getDoctrine()->getManager()->getRepository(Property::class);
        $properties = $repository->findByCategoryId($request->get('id'));

        $result = [];

        $html = "";
        foreach ($properties as $property) {
            $propId = $property->getId();
            $html .= "<div class=\"form-group field-text\">";
            $html .= "<label class=\"col-sm-3 control-label\" for=\"prop-$propId\">" . $property->getName() . "</label>";
            $html .= "<div class='col-sm-9'>";
            $html .= "<input type=\"text\" id=\"prop-$propId\" name=\"products[propertiesValues][$propId]\" class='form-control'>";
            $html .= "</div></div>";
        }

        $result['data'] = $html;
        return new JsonResponse($result);
    }
}