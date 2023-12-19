local options = {
	termguicolors = true,
	completeopt = "menuone,noinsert,noselect",
	mouse = "a",
	splitright = true,
	splitbelow = true,
	expandtab = true,
	tabstop = 2,
	shiftwidth = 2,
	number = true,
	ignorecase = true,
	smartcase = true,
	incsearch = true,
	diffopt = vim.opt.diffopt + "vertical",
	hidden = true,
	backup = false,
	writebackup = false,
	cmdheight = 1,
	shortmess = vim.opt.shortmess + "c",
	signcolumn = "yes",
	updatetime = 750,
  wildignore = vim.opt.wildignore + "*.jar,*.class,target/**,app/client/node_modules/**,node_modules/**",
  backupdir = vim.fn.expand("~/.vim/backup"),
  directory = vim.fn.expand("~/.vim/backup"),
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
