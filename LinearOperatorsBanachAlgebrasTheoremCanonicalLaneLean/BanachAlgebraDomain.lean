import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LinearOperatorsBanachAlgebrasTheoremCanonicalLaneLean

structure BanachAlgebraObject where
  carrierSpace : Type u
  norm : carrierSpace → ℝ
  algebraMult : carrierSpace → carrierSpace → carrierSpace
  normedAlgebra : Prop
  completeNorm : Prop
  submultiplicative : Prop
  unital : Prop

structure BanachAlgebraAdmittedObject where
  algebra : BanachAlgebraObject
  operatorTheory : Prop
  spectralRadius : Prop
  conclusion : operatorTheory ∧ spectralRadius

structure BanachAlgebraEndgameState where
  object : BanachAlgebraAdmittedObject

def BanachAlgebraWitnessClosed (O : BanachAlgebraAdmittedObject) : Prop :=
  O.operatorTheory ∧ O.spectralRadius

end LinearOperatorsBanachAlgebrasTheoremCanonicalLaneLean
end HautevilleHouse