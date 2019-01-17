<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Cookie;
use App\Entity\Product;

class CartController extends AbstractController
{
    /**
     * @Route("/cart/", name="cart")
     */
    public function actionIndex(Request $request)
    {
        $cart = $request->cookies->get('cart');
        $cart = (array)json_decode($cart);

        $products = [];
        $productsRepo = $this->getDoctrine()->getManager()->getRepository(Product::class);
        foreach ($cart as $productId => $kol) {
            $products[$productId] = $productsRepo->find($productId);
        }

        return $this->render('/cart/index.html.twig', [
            'cart' => $this->getTable($cart)
        ]);
    }

    /**
     * @Route("/cart/add/", name="addToCart", methods={"GET"})
     * @param Request $request
     */
    public function actionAddToCart(Request $request)
    {
        $productId = $request->get('productId');
        $kol = $request->get('kol', 1);

        $cart = $request->cookies->get('cart');

        if ($cart) {
            $cart = (array)json_decode($cart);
            if (isset($cart[$productId])) {
                $cart[$productId] += $kol;
            } else {
                $cart[$productId] = $kol;
            }
        } else {
            $cart = [$productId => $kol];
        }

        $response = new Response();
        $response->headers->clearCookie('cart');
        $response->headers->setCookie(new Cookie('cart', json_encode($cart)));
        $response->send();
        die;
    }

    /**
     * @Route("/cart/remove/", name="removeFromCart", methods={"GET"})
     * @param Request $request
     */
    public function actionRemoveFromCart(Request $request)
    {
        $productId = $request->get('productId');
        $cart = $request->cookies->get('cart');

        if ($cart) {
            $cart = (array)json_decode($cart);
            if (isset($cart[$productId])) {
                unset($cart[$productId]);
            }
        }

        echo $this->getTable($cart);

        $response = new Response();
        $response->headers->clearCookie('cart');
        $response->headers->setCookie(new Cookie('cart', json_encode($cart)));
        $response->send();
        die;
    }

    public function getTable($cart)
    {
        $html = '';
        $products = [];
        $productsRepo = $this->getDoctrine()->getManager()->getRepository(Product::class);
        foreach ($cart as $productId => $kol) {
            $products[$productId] = $productsRepo->find($productId);
        }

        if (count($cart) != 0) {
            $html .= "<h2 class=\"text-left mb-3\">Вы выбрали следующие товары:</h2>
                    <table class=\"table table-bordered\">
                        <thead>
                        <tr>
                            <th scope=\"col\">#</th>
                            <th scope=\"col\">Картинка</th>
                            <th scope=\"col\">Наименование</th>
                            <th scope=\"col\">Артикул</th>
                            <th scope=\"col\">Цена</th>
                            <th scope=\"col\">Количество</th>
                            <th scope=\"col\">Стоимость</th>
                        </tr>
                        </thead>
                        <tbody>";

            $current = 1;
            $sum = 0;
            foreach ($cart as $productId => $kol) {
                $html .= "<tr>";
                $html .= "</tr>";
                $html .= "<th scope=\"row\">$current</th>";
                $html .= "<td class=\"p-0\"><img src=\"" . $products[$productId]->getPicture() . "\" alt=\"" . $products[$productId]->getName() . "\" height=\"70px\"></td>";
                $html .= "<td>" . $products[$productId]->getName() . "</td>";
                $html .= "<td>" . $products[$productId]->getCode() . "</td>";
                $html .= "<td>" . $products[$productId]->getPrice() . "</td>";
                $html .= "<td>" . $kol . "</td>";
                $html .= "<td>" . $products[$productId]->getPrice() * $kol . "</td>";
                $html .= "<td><button type = \"button\" class=\"close remove\" id =\"$productId\">&times;</button></td>";

                $sum += $products[$productId]->getPrice() * $kol;
                $current++;
            }

            $html .= "</tbody>";
            $html .= "</table>";
            $html .= "<p class=\"text-left p-4\">Итого: $sum</p>";
        } else {
            $html = "<h2>Корзина пуста</h2>";
        }

        return $html;
    }
}