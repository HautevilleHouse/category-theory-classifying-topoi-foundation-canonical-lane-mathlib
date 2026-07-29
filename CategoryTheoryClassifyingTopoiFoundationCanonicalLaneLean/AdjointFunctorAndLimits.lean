import canonicalLaneMathlib.AdmissibleClass

/-!
# Adjoint Functor and Limit Package
-/

namespace HautevilleHouse
namespace CategoryTheoryClassifyingTopoiFoundationCanonicalLaneLean

structure Adjunction (C : Type u) [Category.{v} C] (D : Type u) [Category.{v} D] where
  leftAdjoint : C ⥤ D
  rightAdjoint : D ⥤ C
  unit : 𝟭 C ⟶ leftAdjoint ⋙ rightAdjoint
  counit : rightAdjoint ⋙ leftAdjoint ⟶ 𝟭 D
  triangleLeft : (leftAdjoint ◁ unit) ≫ (counit ▷ leftAdjoint) = 𝟙 leftAdjoint
  triangleRight : (unit ▷ rightAdjoint) ≫ (rightAdjoint ◁ counit) = 𝟙 rightAdjoint

structure LimitPreserving (F : C ⥤ D) where
  preservesLimits : ∀ (J : Type v) [Category.{v} J] (K : J ⥤ C), PreservesLimit K F
  preservesColimits : ∀ (J : Type v) [Category.{v} J] (K : J ⥤ C), PreservesColimit K F

structure AdjunctionEvidence {C : Type u} [Category.{v} C] {D : Type u} [Category.{v} D] (A : Adjunction C D) where
  triangleLeftClosed : A.triangleLeft
  triangleRightClosed : A.triangleRight

def AdjunctionClosed {C : Type u} [Category.{v} C] {D : Type u} [Category.{v} D] (A : Adjunction C D) : Prop :=
  A.triangleLeft ∧ A.triangleRight

theorem adjunction_closed_from_evidence
    {C : Type u} [Category.{v} C] {D : Type u} [Category.{v} D]
    (A : Adjunction C D) (E : AdjunctionEvidence A) : AdjunctionClosed A :=
  And.intro E.triangleLeftClosed E.triangleRightClosed

structure LimitPreservingEvidence {C : Type u} [Category.{v} C] {D : Type u} [Category.{v} D] (F : C ⥤ D) (L : LimitPreserving F) where
  preservesLimitsClosed : L.preservesLimits
  preservesColimitsClosed : L.preservesColimits

def LimitPreservingClosed {C : Type u} [Category.{v} C] {D : Type u} [Category.{v} D} (F : C ⥤ D) (L : LimitPreserving F) : Prop :=
  L.preservesLimits ∧ L.preservesColimits

theorem limit_preserving_closed_from_evidence
    {C : Type u} [Category.{v} C] {D : Type u} [Category.{v} D} (F : C ⥤ D) (L : LimitPreserving F)
    (E : LimitPreservingEvidence F L) : LimitPreservingClosed F L :=
  And.intro E.preservesLimitsClosed E.preservesColimitsClosed

end CategoryTheoryClassifyingTopoiFoundationCanonicalLaneLean
end HautevilleHouse