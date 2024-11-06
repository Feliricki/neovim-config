return {
  'mrcjkb/haskell-tools.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'ndmitchell/hoogle'
  },
  version = '^4', -- Recommended
  ft = { 'haskell', 'lhaskell', 'cabal', 'cabalproject' },
}
