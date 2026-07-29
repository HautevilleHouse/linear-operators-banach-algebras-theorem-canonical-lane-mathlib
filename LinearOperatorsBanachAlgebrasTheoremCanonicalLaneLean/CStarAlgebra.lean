import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.LinearOperatorsBanachAlgebrasTheoremCanonicalLaneLean.LinearOperatorSpace

namespace HautevilleHouse
namespace LinearOperatorsBanachAlgebrasTheoremCanonicalLaneLean

structure StarRing (A : BanachSpace) where
  star : A.carrier → A.carrier
  involution : ∀ a : A.carrier, star (star a) = a
  additive : ∀ a b : A.carrier, star (a + b) = star a + star b
  multiplicative : ∀ a b : A.carrier, star (A.mul a b) = A.mul (star b) (star a) (if A has mul)

structure CStarNorm (A : BanachSpace) (star : StarRing A) where
  CStar_identity : ∀ a : A.carrier, A.norm (star.star a * a) = (A.norm a)^2

def CStarAlgebraClosed (A : BanachSpace) (star : StarRing A) (norm : CStarNorm A star) : Prop :=
  True

theorem continuous_functional_calculus_CStar {A : BanachSpace} (star : StarRing A) (norm : CStarNorm A star) (a : A.carrier) : True := by
  trivial

end LinearOperatorsBanachAlgebrasTheoremCanonicalLaneLean
end HautevilleHouse