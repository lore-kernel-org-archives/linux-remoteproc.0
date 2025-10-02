Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6705979CD;
	Thu,  2 Oct 2025 13:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759413322; cv=none; b=XQbhuXLsmCjx7zW8RUI1p3p7kiDo1YV7LtTV5HEmNcINQhUHI0LbPblLy3opVPQWJuoHjeKHIXwlPqU9CSamAGYFkpmoE72qeWgTk00ULS63EhO+kEL/JGEI0GEaTHhG28poruXhKT0prl2jDbQWJgA8d1yF3S/nytkAFYEUGCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759413322; c=relaxed/simple;
	bh=Oehkg71iGQrBKcwJhZmgGeAtCS+lbF/c/nrjeCqyQ+A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I/iMRgjR8xYf04r6XR4/WlzqQYxZJ2x6fJMpNZUet7owkVaKWOzmlCWtdF8hjm+OzX+KiTP4vPqTrD7lsCZTCILmfBBwH9OYImN5T0Y/STExXJlVNhG0OJpv7AlIcZIOkc9DGn99Obe5+vmmygT231WmXLCoiTqzvNfRBC4bHVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wsj7Kf+7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wsj7Kf+7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23FB5C4CEF4;
	Thu,  2 Oct 2025 13:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759413322;
	bh=Oehkg71iGQrBKcwJhZmgGeAtCS+lbF/c/nrjeCqyQ+A=;
	h=From:To:Cc:Subject:Date:From;
	b=Wsj7Kf+7bzgYCruf2m1MNtWQZKQCo/ieAn1h22OPWdMQJJwP2xUZGqb8mipVV4n5e
	 uWtHMYajQdWnSs9TFD/jGj+NmnWiHKo5qlMp1DrIhGJdsHk225wFKVzkKmc84MmmcT
	 oZ4PG0DXJM5WKKQuhJDyVpsMtTmWLRbQR7fsHsFTGqujGeSuu9FzQOxmLO5VCbo4j0
	 c5xekjrldfbHGaSdpZey6irah4Bu4kHZ4hS37v8yAPDOyceaeBRm8BkgJygquj/zDY
	 VYv7uV7WRee3BzhylfxXWY5f9JZUowYtKKf7uoA3GE+/PnF4/Iy8xPSLh8++8iUpQD
	 RGtDK12wkm7Eg==
From: Bjorn Andersson <andersson@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrew Davis <afd@ti.com>,
	Peng Fan <peng.fan@nxp.com>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Zhen Ni <zhen.ni@easystack.cn>
Subject: [GIT PULL] remoteproc updates for v6.18
Date: Thu,  2 Oct 2025 08:55:18 -0500
Message-ID: <20251002135520.63777-1-andersson@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9:

  Linux 6.17-rc2 (2025-08-17 15:22:10 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rproc-v6.18

for you to fetch changes up to d41e075b077142bb9ae5df40b9ddf9fd7821a811:

  remoteproc: pru: Fix potential NULL pointer dereference in pru_rproc_set_ctable() (2025-09-23 11:49:58 -0600)

----------------------------------------------------------------
remoteproc updates for v6.18

Enable coredump support for the i.MX HiFi core remoteproc, and clean up
the i.MX remoteproc driver.

Introduce remoteprocs on the Qualcomm Milos platform. Gracefully shut own
the ADSP remoteproc when bootloader has loaded the "Lite" firmware on X
Elite. Improve the resource handover procedure to avoid possibly duplicate
handling.

Transition the TI DA8xx, TI Keystone, and TI Wakeup M3 remoteproc
drivers to handle resources using devres.

----------------------------------------------------------------
Andrew Davis (12):
      remoteproc: da8xx: Use devm_rproc_alloc() helper
      remoteproc: da8xx: Use devm action to release reserved memory
      remoteproc: da8xx: Use devm_rproc_add() helper
      remoteproc: keystone: Use devm action to release reserved memory
      remoteproc: keystone: Use devm_pm_runtime_enable() helper
      remoteproc: keystone: Use devm action to call PM runtime put sync
      remoteproc: keystone: Use devm_gpiod_get() helper
      remoteproc: keystone: Use devm_rproc_add() helper
      remoteproc: wkup_m3: Use devm_pm_runtime_enable() helper
      remoteproc: wkup_m3: Use devm action to call PM runtime put sync
      remoteproc: wkup_m3: Use devm_rproc_alloc() helper
      remoteproc: wkup_m3: Use devm_rproc_add() helper

Christophe JAILLET (1):
      remoteproc: k3: Correctly release some resources allocated in k3_rproc_request_mbox()

Dmitry Baryshkov (1):
      remoteproc: qcom_q6v5_mss: support loading MBN file on msm8974

Hiago De Franco (1):
      remoteproc: k3: Remove remote processor mailbox ping

Luca Weiss (2):
      dt-bindings: remoteproc: qcom,milos-pas: Document remoteprocs
      remoteproc: qcom: pas: Add Milos remoteproc support

Peng Fan (6):
      remoteproc: imx_rproc: Introduce start/stop/detect_mode ops for imx_rproc_dcfg
      remoteproc: imx_rproc: Move imx_rproc_dcfg closer to imx_rproc_of_match
      remoteproc: imx_rproc: Simplify IMX_RPROC_MMIO switch case
      remoteproc: imx_rproc: Simplify IMX_RPROC_SCU_API switch case
      remoteproc: imx_rproc: Simplify IMX_RPROC_SMC switch case
      remoteproc: imx_rproc: Clean up after ops introduction

Shengjiu Wang (1):
      remoteproc: imx_dsp_rproc: Add support of recovery and coredump process

Stephan Gerhold (4):
      remoteproc: qcom: q6v5: Avoid disabling handover IRQ twice
      remoteproc: qcom: q6v5: Avoid handling handover twice
      remoteproc: qcom: pas: Shutdown lite ADSP DTB on X1E
      remoteproc: qcom: pas: Drop redundant assignment to ret

Zhen Ni (1):
      remoteproc: pru: Fix potential NULL pointer dereference in pru_rproc_set_ctable()

 .../bindings/remoteproc/qcom,milos-pas.yaml        | 198 +++++++++
 drivers/remoteproc/da8xx_remoteproc.c              |  57 +--
 drivers/remoteproc/imx_dsp_rproc.c                 |  45 ++-
 drivers/remoteproc/imx_rproc.c                     | 449 ++++++++++++---------
 drivers/remoteproc/imx_rproc.h                     |   7 +
 drivers/remoteproc/keystone_remoteproc.c           |  95 ++---
 drivers/remoteproc/pru_rproc.c                     |   3 +-
 drivers/remoteproc/qcom_q6v5.c                     |   8 +-
 drivers/remoteproc/qcom_q6v5_mss.c                 |  11 +-
 drivers/remoteproc/qcom_q6v5_pas.c                 |  32 +-
 drivers/remoteproc/ti_k3_common.c                  |  21 +-
 drivers/remoteproc/ti_k3_dsp_remoteproc.c          |   2 -
 drivers/remoteproc/ti_k3_r5_remoteproc.c           |   2 -
 drivers/remoteproc/wkup_m3_rproc.c                 |  69 ++--
 14 files changed, 635 insertions(+), 364 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml
