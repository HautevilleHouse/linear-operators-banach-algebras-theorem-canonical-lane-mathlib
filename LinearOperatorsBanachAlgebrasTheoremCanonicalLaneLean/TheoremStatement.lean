import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LinearOperatorsBanachAlgebrasTheoremCanonicalLaneLean

structure BanachAlgebraAdmittedObject where
  algebra : Type u
  normedAlgebra : Prop
  complete : Prop
  operator : Type v
  boundedOperator : Prop
  conclusion : Prop

end LinearOperatorsBanachAlgebrasTheoremCanonicalLaneLean
end HautevilleHouse
