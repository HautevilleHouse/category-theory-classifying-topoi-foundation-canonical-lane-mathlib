import canonicalLaneMathlib.AdmissibleClass

/-!
# Yoneda Lemma and Sheaf Condition Package
-/

namespace HautevilleHouse
namespace CategoryTheoryClassifyingTopoiFoundationCanonicalLaneLean

structure YonedaEmbedding (C : Type u) [Category.{v} C] where
  yonedaFunctor : C ⥤ Presheaf C
  isFullyFaithful : Prop
  yonedaLemma : ∀ (X : C) (F : Presheaf C), (yonedaFunctor.obj X ⟶ F) ≅ F.obj X
  yonedaLemmaNatural : Prop

structure SheafCondition {C : Type u} [Category.{v} C] (F : Presheaf C) (J : GrothendieckTopology C) where
  sheafCondition : ∀ (X : C) (S : Sieve X) (hS : S ∈ J X), compatible F S → (∃! s : F.obj X, ...)
  isSheaf : Prop

structure YonedaEvidence {C : Type u} [Category.{v} C] (Y : YonedaEmbedding C) where
  isFullyFaithfulClosed : Y.isFullyFaithful
  yonedaLemmaNaturalClosed : Y.yonedaLemmaNatural

def YonedaClosed {C : Type u} [Category.{v} C] (Y : YonedaEmbedding C) : Prop :=
  Y.isFullyFaithful ∧ Y.yonedaLemmaNatural

theorem yoneda_closed_from_evidence
    {C : Type u} [Category.{v} C] (Y : YonedaEmbedding C) (E : YonedaEvidence Y) : YonedaClosed Y :=
  And.intro E.isFullyFaithfulClosed E.yonedaLemmaNaturalClosed

structure SheafConditionEvidence {C : Type u} [Category.{v} C] {F : Presheaf C} {J : GrothendieckTopology C} (S : SheafCondition F J) where
  isSheafClosed : S.isSheaf

def SheafConditionClosed {C : Type u} [Category.{v} C] {F : Presheaf C} {J : GrothendieckTopology C} (S : SheafCondition F J) : Prop :=
  S.isSheaf

theorem sheaf_condition_closed_from_evidence
    {C : Type u} [Category.{v} C] {F : Presheaf C} {J : GrothendieckTopology C}
    (S : SheafCondition F J) (E : SheafConditionEvidence S) : SheafConditionClosed S :=
  E.isSheafClosed

end CategoryTheoryClassifyingTopoiFoundationCanonicalLaneLean
end HautevilleHouse