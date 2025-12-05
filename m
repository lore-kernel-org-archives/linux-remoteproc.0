Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E155C2E5405;
	Fri,  5 Dec 2025 19:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764964645; cv=none; b=l1TwS++lS0NF03WKv4erM0tSuce/rUpO9dndOLAA5ffR+81vT83S0eU9N0Kiig1kT/5/EzcbsAhL1lnV3yMAQrB21+K8ZU1UdpA+jg5WeCddR20cvkulz/1gcpr2j2o3VjX0enViMZN7hYv3AQmOjfgEOsoq3bu5JPjzYdpxEbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764964645; c=relaxed/simple;
	bh=9wieTBYTS9qbnt0IsesCuAdVpiPQaww8mwfsIfkX/vI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hYSb5OfBYMYdJen/O54S7ucbhPy8TdkljRB3b7Cs/N3ulnAA1Y+/L5r1ZdAls7pqK/+P3BZ2YkmnsZmYSFhE+4IbDOyt/IgZA3e2iNLiwwB2VhZQI4a3eeY5DxRSTzQgSwYRb7+z18xfRqzeCps2tD87IesjRvcjK7AodkgW1Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L3d7SPaS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L3d7SPaS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25587C4CEF1;
	Fri,  5 Dec 2025 19:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764964644;
	bh=9wieTBYTS9qbnt0IsesCuAdVpiPQaww8mwfsIfkX/vI=;
	h=From:To:Cc:Subject:Date:From;
	b=L3d7SPaSjxKB1BVWwnEvnuHuinQ55hUAWcMnYIgETmo2Pa3OM5fKVtVcKZerIGX86
	 rwisCD789vrjSLLNcwBObKNO+hO2KjJDcEV2Wb9Mq7HdjgB3jMBxPE6ysn3iy4s++k
	 hnOZSdjND8F3dB00TYK3XPKkk+oJLaSbSY2ZDlNJhQCoyZOwcC9he8vN5z7CrpacvG
	 YLI3s/QYWVrx9Yf21BuzE8WtawpByeVrGJh0ZcmTY/tMk6oUZolf7lRtzfjMmPfzzv
	 J96t1+9bOVFYHDDBe4gkF6QquqkOYLWAdWa5ZLF6N1klVNbN5xANzRLS0dnd+pQVoY
	 MROKYDJogJgtg==
From: Bjorn Andersson <andersson@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Nickolay Goppen <setotau@mainlining.org>,
	Alexandru Gagniuc <mr.nuke.me@gmail.com>,
	Luca Weiss <luca@lucaweiss.eu>,
	Rob Herring <robh@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [GIT PULL] remoteproc updates for v6.19
Date: Fri,  5 Dec 2025 14:03:42 -0600
Message-ID: <20251205200342.119676-1-andersson@kernel.org>
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

  https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rproc-v6.19

for you to fetch changes up to 641092c1bc1bbc3be059d9d723b1cec10a368617:

  remoteproc: qcom_q6v5_wcss: use optional reset for wcss_q6_bcr_reset (2025-11-29 15:20:23 -0600)

----------------------------------------------------------------
remoteproc updates for v6.19

Add support for the compute DSP in the Qualcomm SDM660 platform, and
finally fix up the way MSM8974 audio DSP remoteproc driver manages its
power rails.

Replace the usage of of_reserved_mem_lookup() with
of_reserved_mem_region_to_resource() to clean things up across most of
the drivers.

Perform a variety of housekeeping and cleanup work across iMX, Mediatek,
and TI remoteproc drivers.

----------------------------------------------------------------
Alexandru Gagniuc (2):
      remoteproc: qcom_q6v5_wcss: fix parsing of qcom,halt-regs
      remoteproc: qcom_q6v5_wcss: use optional reset for wcss_q6_bcr_reset

AngeloGioacchino Del Regno (1):
      remoteproc: mtk_scp: Construct FW path if firmware-name not present

Bjorn Andersson (1):
      remoteproc: st: Fix indexing of memory-regions

Dan Carpenter (6):
      remoteproc: mediatek: Change the snprintf() checking
      remoteproc: imx_dsp_rproc: Fix NULL vs IS_ERR() bug in imx_dsp_rproc_add_carveout()
      remoteproc: qcom_q6v5_adsp: Fix a NULL vs IS_ERR() check in adsp_alloc_memory_region()
      remoteproc: qcom: pas: Fix a couple NULL vs IS_ERR() bugs
      remoteproc: qcom: q6v5: Fix NULL vs IS_ERR() bug in q6v5_alloc_memory_region()
      remoteproc: qcom_wcnss: Fix NULL vs IS_ERR() bug in wcnss_alloc_memory_region()

Konrad Dybcio (1):
      dt-bindings: remoteproc: qcom,sc8280xp-pas: Fix CDSP power desc

Luca Weiss (2):
      dt-bindings: remoteproc: qcom,adsp: Make msm8974 use CX as power domain
      remoteproc: qcom_q6v5_pas: Use resource with CX PD for MSM8974

Nickolay Goppen (3):
      dt-bindings: remoteproc: qcom: adsp: Add missing constrains for SDM660 ADSP
      dt-bindings: remoteproc: qcom: adsp: Add SDM660 CDSP compatible
      remoteproc: qcom: pas: Add support for SDM660 CDSP

Peng Fan (26):
      remoteproc: imx_rproc: Fix runtime PM cleanup and improve remove path
      remoteproc: imx_rproc: Use devm_add_action_or_reset() for workqueue cleanup
      remoteproc: imx_rproc: Use devm_add_action_or_reset() for mailbox cleanup
      remoteproc: imx_rproc: Use devm_clk_get_enabled() and simplify cleanup
      remoteproc: imx_rproc: Use devm_add_action_or_reset() for scu cleanup
      remoteproc: imx_rproc: Use devm_rproc_add() helper
      remoteproc: imx_rproc: Simplify clock enable logic using dcfg flags
      remoteproc: imx_rproc: Make detach operation platform-specific
      remoteproc: imx_rproc: Enable PM runtime support unconditionally
      remoteproc: imx_rproc: Remove the assignement to method
      remoteproc: core: Drop redundant initialization of 'ret' in rproc_shutdown()
      remoteproc: core: Sort header includes
      remoteproc: core: Removed unused headers
      remoteproc: core: Remove unused export of rproc_va_to_pa
      remoteproc: imx_dsp_rproc: Simplify power domain attach and error handling
      remoteproc: imx_dsp_rproc: Use devm_rproc_add() helper
      remoteproc: imx_dsp_rproc: Use devm_pm_runtime_enable() helper
      remoteproc: imx_dsp_rproc: Use dev_err_probe() for firmware and mode errors
      remoteproc: imx_dsp_rproc: Drop extra space
      remoteproc: imx_dsp_rproc: Use start/stop/detect_mode ops from imx_rproc_dcfg
      remoteproc: imx_dsp_rproc: Move imx_dsp_rproc_dcfg closer to imx_dsp_rproc_of_match
      remoteproc: imx_dsp_rproc: Simplify IMX_RPROC_MMIO switch case
      remoteproc: imx_dsp_rproc: Simplify IMX_RPROC_SCU_API switch case
      remoteproc: imx_dsp_rproc: Simplify IMX_RPROC_RESET_CONTROLLER switch case
      remoteproc: imx_rproc: Remove enum imx_rproc_method
      remoteproc: imx_dsp_rproc: Simplify start/stop error handling

Rob Herring (Arm) (2):
      remoteproc: Use of_reserved_mem_region_* functions for "memory-region"
      remoteproc: qcom: Use of_reserved_mem_region_* functions for "memory-region"

Sakari Ailus (1):
      remoteproc: omap: Remove redundant pm_runtime_mark_last_busy() calls

 .../devicetree/bindings/remoteproc/qcom,adsp.yaml  |  26 +-
 .../bindings/remoteproc/qcom,sc8280xp-pas.yaml     |   4 +
 drivers/remoteproc/imx_dsp_rproc.c                 | 404 +++++++++++----------
 drivers/remoteproc/imx_rproc.c                     | 238 +++++-------
 drivers/remoteproc/imx_rproc.h                     |  16 +-
 drivers/remoteproc/mtk_scp.c                       |  65 +++-
 drivers/remoteproc/omap_remoteproc.c               |   3 -
 drivers/remoteproc/qcom_q6v5_adsp.c                |  29 +-
 drivers/remoteproc/qcom_q6v5_mss.c                 |  60 +--
 drivers/remoteproc/qcom_q6v5_pas.c                 |  80 ++--
 drivers/remoteproc/qcom_q6v5_wcss.c                |  40 +-
 drivers/remoteproc/qcom_wcnss.c                    |  27 +-
 drivers/remoteproc/rcar_rproc.c                    |  38 +-
 drivers/remoteproc/remoteproc_core.c               |  31 +-
 drivers/remoteproc/st_remoteproc.c                 |  44 ++-
 drivers/remoteproc/stm32_rproc.c                   |  46 +--
 drivers/remoteproc/ti_k3_common.c                  |  28 +-
 drivers/remoteproc/xlnx_r5_remoteproc.c            |  53 +--
 18 files changed, 570 insertions(+), 662 deletions(-)
