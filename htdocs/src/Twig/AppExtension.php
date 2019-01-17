<?php

namespace App\Twig;

use Twig\Extension\AbstractExtension;
use Twig\TwigFilter;

class AppExtension extends AbstractExtension
{
    public function getFilters()
    {
        return array(
            new TwigFilter('filter_admin_actions', array($this, 'filterActions')),
        );
    }

    public function filterActions(array $itemActions, $item)
    {
        if ($item->getProducts()->isEmpty()) {
            $delete = true;
        } else {
            $delete = false;
        }

        if (!$delete) {
            unset($itemActions['delete']);
        }

        return $itemActions;
    }
}