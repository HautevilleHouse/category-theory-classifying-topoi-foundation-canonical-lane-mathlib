import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryClassifyingTopoiFoundationCanonicalLaneLean

structure AdjointFunctor where
  leftFunctor : Type u
  rightFunctor : Type v
  unitTransformation : Type w
  counitTransformation : Type z
  triangleIdentities : Prop
  unitCounitAdjunction : Prop
  triangleIdentitiesClosed : triangleIdentities
  unitCounitAdjunctionClosed : unitCounitAdjunction

structure AdjointFunctorEvidence (A : AdjointFunctor) where
  triangleIdentitiesClosed : A.triangleIdentities
  unitCounitAdjunctionClosed : A.unitCounitAdjunction

def AdjointFunctorClosed (A : AdjointFunctor) : Prop :=
  A.triangleIdentities ∧ A.unitCounitAdjunction

theorem adjoint_functor_closed_from_evidence
    (A : AdjointFunctor) (E : AdjointFunctorEvidence A) :
    AdjointFunctorClosed A := by
  exact And.intro E.triangleIdentitiesClosed E.unitCounitAdjunctionClosed

structure LimitColimitPackage where
  smallCategory : Type u
  limitExists : ∀ (F : Type u → Type v), Prop
  colimitExists : ∀ (F : Type u → Type v), Prop
  universalProperty : Prop
  limitExistsClosed : ∀ (F : Type u → Type v), limitExists F
  colimitExistsClosed : ∀ (F : Type u → Type v), colimitExists F
  universalPropertyClosed : universalProperty

structure LimitColimitEvidence (L : LimitColimitPackage) where
  limitExistsClosed : ∀ (F : Type u → Type v), L.limitExists F
  colimitExistsClosed : ∀ (F : Type u → Type v), L.colimitExists F
  universalPropertyClosed : L.universalProperty

def LimitColimitClosed (L : LimitColimitPackage) : Prop :=
  (∀ (F : Type u → Type v), L.limitExists F) ∧ (∀ (F : Type u → Type v), L.colimitExists F) ∧ L.universalProperty

theorem limit_colimit_closed_from_evidence
    (L : LimitColimitPackage) (E : LimitColimitEvidence L) :
    LimitColimitClosed L := by
  exact And.intro E.limitExistsClosed
    (And.intro E.colimitExistsClosed E.universalPropertyClosed)

structure AdjointFunctorTheoremPackage (L : LimitColimitPackage) where
  leftAdjointPreservesColimits : Prop
  rightAdjointPreservesLimits : Prop
  freydAdjointFunctorTheorem : Prop
  leftAdjointPreservesColimitsClosed : leftAdjointPreservesColimits
  rightAdjointPreservesLimitsClosed : rightAdjointPreservesLimits
  freydAdjointFunctorTheoremClosed : freydAdjointFunctorTheorem
  limitColimitClosed : LimitColimitClosed L

structure AdjointFunctorTheoremEvidence {L : LimitColimitPackage}
    (A : AdjointFunctorTheoremPackage L) where
  leftAdjointPreservesColimitsClosed : A.leftAdjointPreservesColimits
  rightAdjointPreservesLimitsClosed : A.rightAdjointPreservesLimits
  freydAdjointFunctorTheoremClosed : A.freydAdjointFunctorTheorem
  limitColimitClosed : LimitColimitClosed L

def AdjointFunctorTheoremClosed {L : LimitColimitPackage}
    (A : AdjointFunctorTheoremPackage L) : Prop :=
  A.leftAdjointPreservesColimits ∧ A.rightAdjointPreservesLimits ∧
  A.freydAdjointFunctorTheorem ∧ LimitColimitClosed L

theorem adjoint_functor_theorem_closed_from_evidence
    {L : LimitColimitPackage} (A : AdjointFunctorTheoremPackage L)
    (E : AdjointFunctorTheoremEvidence A) : AdjointFunctorTheoremClosed A := by
  exact And.intro E.leftAdjointPreservesColimitsClosed
    (And.intro E.rightAdjointPreservesLimitsClosed
      (And.intro E.freydAdjointFunctorTheoremClosed E.limitColimitClosed))

end CategoryTheoryClassifyingTopoiFoundationCanonicalLaneLean
end HautevilleHouse