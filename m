Received: from smtp.smtpout.orange.fr (smtp-16.smtpout.orange.fr [80.12.242.16])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F7725CC69;
	Fri, 27 Jun 2025 21:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751061099; cv=none; b=avFnxH/8ZXOgFUfaFfRX+1LtKwJl0c0Ujvz4/s6OcxnG6HnJQDf//xJXTjMsswxhRlUsybMxXCJ2c7rVF6oRc//H2sYrIHl5WM2rc0jcFSdx/H3RFBTNjC9sGlAkcL13Rauem5fVspJzhjO4MQow/ikpR9uCZItOaPqp8aNoWu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751061099; c=relaxed/simple;
	bh=p84SUZOBh2KwgfNP4tsjy/n+Aua2QB4VpTm9s4Z9284=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ra6D0ovk7NjSDi/QLkWbIBp0LAq5bESTAciik6V37TNffi5KJGmlqmuFEEcgVjSix5FzUeCl1FcHdlJxH0iRQFq7YdaogrFdpFxYj3NxZVWkzq/Tdb78ZO+Xy+qOvyMGRGyp5APpt6FV8/di4wrxr4mZcFKp+Qnvu/oIEY9Khwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=E384+2Q6; arc=none smtp.client-ip=80.12.242.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="E384+2Q6"
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id VGqQuIpApqtV6VGqQuQjHe; Fri, 27 Jun 2025 23:42:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1751060571;
	bh=3azxurnCZ0xuClFPmibEzr67iBGJnUksM41hokFlhrI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=E384+2Q6HHMTaPcuK4pWvjusqmBr8WAx1n37ONcbDKH6u1oNuwvSiyaPu+37BsBjK
	 wjaJBJ7ow9AMOdzrwgTZIryCpwgeU44qy6UH+QNARAy/Tyr2/xMaNlyWG6WbWC/21f
	 JIn6GfLuulRvo7SDJDegj0wqGjiQecSeaJOCdHMGjEzoX5fMEjeXZQ9lercUeiw5DB
	 9zYb57NCey5cHygHy3qRF/vgR0obPX14pnd1T1XArfCwGXl+so+HbB3Qr2rar4tJoX
	 gJ0Uea8Gl/DzkiMo4L7O+TGMeKgUeSnGexgZWaTWpoBts7M1qe6JD9yY1mMQjD8yQF
	 zqB4T6B8+G9Ww==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 27 Jun 2025 23:42:51 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH v4] remoteproc: k3-dsp: Fix an error handling path in k3_dsp_rproc_probe()
Date: Fri, 27 Jun 2025 23:42:33 +0200
Message-ID: <f96befca61e7a819c0e955e4ebe40dc8a481619d.1751060507.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

IF an error occurs after a successful k3_rproc_request_mbox() call,
mbox_free_channel() should be called to avoid a leak.

Such a call is missing in the error handing path of k3_dsp_rproc_probe().
It is also missing both in the error handling path of k3_m4_rproc_probe()
and in (in-existent) corresponding remove function.

Switch to managed resources to avoid these leaks and simplify the code.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.

This is an update of [1].
The code has been heavily refactored recently with things moved to
ti_k3_common.c

This new version also fixes a leak in k3_m4_rproc_probe(). In this file,
mbox_free_channel() was missing.

Being very different from the v3, I've removed the previous review tags.

[1]: https://lore.kernel.org/all/591e219df99da6f02c9d402f7854bc3ab23e76f9.1726328417.git.christophe.jaillet@wanadoo.fr/
---
 drivers/remoteproc/ti_k3_common.c         | 12 +++++++++++-
 drivers/remoteproc/ti_k3_dsp_remoteproc.c |  2 --
 drivers/remoteproc/ti_k3_r5_remoteproc.c  |  2 --
 3 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
index d4f20900f33b..7a9c3fb80fec 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -155,6 +155,13 @@ int k3_rproc_release(struct k3_rproc *kproc)
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
@@ -173,6 +180,10 @@ int k3_rproc_request_mbox(struct rproc *rproc)
 		return dev_err_probe(dev, PTR_ERR(kproc->mbox),
 				     "mbox_request_channel failed\n");
 
+	ret = devm_add_action_or_reset(dev, k3_rproc_free_channel, kproc);
+	if (ret)
+		return ret;
+
 	/*
 	 * Ping the remote processor, this is only for sanity-sake for now;
 	 * there is no functional effect whatsoever.
@@ -183,7 +194,6 @@ int k3_rproc_request_mbox(struct rproc *rproc)
 	ret = mbox_send_message(kproc->mbox, (void *)RP_MBOX_ECHO_REQUEST);
 	if (ret < 0) {
 		dev_err(dev, "mbox_send_message failed (%pe)\n", ERR_PTR(ret));
-		mbox_free_channel(kproc->mbox);
 		return ret;
 	}
 
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
2.50.0

