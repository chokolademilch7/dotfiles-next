local agitator = require('agitator')
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Maybe Move to Util.
local function get_git_info()
  local repo_name = vim.fn.systemlist('git rev-parse --show-toplevel')[1]
  local owner_name = vim.fn.systemlist('git config --get remote.origin.url')[1]

  -- リポジトリ名とオーナー名が取得できなかった場合、デフォルトの値を設定
  if not repo_name or repo_name == '' then
    repo_name = 'Unknown Repo'
  else
    -- パスからリポジトリ名だけを抽出
    repo_name = vim.fn.fnamemodify(repo_name, ':t')
  end

  if not owner_name or owner_name == '' then
    owner_name = 'Unknown Owner'
  else
    -- GitHubリポジトリURLからオーナー名だけを抽出
    owner_name = owner_name:match('.+/(.+)%.git') or owner_name
  end

  return repo_name, owner_name
end

keymap.set('n', '<leader>gl', function()
  agitator.git_blame_toggle({
    sidebar_width = 45,
    formatter = function(r)
      local summaryMessage
      if r.author == 'Not Committed Yet' then
        summaryMessage = 'Nothing'
      else
        summaryMessage = r.summary
      end
      return string.format('%02d-%02d-%02d | %s | %s', r.date.year, r.date.month, r.date.day, r.author, summaryMessage)
    end,
  })
end, opts)

keymap.set('n', '<leader>gO', function()
  local commit_sha = agitator.git_blame_commit_for_line()
  -- TODO: Refactor to silent...
  -- neovim上でcommandの結果を取得する方法を調査する
  -- local owner_name = vim.cmd('!gh repo view --json owner --jq ".owner.login"')
  -- local repo_name = vim.cmd('!gh repo view --json name --jq ".name"')
  -- local cmdTxt = '!gh api graphql -F owner="'
  --     .. owner_name
  --     .. '" -F repo="'
  --     .. repo_name
  --     .. '" -F expression="'
  --     .. commit_sha
  --     ..
  --     '" -F query=@/Users/s06539/Github/tools/gh-graphql/getPR.graphql | yq -e ".data.repository.object.associatedPullRequests.nodes[].url"'
  -- local prUrl = vim.cmd(cmdTxt)
  -- vim.cmd('!echo ' .. prUrl)
end, opts)
keymap.set('n', '<leader>gt', agitator.git_time_machine, opts)
keymap.set('n', '<leader>gf', agitator.open_file_git_branch, opts)
keymap.set('n', '<leader>gF', agitator.search_git_branch, opts)
