import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryClassifyingTopoiFoundationCanonicalLaneLean.BridgeLemmas
import HautevilleHouse.CategoryTheoryClassifyingTopoiFoundationCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace CategoryTheoryClassifyingTopoiFoundationCanonicalLaneLean

def ConstrainedClassifyingToposClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_classifying_topos_endgame (A : AdmissibleClass) : ConstrainedClassifyingToposClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CategoryTheoryClassifyingTopoiFoundationCanonicalLaneLean
end HautevilleHouse