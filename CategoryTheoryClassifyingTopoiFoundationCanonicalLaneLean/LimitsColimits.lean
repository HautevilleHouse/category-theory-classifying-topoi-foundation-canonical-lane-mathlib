import CategoryTheoryClassifyingTopoiFoundationCanonicalLaneLean.AdmissibleClass
import Mathlib.CategoryTheory.Limits.Types

namespace HautevilleHouse
namespace CategoryTheoryClassifyingTopoiFoundationCanonicalLaneLean

structure LimitsColimitsPackage where
  category : Type u
  [Category : CategoryTheory.Category category]
  smallLimitsExist : Prop
  smallColimitsExist : Prop
  exactnessProperties : Prop

def LimitsColimitsClosed (L : LimitsColimitsPackage) : Prop :=
  L.smallLimitsExist ∧ L.smallColimitsExist ∧ L.exactnessProperties

theorem limits_colimits_bridge (L : LimitsColimitsPackage) (h : LimitsColimitsClosed L) : bridgeClosed (AdmissibleClass.mk (ToposAdmittedObject.mk ??)) := by
  sorry

end CategoryTheoryClassifyingTopoiFoundationCanonicalLaneLean
end HautevilleHouse