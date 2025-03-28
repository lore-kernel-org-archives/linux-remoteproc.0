Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D6FE545;
	Fri, 28 Mar 2025 19:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743189970; cv=none; b=nVu2mLWWAbe6TTaZBY3VOpLkdRlIf4DSInAM+1EWPHm99G62CYvE0Y3ijynYFh8O5vIel+RQm/fFogYu4x7KUfKLHat3qdaL9eL1/U2BiLt/VEDfMFZKRRErTgB1hEdoSL1KU53ek3VUtCFS7+dsAmnwdBilSzDjSQlgPTGo5z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743189970; c=relaxed/simple;
	bh=hhPunpsntFt6XxabHd1o/+l0RU1HFQRT6+V86ZVI+Mk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cn3jJY7nnWt2XRvNOYuodJPbqrpX29TixdPNmQnebOglj+SJNNWh2zPC3POBCNoyuseWTLclPIfOmNoi+R0P8VU8FBXJy+/zQFWOnygNwoOyQ5zATYq71Aqp23rOSwctrE+Mw4RPSa4MAiGe5by+NkqimLQ8NkskAam/xD+/c7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uB01Ql31; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uB01Ql31"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74152C4CEE4;
	Fri, 28 Mar 2025 19:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743189970;
	bh=hhPunpsntFt6XxabHd1o/+l0RU1HFQRT6+V86ZVI+Mk=;
	h=From:To:Cc:Subject:Date:From;
	b=uB01Ql31T2Fl8DTKJmuhV/cUhmk5OJcBC8/Fh+1AFymKGN6x8XRSha5kd3VwUy6dO
	 x5JgWLdMFGVqnL7PCqESo1PUJuIqYWb6dUPeMr3h/aUROYtjM8qrl54KScTgHi2AEa
	 pj2/ozggdtkx8H6YiWfQv2TQId00a4D/o3+Ql/NYowNzySoYJGiym0JJmfqXbm9Bl3
	 z73gizkN8dcMy9RpAaGkMp2Ct8/42Q8ztKjcahEV0ell6kakoIcCgiDrEsRtzRr+NN
	 ZvLasxIRUARtFqzxNIYzuk2gsZFGh/hWUP1MKU8VEURZ+RjKm7XcbcMLREJWeKeMkE
	 xfGQmnc0yvcTQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Luca Weiss <luca@lucaweiss.eu>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	=?UTF-8?q?Matti=20Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>,
	Peng Fan <peng.fan@nxp.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Luca Weiss <luca.weiss@fairphone.com>
Subject: [GIT PULL] remoteproc updates for v6.15
Date: Fri, 28 Mar 2025 14:26:04 -0500
Message-ID: <20250328192607.188729-1-andersson@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


The following changes since commit a64dcfb451e254085a7daee5fe51bf22959d52d3:

  Linux 6.14-rc2 (2025-02-09 12:45:03 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rproc-v6.15

for you to fetch changes up to e917b73234b02aa4966325e7380d2559bf127ba9:

  remoteproc: qcom_q6v5_pas: Make single-PD handling more robust (2025-03-22 08:42:39 -0500)

----------------------------------------------------------------
remoteproc updates for v6.15

The i.MX8MP DSP remoteproc driver is transitioned to use the reset
framework for driving the run/stall reset bits.

Support for managing the modem remoteprocessor on the Qualocmm MSM8226,
MSM8926, and SM8750 platforms is added.

----------------------------------------------------------------
Dan Carpenter (1):
      remoteproc: sysmon: Update qcom_add_sysmon_subdev() comment

Daniel Baluta (8):
      dt-bindings: reset: audiomix: Add reset ids for EARC and DSP
      dt-bindings: dsp: fsl,dsp: Add resets property
      reset: imx8mp-audiomix: Add prefix for internal macro
      reset: imx8mp-audiomix: Prepare the code for more reset bits
      reset: imx8mp-audiomix: Introduce active_low configuration option
      reset: imx8mp-audiomix: Add support for DSP run/stall
      imx_dsp_rproc: Use reset controller API to control the DSP
      remoteproc: imx_dsp_rproc: Document run_stall struct member

Jiri Slaby (SUSE) (1):
      irqdomain: remoteproc: Switch to of_fwnode_handle()

Konrad Dybcio (1):
      dt-bindings: remoteproc: Consolidate SC8180X and SM8150 PAS files

Krzysztof Kozlowski (4):
      dt-bindings: remoteproc: qcom,sm6115-pas: Use recommended MBN firmware format in DTS example
      dt-bindings: remoteproc: Add SM8750 CDSP
      dt-bindings: remoteproc: Add SM8750 MPSS
      remoteproc: qcom: pas: Add SM8750 MPSS

Luca Weiss (7):
      dt-bindings: remoteproc: qcom,msm8916-mss-pil: Add MSM8926
      remoteproc: qcom_q6v5_mss: Handle platforms with one power domain
      remoteproc: qcom_q6v5_mss: Add modem support on MSM8226
      remoteproc: qcom_q6v5_mss: Add modem support on MSM8926
      remoteproc: qcom: pas: add minidump_id to SC7280 WPSS
      remoteproc: qcom_q6v5_pas: Use resource with CX PD for MSM8226
      remoteproc: qcom_q6v5_pas: Make single-PD handling more robust

Matti Lehtimäki (4):
      dt-bindings: remoteproc: qcom,msm8916-mss-pil: Support platforms with one power domain
      dt-bindings: remoteproc: qcom,msm8916-mss-pil: Add MSM8226
      dt-bindings: remoteproc: qcom,wcnss-pil: Add support for single power-domain platforms
      remoteproc: qcom_wcnss: Handle platforms with only single power domain

Peng Fan (2):
      remoteproc: omap: Add comment for is_iomem
      remoteproc: core: Clear table_sz when rproc_shutdown

 Documentation/devicetree/bindings/dsp/fsl,dsp.yaml |  24 ++-
 .../bindings/remoteproc/qcom,msm8916-mss-pil.yaml  |  64 ++++++-
 .../bindings/remoteproc/qcom,sc8180x-pas.yaml      |  96 -----------
 .../bindings/remoteproc/qcom,sm6115-pas.yaml       |   2 +-
 .../bindings/remoteproc/qcom,sm8150-pas.yaml       |   7 +
 .../bindings/remoteproc/qcom,sm8550-pas.yaml       |  46 +++++-
 .../bindings/remoteproc/qcom,wcnss-pil.yaml        |  45 ++++-
 drivers/remoteproc/imx_dsp_rproc.c                 |  26 ++-
 drivers/remoteproc/imx_rproc.h                     |   2 +
 drivers/remoteproc/omap_remoteproc.c               |   1 +
 drivers/remoteproc/pru_rproc.c                     |   2 +-
 drivers/remoteproc/qcom_q6v5_mss.c                 | 184 ++++++++++++++++++++-
 drivers/remoteproc/qcom_q6v5_pas.c                 |  38 ++++-
 drivers/remoteproc/qcom_sysmon.c                   |   2 +-
 drivers/remoteproc/qcom_wcnss.c                    |  33 +++-
 drivers/remoteproc/remoteproc_core.c               |   1 +
 drivers/reset/reset-imx8mp-audiomix.c              |  78 ++++++---
 include/dt-bindings/reset/imx8mp-reset-audiomix.h  |  13 ++
 18 files changed, 499 insertions(+), 165 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,sc8180x-pas.yaml
 create mode 100644 include/dt-bindings/reset/imx8mp-reset-audiomix.h
