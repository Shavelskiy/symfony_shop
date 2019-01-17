<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\CategoryRepository")
 */
class Category
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $name;

    /**
     * @ORM\Column(type="integer")
     */
    private $sort;

    /**
     * @ORM\Column(type="boolean")
     */
    private $activity;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Product", mappedBy="category")
     */
    private $products;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Property", mappedBy="category")
     */
    private $properties;

    private $propertiesNames;

    /**
     * @ORM\Column(type="integer")
     */
    private $level;

    /**
     * @ORM\Column(type="integer")
     */
    private $leftKey;

    /**
     * @ORM\Column(type="integer")
     */
    private $rightKey;

    /**
     * @ORM\Column(type="integer")
     */
    private $root;

    public function __construct()
    {
        $this->properties = new ArrayCollection();
    }

    public function __toString()
    {
        return $this->name;
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): self
    {
        $this->name = $name;

        return $this;
    }

    public function getSort(): ?int
    {
        return $this->sort;
    }

    public function setSort(int $sort): self
    {
        $this->sort = $sort;

        return $this;
    }

    public function getActivity(): ?bool
    {
        return $this->activity;
    }

    public function setActivity(bool $activity): self
    {
        $this->activity = $activity;

        return $this;
    }

    /**
     * @return Collection|Property[]
     */
    public function getProperties(): Collection
    {
        return $this->properties;
    }

    public function getPropertiesNames()
    {
        $result = ['old' => []];
        foreach ($this->properties as $property) {
            $result['old'][$property->getId()] = $property->getName();
        }
        $result['edit'] = $this->propertiesNames;
        return $result;
    }

    public function setPropertiesNames($props)
    {
        $this->propertiesNames = $props;
        return $this;
    }

    /**
     * @return Collection|Property[]
     */
    public function getProducts(): Collection
    {
        return $this->products;
    }

    public function getLevel(): ?int
    {
        return $this->level;
    }

    public function setLevel(int $level): self
    {
        $this->level = $level;

        return $this;
    }

    public function getLeftKey(): ?int
    {
        return $this->leftKey;
    }

    public function setLeftKey(int $leftKey): self
    {
        $this->leftKey = $leftKey;

        return $this;
    }

    public function getRightKey(): ?int
    {
        return $this->rightKey;
    }

    public function setRightKey(int $rightKey): self
    {
        $this->rightKey = $rightKey;

        return $this;
    }

    public function getRoot(): ?int
    {
        return $this->root;
    }

    public function setRoot(int $root): self
    {
        $this->root = $root;

        return $this;
    }
}
