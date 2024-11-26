Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9ED61D86F6;
	Tue, 26 Nov 2024 16:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732637028; cv=none; b=A4qnHVBnlNpKXbXHWzjVJXMQZB1ahUyIpFRnkQgBjVq8wvyCd/qwpnVrjz5N/cgYqbUaWYz/BbAY/1PZk3DUfWDIA/rW8oyq9iXbgM3N6FI/C1/wbIE/nuoaDkLeMQAHQjmPoPZp/N1saGXJjl7t9PmCYUJve1UNVcGdLDB8X9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732637028; c=relaxed/simple;
	bh=FpUNHisF0kc5uQOfxRQln2JgUAQH9TL8aMKg2gXJBcs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=K/0sEX+PeUAeC1yEC4Tc5zAGcUfJ/oQdjH0GPGodKmX3mwHwOUJS+KFNnnf0vx5pgdTWzqlYOdQetw/diE6ChY/ysJDwmwJej7kNJDkm6FhBZWMqFjCiXwHKZx66fEiG87zA5FK0Je1o6yjOBxovl1MIWuwxYEkSSeyMMTExw+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GxATP0Be; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GxATP0Be"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6811C4CED2;
	Tue, 26 Nov 2024 16:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732637027;
	bh=FpUNHisF0kc5uQOfxRQln2JgUAQH9TL8aMKg2gXJBcs=;
	h=From:To:Cc:Subject:Date:From;
	b=GxATP0BeIVmYie2oYXToHqMcdtk5Wu+PYF9P20B594yHAPHl8PAgokdJVLLxnKPb8
	 B9oTu7dpac0Yjrn50VG/TdvEEdj16xNdwAZReidgtufbeQWpIpr+wW2QNPsD0u3PGq
	 oXPn/DNSWBrvM6mOlsMirOnAVOpZpF7m/tsrqUXK55LvOB3hnWVPT9O9QavlCPpZHQ
	 ZwjrETlRLa6FB5qQ6rqqdwhRwGHwwdKVexKXsevV09kxXfWopNKwE8XCEuQQ0l7F9m
	 842Hez7MzAZ902PqOG6k7oAcdm8Iojzd/9rMw8j06IwtcCBO6FyaooqKIeB/oSz39Q
	 n21cMlyAMCG2g==
From: Bjorn Andersson <andersson@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Andrew Davis <afd@ti.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Arnd Bergmann <arnd@arndb.de>,
	Balaji Pothunoori <quic_bpothuno@quicinc.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Markus Elfring <elfring@users.sourceforge.net>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Yuesong Li <liyuesong@vivo.com>
Subject: [GIT PULL] remoteproc updates for v6.13
Date: Tue, 26 Nov 2024 08:05:20 -0800
Message-ID: <20241126160536.3286933-1-andersson@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rproc-v6.13

for you to fetch changes up to 44024ebf25918efb8c771e1b496250bc9c4ef893:

  remoteproc: qcom: wcss: Remove double assignment in q6v5_wcss_probe() (2024-11-15 20:36:27 -0800)

----------------------------------------------------------------
remoteproc updates for v6.13

Make Qualcomm TrustZone Peripherial Authentication Service-remoteproc
identifier/name human friendly. Add audio DSP support for the Qualcomm
SAR2130P. Ensure IMEM access in the Qualcomm modem remoteproc driver is
performed prior to the firmware enabling the XPU and locking us out.

Improve error handling, error logging, compile testing support, and a
few other stylistic things across a variety of the drivers.

----------------------------------------------------------------
Andrew Davis (5):
      remoteproc: k3-dsp: Add compile testing support
      remoteproc: k3-r5: Add compile testing support
      remoteproc: k3-r5: Use IO memset to clear TCMs
      remoteproc: k3-r5: Force cast from iomem address space
      remoteproc: k3-dsp: Force cast from iomem address space

Arnd Bergmann (1):
      mailbox, remoteproc: k3-m4+: fix compile testing

Balaji Pothunoori (1):
      remoteproc: qcom_q6v5_pas: disable auto boot for wpss

Bjorn Andersson (1):
      remoteproc: qcom: pas: Make remoteproc name human friendly

Dmitry Baryshkov (3):
      dt-bindings: remoteproc: qcom,sm8350-pas: add SAR2130P aDSP compatible
      remoteproc: qcom: pas: add minidump_id to SM8350 resources
      remoteproc: qcom: pas: enable SAR2130P audio DSP support

Joe Hattori (3):
      remoteproc: qcom: pas: Remove subdevs on the error path of adsp_probe()
      remoteproc: qcom: adsp: Remove subdevs on the error path of adsp_probe()
      remoteproc: qcom: wcss: Remove subdevs on the error path of q6v5_wcss_probe()

Krzysztof Kozlowski (11):
      remoteproc: da8xx: Handle deferred probe
      remoteproc: da8xx: Simplify with dev_err_probe()
      remoteproc: ti_k3_r5: Simplify with dev_err_probe()
      remoteproc: ti_k3_r5: Simplify with scoped for each OF child loop
      dt-bindings: remoteproc: qcom,sm8550-pas: Add SM8750 ADSP
      remoteproc: qcom_q6v5_adsp: Simplify with dev_err_probe()
      remoteproc: qcom_q6v5_mss: Simplify with dev_err_probe()
      remoteproc: qcom_q6v5_mss: Drop redundant error printks in probe
      remoteproc: qcom_q6v5_pas: Simplify with dev_err_probe()
      remoteproc: qcom_q6v5_wcss: Simplify with dev_err_probe()
      remoteproc: qcom_wcnss_iris: Simplify with dev_err_probe()

Lu Baolu (1):
      remoteproc: Use iommu_paging_domain_alloc()

Markus Elfring (1):
      remoteproc: k3: Call of_node_put(rmem_np) only once in three functions

Sibi Sankar (1):
      remoteproc: qcom_q6v5_mss: Re-order writes to the IMEM region

Uwe Kleine-König (1):
      remoteproc: Switch back to struct platform_driver::remove()

Yuesong Li (1):
      remoteproc: qcom: wcss: Remove double assignment in q6v5_wcss_probe()

 .../bindings/remoteproc/qcom,sm8350-pas.yaml       |   3 +
 .../bindings/remoteproc/qcom,sm8550-pas.yaml       |  48 ++++++---
 drivers/remoteproc/Kconfig                         |  12 ++-
 drivers/remoteproc/da8xx_remoteproc.c              |  31 ++----
 drivers/remoteproc/imx_dsp_rproc.c                 |   2 +-
 drivers/remoteproc/imx_rproc.c                     |   2 +-
 drivers/remoteproc/keystone_remoteproc.c           |   2 +-
 drivers/remoteproc/meson_mx_ao_arc.c               |   2 +-
 drivers/remoteproc/mtk_scp.c                       |   2 +-
 drivers/remoteproc/pru_rproc.c                     |   2 +-
 drivers/remoteproc/qcom_q6v5_adsp.c                |  30 +++---
 drivers/remoteproc/qcom_q6v5_mss.c                 |  56 ++++------
 drivers/remoteproc/qcom_q6v5_pas.c                 |  51 ++++-----
 drivers/remoteproc/qcom_q6v5_wcss.c                | 114 +++++++++------------
 drivers/remoteproc/qcom_wcnss.c                    |   2 +-
 drivers/remoteproc/qcom_wcnss_iris.c               |   5 +-
 drivers/remoteproc/rcar_rproc.c                    |   2 +-
 drivers/remoteproc/remoteproc_core.c               |   6 +-
 drivers/remoteproc/remoteproc_virtio.c             |   2 +-
 drivers/remoteproc/st_remoteproc.c                 |   2 +-
 drivers/remoteproc/stm32_rproc.c                   |   2 +-
 drivers/remoteproc/ti_k3_dsp_remoteproc.c          |  10 +-
 drivers/remoteproc/ti_k3_m4_remoteproc.c           |   6 +-
 drivers/remoteproc/ti_k3_r5_remoteproc.c           |  83 ++++++---------
 drivers/remoteproc/wkup_m3_rproc.c                 |   2 +-
 25 files changed, 215 insertions(+), 264 deletions(-)
