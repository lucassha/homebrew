class ShowSecrets < Formula
    desc "CLI to show decoded Kubernetes secrets"
    homepage "https://github.com/lucassha/show-secrets"
    url "https://lucassha-show-secrets-releases.s3.us-west-2.amazonaws.com/releases/v0.0.1"
    
    # to get the latest SHA:
    # find latest release: aws s3api list-objects --bucket lucassha-show-secrets-releases | jq '.Contents[].Key'
    # download release: aws s3 cp s3://lucassha-show-secrets-releases/releases/v0.0.1 . 
    # get sha: shasum -a 256 v0.0.1
    # 

    sha256 "36018cff6708dea3587c086e366ff80bed7a2750ddda9aa7e8c1af8311b17649"

    depends_on "kubernetes-cli"

    def install
        bin.install "show-secrets"
        bin.install "kubectl-show-secrets"
        # add kubectl binary to make it a kubectl plugin
        # cp bin/"show-secrets" bin/"kubectl-show-secrets"
    end

    def caveats; <<-EOS
        This tool may be used as a standalone CLI or a kubectl plugin
        # example
        show-secrets -n default
        kubectl show secrets -n default
    EOS
    end
end
