import canonicalLaneMathlib.AdmissibleClass
import Mathlib.CategoryTheory.Sites.Giraud

namespace HautevilleHouse
namespace CategoryTheoryClassifyingTopoiFoundationCanonicalLaneLean

structure GiraudTheoremPackage (C : Type u) [CategoryTheory.Category.{v} C] where
  site : CategoryTheory.GrothendieckTopology C
  sheafCategory : Type (max u v)
  exactnessProperties : Prop
  limitColimitCompatibility : Prop
  generatingSet : Prop

structure GiraudTheoremEvidence {C : Type u} [CategoryTheory.Category.{v} C] (G : GiraudTheoremPackage C) where
  exactnessPropertiesClosed : G.exactnessProperties
  limitColimitCompatibilityClosed : G.limitColimitCompatibility
  generatingSetClosed : G.generatingSet

def GiraudTheoremClosed {C : Type u} [CategoryTheory.Category.{v} C] (G : GiraudTheoremPackage C) : Prop :=
  G.exactnessProperties ∧ G.limitColimitCompatibility ∧ G.generatingSet

theorem giraud_theorem_closed_from_evidence {C : Type u} [CategoryTheory.Category.{v} C] (G : GiraudTheoremPackage C) (E : GiraudTheoremEvidence G) : GiraudTheoremClosed G := by
  exact And.intro E.exactnessPropertiesClosed (And.intro E.limitColimitCompatibilityClosed E.generatingSetClosed)

end CategoryTheoryClassifyingTopoiFoundationCanonicalLaneLean
end HautevilleHouse