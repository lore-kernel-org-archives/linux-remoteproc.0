Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D24212D8A;
	Mon,  2 Jun 2025 15:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748878633; cv=none; b=AkGpfB4Qm1d0RejuwftvgVgW67udqQZWReD3a3u0yp26JeqRvBv6NeewgvZHW41K9wEJkgUCjKhYA3sN9+xh7sOLvoKN5OtMuymUwfP+nNQKM9DkzyUcqeo1KzZisBM9oz0blG/0KXbtPDvOQHDkm1HVizC5YF/1bprzu8bOd3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748878633; c=relaxed/simple;
	bh=iLVn1HXm8BcU24Gao1meuqf82wyqfJbGKL+FZ3VLebU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f1NBTg0LCdMPE174DKPsUoslZy+xSWUfuMN8Ctd2Q3d6KeeQ37zet2NUszIo/Ymind2xD+zEJJRLdxHjJE6/Wu135ngq9Hch7pb5UBMGOeFdbAM/dRZNaprOHW9qfbV0yDIWRNcHU5sf8Olh4z1ZXNv3n0VRxGJWz20yN5TasyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cmsD1JiB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cmsD1JiB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47782C4CEEB;
	Mon,  2 Jun 2025 15:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748878633;
	bh=iLVn1HXm8BcU24Gao1meuqf82wyqfJbGKL+FZ3VLebU=;
	h=From:To:Cc:Subject:Date:From;
	b=cmsD1JiBvgSUCl64K3XoVRxIYSXXof9N126xrp4lmYP6vyFS2X7HZAL4TwPc2hJRW
	 q0KlV/Tzg1RM1/d8uqw1VQAqNTy1zGmQ7hFgBpEu/atBT8MGTjWEASL6BTJmTF6JJ9
	 XApzlsxKq64pwQ31PLkT+5kyGCNv9eokEXTIr2ThrltJegWIWAgH9CnL5sAs22/Y7S
	 PZgOtMQ8tYzhwAl7HTHGwOfN1e9VoyGvvn/qGsBETg9qxTjnYOymSVL/HAAtNonI9Q
	 uxG7AQmIilXkZ2fH+AsbEoeNA3rPDcQo18BCI1ltuLM4UYCYtdxdZWd1yf07Jy7ETS
	 9G7n2/A/4tcyA==
From: Bjorn Andersson <andersson@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Beleswar Padhi <b-padhi@ti.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Xiaolei Wang <xiaolei.wang@windriver.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Tanmay Shah <tanmay.shah@amd.com>
Subject: [GIT PULL] remoteproc updates for v6.16
Date: Mon,  2 Jun 2025 10:37:09 -0500
Message-ID: <20250602153710.3447-1-andersson@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rproc-v6.16

for you to fetch changes up to 5779f6f9a64ffc3e002a37ab1f78521d9a5c0100:

  remoteproc: k3: Refactor release_tsp() functions into common driver (2025-05-20 11:19:12 -0600)

----------------------------------------------------------------
remoteproc updates for v6.16

Fix resource cleanup in the remoteproc attach error handling code paths.

Refactor the various TI K3 drivers to extract and reuse common code
between them.

Add support in the i.MX remoteproc driver for determining from the
firmware if Linux should wait on a "firmware ready" signal at startup.

Improve the Xilinx R5F power down mechanism to handle use cases where
this is shared with other entities in the system.

----------------------------------------------------------------
Arnaud Pouliquen (2):
      dt-bindings: remoteproc: stm32-rproc: Add firmware-name property
      remoteproc: stm32_rproc: Allow to specify firmware default name

Beleswar Padhi (34):
      remoteproc: k3-r5: Refactor sequential core power up/down operations
      remoteproc: k3-m4: Don't assert reset in detach routine
      remoteproc: k3-r5: Re-order internal memory initialization functions
      remoteproc: k3-r5: Re-order k3_r5_release_tsp() function
      remoteproc: k3-r5: Refactor Data Structures to Align with DSP and M4
      remoteproc: k3-r5: Use k3_r5_rproc_mem_data structure for memory info
      remoteproc: k3-{m4/dsp}: Add a void ptr member in rproc internal struct
      remoteproc: k3-m4: Add pointer to rproc struct within k3_m4_rproc
      remoteproc: k3-m4: Use k3_rproc_mem_data structure for memory info
      remoteproc: k3: Refactor shared data structures
      remoteproc: k3: Refactor mailbox rx_callback functions into common driver
      remoteproc: k3: Refactor .kick rproc ops into common driver
      remoteproc: k3-dsp: Correct Reset logic for devices without lresets
      remoteproc: k3-m4: Introduce central function to put rproc into reset
      remoteproc: k3: Refactor rproc_reset() implementation into common driver
      remoteproc: k3-dsp: Correct Reset deassert logic for devices w/o lresets
      remoteproc: k3-m4: Introduce central function to release rproc from reset
      remoteproc: k3: Refactor rproc_release() implementation into common driver
      remoteproc: k3-m4: Ping the mbox while acquiring the channel
      remoteproc: k3: Refactor rproc_request_mbox() implementations into common driver
      remoteproc: k3-dsp: Don't override rproc ops in IPC-only mode
      remoteproc: k3-dsp: Assert local reset during .prepare callback
      remoteproc: k3: Refactor .prepare rproc ops into common driver
      remoteproc: k3: Refactor .unprepare rproc ops into common driver
      remoteproc: k3: Refactor .start rproc ops into common driver
      remoteproc: k3: Refactor .stop rproc ops into common driver
      remoteproc: k3: Refactor .attach rproc ops into common driver
      remoteproc: k3: Refactor .detach rproc ops into common driver
      remoteproc: k3: Refactor .get_loaded_rsc_table ops into common driver
      remoteproc: k3: Refactor .da_to_va rproc ops into common driver
      remoteproc: k3: Refactor of_get_memories() functions into common driver
      remoteproc: k3: Refactor mem_release() functions into common driver
      remoteproc: k3: Refactor reserved_mem_init() functions into common driver
      remoteproc: k3: Refactor release_tsp() functions into common driver

Bjorn Andersson (1):
      Revert "remoteproc: core: Clear table_sz when rproc_shutdown"

Dan Carpenter (1):
      remoteproc: qcom_wcnss_iris: Add missing put_device() on error in probe

Iuliana Prodan (1):
      remoteproc: imx_dsp_rproc: Add support for DSP-specific features

Konrad Dybcio (1):
      dt-bindings: remoteproc: qcom,sm8350-pas: Add SC8280XP

Krzysztof Kozlowski (1):
      dt-bindings: remoteproc: qcom,sm8150-pas: Add missing SC8180X compatible

Siddharth Vadapalli (2):
      remoteproc: k3-r5: Drop check performed in k3_r5_rproc_{mbox_callback/kick}
      remoteproc: k3-dsp: Drop check performed in k3_dsp_rproc_{mbox_callback/kick}

Tanmay Shah (1):
      remoteproc: xlnx: Avoid RPU force power down

Xiaolei Wang (2):
      remoteproc: core: Cleanup acquired resources when rproc_handle_resources() fails in rproc_attach()
      remoteproc: core: Release rproc->clean_table after rproc_attach() fails

 .../bindings/remoteproc/qcom,sm8150-pas.yaml       |    3 +
 .../bindings/remoteproc/qcom,sm8350-pas.yaml       |   54 +-
 .../bindings/remoteproc/st,stm32-rproc.yaml        |    4 +
 drivers/remoteproc/Makefile                        |    6 +-
 drivers/remoteproc/imx_dsp_rproc.c                 |   98 +-
 drivers/remoteproc/qcom_wcnss_iris.c               |    2 +
 drivers/remoteproc/remoteproc_core.c               |    7 +-
 drivers/remoteproc/stm32_rproc.c                   |    8 +-
 drivers/remoteproc/ti_k3_common.c                  |  551 +++++++++++
 drivers/remoteproc/ti_k3_common.h                  |  118 +++
 drivers/remoteproc/ti_k3_dsp_remoteproc.c          |  616 +-----------
 drivers/remoteproc/ti_k3_m4_remoteproc.c           |  583 +----------
 drivers/remoteproc/ti_k3_r5_remoteproc.c           | 1018 +++++++-------------
 drivers/remoteproc/xlnx_r5_remoteproc.c            |   34 +-
 14 files changed, 1266 insertions(+), 1836 deletions(-)
 create mode 100644 drivers/remoteproc/ti_k3_common.c
 create mode 100644 drivers/remoteproc/ti_k3_common.h
