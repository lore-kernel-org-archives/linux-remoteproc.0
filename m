Received: from smtp.smtpout.orange.fr (smtp-27.smtpout.orange.fr [80.12.242.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95496227586;
	Sun, 24 Aug 2025 20:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756065750; cv=none; b=hfyvy2HbvDZfIIqbsfN18MuhmdPF6UgwqLFxmeRVy+zN1HM0WvySDLtPfDVq3FpW9s9WTvYWWBE1AOnZ+7o7x5I/3m4DfuWCWEgHFq9JUwQadIZaJUL6ygwYTBvv+0TLkCDRvsoRkgzpv/pws1wCRHOu6ODl/qQQ35hqA1vVq10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756065750; c=relaxed/simple;
	bh=2KZo97Y3dKfB4kOtwK3564CJU05GkQdX8qPUaIWzL8c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rq5V3V82gt4auDuFyOtLBrN75ZW8jc3obd2rh3sUIwnCb2IM69xKlhSCtZhnJZBf+CIhhGkcFn+RudH1lV6CPBS/UF9oklnCwWU2Rp7/m6vU/84Tb4ANLWlbiaCAgT/BmsXM3LXjxmtboqgDQZz4ygfvVNxHCraPf4tYI/sU6Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=EN8Kqz8V; arc=none smtp.client-ip=80.12.242.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="EN8Kqz8V"
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id qGm6uCsM5FvH0qGm6utKsV; Sun, 24 Aug 2025 21:53:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1756065191;
	bh=h6KbBJ25vHeT4tnyRiFvChv89E8oXiVdW8qvo8bRqok=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=EN8Kqz8VLEM+1kuikWX4y7O0cGK00mGeDVQeRfEcYGEmujry0002f6D4QGofCYWag
	 D//5jLjoDJXBcB/GfzbITnsQTmMza2dCYlKV9CahdeFQItYttQhbGY+bQPuKsBxrg8
	 HO9E2FDoHPl5FCUySNfvbNUiQKhdJQnHFACEiRvpMNiT11jt+4kbFPn51pcm0aakQN
	 l7Qmwf833++Lz0390iFm0QD6Kcs5Pxy0pLn19n1fcGsR3RltHw5sojv0v4T9pTtmkz
	 PEHywLliY0mVrk7nxor+7xxYARWAge0+DxrfsDnWtykYS6nXUnlG1VCH0YRPUuaKzn
	 lmZAm7bCvcHiQ==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 24 Aug 2025 21:53:11 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Beleswar Padhi <b-padhi@ti.com>,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH v5] remoteproc: k3: Correctly release some resources allocated in k3_rproc_request_mbox()
Date: Sun, 24 Aug 2025 21:52:37 +0200
Message-ID: <df853ede72e9972c464415990b196289680e6acb.1756065142.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If an error occurs after a successful k3_rproc_request_mbox() call,
mbox_free_channel() should be called to avoid a leak.

Such a call is missing in the error handling path of k3_dsp_rproc_probe().
It is also missing both in the error handling path of k3_m4_rproc_probe()
and in the (in-existent) corresponding remove function.

Switch to managed resources to avoid these leaks and simplify the code.
Remove the now unneeded mbox_free_channel().

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Reviewed-by: Beleswar Padhi <b-padhi@ti.com>
Tested-by: Beleswar Padhi <b-padhi@ti.com>
---
Compile tested only.

Changes in v5:
  - Update subject line   [Beleswar Prasad Padhi]
  - Add R-b and T-b tags
  - Rebase with latest -next (especially, because of commit f9a4c582e508
    ("remoteproc: k3: Remove remote processor mailbox ping))

v4: https://lore.kernel.org/all/f96befca61e7a819c0e955e4ebe40dc8a481619d.1751060507.git.christophe.jaillet@wanadoo.fr/

Previous versions:
   https://lore.kernel.org/all/591e219df99da6f02c9d402f7854bc3ab23e76f9.1726328417.git.christophe.jaillet@wanadoo.fr/
---
 drivers/remoteproc/ti_k3_common.c         | 12 ++++++++++++
 drivers/remoteproc/ti_k3_dsp_remoteproc.c |  2 --
 drivers/remoteproc/ti_k3_r5_remoteproc.c  |  2 --
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
index 8266e11914af..56b71652e449 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -155,11 +155,19 @@ int k3_rproc_release(struct k3_rproc *kproc)
 }
 EXPORT_SYMBOL_GPL(k3_rproc_release);
 
+static void k3_rproc_free_channel(void *data)
+{
+	struct k3_rproc *kproc = data;
+
+	mbox_free_channel(kproc->mbox);
+}
+
 int k3_rproc_request_mbox(struct rproc *rproc)
 {
 	struct k3_rproc *kproc = rproc->priv;
 	struct mbox_client *client = &kproc->client;
 	struct device *dev = kproc->dev;
+	int ret;
 
 	client->dev = dev;
 	client->tx_done = NULL;
@@ -172,6 +180,10 @@ int k3_rproc_request_mbox(struct rproc *rproc)
 		return dev_err_probe(dev, PTR_ERR(kproc->mbox),
 				     "mbox_request_channel failed\n");
 
+	ret = devm_add_action_or_reset(dev, k3_rproc_free_channel, kproc);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(k3_rproc_request_mbox);
diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index 7a72933bd403..d6ceea6dc920 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -175,8 +175,6 @@ static void k3_dsp_rproc_remove(struct platform_device *pdev)
 		if (ret)
 			dev_err(dev, "failed to detach proc (%pe)\n", ERR_PTR(ret));
 	}
-
-	mbox_free_channel(kproc->mbox);
 }
 
 static const struct k3_rproc_mem_data c66_mems[] = {
diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index ca5ff280d2dc..04f23295ffc1 100644
--- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -1206,8 +1206,6 @@ static void k3_r5_cluster_rproc_exit(void *data)
 				return;
 			}
 		}
-
-		mbox_free_channel(kproc->mbox);
 	}
 }
 
-- 
2.51.0

