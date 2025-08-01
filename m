Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A37C1F5EA;
	Fri,  1 Aug 2025 19:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754077987; cv=none; b=ec4wpy7qeYkkFwlOfschkHRbsl0sziuZwKruXCBMtEgp3a+PfGifJdyaIE1urI1pB8SWY5r+ug/im147//8mhpaioxz8ZiCT0k4L+GS2XpylMW9cNMoSb7DKXl0HHMNe3d+Tlp/6yOudVHnHf2f7Uk3MB6kWiQuRdmSF6xwp/3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754077987; c=relaxed/simple;
	bh=Ci4OX2WgPtXe8Uov/x7CfGCBso6vH5ggZ1FzK5AkVJY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aVxHvYtygKUZURj1L3D3N6VqcWVQ1kmku2dAnZThbCTjrA+DJ9fT6sOH6JZUIwUfbkDvNqUIUUI5WGS4WbZZI+0QqoaiA6ai4YCHAyKfh+RuuY9Fk39zw7acImWN8sot2fczbkbnEcoYSqKyzoR2Jsi/3RPUFvHSDAf3AOGKAys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ek4r3opA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ek4r3opA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57661C4CEE7;
	Fri,  1 Aug 2025 19:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754077986;
	bh=Ci4OX2WgPtXe8Uov/x7CfGCBso6vH5ggZ1FzK5AkVJY=;
	h=From:To:Cc:Subject:Date:From;
	b=ek4r3opALSdoSBip2WqD2DMjtOQees6zjYXdchCkLF84ZSZRJWlSOJng+q2d7Jme1
	 Y+zck+egvaiLMTZoPWcBpBqBIr6/9xyZS0DP4bifcYYtnZBb4k5Pdph/3tmiAvJtmR
	 P389mIq0JXr1L5NCQXhTAiSGq52vE82pztg6FGIPOIM2SRtFz8frfHA4/khfR3Wlpt
	 kdOrf8yWPj2my5v5KBE8Z5LwqVsdMtzcN2UryVeYFG5CRcu+kbuPNSK6Q8AelWOSth
	 FpzMmhnSmpebxyBnXo8UwxxDqmRF0IuITkBgdA/C1Ayfe2GvmUEM71SIDpSTipOEpm
	 yWP+cZBBk5aDQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tanmay Shah <tanmay.shah@amd.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Lijuan Gao <lijuan.gao@oss.qualcomm.com>,
	Lijuan Gao <quic_lijuang@quicinc.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Subject: [GIT PULL] remoteproc updates for v6.17
Date: Fri,  1 Aug 2025 14:53:03 -0500
Message-ID: <20250801195305.996861-1-andersson@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rproc-v6.17

for you to fetch changes up to 1c20224123f41e4f7da44ae020832bdac3f30ec1:

  remoteproc: xlnx: Fix kernel-doc warnings (2025-07-22 09:13:38 -0600)

----------------------------------------------------------------
remoteproc updates for v6.17

Make the Xilinx remoteproc driver support running on only a single core,
disable still unsupported remoteproc features, and stop the remoteproc
on shutdown to facilitate kexec.

Conclude the renaming of the Qualcomm ADSP driver to "PAS" that was
started many years ago.

----------------------------------------------------------------
Bjorn Andersson (1):
      remoteproc: qcom: pas: Conclude the rename from adsp

Lijuan Gao (2):
      dt-bindings: remoteproc: qcom,sm8150-pas: Document QCS615 remoteproc
      dt-bindings: remoteproc: qcom,sa8775p-pas: Correct the interrupt number

Tanmay Shah (4):
      remoteproc: xlnx: Allow single core use in split mode
      remoteproc: xlnx: Add shutdown callback
      remoteproc: xlnx: Disable unsupported features
      remoteproc: xlnx: Fix kernel-doc warnings

Thomas Weißschuh (1):
      remoteproc: Don't use %pK through printk

 .../bindings/remoteproc/qcom,sa8775p-pas.yaml      |   2 +-
 .../bindings/remoteproc/qcom,sm8150-pas.yaml       |  65 ++-
 drivers/remoteproc/Kconfig                         |  11 +-
 drivers/remoteproc/omap_remoteproc.c               |   2 +-
 drivers/remoteproc/pru_rproc.c                     |   2 +-
 drivers/remoteproc/qcom_q6v5_pas.c                 | 621 ++++++++++-----------
 drivers/remoteproc/remoteproc_core.c               |   2 +-
 drivers/remoteproc/remoteproc_virtio.c             |   2 +-
 drivers/remoteproc/st_slim_rproc.c                 |   2 +-
 drivers/remoteproc/ti_k3_common.c                  |   4 +-
 drivers/remoteproc/ti_k3_r5_remoteproc.c           |   2 +-
 drivers/remoteproc/xlnx_r5_remoteproc.c            |  74 ++-
 drivers/rpmsg/virtio_rpmsg_bus.c                   |   2 +-
 13 files changed, 421 insertions(+), 370 deletions(-)
