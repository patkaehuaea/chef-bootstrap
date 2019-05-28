default['chef-bootstrap']['user'] = 'patk'
default['chef-bootstrap']['base']['path'] = File.join('/', 'home', 'patk')
default['chef-bootstrap']['fonts']['path'] = File.join(node['chef-bootstrap']['base']['path'], '.local','share','fonts')
default['chef-bootstrap']['fonts']['config']['path'] = File.join(node['chef-bootstrap']['base']['path'], '.config','fontconfig','conf.d')
default['chef-bootstrap']['vim']['path'] = File.join(node['chef-bootstrap']['base']['path'], '.vim')
default['chef-bootstrap']['vim']['plugin']['path'] = File.join(node['chef-bootstrap']['vim']['path'], 'bundle')
default['chef-bootstrap']['vim']['pathogen']['path'] = File.join(node['chef-bootstrap']['vim']['path'], 'autoload')
default['chef-bootstrap']['packages'] = %w(
  lsof
  python-powerline
  terminator
  tree
  vim
)

default['chef-bootstrap']['directories'] = {
  node['chef-bootstrap']['fonts']['path'] => '0755',
  node['chef-bootstrap']['fonts']['config']['path'] => '0755',
  node['chef-bootstrap']['vim']['path'] => '0755',
  node['chef-bootstrap']['vim']['plugin']['path'] => '0755',
  node['chef-bootstrap']['vim']['pathogen']['path'] => '0755'
}

default['chef-bootstrap']['homedir']['files'] = {
  '.bash_profile' => '644',
  '.crontab' => '644',
  '.gemrc' => '644',
  '.gitconfig' => '644',
  '.gitignore' => '644',
  '.profile' => '644',
  '.screenrc' => '644',
  '.shellaliases' => '644',
  '.shellfn' => '644',
  '.shellpaths' => '644',
  '.shellvars' => '644',
  '.tmux.conf' => '644',
  '.todo.cfg' => '644',
  '.vimrc' => '644'
}

default['chef-bootstrap']['git']['repos'] = {
  File.join(node['chef-bootstrap']['vim']['plugin']['path'],'Vundle.vim') => {
    'group' => node['chef-bootstrap']['user'],
    'user' => node['chef-bootstrap']['user'],
    'repository' => 'git://github.com/VundleVim/Vundle.vim.git',
    'revision' => 'v0.10.2',
    'action' => :sync
  },
  File.join(node['chef-bootstrap']['vim']['plugin']['path'],'nerdtree') => {
    'group' => node['chef-bootstrap']['user'],
    'user' => node['chef-bootstrap']['user'],
    'repository' => 'git://github.com/scrooloose/nerdtree.git',
    'action' => :sync
  },
  File.join(node['chef-bootstrap']['vim']['plugin']['path'],'nerdtree-git-plugin') => {
    'group' => node['chef-bootstrap']['user'],
    'user' => node['chef-bootstrap']['user'],
    'repository' => 'git://github.com/Xuyuanp/nerdtree-git-plugin.git',
    'action' => :sync
  },
  File.join(node['chef-bootstrap']['vim']['plugin']['path'],'vim-chef') => {
    'group' => node['chef-bootstrap']['user'],
    'user' => node['chef-bootstrap']['user'],
    'repository' => 'git://github.com/dougireton/vim-chef.git',
    'action' => :sync
  },
  File.join(node['chef-bootstrap']['vim']['plugin']['path'],'vim-go') => {
    'group' => node['chef-bootstrap']['user'],
    'user' => node['chef-bootstrap']['user'],
    'repository' => 'git://github.com/fatih/vim-go.git',
    'action' => :sync
  },
  File.join(node['chef-bootstrap']['vim']['plugin']['path'],'vim-ruby') => {
    'group' => node['chef-bootstrap']['user'],
    'user' => node['chef-bootstrap']['user'],
    'repository' => 'git://github.com/vim-ruby/vim-ruby.git',
    'action' => :sync
  }
}

default['chef-bootstrap']['fonts']['files'] = {
  File.join(node['chef-bootstrap']['fonts']['path'],'PowerlineSymbols.otf') => {
    'group' => node['chef-bootstrap']['user'],
    'mode' => '0755',
    'owner' => node['chef-bootstrap']['user'],
    'source' => 'https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf',
    'action' => :create
  },
  File.join(node['chef-bootstrap']['fonts']['config']['path'], '10-powerline-symbols.conf') => {
    'group' => node['chef-bootstrap']['user'],
    'mode' => '0755',
    'owner' => node['chef-bootstrap']['user'],
    'source' => 'https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf',
    'action' => :create
  }
}
