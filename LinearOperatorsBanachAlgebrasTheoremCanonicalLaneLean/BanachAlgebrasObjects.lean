import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LinearOperatorsBanachAlgebrasTheoremCanonicalLaneLean

structure BanachAlgebra where
  carrier : Type
  norm : carrier → ℝ
  normedAddCommGroup : NormedAddCommGroup carrier
  normedRing : NormedRing carrier
  complete : Prop

structure OperatorAlgebraAdmittedObject where
  algebra : BanachAlgebra
  operators : Type
  operatorNorm : operators → ℝ
  opNormedAlgebra : Prop
  commutative : Prop
  conclusion : opNormedAlgebra

structure OperatorAlgebraEndgameState where
  object : OperatorAlgebraAdmittedObject

def OperatorAlgebraWitnessClosed (O : OperatorAlgebraAdmittedObject) : Prop :=
  O.opNormedAlgebra

end LinearOperatorsBanachAlgebrasTheoremCanonicalLaneLean
end HautevilleHouse