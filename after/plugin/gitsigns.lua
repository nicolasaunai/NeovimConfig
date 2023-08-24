ok, gitsigns = pcall(require, 'gitsigns')
if not ok then
    print("gitsigns not founf")
  return
end
gitsigns.setup()
