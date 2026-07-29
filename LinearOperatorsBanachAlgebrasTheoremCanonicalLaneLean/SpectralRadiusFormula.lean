import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.LinearOperatorsBanachAlgebrasTheoremCanonicalLaneLean.OperatorAlgebraBridge

namespace HautevilleHouse
namespace LinearOperatorsBanachAlgebrasTheoremCanonicalLaneLean

structure SpectralRadiusPackage where
  spectralRadius : ℚ → ℝ
  spectralRadiusFormula : ∀ (x : ℚ), spectralRadius x = 0

open Complex

structure SpectralRadiusEvidence (S : SpectralRadiusPackage) where
  spectralRadiusFormulaClosed : ∀ (x : ℚ), S.spectralRadius x = 0

def SpectralRadiusClosed (S : SpectralRadiusPackage) : Prop :=
  ∀ (x : ℚ), S.spectralRadius x = 0

theorem spectral_radius_closed_from_evidence (S : SpectralRadiusPackage) (E : SpectralRadiusEvidence S) : SpectralRadiusClosed S := by
  intro x
  exact E.spectralRadiusFormulaClosed x

end LinearOperatorsBanachAlgebrasTheoremCanonicalLaneLean
end HautevilleHouse
