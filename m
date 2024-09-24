Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46D41805A;
	Tue, 24 Sep 2024 04:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727153061; cv=none; b=r19Ro7tsHDqOPyIc6fKNi6EfT3h2OSDAkD3sDm5D1fUATAnQdWE70qbR6ANGfOO4s/fFs1EwM6Enaw16ulJ0rwrWzPKjqxBcyYdGfkapC/Iw1iGnQE88CNOmkFh1GDKcTApqd6+uJKA8xrObrrTDzQcFua2OIUp8vXKU15s3XRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727153061; c=relaxed/simple;
	bh=Dk+sxud92c3V59tI0lVfNjPWSYFft4rlNJ7x34uuYaE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gWT1YF1V6pDs4YH/6XTDmkE815JsespQ2QcFoaUMtWCA85q5wV3x/r3h2qnkYhX4OEarHNkIHttP2CuK6mAcsggKJaMruwPRxBDx/4iiMhFprfCPPVZQZNmAvMyy6iINjuEIIV/5AJzJiJWmwOy6Ubs4YzRoDDaaqam/hgDeg3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V/9kk41j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V/9kk41j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 296A1C4CEC4;
	Tue, 24 Sep 2024 04:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727153061;
	bh=Dk+sxud92c3V59tI0lVfNjPWSYFft4rlNJ7x34uuYaE=;
	h=From:To:Cc:Subject:Date:From;
	b=V/9kk41jKZ6k8C47KjWpXbegCENPrNrk7+kDNs6/kC1IerjcIOlsjb8JJVuRhUexR
	 b15ARSMHla1cchoWPIAGsvlS7hXTM/WXBwlYm9uqkHh+mSVJzTZzmK1kQovY717igV
	 15qlp2fZ75c9HPj2cv2ovqeAezZoOqDppn8/en9J4J3Hn28FKAgHmgI0e5i8zGiegI
	 ujX2tDnFKz0ekujHaJhuDbyosVW5nAmhYj792XVrLmwbsHvWCb6AMjtFFSMR6Vd1Xh
	 939wfxq6AP796Ea0pwY62IDHVWSNblXK+SByksgnCJyGTdq1ZNyXE3UQPO5sJ0os2g
	 nmVZDkCW63Ijw==
From: Bjorn Andersson <andersson@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>,
	Andrew Davis <afd@ti.com>,
	Beleswar Padhi <b-padhi@ti.com>,
	Zhang Zekun <zhangzekun11@huawei.com>,
	Naina Mehta <quic_nainmeht@quicinc.com>,
	Hari Nagalla <hnagalla@ti.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Martyn Welch <martyn.welch@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Tanmay Shah <tanmay.shah@amd.com>,
	Tengfei Fan <quic_tengfan@quicinc.com>,
	Udit Kumar <u-kumar1@ti.com>
Subject: [GIT PULL] remoteproc updates for v6.12
Date: Mon, 23 Sep 2024 21:47:40 -0700
Message-ID: <20240924044741.3078097-1-andersson@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rproc-v6.12

for you to fetch changes up to 38a0e38b31d3f967525f6414711bed6f14dfa15e:

  remoteporc: ingenic: Use devm_platform_ioremap_resource_byname() (2024-09-09 09:50:54 -0600)

----------------------------------------------------------------
remoteproc updates for v6.12

This adds remoteproc support for the Cortex M4F found in AM62x and AM64x
of the TI K3 family, support for the modem remoteproc in the Qualcomm
SDX75, and audio, compute and general-purpose DSPs of the Qualcomm
SA8775P.

The i.MX remoteproc driver gains support for blocking and non-blocking
mailbox transmissions, followed by the implementation of poweroff and
reboot mechanisms, using the same. This is followed by a few bug fixes
and minor improvements.

A few cleanups and bug fixes for the TI K3 DSP and R5F drivers are
introduced.

Support for mapping SRAM regions into the AMD-Xilinx Zynqmp R5 cores is
added.

The Ingenic, TI DA8xx, TI Keystone, TI K3, ST slim drivers are
simplified using devres helpers for various allocations.

Uses of of_{find,get}_property() are replaced with of_property_present()
where possible.

----------------------------------------------------------------
Andrew Davis (3):
      remoteproc: keystone: Use devm_kasprintf() to build name string
      remoteproc: keystone: Use devm_rproc_alloc() helper
      remoteproc: k3: Factor out TI-SCI processor control OF get function

Beleswar Padhi (3):
      remoteproc: k3-r5: Use devm_rproc_alloc() helper
      remoteproc: k3-r5: Acquire mailbox handle during probe routine
      remoteproc: k3-dsp: Acquire mailbox handle during probe routine

Hari Nagalla (1):
      dt-bindings: remoteproc: k3-m4f: Add K3 AM64x SoCs

Jan Kiszka (1):
      remoteproc: k3-r5: Fix error handling when power-up failed

Krzysztof Kozlowski (1):
      dt-bindings: remoteproc: xlnx,zynqmp-r5fss: Add missing "additionalProperties" on child nodes

Martyn Welch (1):
      remoteproc: k3-m4: Add a remoteproc driver for M4F subsystem

Naina Mehta (2):
      dt-bindings: remoteproc: qcom,sm8550-pas: document the SDX75 PAS
      remoteproc: qcom: pas: Add SDX75 remoteproc support

Peng Fan (6):
      remoteproc: imx_rproc: Correct ddr alias for i.MX8M
      remoteproc: imx_rproc: Use imx specific hook for find_loaded_rsc_table
      remoteproc: imx_rproc: Initialize workqueue earlier
      remoteproc: imx_rproc: Merge TCML/U
      remoteproc: imx_rproc: Allow setting of the mailbox transmit mode
      remoteproc: imx_rproc: Add support for poweroff and reboot

Rob Herring (Arm) (1):
      remoteproc: Use of_property_present()

Tanmay Shah (1):
      remoteproc: xlnx: Add sram support

Tengfei Fan (1):
      remoteproc: qcom: pas: Add support for SA8775p ADSP, CDSP and GPDSP

Udit Kumar (1):
      remoteproc: k3-r5: Delay notification of wakeup event

Zhang Zekun (3):
      remoteproc: st_slim: Use devm_platform_ioremap_resource_byname()
      remoteproc: da8xx: Use devm_platform_ioremap_resource_byname()
      remoteporc: ingenic: Use devm_platform_ioremap_resource_byname()

 .../bindings/remoteproc/qcom,sm8550-pas.yaml       |   3 +
 .../bindings/remoteproc/ti,k3-m4f-rproc.yaml       | 125 ++++
 .../bindings/remoteproc/xlnx,zynqmp-r5fss.yaml     |   1 +
 drivers/remoteproc/Kconfig                         |  13 +
 drivers/remoteproc/Makefile                        |   1 +
 drivers/remoteproc/da8xx_remoteproc.c              |  10 +-
 drivers/remoteproc/imx_dsp_rproc.c                 |   2 +-
 drivers/remoteproc/imx_rproc.c                     |  93 ++-
 drivers/remoteproc/imx_rproc.h                     |   4 +
 drivers/remoteproc/ingenic_rproc.c                 |   3 +-
 drivers/remoteproc/keystone_remoteproc.c           |  21 +-
 drivers/remoteproc/qcom_q6v5_pas.c                 |  93 +++
 drivers/remoteproc/st_slim_rproc.c                 |   6 +-
 drivers/remoteproc/ti_k3_dsp_remoteproc.c          | 108 +---
 drivers/remoteproc/ti_k3_m4_remoteproc.c           | 667 +++++++++++++++++++++
 drivers/remoteproc/ti_k3_r5_remoteproc.c           | 130 ++--
 drivers/remoteproc/ti_sci_proc.h                   |  26 +
 drivers/remoteproc/xlnx_r5_remoteproc.c            | 141 ++++-
 18 files changed, 1225 insertions(+), 222 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,k3-m4f-rproc.yaml
 create mode 100644 drivers/remoteproc/ti_k3_m4_remoteproc.c
