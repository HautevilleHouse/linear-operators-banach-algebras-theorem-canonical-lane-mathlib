import canonicalLaneMathlib.AdmissibleClass
import LinearOperatorsBanachAlgebrasTheoremCanonicalLaneLean.BanachAlgebra

namespace HautevilleHouse
namespace LinearOperatorsBanachAlgebrasTheoremCanonicalLaneLean

structure BoundedLinearOperator (X : Type u) [NormedAddCommGroup X] [NormedSpace ℂ X] where
  f : X → X
  linear : IsLinearMap ℂ f
  bounded : ∃ M : ℝ, 0 ≤ M ∧ ∀ x : X, ‖f x‖ ≤ M * ‖x‖

structure OperatorAlgebraPackage (X : Type u) [NormedAddCommGroup X] [NormedSpace ℂ X] where
  operators : Set (BoundedLinearOperator X)
  closedUnderAdd : Prop
  closedUnderMul : Prop
  closedUnderScalar : Prop
  containsIdentity : Prop
  complete : Prop

def OperatorAlgebraPackageClosed (X : Type u) [NormedAddCommGroup X] [NormedSpace ℂ X]
    (O : OperatorAlgebraPackage X) : Prop :=
  O.closedUnderAdd ∧ O.closedUnderMul ∧ O.closedUnderScalar ∧ O.containsIdentity ∧ O.complete

structure OperatorAlgebraPackageEvidence (X : Type u) [NormedAddCommGroup X] [NormedSpace ℂ X]
    (O : OperatorAlgebraPackage X) where
  closedUnderAddClosed : O.closedUnderAdd
  closedUnderMulClosed : O.closedUnderMul
  closedUnderScalarClosed : O.closedUnderScalar
  containsIdentityClosed : O.containsIdentity
  completeClosed : O.complete

theorem operator_algebra_package_closed_from_evidence (X : Type u)
    [NormedAddCommGroup X] [NormedSpace ℂ X] (O : OperatorAlgebraPackage X)
    (E : OperatorAlgebraPackageEvidence X O) : OperatorAlgebraPackageClosed X O := by
  exact And.intro E.closedUnderAddClosed
    (And.intro E.closedUnderMulClosed
      (And.intro E.closedUnderScalarClosed
        (And.intro E.containsIdentityClosed E.completeClosed)))

end LinearOperatorsBanachAlgebrasTheoremCanonicalLaneLean
end HautevilleHouse