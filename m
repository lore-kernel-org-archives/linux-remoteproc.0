Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F56330B0E;
	Fri,  5 Dec 2025 20:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764964809; cv=none; b=Hj9lU3DMO3jxDdQjDE2enPCXGoXnsb/4fwn9eENCL6ihv4epZNtAGbZsImoT95yP/svz2VXHboY73E3WoLEczP4MI0SKje7uohs1nWv8l5G+jNqgYf1t6icJgqJklwHtJW7ZJfpDKu/OnfBuemFNWQRmZ3gTruVAAtfoNklhwrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764964809; c=relaxed/simple;
	bh=etEGidQXnUL5yN9b4dSKqjEMa6XBpUu87O8byxbHuWM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oi953vnrvXIVh1F4HJqfV3kH/NJaOZAnCrhrfDib4dOrVl7POZewYOtKcWS0GBniSsmrwSoRq/S/WUsGmpDbt83kjzjIhixcog4+eBGK0NMk6xzb2QWZJXw2ZQk7VwQ1PesGdVpbaPzPNGb0AaB+OK48/j+WW1EjnBpBZuJ9g1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T03QseS8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T03QseS8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BA6BC4CEF1;
	Fri,  5 Dec 2025 20:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764964808;
	bh=etEGidQXnUL5yN9b4dSKqjEMa6XBpUu87O8byxbHuWM=;
	h=From:To:Cc:Subject:Date:From;
	b=T03QseS8S6rLGYTei6rplXqZGKhWnh7CWoIuRlbO75Y7XUO3cPdNFQaZf37d7NZHL
	 E9Re0VgrBYSiNFfqmvmNhy5wydAs4hgHyjI49wp4B5jg6FZb0Uj44ZG4EX18zB/YAm
	 FzkHoAxL1D/sckzqTiWyyICeS6uxaZSAo5zyuTytqJj7/4uCdgJoDz/67ImUzxo5kM
	 hUV/w77sa9KdopdEkyHs3N4w572Z0wZiArF3P6gBZqHHcWb+BpX+ccnuvaekCQZ9F/
	 mkq/EScE3MXMx+u1UYi+OciTGOpBJ8940yd5Vp59Emt3afASOzs3abPtlHgg7FF4Uc
	 TMHclowmDK4gg==
From: Bjorn Andersson <andersson@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [GIT PULL] rpmsg updates for v6.19
Date: Fri,  5 Dec 2025 14:06:28 -0600
Message-ID: <20251205200628.120406-1-andersson@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git rpmsg-v6.19

for you to fetch changes up to 112766cdf2e5ea0a0f72b0304d57a6f74c066670:

  rpmsg: glink: remove duplicate code for rpmsg device remove (2025-11-26 10:16:10 -0600)

----------------------------------------------------------------
rpmsg updates for v6.19

Reduce code duplication related to channel removal, and invoke the
removal in one case previously missing, in the Glink driver.

----------------------------------------------------------------
Srinivas Kandagatla (2):
      rpmsg: glink: fix rpmsg device leak
      rpmsg: glink: remove duplicate code for rpmsg device remove

 drivers/rpmsg/qcom_glink_native.c | 35 ++++++++++++++++-------------------
 1 file changed, 16 insertions(+), 19 deletions(-)
