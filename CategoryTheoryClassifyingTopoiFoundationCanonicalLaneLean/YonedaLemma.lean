import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryClassifyingTopoiFoundationCanonicalLaneLean

structure FunctorCategory where
  sourceCategory : Type u
  targetCategory : Type v
  naturalTransformations : Type w
  composition : Prop
  identityTransformation : Prop
  composition_associative : composition → composition → composition → Prop
  identity_left : identityTransformation → composition → Prop

structure FunctorCategoryEvidence (F : FunctorCategory) where
  compositionClosed : F.composition
  identityTransformationClosed : F.identityTransformation
  compositionAssociativeClosed : ∀ (f g h : F.composition), F.composition_associative f g h
  identityLeftClosed : ∀ (f : F.composition), F.identity_left F.identityTransformation f

def FunctorCategoryClosed (F : FunctorCategory) : Prop :=
  F.composition ∧ F.identityTransformation ∧
  (∀ (f g h : F.composition), F.composition_associative f g h) ∧
  (∀ (f : F.composition), F.identity_left F.identityTransformation f)

theorem functor_category_closed_from_evidence
    (F : FunctorCategory) (E : FunctorCategoryEvidence F) :
    FunctorCategoryClosed F := by
  exact And.intro E.compositionClosed
    (And.intro E.identityTransformationClosed
      (And.intro (fun f g h => E.compositionAssociativeClosed f g h)
        (fun f => E.identityLeftClosed f)))

structure YonedaEmbedding (F : FunctorCategory) where
  yonedaFunctor : Type u
  fullFaithfulness : Prop
  naturalityIso : Prop
  fullFaithfulnessClosed : fullFaithfulness
  naturalityIsoClosed : naturalityIso

structure YonedaEmbeddingEvidence {F : FunctorCategory} (Y : YonedaEmbedding F) where
  fullFaithfulnessClosed : Y.fullFaithfulness
  naturalityIsoClosed : Y.naturalityIso

def YonedaEmbeddingClosed {F : FunctorCategory} (Y : YonedaEmbedding F) : Prop :=
  Y.fullFaithfulness ∧ Y.naturalityIso

theorem yoneda_embedding_closed_from_evidence
    {F : FunctorCategory} (Y : YonedaEmbedding F) (E : YonedaEmbeddingEvidence Y) :
    YonedaEmbeddingClosed Y := by
  exact And.intro E.fullFaithfulnessClosed E.naturalityIsoClosed

structure YonedaLemmaPackage where
  functorCategory : FunctorCategory
  yonedaEmbedding : YonedaEmbedding functorCategory
  bijection : Prop
  naturality : Prop
  bijectionClosed : bijection
  naturalityClosed : naturality

structure YonedaLemmaEvidence (Y : YonedaLemmaPackage) where
  functorCategoryClosed : FunctorCategoryClosed Y.functorCategory
  yonedaEmbeddingClosed : YonedaEmbeddingClosed Y.yonedaEmbedding
  bijectionClosed : Y.bijection
  naturalityClosed : Y.naturality

def YonedaLemmaClosed (Y : YonedaLemmaPackage) : Prop :=
  FunctorCategoryClosed Y.functorCategory ∧ YonedaEmbeddingClosed Y.yonedaEmbedding ∧
  Y.bijection ∧ Y.naturality

theorem yoneda_lemma_closed_from_evidence (Y : YonedaLemmaPackage) (E : YonedaLemmaEvidence Y) :
    YonedaLemmaClosed Y := by
  exact And.intro E.functorCategoryClosed
    (And.intro E.yonedaEmbeddingClosed
      (And.intro E.bijectionClosed E.naturalityClosed))

end CategoryTheoryClassifyingTopoiFoundationCanonicalLaneLean
end HautevilleHouse