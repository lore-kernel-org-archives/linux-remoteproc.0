Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793197437;
	b=IxbTkMjqgICe+0l6A19cOlDC3YMOrmXDrbNgW4sL/dXEmCU5cA0/RYdgH0exQPZLiH8G
	 NWpNUMzshjhfeRR/nKyNdjPSBDN7phIcqYMDdS0IqasvmSfuGNPEsl2WBkL7q4njdEwCB
	 GAO/eIkH+cM5E8XBXhzBJWPyhnH4IDi5cprY8OtxMfgbfo2znsUymgO/dhVGMVv7wDeE0
	 oBeaK50wkBpK8bHtFchJBecsaWjA59Az6R/TxWINe55j/iITe0dx6Un0889q2JjrTh4jj
	 /FE9T3DZbdybQrqJGeIbOqaTGzQfDsiZf0TcSHuG62A9/+bICcR98I0wwNTOJ189k/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793197437;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rli+5BgvJFUYW9dxHDoQTZKNT+u6yXvrLrSJl3h0Alg=;
	b=PlvU6Z4jjohXhkI+6zTBE7PpnqjEw9ah/74+PmrIk0XLJYVfEgCOuYGiqDr244ECi2Vw
	 7GdtcGC0s+YqKvbT/9TaTK34Gz+QwD4yFfV0ZW0FDbTxqy0zLbs8qmhNxG7liqAEV3pAk
	 bw/4VIQajUtDvnJxCUgG2lZWxyEtoqM1EniVINXqAoQg7jwofqfu1yFbyJk87PXFpdJcM
	 RpCdOR+iA8zFZWkcDQAB5DWaH+Cj648knOsjfsmbnaBUE08ndfsnYQ4SKNwkKGf/sqsv4
	 HcfGPlZyP4HdzmbTxlFrYgBFk12bkSFxoK8z9nHjRgfml+QCa3Lwplag7smag9AU82Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j9Nt9lT5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D693B606A322;
	Wed, 28 Oct 2026 14:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j9Nt9lT5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CDD51F01825;
	Wed, 28 Oct 2026 14:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793197436;
	bh=rli+5BgvJFUYW9dxHDoQTZKNT+u6yXvrLrSJl3h0Alg=;
	h=From:To:Cc:Subject:Date;
	b=j9Nt9lT5mo9/hofHi2fJKrA+C/V6mmsG/lvXo8ad5VN6cyACjX+2zJSKFDbe4p3hv
	 8nUsaYHinUQmcOQsS7XQLtczZA9CrofXr3wBXj64Nk7dHpfL501fVEUgUI9BQujcl0
	 Xy7Wor6kezCrbBtLfdeoKDuAe+ySesP5Qf21A1xOAryYyMvXCuyCiSS/DD10RLscvD
	 M570o+9pv/Smx8IELZI2xbpZviOZwbP1z/ag74MJNkyATkUThj1tccTzb4wVBnPyfj
	 oStlNYdjOmR+02djFP/U/xdk5Ch7RTJZ/diT8zr1hzk5jTZXoO5P1RKzb1b/5qyewH
	 slNsaMchTnJrA==
From: Bjorn Andersson <andersson@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Andrew Davis <afd@ti.com>,
	Francesco Valla <francesco@valla.it>,
	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
	Yonghao Zhang <hyz3367@gmail.com>,
	Rahul T R <r-ravikumar@ti.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Tanmay Shah <tanmay.shah@amd.com>,
	Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>,
	Casey Connolly <casey.connolly@linaro.org>,
	Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>,
	HyeongJun An <sammiee5311@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Marcel Hofmann <marcel.hofmann@ingenics-digital.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Rob Herring <robh@kernel.org>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [GIT PULL] remoteproc updates for v7.4
Date: Wed, 28 Oct 2026 09:23:49 -0500
Message-ID: <20261028142349.19495-1-andersson@kernel.org>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rproc-v7.4

for you to fetch changes up to a6e0c839f999007721d060618b6ca2134dad46a9:

  remoteproc: qcom_q6v5_pas: Add QMI TMD cooling support for Shikra (2026-10-28 08:14:21 -0500)

----------------------------------------------------------------
remoteproc updates for v7.4

Add Qualcomm QMI Thermal Mitigation Device support for PAS-managed
remote processors, with cooling device bindings and configurations for
Hamoa, Kodiak, Lemans, Talos, Monaco, and Shikra CDSP and modem
subsystems as applicable.

Add per-power-domain proxy performance states for Hawi CDSP and update
Hawi, Maili, and SDX75 PAS compatible bindings and the SDX75 device
tree. Correct the Qualcomm ADSP startup timeout.

Fetch auto-boot firmware only once and synchronize boot work with device
removal. Bound ELF section header accesses, improve trace diagnostics,
and update coredump configuration documentation.

Set 48-bit DMA masks for TI K3 DSP and R5 remote processors, correct
mailbox message types, and enable compile testing for more TI drivers.
Fix i.MX address range boundary checks and DSP runtime PM ordering, and
simplify mailbox notification handling.

Harden Xilinx mailbox setup and teardown and avoid sending notifications
when the transmit queue is full. Propagate STM32 optional IRQ lookup
errors and correct the MediaTek MT8188 SCP register binding.

----------------------------------------------------------------
Andrew Davis (3):
      remoteproc: k3: Include what we need and only what we need
      remoteproc: k3-dsp: Fix usage of omap_mbox_message and mbox_msg_t
      remoteproc: Add compile testing for additional TI drivers

Anup Vishwakarma (1):
      remoteproc: qcom_q6v5_adsp: Fix double jiffies conversion in adsp_start()

Casey Connolly (1):
      soc: qcom: Add QMI TMD support for remote thermal mitigation

Dipa Ramesh Mantre (1):
      remoteproc: qcom_q6v5_pas: Add QMI TMD cooling support for Shikra

Francesco Valla (3):
      remoteproc: virtio: Add vdev_to_rsc() helper
      remoteproc: virtio: Replace kmemdup with kmemdup_array
      remoteproc: virtio: Remove stray white space

Gaurav Kohli (3):
      dt-bindings: remoteproc: qcom,pas: add #cooling-cells property
      remoteproc: qcom: pas: add support for TMD thermal cooling devices
      remoteproc: qcom_q6v5_pas: enable QMI TMD cooling support

HyeongJun An (1):
      remoteproc: elf_loader: Bound the section header table

Krzysztof Kozlowski (1):
      dt-bindings: remoteproc: ti,am3352-wkup-m3: Drop redundant reset-names dependency

Marcel Hofmann (1):
      remoteproc: imx_rproc: Allow mappings ending at region boundary

Mukesh Ojha (5):
      dt-bindings: remoteproc: qcom,sm8550-pas: Add Hawi and Maili MPSS as SM8650 fallback
      dt-bindings: remoteproc: qcom,sm8550-pas: Make SDX75 MPSS fallback to SM8650
      arm64: dts: qcom: sdx75: Use SM8650 MPSS as fallback compatible
      dt-bindings: remoteproc: qcom,sm8550-pas: make qcom,hawi-cdsp-pas standalone
      remoteproc: qcom_q6v5_pas: add per-PD proxy performance states for Hawi CDSP

Pengpeng Hou (1):
      remoteproc: imx_dsp: Acquire runtime PM before adding carveouts

Rahul T R (2):
      remoteproc: k3-r5: Set a 48-bit DMA mask for remoteproc device
      remoteproc: k3-dsp: Set a 48-bit DMA mask for remoteproc device

Rob Herring (Arm) (1):
      dt-bindings: remoteproc: Fix MT8188 SCP regs

Runyu Xiao (1):
      remoteproc: xlnx: Initialize mailbox work before requesting channels

Sebastian Andrzej Siewior (2):
      remoteproc: imx_rproc: Invoke the callback directly
      remoteproc: Use %p for pointer formatting

Tanmay Shah (2):
      remoteproc: xlnx: Do not send new mailbox notification
      remoteproc: xlnx: fix typecast warnings

Yonghao Zhang (3):
      remoteproc: sysfs: Fix stale coredump attribute documentation
      remoteproc: core: Set trace buffer name for diagnostics
      remoteproc: core: Fetch the auto-boot firmware only once

bui duc phuc (1):
      remoteproc: stm32_rproc: Propagate errors from optional IRQ lookup

 .../devicetree/bindings/remoteproc/mtk,scp.yaml    |  22 +-
 .../bindings/remoteproc/qcom,pas-common.yaml       |   9 +
 .../bindings/remoteproc/qcom,sm8550-pas.yaml       |  31 +-
 .../bindings/remoteproc/ti,am3352-wkup-m3.yaml     |   1 -
 MAINTAINERS                                        |   8 +
 arch/arm64/boot/dts/qcom/sdx75.dtsi                |   3 +-
 drivers/remoteproc/Kconfig                         |  11 +-
 drivers/remoteproc/imx_dsp_rproc.c                 |   7 +-
 drivers/remoteproc/imx_rproc.c                     |  51 +-
 drivers/remoteproc/omap_remoteproc.c               |  12 +-
 drivers/remoteproc/qcom_q6v5_adsp.c                |   2 +-
 drivers/remoteproc/qcom_q6v5_pas.c                 | 172 +++++-
 drivers/remoteproc/remoteproc_core.c               |  69 +--
 drivers/remoteproc/remoteproc_debugfs.c            |   6 +-
 drivers/remoteproc/remoteproc_elf_loader.c         |  23 +-
 drivers/remoteproc/remoteproc_sysfs.c              |   7 +-
 drivers/remoteproc/remoteproc_virtio.c             |  61 +--
 drivers/remoteproc/stm32_rproc.c                   |   2 +-
 drivers/remoteproc/ti_k3_common.c                  |  10 +-
 drivers/remoteproc/ti_k3_common.h                  |   4 +
 drivers/remoteproc/ti_k3_dsp_remoteproc.c          |   7 +-
 drivers/remoteproc/ti_k3_m4_remoteproc.c           |   4 +-
 drivers/remoteproc/ti_k3_r5_remoteproc.c           |   9 +-
 drivers/remoteproc/xlnx_r5_remoteproc.c            |  23 +-
 drivers/soc/qcom/Kconfig                           |  12 +
 drivers/soc/qcom/Makefile                          |   1 +
 drivers/soc/qcom/qmi_tmd.c                         | 595 +++++++++++++++++++++
 include/dt-bindings/thermal/qcom,pas.h             |  20 +
 include/linux/omap-mailbox.h                       |   5 +-
 include/linux/remoteproc.h                         |   4 +-
 include/linux/soc/qcom/qmi.h                       |   1 +
 include/linux/soc/qcom/qmi_tmd.h                   |  36 ++
 32 files changed, 1032 insertions(+), 196 deletions(-)
 create mode 100644 drivers/soc/qcom/qmi_tmd.c
 create mode 100644 include/dt-bindings/thermal/qcom,pas.h
 create mode 100644 include/linux/soc/qcom/qmi_tmd.h
