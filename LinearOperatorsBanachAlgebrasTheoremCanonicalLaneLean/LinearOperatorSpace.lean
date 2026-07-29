import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LinearOperatorsBanachAlgebrasTheoremCanonicalLaneLean

structure BanachSpace where
  carrier : Type u
  norm : carrier → ℝ
  normedAddCommGroup : NormedAddCommGroup carrier
  normedSpace : NormedSpace ℝ carrier
  complete : CompleteSpace carrier

structure BoundedLinearOperator (X Y : BanachSpace) where
  toFun : X.carrier → Y.carrier
  linear : IsLinearMap ℝ toFun
  bounded : ∃ C : ℝ, ∀ x : X.carrier, Y.norm (toFun x) ≤ C * X.norm x

structure BanachAlgebra (A : BanachSpace) where
  mul : A.carrier → A.carrier → A.carrier
  normedRing : NormedRing A.carrier
  norm_mul : ∀ a b : A.carrier, A.norm (mul a b) ≤ A.norm a * A.norm b

def LinearOperatorClosure (X Y : BanachSpace) (T : BoundedLinearOperator X Y) : Prop :=
  True

end LinearOperatorsBanachAlgebrasTheoremCanonicalLaneLean
end HautevilleHouse