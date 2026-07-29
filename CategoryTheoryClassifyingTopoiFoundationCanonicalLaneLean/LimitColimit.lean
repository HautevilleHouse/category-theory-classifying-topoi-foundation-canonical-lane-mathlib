import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryClassifyingTopoiFoundationCanonicalLaneLean

structure LimitColimitPackage where
  diagram : Type u
  cone : Type v
  cocone : Type w
  limitExists : Prop
  colimitExists : Prop
  universalProperty : Prop

structure LimitColimitEvidence (L : LimitColimitPackage) where
  limitExistsClosed : L.limitExists
  colimitExistsClosed : L.colimitExists
  universalPropertyClosed : L.universalProperty

def LimitColimitClosed (L : LimitColimitPackage) : Prop :=
  L.limitExists ∧ L.colimitExists ∧ L.universalProperty

theorem limit_colimit_closed_from_evidence (L : LimitColimitPackage) (E : LimitColimitEvidence L) : LimitColimitClosed L := by
  exact And.intro E.limitExistsClosed (And.intro E.colimitExistsClosed E.universalPropertyClosed)

end CategoryTheoryClassifyingTopoiFoundationCanonicalLaneLean
end HautevilleHouse