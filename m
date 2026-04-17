Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4301C84BC;
	Fri, 17 Apr 2026 20:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776456096; cv=none; b=a8pmQtpO+wjxppTq36bzbT7O4HlmRZXrXW9FahFr61Ow4hlvy0z1OU8pN3ECmcPFV0e+wIR9shl+tGzkkhwtk0yBMFDIupCcFpZuYLmdbBJQpsiTaZ9uTe/Iu8ZRKSwVYG5xiQnif/1XZAYtllUqtYgfTZBDDhqrDinhArMo85s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776456096; c=relaxed/simple;
	bh=vwfjMzm/GROsxUn5anF0PgY/aDt4sTknxhszmicwFG8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qtmVOX2fd1+PN0tgMsjc5ZFra1lyE0CFQ8TC53KH466u7Jt/0ia9AexLSTXFMDlA02Xhp3Kx1Is6uDxcxzHtlEcM0fS2FYLKTbA0bNej3JMp/7hpq+O9z3bjk5KAtRD9SH6+bMYh4y8++mT+xDnsZMuWSfUE7Du6liv7FQKyJFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JwZjWMEr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JwZjWMEr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D0EDC19425;
	Fri, 17 Apr 2026 20:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776456096;
	bh=vwfjMzm/GROsxUn5anF0PgY/aDt4sTknxhszmicwFG8=;
	h=From:To:Cc:Subject:Date:From;
	b=JwZjWMErD2J0QjZAxOzy7q6sf06Qdi73M0wH7m18GZYL+yC4iMB8N738SiPoLzZiN
	 CUBRya83T8jmP9GX+ItFvE1ifOVNztOE3SPgtWQDJ80d7I9Q1swGExiDuyRhtkpusy
	 MkDepeygXWraUjUBHAKbhtTlGgEjxUiOjDEuM7GBRzwuiKwQywr+z0+qxf4CnOFt3a
	 5Fnx+Rox4qn5ur0D0cwH2Lz/NsJABinGcEJHqnYjFB9upxv6ZaI5ozZQA2F8DrhouB
	 0vGi+wyYSqPgMGvq3snZhk7gIzge/M8jd5LNr2pM12+zzSZFYZ/vXi0Nxr/N6KDeWy
	 HPicRSEZh+suw==
From: Bjorn Andersson <andersson@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
	Andrew Davis <afd@ti.com>,
	Chen Ni <nichen@iscas.ac.cn>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Markus Schneider-Pargmann <msp@baylibre.com>,
	Shawn Guo <shengchao.guo@oss.qualcomm.com>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Tanmay Shah <tanmay.shah@amd.com>,
	Anas Iqbal <mohd.abd.6602@gmail.com>,
	Ben Levinsky <ben.levinsky@amd.com>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Stephan Gerhold <stephan@gerhold.net>,
	Tim Michals <tcmichals@yahoo.com>
Subject: [GIT PULL] remoteproc updates for v7.1
Date: Fri, 17 Apr 2026 15:01:32 -0500
Message-ID: <20260417200132.2581415-1-andersson@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rproc-v7.1

for you to fetch changes up to 56c1ec524284805da0181bc6e9ca656c0091b201:

  remoteproc: qcom: pas: Add Eliza ADSP support (2026-04-06 09:49:21 -0500)

----------------------------------------------------------------
remoteproc updates for v7.1

Move requesting of IRQs in TI Keystone driver to probe time instead of
remoteproc start, to allow better handling of errors.

Introduce support for more than 10 entries in the Qualcomm minidump
implementation.

Add audio DSP remoteproc support for the Qualcomm Eliza platform. Add
modem remoteproc support for the Qualcomm MDM9607, MSM8917, MSM8937, and
MSM8940 platforms.

Add list of Qualcomm QMI service ids to the QMI header file, in order to
avoid sprinkling them across the various drivers using them. Migrate
sysmon to use this constant.

Fix several issues related to DeviceTree parsing and mailbox handling in
the Xilinx R5F remote processor driver.

Fix incorrect error checks in reserved memory handling and polish the
code across i.MX and TI drivers.

----------------------------------------------------------------
Abel Vesa (2):
      dt-bindings: remoteproc: qcom,milos-pas: Document Eliza ADSP
      remoteproc: qcom: pas: Add Eliza ADSP support

Anas Iqbal (1):
      remoteproc: use SIZE_MAX in rproc_u64_fit_in_size_t()

Andrew Davis (6):
      remoteproc: da8xx: Use dev_err_probe()
      remoteproc: da8xx: Remove unused local struct data
      remoteproc: da8xx: Reorder resource fetching in probe()
      remoteproc: pru: Use rproc_of_parse_firmware() to get firmware name
      remoteproc: pru: Remove empty remove callback
      remoteproc: keystone: Request IRQs in probe()

Barnabás Czémán (8):
      remoteproc: qcom_q6v5_mss: Introduce need_pas_mem_setup
      dt-bindings: remoteproc: qcom,msm8916-mss-pil: Add MDM9607
      dt-bindings: remoteproc: qcom,msm8916-mss-pil: Add MSM8917
      remoteproc: qcom_q6v5_mss: Add MSM8917
      dt-bindings: remoteproc: qcom,msm8916-mss-pil: Add MSM8937
      remoteproc: qcom_q6v5_mss: Add MSM8937
      dt-bindings: remoteproc: qcom,msm8916-mss-pil: Add MSM8940
      remoteproc: qcom_q6v5_mss: Add MSM8940

Ben Levinsky (1):
      remoteproc: xlnx: Only access buffer information if IPI is buffered

Bjorn Andersson (1):
      Merge branch '20260309230346.3584252-2-daniel.lezcano@oss.qualcomm.com' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into rproc-next

Chen Ni (3):
      remoteproc: imx_rproc: Check return value of regmap_attach_dev() in imx_rproc_mmio_detect_mode()
      remoteproc: imx_rproc: Fix NULL vs IS_ERR() bug in imx_rproc_addr_init()
      remoteproc: k3: Fix NULL vs IS_ERR() bug in k3_reserved_mem_init()

Daniel Lezcano (2):
      soc: qcom: qmi: Enumerate the service IDs of QMI
      remoteproc: sysmon: Use the unified QMI service ID instead of defining it locally

Jingyi Wang (2):
      dt-bindings: remoteproc: qcom,sm8550-pas: Add Kaanapali ADSP
      dt-bindings: remoteproc: qcom,sm8550-pas: Add Kaanapali CDSP

Markus Schneider-Pargmann (TI) (2):
      dt-bindings: remoteproc: k3-r5f: Split up memory regions
      dt-bindings: remoteproc: k3-r5f: Add memory-region-names

Mukesh Ojha (1):
      remoteproc: qcom: Fix minidump out-of-bounds access on subsystems array

Shawn Guo (2):
      dt-bindings: remoteproc: qcom: Drop types for firmware-name
      remoteproc: qcom: Add missing space before closing bracket

Sibi Sankar (2):
      dt-bindings: remoteproc: qcom,sm8550-pas: Add Glymur ADSP
      dt-bindings: remoteproc: qcom,sm8550-pas: Add Glymur CDSP

Stephan Gerhold (1):
      remoteproc: qcom_q6v5_mss: Add MDM9607

Tanmay Shah (2):
      remoteproc: xlnx: Avoid mailbox setup
      remoteproc: xlnx: Release mailbox channels on shutdown

Tim Michals (1):
      remoteproc: xlnx: Fix sram property parsing

 .../bindings/remoteproc/qcom,milos-pas.yaml        |   3 +
 .../bindings/remoteproc/qcom,msm8916-mss-pil.yaml  |  14 +-
 .../bindings/remoteproc/qcom,msm8996-mss-pil.yaml  |   1 -
 .../bindings/remoteproc/qcom,sa8775p-pas.yaml      |   1 -
 .../bindings/remoteproc/qcom,sc7180-mss-pil.yaml   |   1 -
 .../bindings/remoteproc/qcom,sc7280-mss-pil.yaml   |   1 -
 .../bindings/remoteproc/qcom,sc8280xp-pas.yaml     |   2 +-
 .../bindings/remoteproc/qcom,sdx55-pas.yaml        |   2 +-
 .../bindings/remoteproc/qcom,sm8550-pas.yaml       |  15 +-
 .../bindings/remoteproc/ti,k3-r5f-rproc.yaml       |  55 ++++-
 drivers/remoteproc/da8xx_remoteproc.c              |  97 +++-----
 drivers/remoteproc/imx_rproc.c                     |   8 +-
 drivers/remoteproc/keystone_remoteproc.c           |  41 ++--
 drivers/remoteproc/pru_rproc.c                     |  17 +-
 drivers/remoteproc/qcom_common.c                   |  17 +-
 drivers/remoteproc/qcom_q6v5_mss.c                 | 263 +++++++++++++++++++--
 drivers/remoteproc/qcom_q6v5_pas.c                 | 139 +++++------
 drivers/remoteproc/qcom_sysmon.c                   |   2 +-
 drivers/remoteproc/remoteproc_internal.h           |   2 +-
 drivers/remoteproc/ti_k3_common.c                  |   2 +-
 drivers/remoteproc/xlnx_r5_remoteproc.c            |  28 ++-
 include/linux/soc/qcom/qmi.h                       |  12 +
 22 files changed, 497 insertions(+), 226 deletions(-)
