Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9D94D09F8
	for <linux-remoteproc@vger.kernel.org>; Wed, 14 Oct 2026 10:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791973989; cv=none; b=FYK1cyXNFkmpK7TM6VB20FPSaHLkCyXaVxZeTIjDCr09ZeJ0ihVtGc8NdHQB1MCNS4z7YXDc/mfCIkTNTbetWW3W4VE8EBzj6DIx+I3TZ/pjxV7kPYDYsacgpEZXlquxtyaNPIXrRfWyYfld5CRnuxLdMvVjiTYcoPNjtYiuZqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791973989; c=relaxed/simple;
	bh=YPiafXX1neRHmZgS2I33U3gLX80MclAkugt0DJqP/Tk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UfptfKcT91D07pv8oNRoY1chsQGuFBtUoWd9NKGcGrV+NOW4uk3jLIVs7QGpakgrWCnGmvbFadgkQx5dR+cvsp8VUF7DWrE0cuXLlOw1Tej13h3JDSAeWakn85dkmlqgjpCLsyyhZghy2BhYOWgGoW3IpUkn3QuqNg/XhZGcNKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O4Bg9V5y; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O4Bg9V5y"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-354ba08cfd1so6662816eec.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 14 Oct 2026 03:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791973986; x=1792578786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GbTpK13BE+gSPxE+FJjdjgUJr/YW1bm7yl3u7boBhdA=;
        b=O4Bg9V5yVWePBX7gt9BfuDggB+r2EAf4spE3Vf0P4GlfAzqK05R9t/8kEPdrNbkM6n
         tZllgbMZf8NubHAzIENrpjWcy++Jip9L6pk7fD9PkWO1GTLE+gXLsOdKiXlNiiVJYeTS
         +nflsKZuwZrZrI0PHyJpCXu3Nk02yIe5Xl3iPonOq1RSTObQIhdiJDSPHhBGkDNr5752
         Lof++PMFs+qznoHNkvJj1kbPUyvmnnXFOUczW279b+EMXoTODvEA0tWl2EMxrdjobLjP
         wOvepHOY6Qf8EmvnDeec7o+ha0SNdK0r6otA9N2sBY/Gus3F5T/EgpSV2wZTuHHXvu+U
         gPqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791973986; x=1792578786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GbTpK13BE+gSPxE+FJjdjgUJr/YW1bm7yl3u7boBhdA=;
        b=MWjNqdt4NKbTGN/3z2ZXKBhrAIR6wZscHI9plkHpGjmaFRX67IQZwbkXEQPYh081aA
         M2sKwehbg6dCudXKfRccv8QNBwqteaNWur8dTC3xA2pwT6jePLi85S2/+/zwUnaaG7fq
         W3K6Rh0ZdtPTlahgetF1RiNylOlyKg8BH2DW4TDsfavvb4nYfBzHEWMW3p+bNa4A+vhI
         kb4w6ta6OSgWfZW1qNZ58Bz/evSpQcnUJdx9sMh4y9AqlV90e9VibCSVsyMgw7lt8Rdd
         LcKpS42glTlgu1Xecj3D88IeR69yKXaFdvucrO3dGCyF6957QuSVo8vbZVOBaJzVRbWy
         o8vQ==
X-Forwarded-Encrypted: i=1; AKwUvBzF8EV370/Xt98NsevANPkuF6CEHQbzf3LyPkH3fEOuJlYuZho5gd7ZcvZ+aKeOmU9uynjYmI+36GhVa8PpDY9B@vger.kernel.org
X-Gm-Message-State: AFq9FYLWVri5/oQq7ZyhpApCSpttJgVDrlreRrwnrQa5XpIEFQ9PIDIi
	zkZGDjyXTDhyiZ7PlfcGvSwEUjA/KgyvFUpI1oG1oDWhx4dj7eQG8YcB
X-Gm-Gg: AYBFou204jjxs81kj3jAjGe8gP6o7ChYqoy+fT0OJyBa/klcfJNtBXyTL/MsViqjyFf
	8nURA0mxHfmkJUovgTF6CDOp0OlfeXGq50KjOibLvEsnqkT/7bIfeymKyrA8DxI7CHmn7KDA6Wg
	87scyjjcWFEhw+ijxn4d6suWHWMwqxiKgwSJW1w1g7ZO4EOyXD1gI7p38HDyPJ7f7jAHGCsuKkX
	jKD9+mSZFBDSUd7Bt4V77Z2twQCH3YStJEsf91cxdmlrnxsFaNMe6bI5i0w74QtGLHSXR+Cmfv2
	czigIejipNgWXEZyUfbeiIJvvuHcYoZWSb2Xhy86bBEpBcxxEM/37EHTzyCx8TeidCVSkiUROOf
	q98Tao2OPUI9mNrSUr4JWzETGCigkTBavzXeTpJOCguQJAjxbnCvM2Owg/XT5Bq2/kF++phONHL
	SPv9FDwjltv2ZCawEEdN7w9KYI418tkge1BdtOZQWEqvO3cpMkHMOaHMV1V/wNEU5f0BT+B8s=
X-Received: by 2002:a05:693c:8951:20b0:35b:782c:aa31 with SMTP id 5a478bee46e88-35b783bf575mr9419120eec.28.1791973985605;
        Wed, 14 Oct 2026 03:33:05 -0700 (PDT)
Received: from nevers1dd ([118.95.161.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-358ee8a3387sm42371533eec.15.2026.10.14.03.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 03:33:05 -0700 (PDT)
From: Siddharth Karanam <sid9.karanam@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	Siddharth Karanam <sid9.karanam@gmail.com>
Subject: [PATCH v2 2/2] remoteproc: Merge ti_sci_dev and ti_sci_proc abstraction
Date: Wed, 14 Oct 2026 16:02:41 +0530
Message-ID: <20261014103241.3847-3-sid9.karanam@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014103241.3847-1-sid9.karanam@gmail.com>
References: <20261014103241.3847-1-sid9.karanam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The previous version of the patch had a new header ti_sci_dev.h,
that mirrors ti_sci_proc.h in terms of the struct decl and
its helper function structure, with the goal of abstracting
all ti_sci_handle's members like ti_sci_dev_ops from being
invoked directly in the driver code.

Upon discussing in the original patch thread, it seemed
better to combine ti_sci_proc.h and ti_sci_dev.h's structs
and merge all their helpers into a single header. That is
what ti_sci_ctrl.h aims to do: It has the union of tsd
(ti_sci_dev) and tsp (ti_sci_proc) and both their helper
functions are prefixed with ti_sci_ctrl_dev and
ti_sci_ctrl_proc respectively.

The goal of the patch is to maintain a single source
of origin for all ti_sci_dev/proc_ops call sites. Any stray calls
to dev_ops/proc_ops function pointer members in driver code should
eventually be abstracted through this header.

In the future we can try to abstract tsd's dev_ops even further
through pm_runtime, but there are some roadblocks that
I am unaware of, so that warranties a different patch.

Signed-off-by: Siddharth Karanam <sid9.karanam@gmail.com>
---
 drivers/remoteproc/ti_k3_common.c         |  17 +--
 drivers/remoteproc/ti_k3_common.h         |   6 +-
 drivers/remoteproc/ti_k3_dsp_remoteproc.c |  26 ++--
 drivers/remoteproc/ti_k3_m4_remoteproc.c  |  24 ++-
 drivers/remoteproc/ti_k3_r5_remoteproc.c  |  58 +++----
 drivers/remoteproc/ti_sci_ctrl.h          | 177 ++++++++++++++++++++++
 drivers/remoteproc/ti_sci_dev.h           |  82 ----------
 drivers/remoteproc/ti_sci_proc.h          | 130 ----------------
 8 files changed, 231 insertions(+), 289 deletions(-)
 create mode 100644 drivers/remoteproc/ti_sci_ctrl.h
 delete mode 100644 drivers/remoteproc/ti_sci_dev.h
 delete mode 100644 drivers/remoteproc/ti_sci_proc.h

diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
index befa9a9bea3a..f778ae545bde 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -32,8 +32,7 @@
 
 #include "omap_remoteproc.h"
 #include "remoteproc_internal.h"
-#include "ti_sci_dev.h"
-#include "ti_sci_proc.h"
+#include "ti_sci_ctrl.h"
 #include "ti_k3_common.h"
 
 /**
@@ -121,7 +120,7 @@ int k3_rproc_reset(struct k3_rproc *kproc)
 		if (ret)
 			dev_err(dev, "local-reset assert failed (%pe)\n", ERR_PTR(ret));
 	} else {
-		ret = ti_sci_dev_put_device(kproc->tsd);
+		ret = ti_sci_ctrl_dev_put_device(kproc->tsc);
 		if (ret)
 			dev_err(dev, "module-reset assert failed (%pe)\n", ERR_PTR(ret));
 	}
@@ -140,11 +139,11 @@ int k3_rproc_release(struct k3_rproc *kproc)
 		ret = reset_control_deassert(kproc->reset);
 		if (ret) {
 			dev_err(dev, "local-reset deassert failed, (%pe)\n", ERR_PTR(ret));
-			if (ti_sci_dev_put_device(kproc->tsd))
+			if (ti_sci_ctrl_dev_put_device(kproc->tsc))
 				dev_warn(dev, "module-reset assert back failed\n");
 		}
 	} else {
-		ret = ti_sci_dev_get_device(kproc->tsd);
+		ret = ti_sci_ctrl_dev_get_device(kproc->tsc);
 		if (ret)
 			dev_err(dev, "module-reset deassert failed (%pe)\n", ERR_PTR(ret));
 	}
@@ -221,7 +220,7 @@ int k3_rproc_prepare(struct rproc *rproc)
 		}
 	}
 
-	ret = ti_sci_dev_get_device(kproc->tsd);
+	ret = ti_sci_ctrl_dev_get_device(kproc->tsc);
 	if (ret) {
 		dev_err(dev, "could not deassert module-reset for internal RAM loading\n");
 		return ret;
@@ -250,7 +249,7 @@ int k3_rproc_unprepare(struct rproc *rproc)
 	if (rproc->state == RPROC_DETACHED)
 		return 0;
 
-	ret = ti_sci_dev_put_device(kproc->tsd);
+	ret = ti_sci_ctrl_dev_put_device(kproc->tsc);
 	if (ret) {
 		dev_err(dev, "module-reset assert failed\n");
 		return ret;
@@ -528,9 +527,9 @@ EXPORT_SYMBOL_GPL(k3_reserved_mem_init);
 
 void k3_release_tsp(void *data)
 {
-	struct ti_sci_proc *tsp = data;
+	struct ti_sci_ctrl *tsc = data;
 
-	ti_sci_proc_release(tsp);
+	ti_sci_ctrl_proc_release(tsc);
 }
 EXPORT_SYMBOL_GPL(k3_release_tsp);
 
diff --git a/drivers/remoteproc/ti_k3_common.h b/drivers/remoteproc/ti_k3_common.h
index 7ba0903ebe0a..f4b9bb0fa0f0 100644
--- a/drivers/remoteproc/ti_k3_common.h
+++ b/drivers/remoteproc/ti_k3_common.h
@@ -71,8 +71,7 @@ struct k3_rproc_dev_data {
  * @num_rmems: number of reserved memory regions
  * @reset: reset control handle
  * @data: pointer to DSP-specific device data
- * @tsp: TI-SCI processor control handle
- * @tsd: TI-SCI device control handle
+ * @tsc: TI-SCI control handle
  * @ti_sci: TI-SCI handle
  * @mbox: mailbox channel handle
  * @client: mailbox client to request the mailbox channel
@@ -87,8 +86,7 @@ struct k3_rproc {
 	int num_rmems;
 	struct reset_control *reset;
 	const struct k3_rproc_dev_data *data;
-	struct ti_sci_proc *tsp;
-	struct ti_sci_dev *tsd;
+	struct ti_sci_ctrl *tsc;
 	const struct ti_sci_handle *ti_sci;
 	struct mbox_chan *mbox;
 	struct mbox_client client;
diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index b6042fe7bae7..6cbf21c82e85 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -19,8 +19,7 @@
 
 #include "omap_remoteproc.h"
 #include "remoteproc_internal.h"
-#include "ti_sci_dev.h"
-#include "ti_sci_proc.h"
+#include "ti_sci_ctrl.h"
 #include "ti_k3_common.h"
 
 /*
@@ -45,7 +44,7 @@ static int k3_dsp_rproc_start(struct rproc *rproc)
 	}
 
 	dev_dbg(dev, "booting DSP core using boot addr = 0x%x\n", boot_addr);
-	ret = ti_sci_proc_set_config(kproc->tsp, boot_addr, 0, 0);
+	ret = ti_sci_ctrl_proc_set_config(kproc->tsc, boot_addr, 0, 0);
 	if (ret)
 		return ret;
 
@@ -115,22 +114,17 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(kproc->reset),
 				     "failed to get reset\n");
 
-	kproc->tsp = ti_sci_proc_of_get_tsp(dev, kproc->ti_sci);
-	if (IS_ERR(kproc->tsp))
-		return dev_err_probe(dev, PTR_ERR(kproc->tsp),
-				     "failed to construct ti-sci proc control\n");
+	kproc->tsc = ti_sci_ctrl_of_get(dev, kproc->ti_sci);
+	if (IS_ERR(kproc->tsc))
+		return dev_err_probe(dev, PTR_ERR(kproc->tsc),
+				     "failed to get construct ti-sci control\n");
 
-	kproc->tsd = ti_sci_dev_of_get_tsd(dev, kproc->ti_sci);
-	if (IS_ERR(kproc->tsd))
-		return dev_err_probe(dev, PTR_ERR(kproc->tsd),
-				     "failed to construct ti-sci dev control\n");
-
-	ret = ti_sci_proc_request(kproc->tsp);
+	ret = ti_sci_ctrl_proc_request(kproc->tsc);
 	if (ret < 0) {
-		dev_err_probe(dev, ret, "ti_sci_proc_request failed\n");
+		dev_err_probe(dev, ret, "ti_sci_ctrl_proc_request failed\n");
 		return ret;
 	}
-	ret = devm_add_action_or_reset(dev, k3_release_tsp, kproc->tsp);
+	ret = devm_add_action_or_reset(dev, k3_release_tsp, kproc->tsc);
 	if (ret)
 		return ret;
 
@@ -142,7 +136,7 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "reserved memory init failed\n");
 
-	ret = ti_sci_dev_is_on(kproc->tsd, NULL, &p_state);
+	ret = ti_sci_ctrl_dev_is_on(kproc->tsc, NULL, &p_state);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to get initial state, mode cannot be determined\n");
 
diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
index ddf8cb9974ca..9c789a92d083 100644
--- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
@@ -18,8 +18,7 @@
 
 #include "omap_remoteproc.h"
 #include "remoteproc_internal.h"
-#include "ti_sci_dev.h"
-#include "ti_sci_proc.h"
+#include "ti_sci_ctrl.h"
 #include "ti_k3_common.h"
 
 static const struct rproc_ops k3_m4_rproc_ops = {
@@ -75,20 +74,15 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
 	if (IS_ERR(kproc->reset))
 		return dev_err_probe(dev, PTR_ERR(kproc->reset), "failed to get reset\n");
 
-	kproc->tsp = ti_sci_proc_of_get_tsp(dev, kproc->ti_sci);
-	if (IS_ERR(kproc->tsp))
-		return dev_err_probe(dev, PTR_ERR(kproc->tsp),
-				     "failed to construct ti-sci proc control\n");
+	kproc->tsc = ti_sci_ctrl_of_get(dev, kproc->ti_sci);
+	if (IS_ERR(kproc->tsc))
+		return dev_err_probe(dev, PTR_ERR(kproc->tsc),
+				     "failed to construct ti-sci control\n");
 
-	kproc->tsd = ti_sci_dev_of_get_tsd(dev, kproc->ti_sci);
-	if (IS_ERR(kproc->tsd))
-		return dev_err_probe(dev, PTR_ERR(kproc->tsd),
-				     "failed to construct ti-sci dev control\n");
-
-	ret = ti_sci_proc_request(kproc->tsp);
+	ret = ti_sci_ctrl_proc_request(kproc->tsc);
 	if (ret < 0)
-		return dev_err_probe(dev, ret, "ti_sci_proc_request failed\n");
-	ret = devm_add_action_or_reset(dev, k3_release_tsp, kproc->tsp);
+		return dev_err_probe(dev, ret, "ti_sci_ctrl_proc_request failed\n");
+	ret = devm_add_action_or_reset(dev, k3_release_tsp, kproc->tsc);
 	if (ret)
 		return ret;
 
@@ -100,7 +94,7 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "reserved memory init failed\n");
 
-	ret = ti_sci_dev_is_on(kproc->tsd, &r_state, &p_state);
+	ret = ti_sci_ctrl_dev_is_on(kproc->tsc, &r_state, &p_state);
 	if (ret)
 		return dev_err_probe(dev, ret,
 				     "failed to get initial state, mode cannot be determined\n");
diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index a387848ac400..caeeb18581d0 100644
--- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -25,8 +25,7 @@
 
 #include "omap_remoteproc.h"
 #include "remoteproc_internal.h"
-#include "ti_sci_dev.h"
-#include "ti_sci_proc.h"
+#include "ti_sci_ctrl.h"
 #include "ti_k3_common.h"
 
 /* This address can either be for ATCM or BTCM with the other at address 0x0 */
@@ -141,7 +140,7 @@ static int k3_r5_split_reset(struct k3_rproc *kproc)
 		return ret;
 	}
 
-	ret = ti_sci_dev_put_device(kproc->tsd);
+	ret = ti_sci_ctrl_dev_put_device(kproc->tsc);
 	if (ret) {
 		dev_err(kproc->dev, "module-reset assert failed, ret = %d\n",
 			ret);
@@ -156,7 +155,7 @@ static int k3_r5_split_release(struct k3_rproc *kproc)
 {
 	int ret;
 
-	ret = ti_sci_dev_get_device(kproc->tsd);
+	ret = ti_sci_ctrl_dev_get_device(kproc->tsc);
 	if (ret) {
 		dev_err(kproc->dev, "module-reset deassert failed, ret = %d\n",
 			ret);
@@ -167,7 +166,7 @@ static int k3_r5_split_release(struct k3_rproc *kproc)
 	if (ret) {
 		dev_err(kproc->dev, "local-reset deassert failed, ret = %d\n",
 			ret);
-		if (ti_sci_dev_put_device(kproc->tsd))
+		if (ti_sci_ctrl_dev_put_device(kproc->tsc))
 			dev_warn(kproc->dev, "module-reset assert back failed\n");
 	}
 
@@ -194,7 +193,7 @@ static int k3_r5_lockstep_reset(struct k3_r5_cluster *cluster)
 	/* disable PSC modules on all applicable cores */
 	list_for_each_entry(core, &cluster->cores, elem) {
 		kproc = core->kproc;
-		ret = ti_sci_dev_put_device(kproc->tsd);
+		ret = ti_sci_ctrl_dev_put_device(kproc->tsc);
 		if (ret) {
 			dev_err(core->dev, "module-reset assert failed, ret = %d\n",
 				ret);
@@ -207,7 +206,7 @@ static int k3_r5_lockstep_reset(struct k3_r5_cluster *cluster)
 unroll_module_reset:
 	list_for_each_entry_continue_reverse(core, &cluster->cores, elem) {
 		kproc = core->kproc;
-		if (ti_sci_dev_put_device(kproc->tsd))
+		if (ti_sci_ctrl_dev_put_device(kproc->tsc))
 			dev_warn(core->dev, "module-reset assert back failed\n");
 	}
 	core = list_last_entry(&cluster->cores, struct k3_r5_core, elem);
@@ -229,7 +228,7 @@ static int k3_r5_lockstep_release(struct k3_r5_cluster *cluster)
 	/* enable PSC modules on all applicable cores */
 	list_for_each_entry_reverse(core, &cluster->cores, elem) {
 		kproc = core->kproc;
-		ret = ti_sci_dev_get_device(kproc->tsd);
+		ret = ti_sci_ctrl_dev_get_device(kproc->tsc);
 		if (ret) {
 			dev_err(core->dev, "module-reset deassert failed, ret = %d\n",
 				ret);
@@ -259,7 +258,7 @@ static int k3_r5_lockstep_release(struct k3_r5_cluster *cluster)
 unroll_module_reset:
 	list_for_each_entry_from(core, &cluster->cores, elem) {
 		kproc = core->kproc;
-		if (ti_sci_dev_put_device(kproc->tsd))
+		if (ti_sci_ctrl_dev_put_device(kproc->tsc))
 			dev_warn(core->dev, "module-reset assert back failed\n");
 	}
 
@@ -268,13 +267,13 @@ static int k3_r5_lockstep_release(struct k3_r5_cluster *cluster)
 
 static inline int k3_r5_core_halt(struct k3_rproc *kproc)
 {
-	return ti_sci_proc_set_control(kproc->tsp,
+	return ti_sci_ctrl_proc_set_control(kproc->tsc,
 				       PROC_BOOT_CTRL_FLAG_R5_CORE_HALT, 0);
 }
 
 static inline int k3_r5_core_run(struct k3_rproc *kproc)
 {
-	return ti_sci_proc_set_control(kproc->tsp,
+	return ti_sci_ctrl_proc_set_control(kproc->tsc,
 				       0, PROC_BOOT_CTRL_FLAG_R5_CORE_HALT);
 }
 
@@ -328,7 +327,7 @@ static int k3_r5_rproc_prepare(struct rproc *rproc)
 		}
 	}
 
-	ret = ti_sci_proc_get_status(kproc->tsp, &boot_vec, &cfg, &ctrl, &stat);
+	ret = ti_sci_ctrl_proc_get_status(kproc->tsc, &boot_vec, &cfg, &ctrl, &stat);
 	if (ret < 0)
 		return ret;
 	mem_init_dis = !!(cfg & PROC_BOOT_CFG_FLAG_R5_MEM_INIT_DIS);
@@ -469,7 +468,7 @@ static int k3_r5_rproc_start(struct rproc *rproc)
 	dev_dbg(dev, "booting R5F core using boot addr = 0x%x\n", boot_addr);
 
 	/* boot vector need not be programmed for Core1 in LockStep mode */
-	ret = ti_sci_proc_set_config(kproc->tsp, boot_addr, 0, 0);
+	ret = ti_sci_ctrl_proc_set_config(kproc->tsc, boot_addr, 0, 0);
 	if (ret)
 		return ret;
 
@@ -612,7 +611,7 @@ static const struct rproc_ops k3_r5_rproc_ops = {
  * by the System Processor.
  *
  * This function is used to pre-configure these settings for each R5F core, and
- * the configuration is all done through various ti_sci_proc functions that
+ * the configuration is all done through various ti_sci_ctrl functions that
  * communicate with the System Processor. The function also ensures that both
  * the cores are halted before the .prepare() step.
  *
@@ -654,7 +653,7 @@ static int k3_r5_rproc_configure(struct k3_rproc *kproc)
 		core = kproc->priv;
 	}
 
-	ret = ti_sci_proc_get_status(core->kproc->tsp, &boot_vec, &cfg, &ctrl,
+	ret = ti_sci_ctrl_proc_get_status(core->kproc->tsc, &boot_vec, &cfg, &ctrl,
 				     &stat);
 	if (ret < 0)
 		return ret;
@@ -732,7 +731,7 @@ static int k3_r5_rproc_configure(struct k3_rproc *kproc)
 				clr_cfg &= ~PROC_BOOT_CFG_FLAG_R5_LOCKSTEP;
 				clr_cfg &= ~PROC_BOOT_CFG_FLAG_R5_TEINIT;
 			}
-			ret = ti_sci_proc_set_config(temp->kproc->tsp, boot_vec,
+			ret = ti_sci_ctrl_proc_set_config(temp->kproc->tsc, boot_vec,
 						     set_cfg, clr_cfg);
 			if (ret)
 				goto out;
@@ -740,14 +739,14 @@ static int k3_r5_rproc_configure(struct k3_rproc *kproc)
 
 		set_cfg = PROC_BOOT_CFG_FLAG_R5_LOCKSTEP;
 		clr_cfg = 0;
-		ret = ti_sci_proc_set_config(core->kproc->tsp, boot_vec,
+		ret = ti_sci_ctrl_proc_set_config(core->kproc->tsc, boot_vec,
 					     set_cfg, clr_cfg);
 	} else {
 		ret = k3_r5_core_halt(core->kproc);
 		if (ret)
 			goto out;
 
-		ret = ti_sci_proc_set_config(core->kproc->tsp, boot_vec,
+		ret = ti_sci_ctrl_proc_set_config(core->kproc->tsc, boot_vec,
 					     set_cfg, clr_cfg);
 	}
 
@@ -821,7 +820,7 @@ static int k3_r5_rproc_configure_mode(struct k3_rproc *kproc)
 
 	core0 = list_first_entry(&cluster->cores, struct k3_r5_core, elem);
 
-	ret = ti_sci_dev_is_on(kproc->tsd, &r_state, &c_state);
+	ret = ti_sci_ctrl_dev_is_on(kproc->tsc, &r_state, &c_state);
 	if (ret) {
 		dev_err(cdev, "failed to get initial state, mode cannot be determined, ret = %d\n",
 			ret);
@@ -845,7 +844,7 @@ static int k3_r5_rproc_configure_mode(struct k3_rproc *kproc)
 	 */
 	core->released_from_reset = c_state;
 
-	ret = ti_sci_proc_get_status(kproc->tsp, &boot_vec, &cfg, &ctrl,
+	ret = ti_sci_ctrl_proc_get_status(kproc->tsc, &boot_vec, &cfg, &ctrl,
 				     &stat);
 	if (ret < 0) {
 		dev_err(cdev, "failed to get initial processor status, ret = %d\n",
@@ -1065,17 +1064,10 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
 			goto out;
 		}
 
-		kproc->tsp = ti_sci_proc_of_get_tsp(cdev, kproc->ti_sci);
-		if (IS_ERR(kproc->tsp)) {
-			ret = dev_err_probe(cdev, PTR_ERR(kproc->tsp),
-					    "failed to construct ti-sci proc control\n");
-			goto out;
-		}
-
-		kproc->tsd = ti_sci_dev_of_get_tsd(cdev, kproc->ti_sci);
-		if (IS_ERR(kproc->tsd)) {
-			ret = dev_err_probe(cdev, PTR_ERR(kproc->tsd),
-					    "failed to construct ti-sci dev control\n");
+		kproc->tsc = ti_sci_ctrl_of_get(cdev, kproc->ti_sci);
+		if (IS_ERR(kproc->tsc)) {
+			ret = dev_err_probe(cdev, PTR_ERR(kproc->tsc),
+					    "failed to construct ti-sci control\n");
 			goto out;
 		}
 
@@ -1086,13 +1078,13 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
 			goto out;
 		}
 
-		ret = ti_sci_proc_request(kproc->tsp);
+		ret = ti_sci_ctrl_proc_request(kproc->tsc);
 		if (ret < 0) {
 			dev_err(cdev, "ti_sci_proc_request failed, ret = %d\n", ret);
 			goto out;
 		}
 
-		ret = devm_add_action_or_reset(cdev, k3_release_tsp, kproc->tsp);
+		ret = devm_add_action_or_reset(cdev, k3_release_tsp, kproc->tsc);
 		if (ret)
 			goto out;
 	}
diff --git a/drivers/remoteproc/ti_sci_ctrl.h b/drivers/remoteproc/ti_sci_ctrl.h
new file mode 100644
index 000000000000..76aee8c5317a
--- /dev/null
+++ b/drivers/remoteproc/ti_sci_ctrl.h
@@ -0,0 +1,177 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Texas Instruments TI-SCI Processor Controller Helper Functions
+ *
+ * Copyright (C) 2018-2026 Texas Instruments Incorporated - https://www.ti.com/
+ *	Suman Anna <s-anna@ti.com>
+ */
+
+#ifndef REMOTEPROC_TI_SCI_CTRL_H
+#define REMOTEPROC_TI_SCI_CTRL_H
+
+#include <linux/of.h>
+#include <linux/soc/ti/ti_sci_protocol.h>
+
+/**
+ * struct ti_sci_ctrl - structure representing a remoteproc control client
+ * @sci: cached TI-SCI protocol handle
+ * @dev: cached client device pointer
+ * @dev_ops: cached TI-SCI device ops
+ * @proc_ops: cached TI-SCI proc ops
+ * @dev_id: TI-SCI device id for the consumer remoteproc device
+ * @proc_id: processor id for the consumer remoteproc device
+ * @host_id: host id to pass the control over for this consumer remoteproc
+ *	     device
+ */
+struct ti_sci_ctrl {
+	const struct ti_sci_handle *sci;
+	struct device *dev;
+	const struct ti_sci_dev_ops *dev_ops;
+	const struct ti_sci_proc_ops *proc_ops;
+	u32 dev_id;
+	u8 proc_id;
+	u8 host_id;
+};
+
+static inline
+struct ti_sci_ctrl *ti_sci_ctrl_of_get(struct device *dev,
+				       const struct ti_sci_handle *sci)
+{
+	struct ti_sci_ctrl *tsc;
+	u32 proc_ids[2];
+	int ret;
+
+	tsc = devm_kzalloc(dev, sizeof(*tsc), GFP_KERNEL);
+	if (!tsc)
+		return ERR_PTR(-ENOMEM);
+
+	ret = of_property_read_u32(dev_of_node(dev), "ti,sci-dev-id",
+				   &tsc->dev_id);
+	if (ret < 0)
+		return ERR_PTR(ret);
+
+	ret = of_property_read_u32_array(dev_of_node(dev), "ti,sci-proc-ids",
+					 proc_ids, 2);
+	if (ret < 0)
+		return ERR_PTR(ret);
+
+	tsc->dev = dev;
+	tsc->sci = sci;
+	tsc->dev_ops = &sci->ops.dev_ops;
+	tsc->proc_ops = &sci->ops.proc_ops;
+	tsc->proc_id = proc_ids[0];
+	tsc->host_id = proc_ids[1];
+
+	return tsc;
+}
+
+/* Power-management helper functions */
+static inline int ti_sci_ctrl_dev_is_on(struct ti_sci_ctrl *tsc, bool *r_state,
+				    bool *c_state)
+{
+	int ret;
+
+	ret = tsc->dev_ops->is_on(tsc->sci, tsc->dev_id, r_state, c_state);
+	if (ret)
+		dev_err(tsc->dev, "ti-sci device is_on failed: %d\n", ret);
+	return ret;
+}
+
+/* Request power on to rproc */
+static inline int ti_sci_ctrl_dev_get_device(struct ti_sci_ctrl *tsc)
+{
+	int ret = 0;
+
+	ret = tsc->dev_ops->get_device(tsc->sci, tsc->dev_id);
+	if (ret)
+		dev_err(tsc->dev, "ti-sci device get failed: %d\n", ret);
+	return ret;
+}
+
+/* Request power off to a rproc */
+static inline int ti_sci_ctrl_dev_put_device(struct ti_sci_ctrl *tsc)
+{
+	int ret = 0;
+
+	ret = tsc->dev_ops->put_device(tsc->sci, tsc->dev_id);
+	if (ret)
+		dev_err(tsc->dev, "ti-sci device put failed: %d\n", ret);
+	return ret;
+}
+
+/* Processor control helper functions */
+static inline int ti_sci_ctrl_proc_request(struct ti_sci_ctrl *tsc)
+{
+	int ret;
+
+	ret = tsc->proc_ops->request(tsc->sci, tsc->proc_id);
+	if (ret)
+		dev_err(tsc->dev, "ti-sci processor request failed: %d\n",
+			ret);
+	return ret;
+}
+
+static inline int ti_sci_ctrl_proc_release(struct ti_sci_ctrl *tsc)
+{
+	int ret;
+
+	ret = tsc->proc_ops->release(tsc->sci, tsc->proc_id);
+	if (ret)
+		dev_err(tsc->dev, "ti-sci processor release failed: %d\n",
+			ret);
+	return ret;
+}
+
+static inline int ti_sci_ctrl_proc_handover(struct ti_sci_ctrl *tsc)
+{
+	int ret;
+
+	ret = tsc->proc_ops->handover(tsc->sci, tsc->proc_id, tsc->host_id);
+	if (ret)
+		dev_err(tsc->dev, "ti-sci processor handover of %d to %d failed: %d\n",
+			tsc->proc_id, tsc->host_id, ret);
+	return ret;
+}
+
+static inline int ti_sci_ctrl_proc_set_config(struct ti_sci_ctrl *tsc,
+					 u64 boot_vector,
+					 u32 cfg_set, u32 cfg_clr)
+{
+	int ret;
+
+	ret = tsc->proc_ops->set_config(tsc->sci, tsc->proc_id, boot_vector,
+					cfg_set, cfg_clr);
+	if (ret)
+		dev_err(tsc->dev, "ti-sci processor set_config failed: %d\n",
+			ret);
+	return ret;
+}
+
+static inline int ti_sci_ctrl_proc_set_control(struct ti_sci_ctrl *tsc,
+					  u32 ctrl_set, u32 ctrl_clr)
+{
+	int ret;
+
+	ret = tsc->proc_ops->set_control(tsc->sci, tsc->proc_id, ctrl_set,
+					 ctrl_clr);
+	if (ret)
+		dev_err(tsc->dev, "ti-sci processor set_control failed: %d\n",
+			ret);
+	return ret;
+}
+
+static inline int ti_sci_ctrl_proc_get_status(struct ti_sci_ctrl *tsc,
+					 u64 *boot_vector, u32 *cfg_flags,
+					 u32 *ctrl_flags, u32 *status_flags)
+{
+	int ret;
+
+	ret = tsc->proc_ops->get_status(tsc->sci, tsc->proc_id, boot_vector,
+					cfg_flags, ctrl_flags, status_flags);
+	if (ret)
+		dev_err(tsc->dev, "ti-sci processor get_status failed: %d\n",
+			ret);
+	return ret;
+}
+
+#endif /* REMOTEPROC_TI_SCI_CTRL_H */
diff --git a/drivers/remoteproc/ti_sci_dev.h b/drivers/remoteproc/ti_sci_dev.h
deleted file mode 100644
index 897998a97d7f..000000000000
--- a/drivers/remoteproc/ti_sci_dev.h
+++ /dev/null
@@ -1,82 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Texas Instruments TI-SCI Device Controller Helper Functions
- *
- * Copyright (C) 2026 Texas Instruments Incorporated - https://www.ti.com/
- */
-
-#ifndef REMOTEPROC_TI_SCI_DEV_H
-#define REMOTEPROC_TI_SCI_DEV_H
-
-#include <linux/soc/ti/ti_sci_protocol.h>
-#include <linux/pm_runtime.h>
-
-/**
- * struct ti_sci_dev - structure representing a device control client
- * @sci: cached TI-SCI protocol handle
- * @ops: cached TI-SCI device ops
- * @dev: cached client device pointer
- * @dev_id: TI-SCI device id for the consumer remoteproc device
- */
-struct ti_sci_dev {
-	const struct ti_sci_handle *sci;
-	const struct ti_sci_dev_ops *ops;
-	struct device *dev;
-	u32 dev_id;
-};
-
-static inline
-struct ti_sci_dev *ti_sci_dev_of_get_tsd(struct device *dev,
-					 const struct ti_sci_handle *sci)
-{
-	struct ti_sci_dev *tsd;
-	int ret;
-
-	tsd = devm_kzalloc(dev, sizeof(*tsd), GFP_KERNEL);
-	if (!tsd)
-		return ERR_PTR(-ENOMEM);
-
-	ret = of_property_read_u32(dev_of_node(dev), "ti,sci-dev-id",
-				   &tsd->dev_id);
-	if (ret < 0)
-		return ERR_PTR(ret);
-
-	tsd->dev = dev;
-	tsd->sci = sci;
-	tsd->ops = &sci->ops.dev_ops;
-
-	return tsd;
-}
-
-static inline int ti_sci_dev_is_on(struct ti_sci_dev *tsd, bool *r_state,
-				   bool *c_state)
-{
-	int ret;
-
-	ret = tsd->ops->is_on(tsd->sci, tsd->dev_id, r_state, c_state);
-	if (ret)
-		dev_err(tsd->dev, "ti-sci device is_on failed: %d\n", ret);
-	return ret;
-}
-
-static inline int ti_sci_dev_get_device(struct ti_sci_dev *tsd)
-{
-	int ret;
-
-	ret = tsd->ops->get_device(tsd->sci, tsd->dev_id);
-	if (ret)
-		dev_err(tsd->dev, "ti-sci device get failed: %d\n", ret);
-	return ret;
-}
-
-static inline int ti_sci_dev_put_device(struct ti_sci_dev *tsd)
-{
-	int ret;
-
-	ret = tsd->ops->put_device(tsd->sci, tsd->dev_id);
-	if (ret)
-		dev_err(tsd->dev, "ti-sci device put failed: %d\n", ret);
-	return ret;
-}
-
-#endif /* REMOTEPROC_TI_SCI_DEV_H */
diff --git a/drivers/remoteproc/ti_sci_proc.h b/drivers/remoteproc/ti_sci_proc.h
deleted file mode 100644
index f3911ce75252..000000000000
--- a/drivers/remoteproc/ti_sci_proc.h
+++ /dev/null
@@ -1,130 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Texas Instruments TI-SCI Processor Controller Helper Functions
- *
- * Copyright (C) 2018-2020 Texas Instruments Incorporated - https://www.ti.com/
- *	Suman Anna <s-anna@ti.com>
- */
-
-#ifndef REMOTEPROC_TI_SCI_PROC_H
-#define REMOTEPROC_TI_SCI_PROC_H
-
-#include <linux/soc/ti/ti_sci_protocol.h>
-
-/**
- * struct ti_sci_proc - structure representing a processor control client
- * @sci: cached TI-SCI protocol handle
- * @ops: cached TI-SCI proc ops
- * @dev: cached client device pointer
- * @proc_id: processor id for the consumer remoteproc device
- * @host_id: host id to pass the control over for this consumer remoteproc
- *	     device
- */
-struct ti_sci_proc {
-	const struct ti_sci_handle *sci;
-	const struct ti_sci_proc_ops *ops;
-	struct device *dev;
-	u8 proc_id;
-	u8 host_id;
-};
-
-static inline
-struct ti_sci_proc *ti_sci_proc_of_get_tsp(struct device *dev,
-					   const struct ti_sci_handle *sci)
-{
-	struct ti_sci_proc *tsp;
-	u32 temp[2];
-	int ret;
-
-	ret = of_property_read_u32_array(dev_of_node(dev), "ti,sci-proc-ids",
-					 temp, 2);
-	if (ret < 0)
-		return ERR_PTR(ret);
-
-	tsp = devm_kzalloc(dev, sizeof(*tsp), GFP_KERNEL);
-	if (!tsp)
-		return ERR_PTR(-ENOMEM);
-
-	tsp->dev = dev;
-	tsp->sci = sci;
-	tsp->ops = &sci->ops.proc_ops;
-	tsp->proc_id = temp[0];
-	tsp->host_id = temp[1];
-
-	return tsp;
-}
-
-static inline int ti_sci_proc_request(struct ti_sci_proc *tsp)
-{
-	int ret;
-
-	ret = tsp->ops->request(tsp->sci, tsp->proc_id);
-	if (ret)
-		dev_err(tsp->dev, "ti-sci processor request failed: %d\n",
-			ret);
-	return ret;
-}
-
-static inline int ti_sci_proc_release(struct ti_sci_proc *tsp)
-{
-	int ret;
-
-	ret = tsp->ops->release(tsp->sci, tsp->proc_id);
-	if (ret)
-		dev_err(tsp->dev, "ti-sci processor release failed: %d\n",
-			ret);
-	return ret;
-}
-
-static inline int ti_sci_proc_handover(struct ti_sci_proc *tsp)
-{
-	int ret;
-
-	ret = tsp->ops->handover(tsp->sci, tsp->proc_id, tsp->host_id);
-	if (ret)
-		dev_err(tsp->dev, "ti-sci processor handover of %d to %d failed: %d\n",
-			tsp->proc_id, tsp->host_id, ret);
-	return ret;
-}
-
-static inline int ti_sci_proc_set_config(struct ti_sci_proc *tsp,
-					 u64 boot_vector,
-					 u32 cfg_set, u32 cfg_clr)
-{
-	int ret;
-
-	ret = tsp->ops->set_config(tsp->sci, tsp->proc_id, boot_vector,
-				   cfg_set, cfg_clr);
-	if (ret)
-		dev_err(tsp->dev, "ti-sci processor set_config failed: %d\n",
-			ret);
-	return ret;
-}
-
-static inline int ti_sci_proc_set_control(struct ti_sci_proc *tsp,
-					  u32 ctrl_set, u32 ctrl_clr)
-{
-	int ret;
-
-	ret = tsp->ops->set_control(tsp->sci, tsp->proc_id, ctrl_set, ctrl_clr);
-	if (ret)
-		dev_err(tsp->dev, "ti-sci processor set_control failed: %d\n",
-			ret);
-	return ret;
-}
-
-static inline int ti_sci_proc_get_status(struct ti_sci_proc *tsp,
-					 u64 *boot_vector, u32 *cfg_flags,
-					 u32 *ctrl_flags, u32 *status_flags)
-{
-	int ret;
-
-	ret = tsp->ops->get_status(tsp->sci, tsp->proc_id, boot_vector,
-				   cfg_flags, ctrl_flags, status_flags);
-	if (ret)
-		dev_err(tsp->dev, "ti-sci processor get_status failed: %d\n",
-			ret);
-	return ret;
-}
-
-#endif /* REMOTEPROC_TI_SCI_PROC_H */
-- 
2.55.0

