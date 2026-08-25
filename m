Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A685B37F33C;
	Tue, 25 Aug 2026 20:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787688873; cv=none; b=ifCVY4acagfwafwXbbE8hl66UC5uRNHdtKFiOiFEDI5vIsAin1jAZN003+SeK0hjM4SrK6Qyvm4vKPt62RPt/HX0JIO3QwYtHd26mUSQJPaqRPyzHoshjzrNuNMuWoi1apScx5SwEZqr0WGUoFfhEZjKnu/YBgcjr3Enr1dv3GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787688873; c=relaxed/simple;
	bh=nTWX5nKv1U0A9ofvMljV5NND7RVuXOIzZ9w3ZqQhd/o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n9dHmDKawiOd/iBYzYHDc1peUiDa4yDbOfX7+X/Vxnu2UUViBkv3KJhp/5cDFYbvokCPtZZ3859/sldu4Cu0n6VFgfHB7oGQD1LVPqblqCAf3lAoAUYDyHq6Bg6vv6iGb2tHHioPCIolhV2PFbYBitrKUykhFmS7K+nGYZPt+7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nkLDoF+7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nkLDoF+7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA6251F000E9;
	Tue, 25 Aug 2026 20:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787688871;
	bh=cOM/+oZcVDiMLK1rVpARBhh1nUM0coB53gKTKXFEZ7k=;
	h=From:To:Cc:Subject:Date;
	b=nkLDoF+7oRI8DyoHU4bQQtRujAP2eOFRWkERj4fTszX3LLmhpEJ2b4zpPUgtC446g
	 X0sHLJsDvzT61ryWAacxzgBzrJwm0fKs/n4df3iFA77iTWU3YtwPpel5I1PxUbTzFg
	 Q1guojPpZLkE/4uZzvOffDPsuhnuumocWTHDagP9tjUI/sRArJAbrJLYt87axPW2Qj
	 TQ+gpBeJEffc8iginlXxFvlorUljlPbsBP9bRc1SQLAfZN6He/0eRAWYXVj3j5QBjX
	 qIBHRIXnXQW0CTQp27+wZa1c/eyN1kMl/MOxYuHC6ppviyygCFGJag/ecqHaWaEOPo
	 7AMluRrVsgvyg==
From: Bjorn Andersson <andersson@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Ben Levinsky <ben.levinsky@amd.com>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Sumit Garg <sumit.garg@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Tanmay Shah <tanmay.shah@amd.com>,
	Ananthu C V <ananthu.cv@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Shawn Guo <shengchao.guo@oss.qualcomm.com>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	Bhargav Joshi <j.bhargav.u@gmail.com>,
	Felix Gu <gu_0233@qq.com>,
	Johan Hovold <johan@kernel.org>,
	Pan Chuang <panchuang@vivo.com>,
	Rob Herring <robh@kernel.org>,
	Uday Khare <udaykhare77@gmail.com>,
	Val Packett <val@packett.cool>,
	Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
	Yijie Yang <yijie.yang@oss.qualcomm.com>
Subject: [GIT PULL] remoteproc updates for v7.3
Date: Tue, 25 Aug 2026 15:14:28 -0500
Message-ID: <20260825201428.925639-1-andersson@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rproc-v7.3

for you to fetch changes up to bb840ea69347aff7bde5a208e7b5b180669a7656:

  remoteproc: fix OOB read via signed offset in rsc_table_for_each_entry() (2026-08-04 17:32:02 -0500)

----------------------------------------------------------------
remoteproc updates for v7.3

Add a remoteproc driver and binding for AMD MicroBlaze/V soft cores
executing from dual-port BRAM, with clock and reset control and support
for firmware without a resource table.

Introduce a generic Qualcomm PAS service with SCM and OP-TEE backends,
and migrate the PAS, MSS, and WCNSS remoteproc drivers to it. Add Nord
ADSP and CDSP support, Eliza CDSP support, Maili ADSP/CDSP bindings, and
late-attach SoCCP support for Kaanapali, Hawi, Maili, and Glymur. Enable
BAM-DMUX child devices for PAS modems and fix PAS memory protection,
handover, shutdown, and resource lifetime handling.

Harden remoteproc lifecycle handling by attaching asynchronously,
stopping crashed processors, synchronizing crash work with removal, and
forcing shutdown before device resources are released. Reallocate
resources during attach recovery and fix several reference and error-path
leaks.

Add Xilinx R5 crash detection and move RPU start and stop sequencing into
the platform firmware driver. Consolidate write-combining carveout
mapping callbacks, use correct I/O-memory accessors, and share optional
ELF resource-table handling across drivers.

Convert the TI Wakeup M3 binding to DT schema, correct Qualcomm and
generic remoteproc bindings, and harden resource-table iteration against
signed-offset out-of-bounds accesses.

----------------------------------------------------------------
Abel Vesa (5):
      remoteproc: qcom: q6v5: Make handover IRQ one-shot
      dt-bindings: remoteproc: qcom,sm8550-pas: Add Eliza CDSP compatible
      remoteproc: qcom: pas: Add Eliza CDSP support
      dt-bindings: remoteproc: qcom,milos-pas: Move Eliza ADSP to SM8550 schema
      arm64: dts: qcom: eliza: Add fallback compatible for ADSP remoteproc

Ananthu C V (2):
      remoteproc: qcom: pas: add needs_tzmem flag to trigger shmbridge creation
      dt-bindings: remoteproc: qcom: move glymur SoCCP pas to standalone

Ben Levinsky (8):
      remoteproc: Add common wc-ioremap carveout callbacks
      remoteproc: Switch exact-match drivers to wc-ioremap callbacks
      remoteproc: Mark wc-ioremap carveouts as iomem
      remoteproc: Add helper for optional ELF resource tables
      remoteproc: Switch drivers to optional resource-table helper
      remoteproc: guard wc-ioremap helpers with HAS_IOMEM
      dt-bindings: remoteproc: Document AMD MicroBlaze/V BRAM-based rproc
      remoteproc: Add AMD MicroBlaze/V BRAM-based remote processor driver

Bhargav Joshi (1):
      dt-bindings: remoteproc: ti,wkup-m3: Convert to DT schema

Bjorn Andersson (5):
      Merge branch '20260702115835.167602-2-sumit.garg@kernel.org' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into rproc-next
      remoteproc: Allow shutdown of crashed processors
      remoteproc: Prevent crash handling to race with rproc_del()
      remoteproc: Force shutdown during device removal
      remoteproc: qcom: q6v5: Request shutdown if crash is triggered host-side

Felix Gu (1):
      remoteproc: qcom_q6v5_adsp: Fix reference leak for device node

Jingyi Wang (8):
      dt-bindings: remoteproc: qcom: cleanup qcom,adsp.yaml
      dt-bindings: remoteproc: qcom: move interrupts and interrupt-names list out of pas-common
      dt-bindings: remoteproc: qcom: Document pas for SoCCP on Kaanapali and Glymur platforms
      remoteproc: qcom: pas: Add late attach support for subsystems
      remoteproc: qcom_q6v5_pas: Add SoCCP node on Kaanapali
      remoteproc: core: Attach rproc asynchronously in rproc_add() path via schedule_work()
      remoteproc: qcom: Check subdev start status in rproc_stop()
      remoteproc: core: cancel crash_handler work in rproc_add() error path

Johan Hovold (1):
      remoteproc: scp: Fix device reference leak on failed lookup

Krzysztof Kozlowski (2):
      remoteproc: ti_k3_r5: Drop redundant NULL check on reset control get
      dt-bindings: remoteproc: Drop redundant $ref of firmware-name property

Mukesh Ojha (11):
      dt-bindings: remoteproc: qcom: Document pas for SoCCP on Hawi and Maili SoC
      remoteproc: qcom: annotate mem_region fields with __iomem
      remoteproc: qcom: pas: Guard dtb metadata release with dtb_pas_id check
      remoteproc: qcom: pas: Fix the PAS context creation placement
      remoteproc: qcom: pas: Map/unmap subsystem region before auth_and_reset
      remoteproc: qcom: pas: Drop unused dtb_mem_region field
      MAINTAINERS: add rsc_table.h to remoteproc entry
      remoteproc: fix coding style issues in remoteproc.h
      remoteproc: replace BSD blurb with SPDX identifier in remoteproc.h
      remoteproc: replace BSD blurb with SPDX identifier in rsc_table.h
      remoteproc: fix OOB read via signed offset in rsc_table_for_each_entry()

Pan Chuang (1):
      remoteproc: Remove redundant dev_err()/dev_err_probe()

Rob Herring (Arm) (1):
      remoteproc: Use presence checks for syscon props

Shawn Guo (2):
      dt-bindings: remoteproc: qcom,nord-pas: Document Nord PAS
      remoteproc: qcom: pas: Add Nord ADSP and CDSP support

Stephan Gerhold (2):
      remoteproc: qcom_q6v5_mss: Make ssctl_id configurable per platform
      remoteproc: qcom_q6v5_mss: Fix MDM9607 subsystem control instance ID

Sumit Garg (8):
      firmware: qcom: Add a generic PAS service
      firmware: qcom_scm: Migrate to generic PAS service
      firmware: qcom: Add a PAS TEE service
      MAINTAINERS: Add maintainer entry for Qualcomm PAS TZ service
      remoteproc: qcom_q6v5_pas: Switch over to generic PAS TZ APIs
      remoteproc: qcom_q6v5_mss: Switch to generic PAS TZ APIs
      remoteproc: qcom_wcnss: Switch to generic PAS TZ APIs
      remoteproc: qcom: Select QCOM_PAS generic service

Tanmay Shah (3):
      remoteproc: xlnx: Refactor start & stop ops
      remoteproc: core: Full attach detach during recovery
      remoteproc: xlnx: Add crash detection mechanism

Uday Khare (1):
      remoteproc: qcom: Fix glink->node reference leak in qcom_add_glink_subdev

Val Packett (1):
      remoteproc: qcom_wcnss: Fix handling the lack of PD regulators in v3

Vishnu Santhosh (1):
      remoteproc: qcom_q6v5_pas: Create platform device for BAM-DMUX

Yijie Yang (1):
      dt-bindings: remoteproc: qcom,sm8550-pas: Add Qualcomm Maili ADSP and CDSP

 .../bindings/remoteproc/amd,bram-rproc.yaml        | 105 +++++
 .../remoteproc/amlogic,meson-mx-ao-arc.yaml        |   2 +-
 .../devicetree/bindings/remoteproc/qcom,adsp.yaml  |  82 ++--
 .../remoteproc/qcom,kaanapali-soccp-pas.yaml       | 156 +++++++
 .../bindings/remoteproc/qcom,milos-pas.yaml        |  29 +-
 .../bindings/remoteproc/qcom,nord-pas.yaml         | 173 ++++++++
 .../bindings/remoteproc/qcom,pas-common.yaml       |  28 +-
 .../bindings/remoteproc/qcom,qcs404-pas.yaml       |  22 +-
 .../bindings/remoteproc/qcom,sa8775p-pas.yaml      |  22 +-
 .../bindings/remoteproc/qcom,sc7180-pas.yaml       |  28 ++
 .../bindings/remoteproc/qcom,sc8280xp-pas.yaml     |  28 ++
 .../bindings/remoteproc/qcom,sdx55-pas.yaml        |  24 +-
 .../bindings/remoteproc/qcom,shikra-pas.yaml       |  20 +
 .../bindings/remoteproc/qcom,sm6115-pas.yaml       |  28 ++
 .../bindings/remoteproc/qcom,sm6350-pas.yaml       |  28 ++
 .../bindings/remoteproc/qcom,sm6375-pas.yaml       |  28 ++
 .../bindings/remoteproc/qcom,sm8150-pas.yaml       |  28 ++
 .../bindings/remoteproc/qcom,sm8350-pas.yaml       |  28 ++
 .../bindings/remoteproc/qcom,sm8550-pas.yaml       |  55 +++
 .../bindings/remoteproc/ti,am3352-wkup-m3.yaml     |  89 ++++
 .../bindings/remoteproc/ti,pru-consumer.yaml       |   1 -
 .../bindings/remoteproc/wkup_m3_rproc.txt          |  52 ---
 MAINTAINERS                                        |  10 +
 arch/arm64/boot/dts/qcom/eliza.dtsi                |   2 +-
 drivers/firmware/qcom/Kconfig                      |  22 +-
 drivers/firmware/qcom/Makefile                     |   2 +
 drivers/firmware/qcom/qcom_pas.c                   | 298 +++++++++++++
 drivers/firmware/qcom/qcom_pas.h                   |  50 +++
 drivers/firmware/qcom/qcom_pas_tee.c               | 479 +++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c                   | 335 +++++++-------
 drivers/firmware/xilinx/zynqmp.c                   |  93 ++++
 drivers/remoteproc/Kconfig                         |  13 +-
 drivers/remoteproc/Makefile                        |   1 +
 drivers/remoteproc/amd_mbv_bram_rproc.c            | 213 +++++++++
 drivers/remoteproc/da8xx_remoteproc.c              |   2 +-
 drivers/remoteproc/imx_dsp_rproc.c                 |  41 +-
 drivers/remoteproc/imx_rproc.c                     |  40 +-
 drivers/remoteproc/ingenic_rproc.c                 |   4 +-
 drivers/remoteproc/keystone_remoteproc.c           |   6 +-
 drivers/remoteproc/mtk_scp.c                       |  13 +-
 drivers/remoteproc/omap_remoteproc.c               |   2 +-
 drivers/remoteproc/qcom_common.c                   |   4 +-
 drivers/remoteproc/qcom_common.h                   |   6 +
 drivers/remoteproc/qcom_q6v5.c                     |  79 ++--
 drivers/remoteproc/qcom_q6v5.h                     |   4 +
 drivers/remoteproc/qcom_q6v5_adsp.c                |   7 +-
 drivers/remoteproc/qcom_q6v5_mss.c                 |  24 +-
 drivers/remoteproc/qcom_q6v5_pas.c                 | 373 +++++++++++++---
 drivers/remoteproc/qcom_sysmon.c                   |  21 +-
 drivers/remoteproc/qcom_wcnss.c                    |  45 +-
 drivers/remoteproc/rcar_rproc.c                    |  41 +-
 drivers/remoteproc/remoteproc_core.c               | 145 +++++--
 drivers/remoteproc/remoteproc_internal.h           |  54 +++
 drivers/remoteproc/remoteproc_sysfs.c              |   1 -
 drivers/remoteproc/st_remoteproc.c                 |  31 +-
 drivers/remoteproc/stm32_rproc.c                   |  42 +-
 drivers/remoteproc/ti_k3_r5_remoteproc.c           |   8 +-
 drivers/remoteproc/xlnx_r5_remoteproc.c            | 204 ++++-----
 drivers/soc/qcom/mdt_loader.c                      |  27 +-
 include/linux/firmware/qcom/qcom_pas.h             |  55 +++
 include/linux/firmware/xlnx-zynqmp.h               |  12 +
 include/linux/remoteproc.h                         |  55 +--
 include/linux/rsc_table.h                          |  46 +-
 include/linux/soc/qcom/mdt_loader.h                |  10 +-
 64 files changed, 3105 insertions(+), 871 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml
 create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,am3352-wkup-m3.yaml
 delete mode 100644 Documentation/devicetree/bindings/remoteproc/wkup_m3_rproc.txt
 create mode 100644 drivers/firmware/qcom/qcom_pas.c
 create mode 100644 drivers/firmware/qcom/qcom_pas.h
 create mode 100644 drivers/firmware/qcom/qcom_pas_tee.c
 create mode 100644 drivers/remoteproc/amd_mbv_bram_rproc.c
 create mode 100644 include/linux/firmware/qcom/qcom_pas.h
