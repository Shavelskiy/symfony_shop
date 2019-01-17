<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\PropertyRepository")
 */
class Property
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
     * @ORM\ManyToOne(targetEntity="App\Entity\Category", inversedBy="proprties")
     */
    private $category;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\PropertyValue", mappedBy="property")
     */
    private $value;

    public function __construct()
    {
        $this->value = new ArrayCollection();
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

    public function getCategory(): ?Category
    {
        return $this->category;
    }

    public function setCategory(?Category $category): self
    {
        $this->category = $category;

        return $this;
    }

    /**
     * @return Collection|PropertyValue[]
     */
    public function getValue(): Collection
    {
        return $this->value;
    }

    public function addValue(PropertyValue $value): self
    {
        if (!$this->value->contains($value)) {
            $this->value[] = $value;
            $value->setProperty($this);
        }

        return $this;
    }

    public function removeValue(PropertyValue $value): self
    {
        if ($this->value->contains($value)) {
            $this->value->removeElement($value);
            // set the owning side to null (unless already changed)
            if ($value->getProperty() === $this) {
                $value->setProperty(null);
            }
        }

        return $this;
    }
}
