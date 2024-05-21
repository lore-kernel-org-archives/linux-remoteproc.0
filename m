Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512A712E71;
	Tue, 21 May 2024 03:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716260850; cv=none; b=SqmiMNqYhbznDiqzVhUmSTmmybbOX1Apd0Wyfcyjj1OqRbIwG8CaMS5vI6UTt+VyXHVD4iIU9C2re+n9ytjumqXbAZEzbAqtkmgKb0kAnjlt1r/JpJz2cGk/LgUUXcBkxqX1iBfN6jjatNvgiPE96E3iQ5g5jP4jlXBVP49oDL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716260850; c=relaxed/simple;
	bh=vEd79klzMu+zXxA36ZyoEIFWyZeEXCjN1gTxWpfDYJU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AIXbh5GYkgD1nBorSdHjgt3k2ZMq/+tCBWod065/5IHEpq1CBMjL1MYf1utgSsjsKKTrN5Q0g9SZ/xiw2ewF5RR1h1EAOMQQc5YjpkH7uVDVHyAFZDHvvA8h2D0xIc4ejObdfC2ERGXd83sxrgJOavLebCN4WVf43WwKniy8M9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tYxRUIlL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tYxRUIlL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8382C2BD10;
	Tue, 21 May 2024 03:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716260849;
	bh=vEd79klzMu+zXxA36ZyoEIFWyZeEXCjN1gTxWpfDYJU=;
	h=From:To:Cc:Subject:Date:From;
	b=tYxRUIlLUxfTbilHW90OZgh2Xy8TfUn8o4d+bzDudrtGoRKJ/JKL6yZfxmkMCVNpm
	 hKL8FonW62Eckn0/htLchsqLx8uCj8Vg/PLSo9/07g8gKYh7vp7jJPIB1gDcDqmaEF
	 SZQi38uvtnSOTm+yB4poxiUKCWxlye22zgyBCwUTjNaNpiczlcSvPYA086coivSkTe
	 rUL6lPOz0ay2wf9VGe5s2pb8hdz+0k+NqULCm5U+Cr+TSd3TDvgmRKQKCpRw/XMTJx
	 KaA6kUbrn1hCv1JSsL/kQtjLkUVFpYnPO8jqfUgWfZ0Ym9CAwqXd1LDhhcgbQZClqd
	 gZ7Es71EHMYFw==
From: Bjorn Andersson <andersson@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tanmay Shah <tanmay.shah@amd.com>,
	Luca Weiss <luca@z3ntu.xyz>,
	Olivia Wen <olivia.wen@mediatek.com>,
	Beleswar Padhi <b-padhi@ti.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Apurva Nandan <a-nandan@ti.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Leonard Crestez <leonard.crestez@nxp.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	"Ricardo B . Marliere" <ricardo@marliere.net>
Subject: [GIT PULL] remoteproc updates for v6.10
Date: Mon, 20 May 2024 20:12:20 -0700
Message-ID: <20240521031222.236250-1-andersson@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rproc-v6.10

for you to fetch changes up to 4d5ba6ead1dc9fa298d727e92db40cd98564d1ac:

  dt-bindings: remoteproc: qcom,sdm845-adsp-pil: Fix qcom,halt-regs definition (2024-05-06 19:41:38 -0700)

----------------------------------------------------------------
remoteproc updates for v6.10

This makes the remoteproc core rproc_class const.

DeviceTree bindings for a few different Qualcomm remoteprocs are updated
to remove a range of validation warnings/errors.  The Qualcomm SMD
binding marks qcom,ipc deprecated, in favor or the mailbox interface.

The TI K3 R5 remoteproc driver is updated to ensure that cores are
powered up in the appropriate order. The driver also see a couple of
fixes related to cleanups in error paths during probe.

The Mediatek remoteproc driver is extended to support the MT8188 SCP
core 1. Support for varying DRAM and IPI shared buffer sizes are
introduced. This together with a couple of bug fixes and improvements to
the driver.

Support for the AMD-Xilinx Versal and Versal-NET platforms are added.
Coredump support and support for parsing TCM information from DeviceTree
is added to the Xilinx R5F remoteproc driver.

----------------------------------------------------------------
AngeloGioacchino Del Regno (1):
      remoteproc: mediatek: Make sure IPI buffer fits in L2TCM

Apurva Nandan (1):
      remoteproc: k3-r5: Wait for core0 power-up before powering up core1

Beleswar Padhi (2):
      remoteproc: k3-r5: Do not allow core1 to power up before core0 via sysfs
      remoteproc: k3-r5: Jump to error handling labels in start/stop errors

Dan Carpenter (1):
      remoteproc: mediatek: Fix error code in scp_rproc_init()

Dmitry Baryshkov (1):
      dt-bindings: remoteproc: qcom,msm8996-mss-pil: allow glink-edge on msm8996

Leonard Crestez (1):
      remoteproc: zynqmp: Add coredump support

Luca Weiss (4):
      dt-bindings: remoteproc: qcom,smd-edge: Mark qcom,ipc as deprecated
      dt-bindings: remoteproc: qcom,qcs404-cdsp-pil: Fix qcom,halt-regs definition
      dt-bindings: remoteproc: qcom,sc7280-wpss-pil: Fix qcom,halt-regs definition
      dt-bindings: remoteproc: qcom,sdm845-adsp-pil: Fix qcom,halt-regs definition

Olivia Wen (4):
      dt-bindings: remoteproc: mediatek: Support MT8188 dual-core SCP
      remoteproc: mediatek: Support MT8188 SCP core 1
      remoteproc: mediatek: Support setting DRAM and IPI shared buffer sizes
      remoteproc: mediatek: Add IMGSYS IPI command

Radhey Shyam Pandey (1):
      dt-bindings: remoteproc: Add Tightly Coupled Memory (TCM) bindings

Ricardo B. Marliere (1):
      remoteproc: Make rproc_class constant

Tanmay Shah (5):
      remoteproc: zynqmp: fix lockstep mode memory region
      remoteproc: zynqmp: parse TCM from device tree
      drivers: remoteproc: xlnx: Add Versal and Versal-NET support
      drivers: remoteproc: xlnx: Fix uninitialized variable use
      drivers: remoteproc: xlnx: Fix uninitialized tcm mode

 .../devicetree/bindings/remoteproc/mtk,scp.yaml    |   2 +
 .../bindings/remoteproc/qcom,msm8996-mss-pil.yaml  |   1 -
 .../bindings/remoteproc/qcom,qcs404-cdsp-pil.yaml  |   6 +-
 .../bindings/remoteproc/qcom,sc7280-wpss-pil.yaml  |   6 +-
 .../bindings/remoteproc/qcom,sdm845-adsp-pil.yaml  |   6 +-
 .../bindings/remoteproc/qcom,smd-edge.yaml         |   3 +-
 .../bindings/remoteproc/xlnx,zynqmp-r5fss.yaml     | 279 +++++++++++++++--
 drivers/remoteproc/mtk_common.h                    |  11 +-
 drivers/remoteproc/mtk_scp.c                       | 241 +++++++++++++--
 drivers/remoteproc/mtk_scp_ipi.c                   |   7 +-
 drivers/remoteproc/remoteproc_internal.h           |   2 +-
 drivers/remoteproc/remoteproc_sysfs.c              |   2 +-
 drivers/remoteproc/ti_k3_r5_remoteproc.c           |  58 +++-
 drivers/remoteproc/xlnx_r5_remoteproc.c            | 329 ++++++++++-----------
 include/linux/remoteproc/mtk_scp.h                 |   1 +
 15 files changed, 721 insertions(+), 233 deletions(-)
