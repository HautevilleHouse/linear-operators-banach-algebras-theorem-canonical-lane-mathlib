import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.LinearOperatorsBanachAlgebrasTheoremCanonicalLaneLean.BanachAlgebraDomain
import HautevilleHouse.LinearOperatorsBanachAlgebrasTheoremCanonicalLaneLean.OperatorNormSpectralRadius

namespace HautevilleHouse
namespace LinearOperatorsBanachAlgebrasTheoremCanonicalLaneLean

structure HolomorphicFunctionalCalculusPackage (A : BanachAlgebraObject) where
  holomorphicFunctionsOnSpectrum : Type
  functionalCalculusMap : (A → ℂ) → (holomorphicFunctionsOnSpectrum) → A
  spectralMapping : Prop
  polynomialAgreement : Prop
  idempotentFromSpectralProjection : Prop
  spectralMappingClosed : spectralMapping
  polynomialAgreementClosed : polynomialAgreement
  idempotentFromSpectralProjectionClosed : idempotentFromSpectralProjection

structure FunctionalCalculusEvidence {A : BanachAlgebraObject} (F : HolomorphicFunctionalCalculusPackage A) where
  spectralMappingClosed : F.spectralMapping
  polynomialAgreementClosed : F.polynomialAgreement
  idempotentFromSpectralProjectionClosed : F.idempotentFromSpectralProjection

def FunctionalCalculusClosed {A : BanachAlgebraObject} (F : HolomorphicFunctionalCalculusPackage A) : Prop :=
  F.spectralMapping ∧ F.polynomialAgreement ∧ F.idempotentFromSpectralProjection

theorem functional_calculus_closed_from_evidence
    {A : BanachAlgebraObject} (F : HolomorphicFunctionalCalculusPackage A)
    (E : FunctionalCalculusEvidence F) : FunctionalCalculusClosed F := by
  exact And.intro E.spectralMappingClosed
    (And.intro E.polynomialAgreementClosed E.idempotentFromSpectralProjectionClosed)

end LinearOperatorsBanachAlgebrasTheoremCanonicalLaneLean
end HautevilleHouse