Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1072A1586CB;
	Tue, 23 Jul 2024 18:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721759156; cv=none; b=tqfW/vW2uNfivQjdiL9IFzS5nAH/DDaKLHlbASv/Bh5YgicnnXMRt/ZIFR0PXqxZoO68M1f3AKmF9DH+Rj3R/aTbLQLSmpD/arn2LxUgi2yqGqDniRmC1B0x4V2HEO8eTfiCzHmAc3hZG/25rQ9PkguBdXVW+J/vIcrJ5d509TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721759156; c=relaxed/simple;
	bh=x9z+uZAhMiXilQAQxen4cFx/yp8mqqLvfg7ImTRBxIs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=is9pWNFjEfRIl6/DTtKn/Ox7J98AdBBDG+yc4cWaak5A7+CHlgrf9Rgi0YP+EfK95c5Y3TC+raxC624I2Gc3wHZUtBq+SE/aO800qhohx23q5LgcIE05IK2YZPpK1r2aRbjzWOW1EWT6NSsUxmJT3RpAugCEjRn3VVUCqQ0/TKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FN42yMv0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FN42yMv0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3571C4AF09;
	Tue, 23 Jul 2024 18:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721759155;
	bh=x9z+uZAhMiXilQAQxen4cFx/yp8mqqLvfg7ImTRBxIs=;
	h=From:To:Cc:Subject:Date:From;
	b=FN42yMv0ejndL9iA9HGkMimmU71cfVL89mj8cvaumsBH9Od52CgOhe3iiiPprZrh/
	 YW4mbKEGAFkaRLqUcrWPf9kPceBWwApPxoYyDZd3NGltTSPkAeMP7Zw8w9zYsK56p7
	 njh7wJspRpW6k5HE2p0C7XYDYC4oWNZYWqylg6PeNvS81WEFaLDW+kEkHAZzUy1wa5
	 OXQpcI4cjJ5dpkrZbDodsvCJPNG030YuXCdgdsKfVqgC+yy7QBbzCc9dmdVjPfI0H3
	 CzFdvcUtV4AOz8GKOnCd4D/CRI1MDxW5Sjd3KnvR4N7+bynQupRrJRmK3gSMV5I2Li
	 2BH2S4JCwMfgw==
From: Bjorn Andersson <andersson@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Andrew Davis <afd@ti.com>,
	Richard Maina <quic_rmaina@quicinc.com>,
	Aleksandr Mishin <amishin@t-argos.ru>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chris Lew <quic_clew@quicinc.com>,
	Frank Li <Frank.Li@nxp.com>,
	Garrett Giordano <ggiordano@phytec.com>,
	Hari Nagalla <hnagalla@ti.com>,
	Jason Chen <Jason-ch.Chen@mediatek.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Tanmay Shah <tanmay.shah@amd.com>
Subject: [GIT PULL] remoteproc updates for v6.11
Date: Tue, 23 Jul 2024 11:30:41 -0700
Message-ID: <20240723183042.3696037-1-andersson@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rproc-v6.11

for you to fetch changes up to 19cb6058620620e68f1a9aed99393be5c3629db4:

  remoteproc: mediatek: Increase MT8188/MT8195 SCP core0 DRAM size (2024-07-08 09:57:16 -0600)

----------------------------------------------------------------
remoteproc updates for v6.11

The maximum amount of DDR memory used by the Mediatek MT8188/MT8195 SCP
is increased, to handle new use cases. Handling of optional L1TCM memory
is made actually optional.
An optimization is introduced to only clear the unused portion of IPI
shared buffers, rather than the entire buffer before writing the
message.

Detection for IPC-only mode in the TI K3 DSP remoteproc driver is
corrected. The loglevel of a debug print in the same is lowered from
error.

Support for attaching to an running remote processor is added to the
Xilinx R5F.

An in-kernel implementation of the Qualcomm "protected domain mapper"
(aka service registry) service is introduced, to remove the dependency
on a userspace implementation to detect when the battery monitor and USB
Type-C port manager becomes available. This is then integrated with the
Qualcomm remoteproc driver.

The Qualcomm PAS remoteproc driver gains support for attempting to bust
hwspinlocks held by the remote processor when it crashed/stopped.

The TI OMAP remoteproc driver is transitioned to use devres helpers for
various forms of allocations.

Parsing of memory-regions in the i.MX remoteproc driver is improved to
avoid a NULL pointer dereference if the phandle reference is empty.
of_node reference counting is corrected in the same.

----------------------------------------------------------------
Aleksandr Mishin (2):
      remoteproc: imx_rproc: Skip over memory region when node value is NULL
      remoteproc: imx_rproc: Fix refcount mistake in imx_rproc_addr_init

Andrew Davis (3):
      remoteproc: omap: Use devm_rproc_alloc() helper
      remoteproc: omap: Use devm action to release reserved memory
      remoteproc: omap: Use devm_rproc_add() helper

AngeloGioacchino Del Regno (1):
      remoteproc: mediatek: Zero out only remaining bytes of IPI buffer

Bjorn Andersson (2):
      Merge branch '20240529-hwspinlock-bust-v3-2-c8b924ffa5a2@quicinc.com' into rproc-next
      Merge branch '20240622-qcom-pd-mapper-v9-0-a84ee3591c8e@linaro.org' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into rproc-next

Chris Lew (1):
      soc: qcom: smem: Add qcom_smem_bust_hwspin_lock_by_host()

Dmitry Baryshkov (6):
      soc: qcom: pdr: protect locator_addr with the main mutex
      soc: qcom: pdr: fix parsing of domains lists
      soc: qcom: pdr: extract PDR message marshalling data
      soc: qcom: add pd-mapper implementation
      remoteproc: qcom: enable in-kernel PD mapper
      remoteproc: qcom: select AUXILIARY_BUS

Frank Li (1):
      dt-bindings: remoteproc: imx_rproc: Add minItems for power-domain

Garrett Giordano (1):
      remoteproc: k3-dsp: Fix log levels where appropriate

Hari Nagalla (1):
      dt-bindings: remoteproc: k3-dsp: Correct optional sram properties for AM62A SoCs

Jason Chen (1):
      remoteproc: mediatek: Increase MT8188/MT8195 SCP core0 DRAM size

Nícolas F. R. A. Prado (1):
      remoteproc: mediatek: Don't attempt to remap l1tcm memory if missing

Richard Genoud (1):
      remoteproc: k3-r5: Fix IPC-only mode detection

Richard Maina (3):
      hwspinlock: Introduce hwspin_lock_bust()
      hwspinlock: qcom: implement bust operation
      remoteproc: qcom_q6v5_pas: Add hwspinlock bust on stop

Tanmay Shah (1):
      remoteproc: xlnx: Add attach detach support

 .../bindings/remoteproc/fsl,imx-rproc.yaml         |  15 +
 .../bindings/remoteproc/ti,k3-dsp-rproc.yaml       |  89 +--
 Documentation/locking/hwspinlock.rst               |  11 +
 drivers/hwspinlock/hwspinlock_core.c               |  28 +
 drivers/hwspinlock/hwspinlock_internal.h           |   3 +
 drivers/hwspinlock/qcom_hwspinlock.c               |  25 +
 drivers/remoteproc/Kconfig                         |   1 +
 drivers/remoteproc/imx_rproc.c                     |  10 +-
 drivers/remoteproc/mtk_scp.c                       |  23 +-
 drivers/remoteproc/omap_remoteproc.c               |  46 +-
 drivers/remoteproc/qcom_common.c                   |  87 +++
 drivers/remoteproc/qcom_common.h                   |  10 +
 drivers/remoteproc/qcom_q6v5_adsp.c                |   3 +
 drivers/remoteproc/qcom_q6v5_mss.c                 |   3 +
 drivers/remoteproc/qcom_q6v5_pas.c                 |  14 +
 drivers/remoteproc/qcom_q6v5_wcss.c                |   3 +
 drivers/remoteproc/ti_k3_dsp_remoteproc.c          |   2 +-
 drivers/remoteproc/ti_k3_r5_remoteproc.c           |  13 +-
 drivers/remoteproc/xlnx_r5_remoteproc.c            | 151 +++++
 drivers/soc/qcom/Kconfig                           |  15 +
 drivers/soc/qcom/Makefile                          |   2 +
 drivers/soc/qcom/pdr_interface.c                   |   8 +-
 drivers/soc/qcom/pdr_internal.h                    | 318 +---------
 drivers/soc/qcom/qcom_pd_mapper.c                  | 677 +++++++++++++++++++++
 drivers/soc/qcom/qcom_pdr_msg.c                    | 353 +++++++++++
 drivers/soc/qcom/smem.c                            |  26 +
 include/linux/hwspinlock.h                         |   6 +
 include/linux/soc/qcom/smem.h                      |   2 +
 28 files changed, 1562 insertions(+), 382 deletions(-)
 create mode 100644 drivers/soc/qcom/qcom_pd_mapper.c
 create mode 100644 drivers/soc/qcom/qcom_pdr_msg.c
