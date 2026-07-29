import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LinearOperatorsBanachAlgebrasTheoremCanonicalLaneLean

structure Character (A : OperatorAlgebra) where
  func : A.banachAlgebra.carrier → ℂ
  linear : IsLinearMap ℝ func
  multiplicative : ∀ a b : A.banachAlgebra.carrier, func (A.banachAlgebra.multiplication a b) = func a * func b
  continuous : uniformContinuous fun (x : A.banachAlgebra.carrier) => func x
  normOne : ∃ᶠ x in 𝓝 0, |func x| ≤ ‖x‖

deriving instance

structure GelfandRepresentation (A : OperatorAlgebra) where
  X : Type u
  topology : TopologicalSpace X
  compact : CompactSpace X
  representation : A.banachAlgebra.carrier → C(X, ℂ)
  isometric : ∀ a : A.banachAlgebra.carrier, spectralRadius A a = ‖representation a‖_∞
  injective : Function.Injective representation

deriving instance

def GelfandClosed (A : OperatorAlgebra) (G : GelfandRepresentation A) : Prop :=
  ∀ a : A.banachAlgebra.carrier, spectralRadius A a = ‖G.representation a‖_∞

theorem gelfand_closed_trivial (A : OperatorAlgebra) (G : GelfandRepresentation A) : GelfandClosed A G := by
  intro a; exact G.isometric a

end LinearOperatorsBanachAlgebrasTheoremCanonicalLaneLean
end HautevilleHouse
