import XMonad
import XMonad.Util.EZConfig
import XMonad.Hooks.DynamicLog

main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

myBar = "xmobar"
myPP = xmobarPP { ppCurrent = xmobarColor "#429942" "" . wrap "" ""
                , ppSep = " - " }
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

myConfig = defaultConfig { terminal = "urxvtc" }
--   `additionalKeysP`
--   [ ("M-f", spawn "firefox")
--   ]
