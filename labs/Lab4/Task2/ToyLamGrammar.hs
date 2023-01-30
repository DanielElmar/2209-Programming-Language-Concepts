{-# OPTIONS_GHC -w #-}
module ToyLamGrammar where
import ToyLamTokens
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.0

data HappyAbsSyn t4
	= HappyTerminal (ToyLamToken)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 t4

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,126) ([9520,25,64,0,38592,8316,0,0,21248,49554,25748,32,0,0,0,0,45058,7981,51692,1031,0,26630,9520,19481,1609,37459,1537,104,0,32864,21254,402,0,9520,19481,1609,63067,54977,124,0,18764,21254,16786,30870,9616,30,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseToyLam","Exp","lam","var","'->'","';'","'('","')'","if","then","else","let","in","'='","digit","'<'","'+'","true","false","%eof"]
        bit_start = st Prelude.* 22
        bit_end = (st Prelude.+ 1) Prelude.* 22
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..21]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (5) = happyShift action_4
action_0 (6) = happyShift action_5
action_0 (9) = happyShift action_6
action_0 (11) = happyShift action_7
action_0 (14) = happyShift action_8
action_0 (17) = happyShift action_2
action_0 (20) = happyShift action_9
action_0 (21) = happyShift action_10
action_0 (4) = happyGoto action_3
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (17) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyReduce_1

action_3 (5) = happyShift action_4
action_3 (6) = happyShift action_5
action_3 (8) = happyShift action_16
action_3 (9) = happyShift action_6
action_3 (11) = happyShift action_7
action_3 (14) = happyShift action_8
action_3 (17) = happyShift action_2
action_3 (18) = happyShift action_17
action_3 (19) = happyShift action_18
action_3 (20) = happyShift action_9
action_3 (21) = happyShift action_10
action_3 (22) = happyAccept
action_3 (4) = happyGoto action_15
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (6) = happyShift action_14
action_4 _ = happyFail (happyExpListPerState 4)

action_5 _ = happyReduce_6

action_6 (5) = happyShift action_4
action_6 (6) = happyShift action_5
action_6 (9) = happyShift action_6
action_6 (11) = happyShift action_7
action_6 (14) = happyShift action_8
action_6 (17) = happyShift action_2
action_6 (20) = happyShift action_9
action_6 (21) = happyShift action_10
action_6 (4) = happyGoto action_13
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (5) = happyShift action_4
action_7 (6) = happyShift action_5
action_7 (9) = happyShift action_6
action_7 (11) = happyShift action_7
action_7 (14) = happyShift action_8
action_7 (17) = happyShift action_2
action_7 (20) = happyShift action_9
action_7 (21) = happyShift action_10
action_7 (4) = happyGoto action_12
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (6) = happyShift action_11
action_8 _ = happyFail (happyExpListPerState 8)

action_9 _ = happyReduce_2

action_10 _ = happyReduce_3

action_11 (16) = happyShift action_25
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (5) = happyShift action_4
action_12 (6) = happyShift action_5
action_12 (8) = happyShift action_16
action_12 (9) = happyShift action_6
action_12 (11) = happyShift action_7
action_12 (12) = happyShift action_24
action_12 (14) = happyShift action_8
action_12 (17) = happyShift action_2
action_12 (18) = happyShift action_17
action_12 (19) = happyShift action_18
action_12 (20) = happyShift action_9
action_12 (21) = happyShift action_10
action_12 (4) = happyGoto action_15
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (5) = happyShift action_4
action_13 (6) = happyShift action_5
action_13 (8) = happyShift action_16
action_13 (9) = happyShift action_6
action_13 (10) = happyShift action_23
action_13 (11) = happyShift action_7
action_13 (14) = happyShift action_8
action_13 (17) = happyShift action_2
action_13 (18) = happyShift action_17
action_13 (19) = happyShift action_18
action_13 (20) = happyShift action_9
action_13 (21) = happyShift action_10
action_13 (4) = happyGoto action_15
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (7) = happyShift action_22
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (8) = happyShift action_16
action_15 (9) = happyShift action_6
action_15 (18) = happyShift action_17
action_15 (20) = happyShift action_9
action_15 (21) = happyShift action_10
action_15 (4) = happyGoto action_15
action_15 _ = happyReduce_10

action_16 (5) = happyShift action_4
action_16 (6) = happyShift action_5
action_16 (9) = happyShift action_6
action_16 (11) = happyShift action_7
action_16 (14) = happyShift action_8
action_16 (17) = happyShift action_2
action_16 (20) = happyShift action_9
action_16 (21) = happyShift action_10
action_16 (4) = happyGoto action_21
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (5) = happyShift action_4
action_17 (6) = happyShift action_5
action_17 (9) = happyShift action_6
action_17 (11) = happyShift action_7
action_17 (14) = happyShift action_8
action_17 (17) = happyShift action_2
action_17 (20) = happyShift action_9
action_17 (21) = happyShift action_10
action_17 (4) = happyGoto action_20
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (5) = happyShift action_4
action_18 (6) = happyShift action_5
action_18 (9) = happyShift action_6
action_18 (11) = happyShift action_7
action_18 (14) = happyShift action_8
action_18 (17) = happyShift action_2
action_18 (20) = happyShift action_9
action_18 (21) = happyShift action_10
action_18 (4) = happyGoto action_19
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (8) = happyShift action_16
action_19 (9) = happyShift action_6
action_19 (18) = happyShift action_17
action_19 (20) = happyShift action_9
action_19 (21) = happyShift action_10
action_19 (4) = happyGoto action_15
action_19 _ = happyReduce_5

action_20 (9) = happyFail []
action_20 (18) = happyFail []
action_20 (20) = happyFail []
action_20 (21) = happyFail []
action_20 (4) = happyGoto action_15
action_20 _ = happyReduce_4

action_21 (8) = happyShift action_16
action_21 (9) = happyShift action_6
action_21 (18) = happyShift action_17
action_21 (20) = happyShift action_9
action_21 (21) = happyShift action_10
action_21 (4) = happyGoto action_15
action_21 _ = happyReduce_11

action_22 (5) = happyShift action_4
action_22 (6) = happyShift action_5
action_22 (9) = happyShift action_6
action_22 (11) = happyShift action_7
action_22 (14) = happyShift action_8
action_22 (17) = happyShift action_2
action_22 (20) = happyShift action_9
action_22 (21) = happyShift action_10
action_22 (4) = happyGoto action_28
action_22 _ = happyFail (happyExpListPerState 22)

action_23 _ = happyReduce_12

action_24 (5) = happyShift action_4
action_24 (6) = happyShift action_5
action_24 (9) = happyShift action_6
action_24 (11) = happyShift action_7
action_24 (14) = happyShift action_8
action_24 (17) = happyShift action_2
action_24 (20) = happyShift action_9
action_24 (21) = happyShift action_10
action_24 (4) = happyGoto action_27
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (5) = happyShift action_4
action_25 (6) = happyShift action_5
action_25 (9) = happyShift action_6
action_25 (11) = happyShift action_7
action_25 (14) = happyShift action_8
action_25 (17) = happyShift action_2
action_25 (20) = happyShift action_9
action_25 (21) = happyShift action_10
action_25 (4) = happyGoto action_26
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (5) = happyShift action_4
action_26 (6) = happyShift action_5
action_26 (8) = happyShift action_16
action_26 (9) = happyShift action_6
action_26 (11) = happyShift action_7
action_26 (14) = happyShift action_8
action_26 (15) = happyShift action_30
action_26 (17) = happyShift action_2
action_26 (18) = happyShift action_17
action_26 (19) = happyShift action_18
action_26 (20) = happyShift action_9
action_26 (21) = happyShift action_10
action_26 (4) = happyGoto action_15
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (5) = happyShift action_4
action_27 (6) = happyShift action_5
action_27 (8) = happyShift action_16
action_27 (9) = happyShift action_6
action_27 (11) = happyShift action_7
action_27 (13) = happyShift action_29
action_27 (14) = happyShift action_8
action_27 (17) = happyShift action_2
action_27 (18) = happyShift action_17
action_27 (19) = happyShift action_18
action_27 (20) = happyShift action_9
action_27 (21) = happyShift action_10
action_27 (4) = happyGoto action_15
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (9) = happyFail []
action_28 (18) = happyFail []
action_28 (20) = happyFail []
action_28 (21) = happyFail []
action_28 (4) = happyGoto action_15
action_28 _ = happyReduce_8

action_29 (5) = happyShift action_4
action_29 (6) = happyShift action_5
action_29 (9) = happyShift action_6
action_29 (11) = happyShift action_7
action_29 (14) = happyShift action_8
action_29 (17) = happyShift action_2
action_29 (20) = happyShift action_9
action_29 (21) = happyShift action_10
action_29 (4) = happyGoto action_32
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (5) = happyShift action_4
action_30 (6) = happyShift action_5
action_30 (9) = happyShift action_6
action_30 (11) = happyShift action_7
action_30 (14) = happyShift action_8
action_30 (17) = happyShift action_2
action_30 (20) = happyShift action_9
action_30 (21) = happyShift action_10
action_30 (4) = happyGoto action_31
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (5) = happyShift action_4
action_31 (8) = happyShift action_16
action_31 (9) = happyShift action_6
action_31 (11) = happyShift action_7
action_31 (14) = happyShift action_8
action_31 (18) = happyShift action_17
action_31 (19) = happyShift action_18
action_31 (20) = happyShift action_9
action_31 (21) = happyShift action_10
action_31 (4) = happyGoto action_15
action_31 _ = happyReduce_9

action_32 (5) = happyShift action_4
action_32 (8) = happyShift action_16
action_32 (9) = happyShift action_6
action_32 (11) = happyShift action_7
action_32 (14) = happyShift action_8
action_32 (18) = happyShift action_17
action_32 (19) = happyShift action_18
action_32 (20) = happyShift action_9
action_32 (21) = happyShift action_10
action_32 (4) = happyGoto action_15
action_32 _ = happyReduce_7

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyTerminal (TokenDigit p happy_var_1))
	 =  HappyAbsSyn4
		 (happy_var_1
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_1  4 happyReduction_2
happyReduction_2 _
	 =  HappyAbsSyn4
		 (True
	)

happyReduce_3 = happySpecReduce_1  4 happyReduction_3
happyReduction_3 _
	 =  HappyAbsSyn4
		 (False
	)

happyReduce_4 = happySpecReduce_3  4 happyReduction_4
happyReduction_4 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (LessThan happy_var_1 happy_var_3
	)
happyReduction_4 _ _ _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_3  4 happyReduction_5
happyReduction_5 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Plus happy_var_1 happy_var_3
	)
happyReduction_5 _ _ _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_1  4 happyReduction_6
happyReduction_6 (HappyTerminal (TokenVar p happy_var_1))
	 =  HappyAbsSyn4
		 (Var happy_var_1
	)
happyReduction_6 _  = notHappyAtAll 

happyReduce_7 = happyReduce 6 4 happyReduction_7
happyReduction_7 ((HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (If happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_8 = happyReduce 4 4 happyReduction_8
happyReduction_8 ((HappyAbsSyn4  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar p happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Lam happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_9 = happyReduce 6 4 happyReduction_9
happyReduction_9 ((HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar p happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Let happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_10 = happySpecReduce_2  4 happyReduction_10
happyReduction_10 (HappyAbsSyn4  happy_var_2)
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (App happy_var_1 happy_var_2
	)
happyReduction_10 _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_3  4 happyReduction_11
happyReduction_11 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Seq happy_var_1 happy_var_3
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_3  4 happyReduction_12
happyReduction_12 _
	(HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (happy_var_2
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 22 22 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenLambda p -> cont 5;
	TokenVar p happy_dollar_dollar -> cont 6;
	TokenAbs p -> cont 7;
	TokenSeq p -> cont 8;
	TokenLParen p -> cont 9;
	TokenRParen  p -> cont 10;
	TokenIf p -> cont 11;
	TokenThen p -> cont 12;
	TokenElse p -> cont 13;
	TokenLet p -> cont 14;
	TokenIn p -> cont 15;
	TokenEq p -> cont 16;
	TokenDigit p happy_dollar_dollar -> cont 17;
	TokenLessThan p -> cont 18;
	TokenPlus p -> cont 19;
	TokenTure p -> cont 20;
	TokenFalse p -> cont 21;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 22 tk tks = happyError' (tks, explist)
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
happyError' :: () => ([(ToyLamToken)], [Prelude.String]) -> HappyIdentity a
happyError' = HappyIdentity Prelude.. (\(tokens, _) -> parseError tokens)
parseToyLam tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [ToyLamToken] -> a
parseError [] = error "Unknown Parse Error"
parseError (t:ts) = error ("Parse error at line:column " ++ (tokenPosn t))

data Exp =  int
         | True
         | False
         | LessThan Exp Exp
         | Plus Exp Exp
         | Var Sting
         | If Exp Exp Exp
         | Lam String Exp
         | Let String Exp Exp
         | App Exp Exp
         | Seq Exp Exp
         deriving Show
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
