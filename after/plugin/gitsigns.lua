ok, gitsigns = pcall(require, 'gitsigns')
if not ok then
    print("gitsigns not found")
  return
end
gitsigns.setup()
