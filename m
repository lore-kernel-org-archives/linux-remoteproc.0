Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795454508;
	b=BN3cwTyifkQhgDVEOZIJyuFQnFSa7tpAbDHCTQcZ1PZoEsvw3gydoi5+jqOZsK3/Li3Z
	 81S1HAbdxjRVzyTHhZaszeqHiI0Rm8a/vsX0TtY6dweUT0ONQdd2vlHKt/XDXh2X2gAD9
	 tL3OQB9E5RgFTFNphiHMMAWmWfV83mqaG6evrOcuLf4qOxuwwYBNZcg6G3qB+XS0aw6aT
	 qZbrZkyoCQG+vdkG+ZovH20HD1RgeC/oVg07BZ9fPQ4o/dflrvtsKe+I1GoQz8XsUMUpk
	 HETvVSOTz507/42B+MPWpCje3ismfmDna3gsVCdixKsN57OiIVc2EhlfJc8hqbJZ0oQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454508;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ZYFw71kldd76QCwTZ1pURFS8nTenSTNKqbr9YucnS7g=;
	b=GSTO936uC+TnrrDAiGC+rALyAayJVXFR2KJF1qxK1FsIIzxIaUpIK5cBiqZ9uWEhqQcp
	 ps3x8zcLYPMuVY6ACqnfUK+I69n5pYfmDggUJXQezKzqsguT7hkaKAuUuViPiERWVtbzv
	 l1QSJvjaU5sIBkS0Z1tmpU+um/EOiD5EBG3VGlEkeyJICTk6lSS5rHB7xpy4yE4M32hKX
	 z5WVcaT4WvqJIwT7R4FWoIv4bJjcIo5Q6kCzwBru/Cp+E8SGULlXhWuSLS88iCFR3vIZE
	 tYjuAy/NFCN0BanmjK5zQQCEaYMj46y3Cz45aBKw5FUYHTPS8ZMglrqHfOEOoUH9syw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="D/Nn6Wa2";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C035606A31A;
	Mon, 23 Nov 2026 17:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D/Nn6Wa2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2F311F000EC;
	Mon, 23 Nov 2026 17:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795454508;
	bh=ZYFw71kldd76QCwTZ1pURFS8nTenSTNKqbr9YucnS7g=;
	h=From:To:Cc:Subject:Date;
	b=D/Nn6Wa2rIrY+rFe7e5OfAVwggkMCdiXLvP/gKvKJXNsVGzZQmYEyW6hlSUEi6Xn9
	 kUziZo18Hnj7REt0Qud+keOUi7HOtPwptft2p5f/UcGPQdFWm/iLn7vuam0Bk2zo7W
	 pYHT0ML2IuSxKG+HMt07z+NlnlTspnc9cCMxaTXeTPWAdqebtnzgVJEkvSRtw99zwc
	 UkzC1IxLJexDVUfQ9bqFIpUALJYxJM/MYB3wnLcRJHjWAyA1lp4uEAK9SpYGEsfozM
	 6IOAV1V0pBMmy2hg+N8BSZ5xZkzsIveo6qaZTB7dxyBXc9UHN+jhoc7YpsU+u/v+ZZ
	 BuzmuOuJNjDBQ==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org
Cc: linux-kernel@vger.kernel.org,
	"Rob Herring (Arm)" <robh@kernel.org>,
	=?UTF-8?q?Sjur=20Br=C3=A6ndeland?= <sjur.brandeland@stericsson.com>,
	Alex Elder <elder@kernel.org>,
	Andrew Davis <afd@ti.com>,
	Beleswar Padhi <b-padhi@ti.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Brian Swetland <swetland@google.com>,
	Clement Leger <cleger@kalray.eu>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	De Leon <x0095078@ti.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Guzman Lugo <fernando.lugo@ti.com>,
	Hari Kanigeri <h-kanigeri2@ti.com>,
	Hari Nagalla <hnagalla@ti.com>,
	HyeongJun An <sammiee5311@gmail.com>,
	imx@lists.linux.dev,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	Loic Pallardy <loic.pallardy@st.com>,
	Mark Grosen <mgrosen@ti.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Ohad Ben-Cohen <ohad@wizery.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rishabh Bhatnagar <rishabhb@codeaurora.org>,
	Robert Tivy <rtivy@ti.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Siddharth Gupta <sidgup@codeaurora.org>,
	Suman Anna <s-anna@ti.com>,
	Tero Kristo <t-kristo@ti.com>,
	Uday Khare <udaykhare77@gmail.com>
Subject: [PATCH 00/10] remoteproc: Assorted bug fixes across remoteproc core and drivers
Date: Mon, 23 Nov 2026 17:20:44 +0000
Message-ID: <20261123172140.3547896-1-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These issues were reported by Sashiko.

None of these changes have been tested on physical hardware.

Cc: "Rob Herring (Arm)" <robh@kernel.org>
Cc: "Sjur Brændeland" <sjur.brandeland@stericsson.com>
Cc: Alex Elder <elder@kernel.org>
Cc: Andrew Davis <afd@ti.com>
Cc: Beleswar Padhi <b-padhi@ti.com>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Brian Swetland <swetland@google.com>
Cc: Clement Leger <cleger@kalray.eu>
Cc: Daniel Baluta <daniel.baluta@nxp.com>
Cc: De Leon <x0095078@ti.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Guzman Lugo <fernando.lugo@ti.com>
Cc: Hari Kanigeri <h-kanigeri2@ti.com>
Cc: Hari Nagalla <hnagalla@ti.com>
Cc: HyeongJun An <sammiee5311@gmail.com>
Cc: imx@lists.linux.dev
Cc: Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-remoteproc@vger.kernel.org
Cc: Loic Pallardy <loic.pallardy@st.com>
Cc: Mark Grosen <mgrosen@ti.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rishabh Bhatnagar <rishabhb@codeaurora.org>
Cc: Robert Tivy <rtivy@ti.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: Siddharth Gupta <sidgup@codeaurora.org>
Cc: Suman Anna <s-anna@ti.com>
Cc: Tero Kristo <t-kristo@ti.com>
Cc: Uday Khare <udaykhare77@gmail.com>

Lee Jones (10):
  remoteproc: core: Fix integer overflow in rproc_check_carveout_da()
  remoteproc: k3: Fix integer overflow in k3_rproc_da_to_va()
  remoteproc: omap: Fix integer overflow in omap_rproc_da_to_va()
  remoteproc: elf_loader: Fix overflow in rproc_elf_load_segments()
  remoteproc: imx_rproc: Avoid stale mailbox pointers on request failure
  remoteproc: imx_rproc: Register SCU cleanup after resource acquisition
  remoteproc: qcom: Clear glink->node on allocation failure
  remoteproc: qcom: Skip unregistering uninitialised SSR subdevice
  remoteproc: imx_dsp_rproc: Fix pointer stride in
    imx_dsp_rproc_memset()
  remoteproc: imx_dsp_rproc: Fix off-by-one bitmask for trailing bytes

 drivers/remoteproc/imx_dsp_rproc.c         | 10 ++++---
 drivers/remoteproc/imx_rproc.c             | 33 ++++++++++++++--------
 drivers/remoteproc/omap_remoteproc.c       | 11 +++++---
 drivers/remoteproc/qcom_common.c           |  5 ++++
 drivers/remoteproc/remoteproc_core.c       |  7 ++---
 drivers/remoteproc/remoteproc_elf_loader.c |  6 ++--
 drivers/remoteproc/ti_k3_common.c          | 27 +++++++++++-------
 7 files changed, 61 insertions(+), 38 deletions(-)

-- 
2.56.1.750.gf70dc682cf-goog

