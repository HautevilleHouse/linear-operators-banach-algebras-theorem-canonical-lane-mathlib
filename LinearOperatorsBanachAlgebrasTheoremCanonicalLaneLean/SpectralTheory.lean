import canonicalLaneMathlib.AdmissibleClass
import LinearOperatorsBanachAlgebrasTheoremCanonicalLaneLean.BanachAlgebra

namespace HautevilleHouse
namespace LinearOperatorsBanachAlgebrasTheoremCanonicalLaneLean

structure SpectralTheoryPackage (A : BanachAlgebra) where
  spectrum : A.carrier → Set ℂ
  spectralRadius : A.carrier → ℝ
  spectralMapping : Prop
  spectralRadiusFormula : Prop
  compactSpectrum : Prop
  nonemptySpectrumGelfandMazur : Prop

def SpectralTheoryClosed (A : BanachAlgebra) (S : SpectralTheoryPackage A) : Prop :=
  S.spectralMapping ∧ S.spectralRadiusFormula ∧ S.compactSpectrum ∧ S.nonemptySpectrumGelfandMazur

structure SpectralTheoryEvidence (A : BanachAlgebra) (S : SpectralTheoryPackage A) where
  spectralMappingClosed : S.spectralMapping
  spectralRadiusFormulaClosed : S.spectralRadiusFormula
  compactSpectrumClosed : S.compactSpectrum
  nonemptySpectrumGelfandMazurClosed : S.nonemptySpectrumGelfandMazur

theorem spectral_theory_closed_from_evidence (A : BanachAlgebra)
    (S : SpectralTheoryPackage A) (E : SpectralTheoryEvidence A S) :
    SpectralTheoryClosed A S := by
  exact And.intro E.spectralMappingClosed
    (And.intro E.spectralRadiusFormulaClosed
      (And.intro E.compactSpectrumClosed E.nonemptySpectrumGelfandMazurClosed))

end LinearOperatorsBanachAlgebrasTheoremCanonicalLaneLean
end HautevilleHouse