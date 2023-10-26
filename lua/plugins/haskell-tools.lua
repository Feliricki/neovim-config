return {
  'mrcjkb/haskell-tools.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'ndmitchell/hoogle'
  },
  version = '^2', -- Recommended
  ft = { 'haskell', 'lhaskell', 'cabal', 'cabalproject' },
}
