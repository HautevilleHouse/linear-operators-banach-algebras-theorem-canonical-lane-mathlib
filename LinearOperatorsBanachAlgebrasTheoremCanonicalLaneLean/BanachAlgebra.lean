import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LinearOperatorsBanachAlgebrasTheoremCanonicalLaneLean

structure BanachAlgebra where
  carrier : Type u
  norm : carrier → ℝ
  add : carrier → carrier → carrier
  mul : carrier → carrier → carrier
  smul : ℝ → carrier → carrier
  zero : carrier
  one : carrier
  normedRing : NormedRing carrier
  normedAlgebra : NormedAlgebra ℝ carrier
  complete : CompleteSpace carrier
  multiplicativeIdentity : one ≠ zero

structure BanachAlgebraEvidence (A : BanachAlgebra) where
  normedRingClosed : A.normedRing
  normedAlgebraClosed : A.normedAlgebra
  completeClosed : A.complete
  multiplicativeIdentityClosed : A.multiplicativeIdentity

def BanachAlgebraClosed (A : BanachAlgebra) : Prop :=
  A.normedRing ∧ A.normedAlgebra ∧ A.complete ∧ A.multiplicativeIdentity

theorem banach_algebra_closed_from_evidence (A : BanachAlgebra)
    (E : BanachAlgebraEvidence A) : BanachAlgebraClosed A := by
  exact And.intro E.normedRingClosed
    (And.intro E.normedAlgebraClosed (And.intro E.completeClosed E.multiplicativeIdentityClosed))

end LinearOperatorsBanachAlgebrasTheoremCanonicalLaneLean
end HautevilleHouse