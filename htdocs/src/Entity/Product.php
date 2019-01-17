<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\HttpFoundation\File\File;


/**
 * @ORM\Entity(repositoryClass="App\Repository\ProductRepository")
 */
class Product
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
     * @ORM\ManyToOne(targetEntity="App\Entity\Category", inversedBy="products")
     * @ORM\JoinColumn(nullable=false)
     */
    private $category;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $price;

    /**
     * @ORM\Column(type="integer")
     */
    private $sort;

    /**
     * @ORM\Column(type="boolean")
     */
    private $activity;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $picture;

    /**
     * @var File
     */
    private $pictureFile;

    /**
     * @ORM\Column(type="text")
     */
    private $preview_text;

    /**
     * @ORM\Column(type="text")
     */
    private $detail_text;

    /**
     * @ORM\Column(type="integer")
     */
    private $code;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Brand", inversedBy="products")
     * @ORM\JoinColumn(nullable=false)
     */
    private $brand;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\PropertyValue", mappedBy="product")
     */
    private $properties;

    private $propertiesValues;

    public function __construct()
    {
        $this->properties = new ArrayCollection();
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

    public function getCategory(): ?category
    {
        return $this->category;
    }

    public function setCategory(?category $category): self
    {
        $this->category = $category;

        return $this;
    }

    public function getPrice(): ?int
    {
        return $this->price;
    }

    public function setPrice(?int $price): self
    {
        $this->price = $price;

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

    public function setPictureFile($file)
    {
        $this->pictureFile = $file;
        return $this;
    }

    public function getPictureFile()
    {
        return $this->pictureFile;
    }

    public function getPicture()
    {
        if ($this->picture) {
            return '/data/uploads/products/' . $this->picture;
        } else {
            return $this->picture;
        }
    }

    public function setPicture(?string $picture): self
    {
        $this->picture = $picture;

        return $this;
    }

    public function getPreviewText(): ?string
    {
        return $this->preview_text;
    }

    public function setPreviewText(string $preview_text): self
    {
        $this->preview_text = $preview_text;

        return $this;
    }

    public function getDetailText(): ?string
    {
        return $this->detail_text;
    }

    public function setDetailText(string $detail_text): self
    {
        $this->detail_text = $detail_text;

        return $this;
    }

    public function getCode(): ?int
    {
        return $this->code;
    }

    public function setCode(int $code): self
    {
        $this->code = $code;

        return $this;
    }

    public function getBrand(): ?brand
    {
        return $this->brand;
    }

    public function setBrand(?brand $brand): self
    {
        $this->brand = $brand;

        return $this;
    }

    /**
     * @return Collection|PropertyValue[]
     */
    public function getProperties(): Collection
    {
        return $this->properties;
    }

    public function setPropertiesValues($values)
    {
        $this->propertiesValues = $values;
        return $this;
    }

    public function getPropertiesValues()
    {
        $result = ['old' => [], 'new' => []];
        $issetPropValues = [];
        foreach ($this->getProperties() as $property) {
            $issetPropValues[$property->getProperty()->getId()] = [
                'id' => $property->getId(),
                'value' => $property->getValue()
            ];
        }

        if ($this->category) {
            foreach ($this->category->getProperties() as $property) {
                $categoryPropId = $property->getId();
                if (isset($issetPropValues[$categoryPropId])) {
                    $result['old'][$issetPropValues[$categoryPropId]['id']] = [
                        'name' => $property->getName(),
                        'value' => $issetPropValues[$categoryPropId]['value']
                    ];
                } else {
                    $result['new'][$categoryPropId] = $property->getName();
                }
            }
        }

        $result['edit'] = $this->propertiesValues;
        return $result;
    }
}
