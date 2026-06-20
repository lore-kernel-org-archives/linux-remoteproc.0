Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E7D1A6809;
	Sat, 20 Jun 2026 14:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781966232; cv=none; b=DIZyFaWq8nTDKWfs+QEQlkGIPM4JieOKm6TqCfeNRM/TYQQTQoLvnfnOAhznwwBS0+JOgZuT7S0+Op2rDm4tgjekkb0C/DPbNFoEJXs49C545WcHB5C4ymWc8uaHJ4/xrSuHABY6fQuq0BqPauf9HXOoo/F+B8ExoPNUmlW7zDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781966232; c=relaxed/simple;
	bh=WAZH+58SnVF7VvPETDBllilNVUZ5n1zjgJ3ASNrSz9o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=POMuYbZoAYteBNwn+ZxPCouGYYYJfCSetSLjsvCZh6aXQ9zVKqbfshSvDhHpWAWrVgTADjw2xqowFjZMpzt3uN2Mpvw7q1QIuZMdK1fcsxmjPZO92Zyac6Zq4LZfM5artbyKFUWQmOMVfurBXOuIfqTPHMR1yCjnNahEWtE69N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ozrbwfw3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ozrbwfw3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 871F71F000E9;
	Sat, 20 Jun 2026 14:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781966231;
	bh=8P0wjXZt78Wh8Gu0snGv8jc5yVE9/V4ukcZPBoFh7HM=;
	h=From:To:Cc:Subject:Date;
	b=Ozrbwfw3VoXj/azo/n/kvKjd9NlI2wlo+TC8AcEcOyIqR/igD0UdqfyA6PuTYnX+V
	 gAoBiCqbj8H/MSqgnFLIuFw7jgsamLUYUpEyeWOrHk9lXI32+JRvsjyq/eFLUKl5Wg
	 LycC/iH9Jt5oWbEhmhfK56hl0VsXlQnwFhxc88RIKBnRyfDquR6WoUhDzYxwJPY4Qd
	 HTYa5esStcKY4ql5HMz+fbitA42QRYLXtnIMCe1jczGVyT21eg/eIabMMHYEf+e/7d
	 TsCN1KTRkSHvqQE8q8I/cF7rSPeNnGoO5yMiUMIMrxZLOyuE0U/DzjvQ85nMuI924U
	 KwgoY/wSj/Xlg==
From: Bjorn Andersson <andersson@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Tanmay Shah <tanmay.shah@amd.com>,
	Peng Fan <peng.fan@nxp.com>,
	Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
	Alexandru Gagniuc <mr.nuke.me@gmail.com>,
	Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
	Jiafei Pan <Jiafei.Pan@nxp.com>,
	Julian Braha <julianbraha@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Shawn Guo <shengchao.guo@oss.qualcomm.com>,
	Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Subject: [GIT PULL] remoteproc updates for v7.2
Date: Sat, 20 Jun 2026 09:37:09 -0500
Message-ID: <20260620143709.1112373-1-andersson@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rproc-v7.2

for you to fetch changes up to b5bfc7d039bb775730186a9c38d0f01afd729638:

  remoteproc: qcom: pas: Drop start/stop completion from struct qcom_pas (2026-06-08 21:53:51 -0500)

----------------------------------------------------------------
remoteproc updates for v7.2

Add i.MX94 support to the i.MX remoteproc driver, covering the Cortex-M7
and Cortex-M33 Sync cores. This also fixes programming of non-zero System
Manager CPU/LMM reset vectors.

Move the remoteproc resource table definitions to a separate header, so
they can be used by clients that do not otherwise depend on remoteproc.
Switch the firmware resource handling over to the common iterator.

Update the Xilinx R5F remoteproc driver to check the remote core state
before attaching, drop a binding header dependency, and add
firmware-name based auto boot support.

Add Qualcomm Hawi ADSP/CDSP bindings, together with Shikra RPM bindings
and CDSP, LPAICP, and MPSS PAS support. Fix a Qualcomm minidump leak,
clean up PAS and WCSS reset handling, and make the user-visible Qualcomm
naming consistent.

Remove a duplicate STM32_RPROC Kconfig dependency and make i.MX
remoteproc instances use the device node name so multiple processors can
be distinguished in sysfs.

----------------------------------------------------------------
Alexandru Gagniuc (1):
      remoteproc: qcom_q6v5_wcss: drop redundant wcss_q6_bcr_reset

Bibek Kumar Patro (1):
      remoteproc: qcom: pas: Add Shikra remoteproc support

Jiafei Pan (1):
      remoteproc: imx_rproc: Use device node name as processor name

Julian Braha (1):
      remoteproc: Dead code cleanup in Kconfig for STM32_RPROC

Komal Bajaj (2):
      dt-bindings: remoteproc: Add Shikra RPM processor compatible
      dt-bindings: remoteproc: qcom,shikra-pas: Document Shikra PAS remoteprocs

Krzysztof Kozlowski (1):
      remoteproc: qcom: Unify user-visible "Qualcomm" name

Mukesh Ojha (4):
      remoteproc: Move resource table data structure to its own header
      remoteproc: use rsc_table_for_each_entry() in rproc_handle_resources()
      dt-bindings: remoteproc: qcom,sm8550-pas: Add Hawi ADSP compatible
      dt-bindings: remoteproc: qcom,sm8550-pas: Add Hawi CDSP compatible

Peng Fan (3):
      dt-bindings: remoteproc: imx-rproc: Support i.MX94
      remoteproc: imx_rproc: Program non-zero SM CPU/LMM reset vector
      remoteproc: imx_rproc: Add support for i.MX94

Shawn Guo (1):
      remoteproc: qcom: pas: Drop start/stop completion from struct qcom_pas

Tanmay Shah (4):
      remoteproc: xlnx: Check remote core state
      remoteproc: xlnx: Remove binding header dependency
      dt-bindings: remoteproc: xlnx: Add firmware-name property
      remoteproc: xlnx: Enable auto boot feature

Wasim Nazir (1):
      remoteproc: qcom: Fix leak when custom dump_segments addition fails

 .../bindings/remoteproc/fsl,imx-rproc.yaml         |   3 +
 .../bindings/remoteproc/qcom,rpm-proc.yaml         |   1 +
 .../bindings/remoteproc/qcom,shikra-pas.yaml       | 167 ++++++++++
 .../bindings/remoteproc/qcom,sm8550-pas.yaml       |   4 +
 .../bindings/remoteproc/xlnx,zynqmp-r5fss.yaml     |   4 +
 drivers/firmware/xilinx/zynqmp.c                   |  28 ++
 drivers/remoteproc/Kconfig                         |   3 +-
 drivers/remoteproc/imx_rproc.c                     |  95 +++++-
 drivers/remoteproc/imx_rproc.h                     |   2 +
 drivers/remoteproc/qcom_common.c                   |  14 +-
 drivers/remoteproc/qcom_q6v5_pas.c                 |  51 ++-
 drivers/remoteproc/qcom_q6v5_wcss.c                |  23 +-
 drivers/remoteproc/remoteproc_core.c               |  81 +++--
 drivers/remoteproc/xlnx_r5_remoteproc.c            | 100 ++++--
 include/linux/firmware/xlnx-zynqmp.h               |  21 ++
 include/linux/remoteproc.h                         | 269 +--------------
 include/linux/rsc_table.h                          | 359 +++++++++++++++++++++
 17 files changed, 858 insertions(+), 367 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
 create mode 100644 include/linux/rsc_table.h
