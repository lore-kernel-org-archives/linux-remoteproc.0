Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A0818A931;
	Mon,  9 Sep 2024 20:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725914311; cv=none; b=gkD/xeVNGDy9x9GoE5bOfSJoU6s0lCCUET9unWklZ9HfLYk/fJHGbEolzNkzm7Q5gMcHXWQXhXObZAPkB2UUqsyDMLbGQ6/a8wve00Qr5aJStNW+meEElEbjecnrQZLcALiJEIJEBXG2/kUd2jE11eXpot/Kqzkrlu/hNYTg3/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725914311; c=relaxed/simple;
	bh=Q/ldUIYTZFL1UMoXWQrSuh4EnveRgkQllQyLRUY6ITs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ss5FnjVbwUSEDuzjF1+bafUpGcp7CQp6Un9yAVeWO74j7nb/PChX9VA6Ht0PYQ8osX+xJOtRP+SoPOnxOgIx3drhE8jZr6OTcSl73KnzSMnogSMLHC8dkGgbVGIH3uruLNOf/FWs4CzTcc+tdZuwqY0JHVIBwWMc4YsBwXZNv24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eFJt6gmG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eFJt6gmG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1002C4CEC8;
	Mon,  9 Sep 2024 20:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725914310;
	bh=Q/ldUIYTZFL1UMoXWQrSuh4EnveRgkQllQyLRUY6ITs=;
	h=From:To:Cc:Subject:Date:From;
	b=eFJt6gmGhtw4cUgKDMuEq39qLyDyvjoJrqM+uSJ8dnc8p0q5grPs2apkpP26U5xEE
	 wS1ExIkLUu5abPeARjY02SPtLhfULRNHMWN4wS5WJilewlKcv9QUMTB3VaD6sqyoum
	 sk9PKkM0Han9ggJSbBaFGwo50+1tGXEOIOJrFG1OybAaqhwiHAw7NbqhSuIHNoEscc
	 9U9oUqRLwScSCvqKhEq7kZkaEHzmPeIKhSF18i04tfpJuOnHseUYqczhflQGBY2Wv3
	 RmH9/Dg5xRrbM8vboo8GWvbXGS5VWFtr6AC3lp2U6rq38VcldHzMo7GVJ+3QN9C6tz
	 1lMhto2lF0+kg==
From: Arnd Bergmann <arnd@kernel.org>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Hari Nagalla <hnagalla@ti.com>,
	Andrew Davis <afd@ti.com>,
	Martyn Welch <martyn.welch@collabora.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH] mailbox, remoteproc: omap2+: fix compile testing
Date: Mon,  9 Sep 2024 20:38:09 +0000
Message-Id: <20240909203825.1666947-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Selecting CONFIG_OMAP2PLUS_MBOX while compile testing
causes a build failure:

WARNING: unmet direct dependencies detected for OMAP2PLUS_MBOX
  Depends on [n]: MAILBOX [=y] && (ARCH_OMAP2PLUS || ARCH_K3)
  Selected by [m]:
  - TI_K3_M4_REMOTEPROC [=m] && REMOTEPROC [=y] && (ARCH_K3 || COMPILE_TEST [=y])

Using 'select' to force-enable another subsystem is generally
a mistake and causes problems such as this one, so change the
three drivers that link against this driver to use 'depends on'
instead, and ensure the driver itself can be compile tested
regardless of the platform.

When compile-testing without CONFIG_TI_SCI_PROTOCOL=m, there
is a chance for a link failure, so add a careful dependency
on that.

arm-linux-gnueabi-ld: drivers/remoteproc/ti_k3_m4_remoteproc.o: in function `k3_m4_rproc_probe':
ti_k3_m4_remoteproc.c:(.text.k3_m4_rproc_probe+0x76): undefined reference to `devm_ti_sci_get_by_phandle'

Fixes: ebcf9008a895 ("remoteproc: k3-m4: Add a remoteproc driver for M4F subsystem")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/mailbox/Kconfig        |  2 +-
 drivers/mailbox/omap-mailbox.c |  2 +-
 drivers/remoteproc/Kconfig     | 10 ++++------
 3 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
index 4eed97295927..ecaf78beb934 100644
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@ -73,7 +73,7 @@ config ARMADA_37XX_RWTM_MBOX
 
 config OMAP2PLUS_MBOX
 	tristate "OMAP2+ Mailbox framework support"
-	depends on ARCH_OMAP2PLUS || ARCH_K3
+	depends on ARCH_OMAP2PLUS || ARCH_K3 || COMPILE_TEST
 	help
 	  Mailbox implementation for OMAP family chips with hardware for
 	  interprocessor communication involving DSP, IVA1.0 and IVA2 in
diff --git a/drivers/mailbox/omap-mailbox.c b/drivers/mailbox/omap-mailbox.c
index 7a87424657a1..6797770474a5 100644
--- a/drivers/mailbox/omap-mailbox.c
+++ b/drivers/mailbox/omap-mailbox.c
@@ -603,7 +603,7 @@ static struct platform_driver omap_mbox_driver = {
 	.driver	= {
 		.name = "omap-mailbox",
 		.pm = &omap_mbox_pm_ops,
-		.of_match_table = of_match_ptr(omap_mailbox_of_match),
+		.of_match_table = omap_mailbox_of_match,
 	},
 };
 module_platform_driver(omap_mbox_driver);
diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 0f0862e20a93..62f8548fb46a 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -330,8 +330,7 @@ config STM32_RPROC
 config TI_K3_DSP_REMOTEPROC
 	tristate "TI K3 DSP remoteproc support"
 	depends on ARCH_K3
-	select MAILBOX
-	select OMAP2PLUS_MBOX
+	depends on OMAP2PLUS_MBOX
 	help
 	  Say m here to support TI's C66x and C71x DSP remote processor
 	  subsystems on various TI K3 family of SoCs through the remote
@@ -343,8 +342,8 @@ config TI_K3_DSP_REMOTEPROC
 config TI_K3_M4_REMOTEPROC
 	tristate "TI K3 M4 remoteproc support"
 	depends on ARCH_K3 || COMPILE_TEST
-	select MAILBOX
-	select OMAP2PLUS_MBOX
+	depends on TI_SCI_PROTOCOL || (COMPILE_TEST && TI_SCI_PROTOCOL=n)
+	depends on OMAP2PLUS_MBOX
 	help
 	  Say m here to support TI's M4 remote processor subsystems
 	  on various TI K3 family of SoCs through the remote processor
@@ -356,8 +355,7 @@ config TI_K3_M4_REMOTEPROC
 config TI_K3_R5_REMOTEPROC
 	tristate "TI K3 R5 remoteproc support"
 	depends on ARCH_K3
-	select MAILBOX
-	select OMAP2PLUS_MBOX
+	depends on OMAP2PLUS_MBOX
 	help
 	  Say m here to support TI's R5F remote processor subsystems
 	  on various TI K3 family of SoCs through the remote processor
-- 
2.39.2

