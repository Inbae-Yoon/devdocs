module Docs
  class Vagrant < UrlScraper
    self.name = 'Vagrant'
    self.type = 'simple'
    self.release = '2.2.0'
    self.base_url = 'https://www.vagrantup.com/docs/'
    self.root_path = 'index.html'
    self.links = {
      home: 'https://www.vagrantup.com/',
      code: 'https://github.com/mitchellh/vagrant'
    }

    html_filters.push 'vagrant/entries', 'vagrant/clean_html'

    options[:skip_patterns] = [/vagrant-cloud/]

    options[:attribution] = <<-HTML
      &copy; 2010&ndash;2018 Mitchell Hashimoto<br>
      Licensed under the MPL 2.0 License.
    HTML

    def get_latest_version(opts)
      contents = get_github_file_contents('hashicorp', 'vagrant', 'website/config.rb', opts)
      contents.scan(/version\s+=\s+"([0-9.]+)"/)[0][0]
    end
  end
end
