# Installs the k command line interface

class K < Formula
  desc "Tool for managing the Reclaim the Stack platform"
  homepage "https://github.com/reclaim-the-stack/k"
  head "https://github.com/reclaim-the-stack/k.git"

  depends_on "boz/repo/kail"
  depends_on "kubernetes-cli"
  depends_on "kubeseal"
  depends_on "yq"

  def install
    bin.install "k"
    # Revisions from before k_pg_proxy was folded into k (reclaim-the-stack/k#27) ship it separately
    bin.install "k_pg_proxy" if (buildpath/"k_pg_proxy").exist?
  end

  test do
    system "#{bin}/k"
  end
end
