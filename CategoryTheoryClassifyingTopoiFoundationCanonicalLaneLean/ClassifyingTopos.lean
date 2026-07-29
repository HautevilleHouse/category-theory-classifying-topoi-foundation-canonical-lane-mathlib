import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryClassifyingTopoiFoundationCanonicalLaneLean

structure GeometricMorphism where
  sourceTopos : Type u
  targetTopos : Type v
  inverseImage : Type w
  directImage : Type z
  inverseImagePreservesFiniteLimits : Prop
  directImagePreservesColimits : Prop
  adjunction : Prop

structure GeometricMorphismEvidence (G : GeometricMorphism) where
  inverseImagePreservesFiniteLimitsClosed : G.inverseImagePreservesFiniteLimits
  directImagePreservesColimitsClosed : G.directImagePreservesColimits
  adjunctionClosed : G.adjunction

def GeometricMorphismClosed (G : GeometricMorphism) : Prop :=
  G.inverseImagePreservesFiniteLimits ∧ G.directImagePreservesColimits ∧ G.adjunction

theorem geometric_morphism_closed_from_evidence
    (G : GeometricMorphism) (E : GeometricMorphismEvidence G) :
    GeometricMorphismClosed G := by
  exact And.intro E.inverseImagePreservesFiniteLimitsClosed
    (And.intro E.directImagePreservesColimitsClosed E.adjunctionClosed)

structure ToposStructure where
  underlyingCategory : Type u
  subobjectClassifier : Type v
  powerObjectFunctor : Type w
  finiteLimits : Prop
  subobjectClassifierExists : Prop
  powerObjectExists : Prop

structure ToposEvidence (T : ToposStructure) where
  finiteLimitsClosed : T.finiteLimits
  subobjectClassifierExistsClosed : T.subobjectClassifierExists
  powerObjectExistsClosed : T.powerObjectExists

def ToposClosed (T : ToposStructure) : Prop :=
  T.finiteLimits ∧ T.subobjectClassifierExists ∧ T.powerObjectExists

theorem topos_closed_from_evidence (T : ToposStructure) (E : ToposEvidence T) :
    ToposClosed T := by
  exact And.intro E.finiteLimitsClosed
    (And.intro E.subobjectClassifierExistsClosed E.powerObjectExistsClosed)

structure ClassifyingToposPackage (T : ToposStructure) where
  geometricTheory : Type u
  classifyingTopos : ToposStructure
  universalProperty : Prop
  syntacticConstruction : Prop
  theoryModelEquivalence : Prop
  universalPropertyClosed : universalProperty
  syntacticConstructionClosed : syntacticConstruction
  theoryModelEquivalenceClosed : theoryModelEquivalence
  toposEvidence : ToposEvidence classifyingTopos

structure ClassifyingToposEvidence {T : ToposStructure} (C : ClassifyingToposPackage T) where
  universalPropertyClosed : C.universalProperty
  syntacticConstructionClosed : C.syntacticConstruction
  theoryModelEquivalenceClosed : C.theoryModelEquivalence
  toposClosed : ToposClosed C.classifyingTopos

def ClassifyingToposClosed {T : ToposStructure} (C : ClassifyingToposPackage T) : Prop :=
  C.universalProperty ∧ C.syntacticConstruction ∧ C.theoryModelEquivalence ∧ ToposClosed C.classifyingTopos

theorem classifying_topos_closed_from_evidence
    {T : ToposStructure} (C : ClassifyingToposPackage T) (E : ClassifyingToposEvidence C) :
    ClassifyingToposClosed C := by
  exact And.intro E.universalPropertyClosed
    (And.intro E.syntacticConstructionClosed
      (And.intro E.theoryModelEquivalenceClosed E.toposClosed))

end CategoryTheoryClassifyingTopoiFoundationCanonicalLaneLean
end HautevilleHouse