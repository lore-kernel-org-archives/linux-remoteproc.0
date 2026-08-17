Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515C03EEAD7
	for <linux-remoteproc@vger.kernel.org>; Mon, 17 Aug 2026 09:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786960553; cv=none; b=lJadOkvxpLnEykUw6Tvl/PMzls417jrWvuKKTVm1SBLlP1/LtRKwSckUi4FZPNmtpz0iqwRfyCu0g2oHu/EItFZZotSWPTGRKuSDlzPnYGQRmCbyc/bj8jwTvvmtCYBUH5R8uR+Xe/GI4HS9vM4BgPEuNFpSufFeuzywxrm8fXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786960553; c=relaxed/simple;
	bh=i33aTdaZMQvhqoiXnxXVes7/99yAVvqlYJVswUj7kDc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XdGOil5ypeA47nQT41AKNtZlT48jvD1yxlufTtr9bAyjwE6QTF32+o76TEBSyLiuBoop6Cru584a4Yr0nVPO+4VejSGF+lpRpXPwVBOpZbGgCxVHofaoO88wDWV5iuYYa7xhbnBlmyyb9wiu4mQzd7J2pntSqGHq9LSwqDdL//s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=crFyiwuh; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="crFyiwuh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=lH2thzjc+pR3sO
	cZ2NskyWITZX4hRVVOGZcMtKGhOxQ=; b=crFyiwuhKwCs9ddPtRIGuvk5kxTIxq
	cJ7ozXbQpC/hj+OMrz3gZB7umwkwJ09P3IX7k1dBuagCZGoscUL6oEl0s+jsInVl
	2mcp+0aAJOi+Kd6FApEiRqHeIOQ1dhoNhBzaqsWdKxifz5dWxSX05eOPXHcrhwrz
	CX7CSm2g15otT05q1cLBh0Wu1CWOX5NpyXAEPBlghIWHWN+cfElbQR+IzVN4s5sN
	+IMklk61N/v7nEhbI65uvmEAXWU53Ogm9r/vcw2PQ3Cla8gc5aRmF+FJDv7KUIiF
	uHwqRbmiXwpUhScwDX+VVoR3CV6+ST01fbfuSrFbwFnuoKjWhNFWeqYw==
Received: (qmail 3413344 invoked from network); 17 Aug 2026 11:55:47 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Aug 2026 11:55:47 +0200
X-UD-Smtp-Session: l3s3148p1@B5GsLDtZ0IQujnve
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-remoteproc@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH v3] soc: renesas: rcar-mfis: add hwspinlock support
Date: Mon, 17 Aug 2026 11:53:34 +0200
Message-ID: <20260817095447.34693-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Every MFIS instance has a block of hardware spinlocks. Add support for
them. Gen4 has only one instance, so the base_id is always 0. Gen5 has
multiple instances, so the base_id has to be encoded in the info
description. Also being a provider, a hwspinlock-private header needs
to be included. Work to refactor the headers is on-going, but will need
many preparational steps. Until then, we need to live with the special
include.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Changes since v2:
* dropped patch 1 because Geert already queued it
* add comment that flex array must be last (Geert)
* calc local_id in a less scary way (Geert)

 drivers/soc/renesas/Kconfig     |  2 +-
 drivers/soc/renesas/rcar-mfis.c | 54 ++++++++++++++++++++++++++++++++-
 2 files changed, 54 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index eb8ac0d47d9d..59f441f528bf 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -468,7 +468,7 @@ endif # RISCV
 config RCAR_MFIS
 	tristate "Renesas R-Car MFIS driver"
 	depends on ARCH_RENESAS || COMPILE_TEST
-	depends on MAILBOX
+	depends on MAILBOX && HWSPINLOCK
 	help
 	  Select this option to enable the Renesas R-Car MFIS core driver for
 	  the MFIS device found on SoCs like R-Car. On families like Gen5, this
diff --git a/drivers/soc/renesas/rcar-mfis.c b/drivers/soc/renesas/rcar-mfis.c
index c327a60789d0..d5bbc3077373 100644
--- a/drivers/soc/renesas/rcar-mfis.c
+++ b/drivers/soc/renesas/rcar-mfis.c
@@ -8,6 +8,7 @@
  */
 #include <dt-bindings/soc/renesas,r8a78000-mfis.h>
 #include <linux/device.h>
+#include <linux/hwspinlock.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
@@ -19,12 +20,18 @@
 #include <linux/platform_device.h>
 #include <linux/spinlock.h>
 
+/* FIXME: hwspinlock core refactoring to not need internal header is on-going */
+#include "../../hwspinlock/hwspinlock_internal.h"
+
+#define MFISLCKR0	0xc0
+#define MFISLCKR8	0x0724
 #define MFISWPCNTR	0x0900
 #define MFISWACNTR	0x0904
 
 #define MFIS_X5H_IICR(i) ((i) * 0x1000 + 0x00)
 #define MFIS_X5H_EICR(i) ((i) * 0x1000 + 0x04)
 
+#define MFIS_NUM_LOCKS 64
 #define MFIS_UNPROTECT_KEY 0xACCE0000
 
 struct mfis_priv;
@@ -42,6 +49,7 @@ struct mfis_info {
 	unsigned int mb_tx_uses_eicr:1;
 	unsigned int mb_channels_are_unidir:1;
 	u32 (*mb_calc_reg)(u32 chan_num, bool tx_uses_eicr, bool is_only_rx);
+	int hwsp_base_id;
 };
 
 struct mfis_chan_priv {
@@ -59,6 +67,9 @@ struct mfis_priv {
 	/* mailbox private data */
 	struct mbox_controller mbox;
 	struct mfis_chan_priv *chan_privs;
+
+	/* hwspinlock private data */
+	struct hwspinlock_device bank; /* flex array inside, must be last! */
 };
 
 static u32 mfis_read(struct mfis_reg *mreg, unsigned int reg)
@@ -86,6 +97,38 @@ static void mfis_write(struct mfis_reg *mreg, u32 reg, u32 val)
 	raw_spin_unlock_irqrestore(&priv->unprotect_lock, flags);
 }
 
+/********************************************************
+ *			HW Spinlocks			*
+ ********************************************************/
+
+#define MFISLCKR8_CH_OFS (MFISLCKR8 - 8 * sizeof(u32))
+
+static int rcar_mfis_hwsp_trylock(struct hwspinlock *lock)
+{
+	struct mfis_priv *priv = lock->priv;
+	int id = hwlock_to_id(lock) - lock->bank->base_id;
+	u32 val, reg;
+
+	reg = id * sizeof(u32) + (id < 8 ? MFISLCKR0 : MFISLCKR8_CH_OFS);
+	val = mfis_read(&priv->common_reg, reg);
+	return !val;
+}
+
+static void rcar_mfis_hwsp_unlock(struct hwspinlock *lock)
+{
+	struct mfis_priv *priv = lock->priv;
+	int id = hwlock_to_id(lock) - lock->bank->base_id;
+	u32 reg;
+
+	reg = id * sizeof(u32) + (id < 8 ? MFISLCKR0 : MFISLCKR8_CH_OFS);
+	mfis_write(&priv->common_reg, reg, 0);
+}
+
+static const struct hwspinlock_ops rcar_mfis_hwsp_ops = {
+	.trylock	= rcar_mfis_hwsp_trylock,
+	.unlock		= rcar_mfis_hwsp_unlock,
+};
+
 /********************************************************
  *			Mailbox				*
  ********************************************************/
@@ -314,7 +357,7 @@ static int mfis_probe(struct platform_device *pdev)
 	struct mfis_priv *priv;
 	int ret;
 
-	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	priv = devm_kzalloc(dev, struct_size(priv, bank.lock, MFIS_NUM_LOCKS), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
@@ -333,6 +376,14 @@ static int mfis_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	for (unsigned int ch = 0; ch < MFIS_NUM_LOCKS; ch++)
+		priv->bank.lock[ch].priv = priv;
+
+	ret = devm_hwspin_lock_register(dev, &priv->bank, &rcar_mfis_hwsp_ops,
+					priv->info->hwsp_base_id, MFIS_NUM_LOCKS);
+	if (ret)
+		return ret;
+
 	return mfis_mb_probe(priv);
 }
 
@@ -357,6 +408,7 @@ static const struct mfis_info mfis_info_r8a78000_scp = {
 	.mb_tx_uses_eicr = true,
 	.mb_channels_are_unidir = true,
 	.mb_calc_reg = mfis_mb_r8a78000_calc_reg,
+	.hwsp_base_id = MFIS_NUM_LOCKS,
 };
 
 static const struct of_device_id mfis_mfd_of_match[] = {
-- 
2.47.3

