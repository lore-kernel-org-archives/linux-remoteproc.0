Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00081A0BD0;
	Sat, 14 Feb 2026 18:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771093666; cv=none; b=M9kphMuhZgFHjnb4taFDgpOLI/L0QD/PONjylVJmgmHbDH0OMWS22KmCmowQzLjF02ML1dJtDizjJr9BRdKljsHhW7FRc+xWfGPUIfrptvDWlWZ0m1B0VCn3woxOVLG3uhpnhBoHqBt1vPayUUqQ/VfY6Ig7LLeSGBhXcWUtPbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771093666; c=relaxed/simple;
	bh=du+p6YB2HazQxY6Ao0NIINpDdPs2vE5HeELXEgZEeoI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dGP5sb5B3uxgoANrgOgaMs9Er2H/MH4KuPyrhHTaBrTqz4c1p9lrtghVf50VOcWYKYrjS6Y7PxbJFzq+sDVUCxNOvB2oHq73z7lDPCTI6rOfLHd3MdQIzF9uQWABqtj1aiODYWMBF4ZN/ZMvKodceLKD2aY1eoswHE6fcuHB2eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s/5eD2Is; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s/5eD2Is"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69A26C16AAE;
	Sat, 14 Feb 2026 18:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771093666;
	bh=du+p6YB2HazQxY6Ao0NIINpDdPs2vE5HeELXEgZEeoI=;
	h=From:To:Cc:Subject:Date:From;
	b=s/5eD2IsRK1qKvPkYE/R7mY/gqWDSh/xHUKFn8J7fRKvoD5ytu91bbHcl3FPTxHAR
	 SUfZKoLivq/6tYj02yuD/URgkXjsYbhHTRaaUE/UcD1DhQ5lw6LPUISWhq2ciwfCHG
	 4Y+mr4u3bg3FRW4wDQ8v9DNhKsLbAcctxa+tm1EHdn8/q/MPZ9GozG0jLf46hkHUXa
	 khrYf6zbWDJ/aIdFiXtqo56cINbVvudubYmfSwX7dRnw9NlED4eA/6UbGxpzqOEMmT
	 ZxAg9RFUxX4C11MhKoADQhnKVpSeudasLO7znzMxoW1+j3R75jDtqYX4FNJalfxq+0
	 2NdwUz9aRD2xw==
From: Bjorn Andersson <andersson@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Peng Fan <peng.fan@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Beleswar Padhi <b-padhi@ti.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Soham Metha <sohammetha01@gmail.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Subject: [GIT PULL] remoteproc updates for v7.0
Date: Sat, 14 Feb 2026 12:27:44 -0600
Message-ID: <20260214182744.3718339-1-andersson@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rproc-v7.0

for you to fetch changes up to 26aa5295010ffaebcf8f1991c53fa7cf2ee1b20d:

  remoteproc: imx_rproc: Fix invalid loaded resource table detection (2026-02-03 09:23:12 -0700)

----------------------------------------------------------------
remoteproc updates for v7.0

Fix a memory remapping issue and make a few life-cycle improvements in
the i.MX HiFi remoteproc driver.

Add support the System Manager CPU and LMM APIs and use this to support i.MX95.

Rework the handling of the Mediatek SCP clock to avoid a potential
circular deadlock in the clock providers.

Refactor the Qualcomm secure-world helpers and add support in the
Qualcomm PAS remoteproc driver for reading a resource-table from secure
world. Use this to configure the IOMMU on newer targets where Linux runs
in EL2.

----------------------------------------------------------------
Beleswar Padhi (1):
      dt-bindings: remoteproc: Add HSM M4F core on TI K3 SoCs

Bjorn Andersson (1):
      Merge branch '20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into rproc-next

Daniel Baluta (1):
      remoteproc: imx_dsp_rproc: Fix multiple start/stop operations

Iuliana Prodan (3):
      remoteproc: imx_dsp_rproc: Skip RP_MBOX_SUSPEND_SYSTEM when mailbox TX channel is uninitialized
      remoteproc: imx_dsp_rproc: Rename macro to reflect multiple contexts
      remoteproc: imx_dsp_rproc: Wait for suspend ACK only if WAIT_FW_CONFIRMATION is set

Krzysztof Kozlowski (4):
      dt-bindings: remoteproc: qcom,adsp: Allow cx-supply on qcom,sdm845-slpi-pas
      dt-bindings: remoteproc: qcom,sm8550-pas: Drop SM8750 ADSP from if-branch
      remoteproc: mtk_scp: Simplify with scoped for each OF child loop
      remoteproc: xlnx_r5: Simplify with scoped for each OF child loop

Mukesh Ojha (13):
      dt-bindings: remoteproc: qcom,pas: Add iommus property
      firmware: qcom_scm: Remove redundant piece of code
      firmware: qcom_scm: Rename peripheral as pas_id
      firmware: qcom_scm: Introduce PAS context allocator helper function
      remoteproc: pas: Replace metadata context with PAS context structure
      soc: qcom: mdtloader: Add PAS context aware qcom_mdt_pas_load() function
      soc: qcom: mdtloader: Remove qcom_mdt_pas_init() from exported symbols
      firmware: qcom_scm: Add a prep version of auth_and_reset function
      firmware: qcom_scm: Refactor qcom_scm_pas_init_image()
      firmware: qcom_scm: Add SHM bridge handling for PAS when running without QHEE
      firmware: qcom_scm: Add qcom_scm_pas_get_rsc_table() to get resource table
      remoteproc: pas: Extend parse_fw callback to fetch resources via SMC call
      remoteproc: qcom: pas: Enable Secure PAS support with IOMMU managed by Linux

Peng Fan (7):
      dt-bindings: remoteproc: fsl,imx-rproc: Add support for i.MX95
      remoteproc: imx_rproc: Add runtime ops copy to support dynamic behavior
      remoteproc: imx_rproc: Introduce prepare ops for imx_rproc_dcfg
      remoteproc: imx_rproc: Add support for System Manager LMM API
      remoteproc: imx_rproc: Add support for System Manager CPU API
      remoteproc: imx_rproc: Add support for i.MX95
      remoteproc: imx_rproc: Fix invalid loaded resource table detection

Shengjiu Wang (1):
      remoteproc: imx_dsp_rproc: Only reset carveout memory at RPROC_OFFLINE state

Shenwei Wang (1):
      remoteproc: imx_rproc: Use strstarts for "rsc-table" check

Soham Metha (1):
      dt-bindings: remoteproc: Fix dead link to Keystone DSP GPIO binding

Tzung-Bi Shih (1):
      remoteproc: mediatek: Break lock dependency to `prepare_lock`

 .../bindings/remoteproc/fsl,imx-rproc.yaml         |   1 +
 .../devicetree/bindings/remoteproc/qcom,adsp.yaml  |   5 +
 .../bindings/remoteproc/qcom,pas-common.yaml       |   3 +
 .../bindings/remoteproc/qcom,sm8550-pas.yaml       |   1 -
 .../bindings/remoteproc/ti,hsm-m4fss.yaml          |  72 ++++
 .../bindings/remoteproc/ti,keystone-rproc.txt      |   2 +-
 drivers/firmware/qcom/qcom_scm.c                   | 380 ++++++++++++++++++---
 drivers/firmware/qcom/qcom_scm.h                   |   1 +
 drivers/remoteproc/Kconfig                         |   2 +
 drivers/remoteproc/imx_dsp_rproc.c                 |  95 ++++--
 drivers/remoteproc/imx_rproc.c                     | 255 +++++++++++++-
 drivers/remoteproc/imx_rproc.h                     |   4 +
 drivers/remoteproc/mtk_scp.c                       |  46 ++-
 drivers/remoteproc/mtk_scp_ipi.c                   |   4 +-
 drivers/remoteproc/qcom_q6v5_pas.c                 | 165 +++++++--
 drivers/remoteproc/xlnx_r5_remoteproc.c            |   9 +-
 drivers/soc/qcom/mdt_loader.c                      |  51 ++-
 include/linux/firmware/qcom/qcom_scm.h             |  30 +-
 include/linux/soc/qcom/mdt_loader.h                |  22 +-
 19 files changed, 959 insertions(+), 189 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,hsm-m4fss.yaml
