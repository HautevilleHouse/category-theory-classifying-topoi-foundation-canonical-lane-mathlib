import canonicalLaneMathlib.CategoryTheory

/-!
# Adjoint Functor Theorems Package
-/

namespace HautevilleHouse
namespace CategoryTheoryClassifyingTopoiFoundationCanonicalLaneLean

structure AdjointFunctorTheoremsPackage (C D : Type u) [Category.{v} C] [Category.{v} D] where
  leftAdjointExists : (F : C ⥤ D) → Prop
  rightAdjointExists : (F : C ⥤ D) → Prop
  freydAdjointFunctorTheorem : Prop
  specialAdjointFunctorTheorem : Prop
  freydAdjointFunctorTheoremClosed : freydAdjointFunctorTheorem
  specialAdjointFunctorTheoremClosed : specialAdjointFunctorTheorem

structure AdjointFunctorTheoremsEvidence {C D : Type u} [Category.{v} C] [Category.{v} D] (A : AdjointFunctorTheoremsPackage C D) where
  freydAdjointFunctorTheoremClosed : A.freydAdjointFunctorTheorem
  specialAdjointFunctorTheoremClosed : A.specialAdjointFunctorTheorem

def AdjointFunctorTheoremsClosed {C D : Type u} [Category.{v} C] [Category.{v} D] (A : AdjointFunctorTheoremsPackage C D) : Prop :=
  A.freydAdjointFunctorTheorem ∧ A.specialAdjointFunctorTheorem

theorem adjoint_functor_theorems_closed_from_evidence {C D : Type u} [Category.{v} C] [Category.{v} D] (A : AdjointFunctorTheoremsPackage C D) (E : AdjointFunctorTheoremsEvidence A) :
    AdjointFunctorTheoremsClosed A := by
  exact And.intro E.freydAdjointFunctorTheoremClosed E.specialAdjointFunctorTheoremClosed

end CategoryTheoryClassifyingTopoiFoundationCanonicalLaneLean
end HautevilleHouse