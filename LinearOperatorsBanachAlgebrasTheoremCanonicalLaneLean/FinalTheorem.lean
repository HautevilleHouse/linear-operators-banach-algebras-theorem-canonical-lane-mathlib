import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.LinearOperatorsBanachAlgebrasTheoremCanonicalLaneLean.OperatorAlgebraBridge

namespace HautevilleHouse
namespace LinearOperatorsBanachAlgebrasTheoremCanonicalLaneLean

def ConstrainedOperatorClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_operator_endgame (A : AdmissibleClass) :
    ConstrainedOperatorClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end LinearOperatorsBanachAlgebrasTheoremCanonicalLaneLean
end HautevilleHouse
