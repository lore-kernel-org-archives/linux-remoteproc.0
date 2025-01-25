Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB319C148;
	Sat, 25 Jan 2025 17:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737826399; cv=none; b=Oy97/AhbJxQn4ab55qi85kuGjTgu+VeNq4qnGb9LNyZZh4TmxOp1AlvrtRrt5hu1oAtC6J70Gx5EJDYq9zP1A/Kpw5TguH4mQE0YLL/8DN+IGyiAd40dbv3mSmAJJ/qjW6+gUaSgrXBE43jKFhBrjGNMdIe4SF3az8Imv9+opac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737826399; c=relaxed/simple;
	bh=ciyp3ZlJLqDq4LuqItwh9HJY/OBJv+8OZRO0Lcc4pBI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LRvnyF3zrMKOd6lh8agnZpVJgMuJejpqFlTWQ8IpPo57wUfnNcHz4Ke4hTiM2Gonp5/WTMvkqIP9NAxM4D65VUiLqDs/z5tZGLYcqjjatGK0Fec+vyAgO8U75NU7Q7VZ8BmcplaI1BCRAWuDmvuZQMd6CJX3SHrL4Z/a31bzafc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ae2M4eaP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ae2M4eaP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F96AC4CED6;
	Sat, 25 Jan 2025 17:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737826398;
	bh=ciyp3ZlJLqDq4LuqItwh9HJY/OBJv+8OZRO0Lcc4pBI=;
	h=From:To:Cc:Subject:Date:From;
	b=Ae2M4eaPsT/Nfi72Z3QHN3V2BvWxqsDk0s3lmlCS2YqgF86n0oH2ZafIfoX/XVfx8
	 j1W6G1WGSu+32fv5204lKjBnwAVPkogWlcYUB7PXeavPll1/WzAGYOctu9Mv/cYUjC
	 obl8Q3uFT2n0wxuz8l9SECYK6FbNQwsl4Wo/Xq48Dtf6qC2wb1FUiF1rftxsufkSBF
	 R7me6UT0On7XMFzQ7dKd6In32pNKJdnHsw3apUWxZPoMMRq54Ugztxo1XTRWniz0yx
	 SjkMREQlYrOEBN5MiqTPpSDO1PIYQKjhoddikh/p8LyUi39UE7I8Gjr+nwkziK4gxC
	 QHEZUHGkghwJA==
From: Bjorn Andersson <andersson@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Beleswar Padhi <b-padhi@ti.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Robin Murphy <robin.murphy@arm.com>
Subject: [GIT PULL] remoteproc updates for v6.14
Date: Sat, 25 Jan 2025 09:39:04 -0800
Message-ID: <20250125173905.1150203-1-andersson@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rproc-v6.14

for you to fetch changes up to 3a53ff95b0be9a5d0ef5037e539558d0041f9a89:

  remoteproc: st: Use syscon_regmap_lookup_by_phandle_args (2025-01-15 10:04:27 -0700)

----------------------------------------------------------------
remoteproc updates for v6.14

Correct error path in rproc_alloc(), with regards to put_device() and
freeing of the rproc index ida. The Mediatek SCP remoteproc driver is
returned to only creating child devices from specific DeviceTree nodes.
OMAP remoteproc driver is updated to match the cleanups in the OMAP
iommu driver.

In addition to this, a number of conversions to devres and other small,
mostly stylistic, code cleanups.

----------------------------------------------------------------
Arnaud Pouliquen (1):
      remoteproc: core: Fix ida_free call while not allocated

Beleswar Padhi (5):
      remoteproc: k3-r5: Add devm action to release reserved memory
      remoteproc: k3-r5: Use devm_kcalloc() helper
      remoteproc: k3-r5: Use devm_ioremap_wc() helper
      remoteproc: k3-r5: Use devm_rproc_add() helper
      remoteproc: k3-r5: Add devm action to release tsp

Chen-Yu Tsai (1):
      remoteproc: mtk_scp: Only populate devices for SCP cores

Krzysztof Kozlowski (5):
      remoteproc: keystone: Simplify returning syscon PTR_ERR
      remoteproc: omap: Simplify returning syscon PTR_ERR
      remoteproc: st: Simplify with dev_err_probe
      remoteproc: keystone: Use syscon_regmap_lookup_by_phandle_args
      remoteproc: st: Use syscon_regmap_lookup_by_phandle_args

Robin Murphy (1):
      remoteproc: omap: Handle ARM dma_iommu_mapping

 drivers/remoteproc/keystone_remoteproc.c | 17 ++----
 drivers/remoteproc/mtk_scp.c             | 12 ++++-
 drivers/remoteproc/omap_remoteproc.c     | 24 +++++++--
 drivers/remoteproc/remoteproc_core.c     | 14 ++---
 drivers/remoteproc/st_remoteproc.c       | 54 ++++++++------------
 drivers/remoteproc/ti_k3_r5_remoteproc.c | 88 +++++++++++++-------------------
 6 files changed, 97 insertions(+), 112 deletions(-)
