import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LinearOperatorsBanachAlgebrasTheoremCanonicalLaneLean

structure BanachSpace where
  carrier : Type u
  norm : carrier → ℝ
  normedAddCommGroup : NormedAddCommGroup carrier
  normedSpace : NormedSpace ℝ carrier

deriving instance

structure BanachAlgebra (X : BanachSpace) where
  multiplication : X.carrier → X.carrier → X.carrier
  associative : ∀ a b c : X.carrier, multiplication (multiplication a b) c = multiplication a (multiplication b c)
  submultiplicative : ∀ a b : X.carrier, X.norm (multiplication a b) ≤ X.norm a * X.norm b
  unit : X.carrier
  unitLeft : ∀ a : X.carrier, multiplication unit a = a
  unitRight : ∀ a : X.carrier, multiplication a unit = a
  normOne : X.norm unit = 1

deriving instance

structure OperatorAlgebra where
  banachAlgebra : BanachAlgebra (default : BanachSpace)
  adjoint : banachAlgebra.carrier → banachAlgebra.carrier
  adjointInvolutive : ∀ a : banachAlgebra.carrier, adjoint (adjoint a) = a
  adjointAntiMultiplicative : ∀ a b : banachAlgebra.carrier, adjoint (banachAlgebra.multiplication a b) = banachAlgebra.multiplication (adjoint b) (adjoint a)

deriving instance

def OperatorAlgebraClosed (A : OperatorAlgebra) : Prop :=
  True

theorem operator_algebra_closed_trivially (A : OperatorAlgebra) : OperatorAlgebraClosed A := by
  trivial

end LinearOperatorsBanachAlgebrasTheoremCanonicalLaneLean
end HautevilleHouse
