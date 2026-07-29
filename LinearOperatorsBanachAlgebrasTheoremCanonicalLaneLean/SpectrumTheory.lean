import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LinearOperatorsBanachAlgebrasTheoremCanonicalLaneLean

structure SpectrumPackage (A : BanachAlgebra) where
  spectrum : A.carrier → Set ℂ
  resolventSet : A.carrier → Set ℂ
  spectralRadius : A.carrier → ℝ
  spectralMappingTheorem : Prop
  spectralRadiusFormula : Prop

structure SpectrumEvidence (A : BanachAlgebra) (S : SpectrumPackage A) where
  spectralMappingTheoremClosed : S.spectralMappingTheorem
  spectralRadiusFormulaClosed : S.spectralRadiusFormula

def SpectrumClosed (A : BanachAlgebra) (S : SpectrumPackage A) : Prop :=
  S.spectralMappingTheorem ∧ S.spectralRadiusFormula

theorem spectrum_closed_from_evidence (A : BanachAlgebra) (S : SpectrumPackage A)
    (E : SpectrumEvidence A S) : SpectrumClosed A S := by
  exact And.intro E.spectralMappingTheoremClosed E.spectralRadiusFormulaClosed

end LinearOperatorsBanachAlgebrasTheoremCanonicalLaneLean
end HautevilleHouse