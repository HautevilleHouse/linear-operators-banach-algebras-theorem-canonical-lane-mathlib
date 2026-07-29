import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.LinearOperatorsBanachAlgebrasTheoremCanonicalLaneLean.OperatorAlgebraBridge

namespace HautevilleHouse
namespace LinearOperatorsBanachAlgebrasTheoremCanonicalLaneLean

structure GelfandPackage where
  characterSpace : Type u
  gelfandTransform : (A : AdmissibleClass) → (A.object.space → A.object.space) → (characterSpace → ℂ)
  isometricProperty : Prop
  surjectivityOnImage : Prop

def GelfandClosed (G : GelfandPackage) : Prop :=
  G.isometricProperty ∧ G.surjectivityOnImage

structure GelfandEvidence (G : GelfandPackage) where
  isometricPropertyClosed : G.isometricProperty
  surjectivityOnImageClosed : G.surjectivityOnImage

theorem gelfand_closed_from_evidence (G : GelfandPackage) (E : GelfandEvidence G) : GelfandClosed G := by
  exact And.intro E.isometricPropertyClosed E.surjectivityOnImageClosed

end LinearOperatorsBanachAlgebrasTheoremCanonicalLaneLean
end HautevilleHouse
