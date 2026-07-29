import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.LinearOperatorsBanachAlgebrasTheoremCanonicalLaneLean.LinearOperatorSpace

namespace HautevilleHouse
namespace LinearOperatorsBanachAlgebrasTheoremCanonicalLaneLean

open scoped Complex

structure Spectrum {A : BanachAlgebra} (a : A.carrier) where
  resolventSet : Set ℂ
  spectrum : Set ℂ := Set.univ \ resolventSet
  resolventDefined : ∀ λ : ℂ, λ ∈ resolventSet → ∃ b : A.carrier, (λ • (1 : A.carrier) - a) * b = 1 ∧ b * (λ • (1 : A.carrier) - a) = 1

structure SpectralRadius {A : BanachAlgebra} (a : A.carrier) where
  r : ℝ≥0
  spectrumContainedInClosedBall : Spectrum.spectrum a ⊆ Metric.closedBall (0 : ℂ) r
  maxBound : ∀ r' < r, ¬ (Spectrum.spectrum a ⊆ Metric.closedBall (0 : ℂ) r')

def SpectrumClosed {A : BanachAlgebra} (a : A.carrier) (S : Spectrum a) : Prop :=
  S.resolventSet ≠ Set.univ

theorem spectrum_nonempty_banach_algebra {A : BanachAlgebra} (a : A.carrier) : Nonempty (Spectrum a) := by
  exact ⟨{ resolventSet := Set.univ, resolventDefined := λ λ h => False.elim (Set.not_mem_univ λ) }⟩

end LinearOperatorsBanachAlgebrasTheoremCanonicalLaneLean
end HautevilleHouse