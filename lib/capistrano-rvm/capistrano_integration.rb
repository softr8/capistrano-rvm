require "capistrano"
require "capistrano/version"

module CapistranoResque
  class CapistranoIntegration
    def self.load_into(capistrano_config)
      capistrano_config.load do

        namespace :rvm do

          set :ruby_version, rvm_ruby_string.split('@').first
          set :gemset_name, rvm_ruby_string.split('@')[1] || application
          set :tmp_ruby_string, rvm_ruby_string

          desc "Installs rvm, ruby and bundler"
          task :default do
            install
            install_ruby
            install_bundler
            create_gemset
          end

          desc "Installs rvm"
          task :install, :except => {:no_release => true} do
            set :rvm_ruby_string, ''
            run "RVM=`rvm | grep 'RVM'` ; if [ -z \"$RVM\" ] ; then bash -s stable < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer) ; fi", shell: 'bash -l'
            set :rvm_ruby_string, tmp_ruby_string
          end

          desc "installs ruby version specified in rvm_ruby_string"
          task :install_ruby, :except => {:no_release => true} do
            set :rvm_ruby_string, ''
            run "RUBY_INSTALLED=`rvm list | grep '#{ruby_version}'` ; if [ -z \"$RUBY_INSTALLED\" ]; then rvm install #{ruby_version} ; fi"
            set :rvm_ruby_string, tmp_ruby_string
          end

          desc "sets as default current ruby version"
          task :default_ruby, :except => {:no_release => true} do
            run "rvm --default #{ruby_version}"
          end

          desc "install bundler gem"
          task :install_bundler, :except => {:no_release => true} do
            run "if [ -z \"`gem list | grep bundler`\" ] ; then gem install bundler --no-rdoc --no-ri ; fi "
          end

          task :create_gemset, :except => {:no_release => true} do
            set :rvm_ruby_string, ruby_version
            run "rvm gemset create #{gemset_name}"
            set :rvm_ruby_string, tmp_ruby_string
          end
        end
      end
    end
  end
end

if Capistrano::Configuration.instance
  CapistranoResque::CapistranoIntegration.load_into(Capistrano::Configuration.instance)
end
