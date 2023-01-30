module TypeChecker where 
import OurLanGrammar

type TypeEnvironment = [(String , Type)]

getBinding :: String -> TypeEnvironment -> Type
getBinding x [] = error "variable binding not found"
getBinding x ((y,t):te) | x==y = t
                          | otherwise = getBinding x te


addBinding :: String -> Type -> TypeEnvironment -> TypeEnvironment 
addBinding x t te = (x,t):te
{--
findType :: TypeEnvironment -> Ops -> Type 
findType te (TInt _) = OurInt  
findType te (TString _ ) = OurString 
findType te (TBool _ ) = OurBool
findType te (Iri _ ) = OurIri
findType te (Negate _ ) = OurNeg
--}