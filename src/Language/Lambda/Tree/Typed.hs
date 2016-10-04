
module Language.Lambda.Tree.Typed
  ( TypedTree
  , typedVar
  , typedAbs
  , typedApp
  ) where

import Control.Comonad.Cofree (Cofree(..))

import Language.Lambda.Name
import Language.Lambda.Tree
import Language.Lambda.Ty

type TypedTree = Cofree TreeF Ty

typedVar :: Ty -> Name -> TypedTree
typedVar ty name = ty :< Var name

typedAbs :: Ty -> TypedTree -> TypedTree -> TypedTree
typedAbs ty x e = ty :< Abs x e

typedApp :: Ty -> TypedTree -> TypedTree -> TypedTree
typedApp ty f x = ty :< App f x
