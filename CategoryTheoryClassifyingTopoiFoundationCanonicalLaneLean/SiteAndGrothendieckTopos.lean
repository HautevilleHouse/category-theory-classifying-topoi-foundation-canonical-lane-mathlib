import canonicalLaneMathlib.AdmissibleClass

/-!
# Site and Grothendieck Topos Package
-/

namespace HautevilleHouse
namespace CategoryTheoryClassifyingTopoiFoundationCanonicalLaneLean

structure Site (C : Type u) [Category.{v} C] where
  coverage : Coverage C
  coveringFamilies : (J : Sieve C) → Prop
  sievesClosedUnderPullback : Prop
  sievesClosedUnderComposition : Prop
  coverageIsGrothendieck : Prop

structure GrothendieckTopos (E : Type u) [Category.{v} E] where
  isTopos : Prop
  hasFiniteLimits : Prop
  hasColimits : Prop
  giraudAxioms : Prop
  siteOfDefinition : ∃ (C : Type u) [Category.{v} C] (J : GrothendieckTopology C), E ≌ Sheaf J

structure SiteEvidence {C : Type u} [Category.{v} C] (S : Site C) where
  sievesClosedUnderPullbackClosed : S.sievesClosedUnderPullback
  sievesClosedUnderCompositionClosed : S.sievesClosedUnderComposition
  coverageIsGrothendieckClosed : S.coverageIsGrothendieck

def SiteClosed {C : Type u} [Category.{v} C] (S : Site C) : Prop :=
  S.sievesClosedUnderPullback ∧ S.sievesClosedUnderComposition ∧ S.coverageIsGrothendieck

theorem site_closed_from_evidence
    {C : Type u} [Category.{v} C] (S : Site C) (E : SiteEvidence S) : SiteClosed S :=
  And.intro E.sievesClosedUnderPullbackClosed (And.intro E.sievesClosedUnderCompositionClosed E.coverageIsGrothendieckClosed)

structure GrothendieckToposEvidence {E : Type u} [Category.{v} E] (T : GrothendieckTopos E) where
  isToposClosed : T.isTopos
  hasFiniteLimitsClosed : T.hasFiniteLimits
  hasColimitsClosed : T.hasColimits
  giraudAxiomsClosed : T.giraudAxioms

def GrothendieckToposClosed {E : Type u} [Category.{v} E] (T : GrothendieckTopos E) : Prop :=
  T.isTopos ∧ T.hasFiniteLimits ∧ T.hasColimits ∧ T.giraudAxioms

theorem grothendieck_topos_closed_from_evidence
    {E : Type u} [Category.{v} E] (T : GrothendieckTopos E) (E' : GrothendieckToposEvidence T) :
    GrothendieckToposClosed T :=
  And.intro E'.isToposClosed (And.intro E'.hasFiniteLimitsClosed (And.intro E'.hasColimitsClosed E'.giraudAxiomsClosed))

end CategoryTheoryClassifyingTopoiFoundationCanonicalLaneLean
end HautevilleHouse