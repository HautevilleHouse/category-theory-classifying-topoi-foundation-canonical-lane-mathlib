import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryClassifyingTopoiFoundationCanonicalLaneLean

structure ToposAxiomPackage where
  category : Type u
  finiteLimits : Prop
  powerObject : Prop
  subobjectClassifier : Prop
  cartesianClosure : Prop
  grothendieckTopology : Prop

structure ToposAxiomEvidence (T : ToposAxiomPackage) where
  finiteLimitsClosed : T.finiteLimits
  powerObjectClosed : T.powerObject
  subobjectClassifierClosed : T.subobjectClassifier
  cartesianClosureClosed : T.cartesianClosure
  grothendieckTopologyClosed : T.grothendieckTopology

def ToposAxiomClosed (T : ToposAxiomPackage) : Prop :=
  T.finiteLimits ∧ T.powerObject ∧ T.subobjectClassifier ∧ T.cartesianClosure ∧ T.grothendieckTopology

theorem topos_axiom_closed_from_evidence (T : ToposAxiomPackage) (E : ToposAxiomEvidence T) : ToposAxiomClosed T := by
  exact And.intro E.finiteLimitsClosed (And.intro E.powerObjectClosed (And.intro E.subobjectClassifierClosed (And.intro E.cartesianClosureClosed E.grothendieckTopologyClosed)))

end CategoryTheoryClassifyingTopoiFoundationCanonicalLaneLean
end HautevilleHouse