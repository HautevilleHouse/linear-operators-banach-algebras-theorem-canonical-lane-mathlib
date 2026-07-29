import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.LinearOperatorsBanachAlgebrasTheoremCanonicalLaneLean.BanachAlgebraDomain

namespace HautevilleHouse
namespace LinearOperatorsBanachAlgebrasTheoremCanonicalLaneLean

structure OperatorNormPackage (A : BanachAlgebraObject) where
  boundedLinearOperators : Type
  operatorNorm : (boundedLinearOperators) → ℝ
  completeness : Prop
  banachAlgebraBoundedness : Prop
  operatorNormSubmultiplicative : Prop

structure SpectralRadiusPackage (A : BanachAlgebraObject) where
  spectralRadiusFormula : Prop
  geldfandFormula : Prop
  spectralRadiusSubadditive : Prop
  spectralRadiusBound : spectralRadiusFormula ∧ geldfandFormula ∧ spectralRadiusSubadditive

structure OperatorNormEvidence {A : BanachAlgebraObject} (P : OperatorNormPackage A) where
  completenessClosed : P.completeness
  banachAlgebraBoundednessClosed : P.banachAlgebraBoundedness
  operatorNormSubmultiplicativeClosed : P.operatorNormSubmultiplicative

def OperatorNormClosed {A : BanachAlgebraObject} (P : OperatorNormPackage A) : Prop :=
  P.completeness ∧ P.banachAlgebraBoundedness ∧ P.operatorNormSubmultiplicative

theorem operator_norm_closed_from_evidence
    {A : BanachAlgebraObject} (P : OperatorNormPackage A) (E : OperatorNormEvidence P) :
    OperatorNormClosed P := by
  exact And.intro E.completenessClosed
    (And.intro E.banachAlgebraBoundednessClosed E.operatorNormSubmultiplicativeClosed)

structure SpectralRadiusEvidence {A : BanachAlgebraObject} (P : SpectralRadiusPackage A) where
  spectralRadiusFormulaClosed : P.spectralRadiusFormula
  geldfandFormulaClosed : P.geldfandFormula
  spectralRadiusSubadditiveClosed : P.spectralRadiusSubadditive

def SpectralRadiusClosed {A : BanachAlgebraObject} (P : SpectralRadiusPackage A) : Prop :=
  P.spectralRadiusFormula ∧ P.geldfandFormula ∧ P.spectralRadiusSubadditive

theorem spectral_radius_closed_from_evidence
    {A : BanachAlgebraObject} (P : SpectralRadiusPackage A) (E : SpectralRadiusEvidence P) :
    SpectralRadiusClosed P := by
  exact And.intro E.spectralRadiusFormulaClosed
    (And.intro E.geldfandFormulaClosed E.spectralRadiusSubadditiveClosed)

end LinearOperatorsBanachAlgebrasTheoremCanonicalLaneLean
end HautevilleHouse