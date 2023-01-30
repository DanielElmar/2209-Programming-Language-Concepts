{-# OPTIONS_GHC -w #-}
module TurtleGrammar where
import TurtleTokens
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.0

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13
	= HappyTerminal (TurtleToks)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 t12
	| HappyAbsSyn13 t13

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,95) ([57344,2032,3584,127,61664,7,0,0,1,0,0,1792,0,32520,0,256,2048,127,0,0,16384,0,1024,0,0,0,0,128,0,0,0,0,61664,7,0,0,256,0,0,0,0,0,0,8,2048,127,61568,6,32520,32768,2032,0,0,256,0,64,32768,2032,4096,0,512,0,0,0,0,0,0,61568,7,0,0,0,2048,127,0,0,0,32768,2032,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseTurtle","ComponentsList","Component","Directive","StatementSeq","Statement","PList","OList","Preds","Objs","Type","pref","base","iri","'.'","','","';'","':'","neg","pos","true","false","name","str","int","%eof"]
        bit_start = st Prelude.* 28
        bit_end = (st Prelude.+ 1) Prelude.* 28
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..27]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (14) = happyShift action_8
action_0 (15) = happyShift action_9
action_0 (16) = happyShift action_10
action_0 (21) = happyShift action_11
action_0 (22) = happyShift action_12
action_0 (23) = happyShift action_13
action_0 (24) = happyShift action_14
action_0 (25) = happyShift action_15
action_0 (26) = happyShift action_16
action_0 (27) = happyShift action_17
action_0 (4) = happyGoto action_18
action_0 (5) = happyGoto action_3
action_0 (6) = happyGoto action_4
action_0 (7) = happyGoto action_5
action_0 (8) = happyGoto action_6
action_0 (13) = happyGoto action_7
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (14) = happyShift action_8
action_1 (15) = happyShift action_9
action_1 (16) = happyShift action_10
action_1 (21) = happyShift action_11
action_1 (22) = happyShift action_12
action_1 (23) = happyShift action_13
action_1 (24) = happyShift action_14
action_1 (25) = happyShift action_15
action_1 (26) = happyShift action_16
action_1 (27) = happyShift action_17
action_1 (4) = happyGoto action_2
action_1 (5) = happyGoto action_3
action_1 (6) = happyGoto action_4
action_1 (7) = happyGoto action_5
action_1 (8) = happyGoto action_6
action_1 (13) = happyGoto action_7
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (14) = happyShift action_8
action_2 (15) = happyShift action_9
action_2 (16) = happyShift action_10
action_2 (21) = happyShift action_11
action_2 (22) = happyShift action_12
action_2 (23) = happyShift action_13
action_2 (24) = happyShift action_14
action_2 (25) = happyShift action_15
action_2 (26) = happyShift action_16
action_2 (27) = happyShift action_17
action_2 (5) = happyGoto action_19
action_2 (6) = happyGoto action_4
action_2 (7) = happyGoto action_5
action_2 (8) = happyGoto action_6
action_2 (13) = happyGoto action_7
action_2 _ = happyFail (happyExpListPerState 2)

action_3 _ = happyReduce_2

action_4 (17) = happyShift action_29
action_4 _ = happyFail (happyExpListPerState 4)

action_5 _ = happyReduce_3

action_6 (17) = happyShift action_26
action_6 (18) = happyShift action_27
action_6 (19) = happyShift action_28
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (16) = happyShift action_10
action_7 (21) = happyShift action_11
action_7 (22) = happyShift action_12
action_7 (23) = happyShift action_13
action_7 (24) = happyShift action_14
action_7 (25) = happyShift action_15
action_7 (26) = happyShift action_16
action_7 (27) = happyShift action_17
action_7 (13) = happyGoto action_25
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (25) = happyShift action_24
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (16) = happyShift action_10
action_9 (21) = happyShift action_11
action_9 (22) = happyShift action_12
action_9 (23) = happyShift action_13
action_9 (24) = happyShift action_14
action_9 (25) = happyShift action_15
action_9 (26) = happyShift action_16
action_9 (27) = happyShift action_17
action_9 (13) = happyGoto action_23
action_9 _ = happyFail (happyExpListPerState 9)

action_10 _ = happyReduce_18

action_11 (27) = happyShift action_22
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (27) = happyShift action_21
action_12 _ = happyFail (happyExpListPerState 12)

action_13 _ = happyReduce_23

action_14 _ = happyReduce_24

action_15 (20) = happyShift action_20
action_15 _ = happyFail (happyExpListPerState 15)

action_16 _ = happyReduce_19

action_17 _ = happyReduce_22

action_18 (14) = happyShift action_8
action_18 (15) = happyShift action_9
action_18 (16) = happyShift action_10
action_18 (21) = happyShift action_11
action_18 (22) = happyShift action_12
action_18 (23) = happyShift action_13
action_18 (24) = happyShift action_14
action_18 (25) = happyShift action_15
action_18 (26) = happyShift action_16
action_18 (27) = happyShift action_17
action_18 (28) = happyAccept
action_18 (5) = happyGoto action_19
action_18 (6) = happyGoto action_4
action_18 (7) = happyGoto action_5
action_18 (8) = happyGoto action_6
action_18 (13) = happyGoto action_7
action_18 _ = happyFail (happyExpListPerState 18)

action_19 _ = happyReduce_1

action_20 (25) = happyShift action_39
action_20 _ = happyFail (happyExpListPerState 20)

action_21 _ = happyReduce_20

action_22 _ = happyReduce_21

action_23 _ = happyReduce_6

action_24 (20) = happyShift action_38
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (16) = happyShift action_10
action_25 (21) = happyShift action_11
action_25 (22) = happyShift action_12
action_25 (23) = happyShift action_13
action_25 (24) = happyShift action_14
action_25 (25) = happyShift action_15
action_25 (26) = happyShift action_16
action_25 (27) = happyShift action_17
action_25 (13) = happyGoto action_37
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (16) = happyShift action_10
action_26 (21) = happyShift action_11
action_26 (22) = happyShift action_12
action_26 (23) = happyShift action_13
action_26 (24) = happyShift action_14
action_26 (26) = happyShift action_16
action_26 (27) = happyShift action_17
action_26 (7) = happyGoto action_36
action_26 (8) = happyGoto action_6
action_26 (13) = happyGoto action_7
action_26 _ = happyReduce_8

action_27 (16) = happyShift action_10
action_27 (21) = happyShift action_11
action_27 (22) = happyShift action_12
action_27 (23) = happyShift action_13
action_27 (24) = happyShift action_14
action_27 (25) = happyShift action_15
action_27 (26) = happyShift action_16
action_27 (27) = happyShift action_17
action_27 (10) = happyGoto action_33
action_27 (12) = happyGoto action_34
action_27 (13) = happyGoto action_35
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (16) = happyShift action_10
action_28 (21) = happyShift action_11
action_28 (22) = happyShift action_12
action_28 (23) = happyShift action_13
action_28 (24) = happyShift action_14
action_28 (25) = happyShift action_15
action_28 (26) = happyShift action_16
action_28 (27) = happyShift action_17
action_28 (9) = happyGoto action_30
action_28 (11) = happyGoto action_31
action_28 (13) = happyGoto action_32
action_28 _ = happyFail (happyExpListPerState 28)

action_29 _ = happyReduce_4

action_30 (17) = happyShift action_45
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (19) = happyShift action_44
action_31 _ = happyReduce_13

action_32 (16) = happyShift action_10
action_32 (21) = happyShift action_11
action_32 (22) = happyShift action_12
action_32 (23) = happyShift action_13
action_32 (24) = happyShift action_14
action_32 (25) = happyShift action_15
action_32 (26) = happyShift action_16
action_32 (27) = happyShift action_17
action_32 (13) = happyGoto action_43
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (17) = happyShift action_42
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (18) = happyShift action_41
action_34 _ = happyReduce_15

action_35 _ = happyReduce_17

action_36 _ = happyReduce_7

action_37 _ = happyReduce_11

action_38 (16) = happyShift action_10
action_38 (21) = happyShift action_11
action_38 (22) = happyShift action_12
action_38 (23) = happyShift action_13
action_38 (24) = happyShift action_14
action_38 (25) = happyShift action_15
action_38 (26) = happyShift action_16
action_38 (27) = happyShift action_17
action_38 (13) = happyGoto action_40
action_38 _ = happyFail (happyExpListPerState 38)

action_39 _ = happyReduce_25

action_40 _ = happyReduce_5

action_41 (16) = happyShift action_10
action_41 (21) = happyShift action_11
action_41 (22) = happyShift action_12
action_41 (23) = happyShift action_13
action_41 (24) = happyShift action_14
action_41 (25) = happyShift action_15
action_41 (26) = happyShift action_16
action_41 (27) = happyShift action_17
action_41 (10) = happyGoto action_47
action_41 (12) = happyGoto action_34
action_41 (13) = happyGoto action_35
action_41 _ = happyFail (happyExpListPerState 41)

action_42 _ = happyReduce_10

action_43 _ = happyReduce_16

action_44 (16) = happyShift action_10
action_44 (21) = happyShift action_11
action_44 (22) = happyShift action_12
action_44 (23) = happyShift action_13
action_44 (24) = happyShift action_14
action_44 (25) = happyShift action_15
action_44 (26) = happyShift action_16
action_44 (27) = happyShift action_17
action_44 (9) = happyGoto action_46
action_44 (11) = happyGoto action_31
action_44 (13) = happyGoto action_32
action_44 _ = happyFail (happyExpListPerState 44)

action_45 _ = happyReduce_9

action_46 _ = happyReduce_12

action_47 _ = happyReduce_14

happyReduce_1 = happySpecReduce_2  4 happyReduction_1
happyReduction_1 (HappyAbsSyn5  happy_var_2)
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (happy_var_2 : happy_var_1
	)
happyReduction_1 _ _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_1  4 happyReduction_2
happyReduction_2 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 ([happy_var_1]
	)
happyReduction_2 _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_1  5 happyReduction_3
happyReduction_3 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn5
		 (StSq happy_var_1
	)
happyReduction_3 _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_2  5 happyReduction_4
happyReduction_4 _
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 (Dir happy_var_1
	)
happyReduction_4 _ _  = notHappyAtAll 

happyReduce_5 = happyReduce 4 6 happyReduction_5
happyReduction_5 ((HappyAbsSyn13  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (NameTok _ happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (Prefix happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_6 = happySpecReduce_2  6 happyReduction_6
happyReduction_6 (HappyAbsSyn13  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (Base happy_var_2
	)
happyReduction_6 _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_3  7 happyReduction_7
happyReduction_7 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 ([happy_var_1] ++ happy_var_3
	)
happyReduction_7 _ _ _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_2  7 happyReduction_8
happyReduction_8 _
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 ([happy_var_1]
	)
happyReduction_8 _ _  = notHappyAtAll 

happyReduce_9 = happyReduce 4 7 happyReduction_9
happyReduction_9 (_ `HappyStk`
	(HappyAbsSyn9  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (happy_var_1 : [ deconstructPreds happy_var_1 pl | pl <- happy_var_3 ]
	) `HappyStk` happyRest

happyReduce_10 = happyReduce 4 7 happyReduction_10
happyReduction_10 (_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (happy_var_1 : [ deconstructObjs happy_var_1 pl | pl <- happy_var_3 ]
	) `HappyStk` happyRest

happyReduce_11 = happySpecReduce_3  8 happyReduction_11
happyReduction_11 (HappyAbsSyn13  happy_var_3)
	(HappyAbsSyn13  happy_var_2)
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn8
		 (St happy_var_1 happy_var_2 happy_var_3
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_3  9 happyReduction_12
happyReduction_12 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn9
		 ([happy_var_1] ++ happy_var_3
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_1  9 happyReduction_13
happyReduction_13 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn9
		 ([happy_var_1]
	)
happyReduction_13 _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_3  10 happyReduction_14
happyReduction_14 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn10
		 ([happy_var_1] ++ happy_var_3
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_1  10 happyReduction_15
happyReduction_15 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn10
		 ([happy_var_1]
	)
happyReduction_15 _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_2  11 happyReduction_16
happyReduction_16 (HappyAbsSyn13  happy_var_2)
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn11
		 (P happy_var_1 happy_var_2
	)
happyReduction_16 _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_1  12 happyReduction_17
happyReduction_17 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn12
		 (O happy_var_1
	)
happyReduction_17 _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_1  13 happyReduction_18
happyReduction_18 (HappyTerminal (IRITok _ happy_var_1))
	 =  HappyAbsSyn13
		 (IRI happy_var_1
	)
happyReduction_18 _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_1  13 happyReduction_19
happyReduction_19 (HappyTerminal (StringLiteralTok _ happy_var_1))
	 =  HappyAbsSyn13
		 (StringType happy_var_1
	)
happyReduction_19 _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_2  13 happyReduction_20
happyReduction_20 (HappyTerminal (IntTok _ happy_var_2))
	_
	 =  HappyAbsSyn13
		 (IntType happy_var_2
	)
happyReduction_20 _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_2  13 happyReduction_21
happyReduction_21 (HappyTerminal (IntTok _ happy_var_2))
	_
	 =  HappyAbsSyn13
		 (IntType (happy_var_2 * (-1))
	)
happyReduction_21 _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_1  13 happyReduction_22
happyReduction_22 (HappyTerminal (IntTok _ happy_var_1))
	 =  HappyAbsSyn13
		 (IntType happy_var_1
	)
happyReduction_22 _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_1  13 happyReduction_23
happyReduction_23 _
	 =  HappyAbsSyn13
		 (BoolType True
	)

happyReduce_24 = happySpecReduce_1  13 happyReduction_24
happyReduction_24 _
	 =  HappyAbsSyn13
		 (BoolType False
	)

happyReduce_25 = happySpecReduce_3  13 happyReduction_25
happyReduction_25 (HappyTerminal (NameTok _ happy_var_3))
	_
	(HappyTerminal (NameTok _ happy_var_1))
	 =  HappyAbsSyn13
		 (NameType happy_var_1 (StringType happy_var_3)
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 28 28 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	PrefixTok _ -> cont 14;
	BaseTok _ -> cont 15;
	IRITok _ happy_dollar_dollar -> cont 16;
	EndTriple _ -> cont 17;
	ObjList _ -> cont 18;
	PredList _ -> cont 19;
	ColonTok _ -> cont 20;
	NegTok _ -> cont 21;
	PosTok _ -> cont 22;
	TrueTok _ -> cont 23;
	FalseTok _ -> cont 24;
	NameTok _ happy_dollar_dollar -> cont 25;
	StringLiteralTok _ happy_dollar_dollar -> cont 26;
	IntTok _ happy_dollar_dollar -> cont 27;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 28 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Prelude.Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Prelude.Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (Prelude.>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (Prelude.return)
happyThen1 m k tks = (Prelude.>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (Prelude.return) a
happyError' :: () => ([(TurtleToks)], [Prelude.String]) -> HappyIdentity a
happyError' = HappyIdentity Prelude.. (\(tokens, _) -> turtleError tokens)
parseTurtle tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


turtleError :: [TurtleToks] -> a
turtleError ts = error (show ts)

data Component = Dir Directive | StSq [Statement] deriving (Show)

data Directive = Base TurtleType
               | Prefix String TurtleType deriving (Show)

data Statement = St TurtleType TurtleType TurtleType deriving (Show)

data PList = P TurtleType TurtleType

data OList = O TurtleType

data TurtleType = IRI String
          | IntType Int
          | StringType String
          | BoolType Bool
          | NameType String TurtleType deriving (Show)

deconstructPreds :: Statement -> PList -> Statement
deconstructPreds st (P obj pr ) = St (getSubj st) obj pr


deconstructObjs :: Statement -> OList -> Statement
deconstructObjs st (O obj ) = St (fst (getSubjPred st)) (snd (getSubjPred st)) obj

getSubj :: Statement -> TurtleType
getSubj (St x _ _) = x

getSubjPred :: Statement -> (TurtleType, TurtleType)
getSubjPred (St x y _) = (x,y)



parseTurtleFile :: String -> IO ([Statement])
parseTurtleFile fname = do s <- readFile fname
                           let comps = ((parseTurtle (alexScanTokens s)))
                           return (parseLine comps)

parseLine :: [Component] -> [Statement]
parseLine comps = parseDirectives (getDirectives comps) (getStatements comps) where

getDirectives :: [Component] -> [Directive]
getDirectives [] = []
getDirectives ((Dir d):cs) = d : getDirectives cs
getDirectives (_:cs) = getDirectives cs

getStatements :: [Component] -> [Statement]
getStatements [] = []
getStatements ((StSq d):cs) = d ++ (getStatements cs)
getStatements (_:cs) = getStatements cs

parseDirectives :: [Directive] -> [Statement] -> [Statement]
parseDirectives ds [] = []
parseDirectives ds ((St i1 i2 i3):sts) = (St (substituteDirectives ds i1) (substituteDirectives ds i2) (substituteDirectives ds i3)) : (parseDirectives ds sts)

substituteDirectives :: [Directive] -> TurtleType -> TurtleType
substituteDirectives ds t = substituteBase ds (substitutePrefix ds t)

substitutePrefix :: [Directive] -> TurtleType -> TurtleType
substitutePrefix [] t = t
substitutePrefix ((Prefix pName (IRI iriPrefix)):ds) (NameType pre (StringType s)) | pName == pre = (substitutePrefix ds (IRI (iriPrefix ++ s)))
                                                                             | otherwise = (substitutePrefix ds (NameType pre (StringType s)))
substitutePrefix (_:ds) t = substitutePrefix ds t

substituteBase :: [Directive] -> TurtleType -> TurtleType
substituteBase [] t = t
substituteBase ((Base (IRI i)):ds) (IRI s) | elem '.' s = (substituteBase ds (IRI s))
                                     | otherwise = (substituteBase ds (IRI (i ++ s)))
substituteBase (_:ds) t = substituteBase ds t
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Prelude.Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x Prelude.< y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `Prelude.div` 16)) (bit `Prelude.mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Prelude.Int ->                    -- token number
         Prelude.Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Prelude.- ((1) :: Prelude.Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Prelude.Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n Prelude.- ((1) :: Prelude.Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Prelude.- ((1)::Prelude.Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Prelude.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
