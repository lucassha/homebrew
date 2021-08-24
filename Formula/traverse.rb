class Traverse < Formula
    desc "Traverse a Vault path to determine if a secret exists in the given path"
    homepage "https://github.com/lucassha/vault-traverser"
    url "https://lucassha-traverse-releases.s3.us-west-2.amazonaws.com/releases/v0.0.1"
    
    # to get the latest SHA:
    # find latest release: aws s3api list-objects --bucket lucassha-traverse-releases | jq '.Contents[].Key'
    # download release: aws s3 cp s3://lucassha-traverse-releases/releases/v0.0.1 . 
    # get sha: shasum -a 256 v0.0.1
    sha256 "efeb8a0b157d52067b0b2bd555ea79d188a5ca95d2321d31a97da12ee9dedf7a"

    depends_on "vault"

    def install
        bin.install "traverse"
    end

    def caveats; <<-EOS
        This tool *must* be used with a Vault server. 
        See Makefile here for Vault testing server in GitHub repo:
        https://github.com/lucassha/vault-traverser/blob/main/Makefile
        
        # example
        traverse --path secret --secret thisisasecret
    EOS
    end
end