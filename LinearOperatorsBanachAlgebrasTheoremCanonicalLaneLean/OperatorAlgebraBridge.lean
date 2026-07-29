import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LinearOperatorsBanachAlgebrasTheoremCanonicalLaneLean

structure OperatorAdmittedObject where
  space : Type u
  norm : space → ℝ
  algebraStructure : Prop
  completeness : Prop
  submultiplicativity : Prop
  conclusion : completeness ∧ submultiplicativity

structure AdmissibleClass where
  object : OperatorAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  OperatorWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

def bridgeClosed (A : AdmissibleClass) : Prop :=
  OperatorWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion.1

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

def OperatorWitnessClosed (O : OperatorAdmittedObject) : Prop :=
  O.completeness ∧ O.submultiplicativity

end LinearOperatorsBanachAlgebrasTheoremCanonicalLaneLean
end HautevilleHouse
