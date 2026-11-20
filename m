Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795154570;
	b=YS1R0aUAuwNpHcZGEDC7oGs29fjBkTWlOzUTEVcQdxH+MeDVONJbZsAoCFFJN8GRMEb3
	 4ZHxFlEJf21ZeTsXVR26StEXR2unBx1UI5IH/doSv4DnztY37ytPEVWtvQ59P0Wh8qQXn
	 qQaqZsUJk6z4rCRf0HEMdsOsuSFEREzsgbBfNQJ/wWHsasq4gccq9KpGYVGbrSQOJk87J
	 gbhdW3Cg0lUvnaT4aJzF8ztHRl3LBkDPOlcaaCEJxpfIRz2NrFBZNdTpNp/S9cp0g841/
	 ipkIPVKo/9dhE81e/j3HtcQ3P+NZ3gob2qlMIZ6RRTedFRTtcs3xrKQNJFJAlPRgFbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795154570;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DKhQU60ApdSBOC9P+XYcHToaVAFsV4f9/nmZ4Azw7rg=;
	b=uSVnoUJ9sLyChJwV8oBS2vohfmS+b4+sd6nnfaGMvlgv7T4Daf3Y59V8mgRCfhbT/Khu
	 0NGfc8wTK4JDE+zRkts5UXYbUbd+KEWuGee7u3DtSpamqYIOq+ul/eLbRzcDw3keakGvb
	 6rZ56ZzBKp7oEpqb+KTcLPEUdp6N1oK3i99OVjoGZTx5Bo86uZIx94236pkg8TkJFjydQ
	 lgZNzBbJgiyxcADgJXUQEW5hCLH3ydeO7IR7/IaVFfsP6N7Ri/IbYxih0QEYTVd/Qi5qS
	 QbYcDjTETF3EqT/LbNWZNLQ8+4/q717adZlBq2T/fwOnohkvgAvWYv+QluYYE9Ylqfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=buokrWoC;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F625606A50B
	for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2026 06:02:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F625606A50B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=buokrWoC
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-385d8a00598so331898eec.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 19 Nov 2026 22:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795154569; x=1795759369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DKhQU60ApdSBOC9P+XYcHToaVAFsV4f9/nmZ4Azw7rg=;
        b=buokrWoCUCirwVvmJJgcbvuZS/LMfgb6epW6LXyMYNF4qFzVWrVPUnobOQrAzK+RZ7
         ylgZs7/xs3n61EgGWoPFUlbxE707odaRZ5HyVrdi6jtAwndKGrv2glOkjEEp1HVaYaGD
         dsRhFmg+GRn9Pz61A/9+ZaNsjjkG9bVW5ekI6bc1Gl+BjWtjKt1FbeVBTldqi7IyAwnK
         4eBA469GQeBPqc6tOxSMWwHP0vqYXR5sFRbQNDr2fha4wJ25+3ipP1ZKHxkgW6uMSSd/
         LVKM4hLoi3kXO5ERZqbmZHQYfpRNivzhL8EIbE1Sr4zI5W/vXuWbeE9y+Yzhcyvq6KMu
         dMfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795154569; x=1795759369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DKhQU60ApdSBOC9P+XYcHToaVAFsV4f9/nmZ4Azw7rg=;
        b=PGkLRyBD9xXTNY+NGXwboPJuseNOSwSjrUM1dCN0wt4TqioZGekw9gtAFVmxI/R6aU
         ZXhtvKuRCKZhFg+AqHhPtvJFuKsfO/wWgyRqRZWfuYRmplV/diosIG13D3a8NNKsi6OJ
         vpjYmmyYlCn3gj+2vlg/u3cGzx7IU3i9I000haX9cW86jX1UJYl6g1AWzp3yRvk718tq
         YzEQV0lQlGpZMYiv2vGtiogcu9+DFQkujQS55X40SxDhZy04biP5ulheW1iGa9n5qMUo
         PABiyqOLDwOjCkFLUi65iO1DNPPc0IYhRMzSgufTV0O1VEDpNx7TsAeNe2zpcUDMM8qn
         pJ8g==
X-Forwarded-Encrypted: i=1; AL+hErGpgoQaJtJTkMQyXgNTt2bIrGqzP/EOUsHopmvYR6Bzissf0aCLTzrxH4P1L++07tj4UYS9xyXrSGkOVUV6ZDBh@vger.kernel.org
X-Gm-Message-State: APuU4Z+9qhj5vK7YokYo2OFEUAszYHAoU3JB/bQ+S9OuqUV4Um/hjDSr
	FPppyPhniQ3cpNvs0UEQ0lFv8ZDCVd7maizf6dAaa7P3tgYEqlhHRVSS
X-Gm-Gg: AZFdTZf8khjL9APhAvgmtCYZE/lEFU00EVrE04vZT3Bxv/8VfYqVXeFLo29fN5H+1//
	exScp8IZfkyXOHSSHDW/OS8/oGUX6iTTgZikm3iTfbJ6MBVcxUAbPGHH1NtGFoujZ0J0BngoTiK
	k+j+ACE/OvEkvmhTwttzqMKM7ZaDXGlHWQJxjvcXj5jMWa8yQp2bhnJ6BqnobwRMTRQhbHW7sfY
	zNSeyft7QYD39JSU8K61FtDmY0Uox22Re+mcKX4OARmsp/lt97W/2hn4RBG2oviqHIwXThbS5Zq
	ZtZJHExottJ8lXWC0ZgqSh9Pj5IeqXJ0D81KRmPwizmJZBSsqeVahUIlsgqicPf6gy6uIXpnJPD
	HkpxCLghDbuAew9JGq1/EnNp1zQS/wuQg5Vq5w49Vcab9SCviAYHKqr8b7pvezxP34W9eXk1d4q
	7mCbnvam9XtJHD5ZMFuv7rhW7KvYJ2RGbGkRRVYIannaLIo2xSgqETCNoVTGf8Wgq33jWqsQYMg
	RXC3IXcBZz62ZbAFDpEMLhbIPayTDFvP7am2OCFuqNzqZVm2X+kmkHq+yYe5Ye6roEAwTYq09aY
	mdn4b4FoHAM2Pqw9QlTGzn5f9CGB/IfOt3Y=
X-Received: by 2002:a05:693c:8083:b0:375:e4de:96d3 with SMTP id 5a478bee46e88-3857083f7d3mr1780826eec.31.1795154568753;
        Thu, 19 Nov 2026 22:02:48 -0800 (PST)
Received: from nevers1dd ([2401:4900:9258:be0f:72a7:6656:e53c:a806])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm4810504eec.26.2026.11.19.22.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 22:02:48 -0800 (PST)
From: Siddharth Karanam <sid9.karanam@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	Siddharth Karanam <sid9.karanam@gmail.com>
Subject: [PATCH v3 1/1] remoteproc: k3: Merge ti_sci_dev and ti_sci_proc abstraction
Date: Fri, 20 Nov 2026 11:32:31 +0530
Message-ID: <20261120060231.11033-2-sid9.karanam@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261120060231.11033-1-sid9.karanam@gmail.com>
References: <20261120060231.11033-1-sid9.karanam@gmail.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The goal of the patch is to maintain a single source
of origin for all ti_sci_dev/proc_ops call sites. Any stray calls
to dev_ops/proc_ops function pointer members in driver code should
eventually be abstracted through this header (ti_sci_ctrl.h).

In the future we could switch to pm runtime calls.

Signed-off-by: Siddharth Karanam <sid9.karanam@gmail.com>
---
 drivers/remoteproc/ti_k3_common.c         |  21 +--
 drivers/remoteproc/ti_k3_common.h         |   6 +-
 drivers/remoteproc/ti_k3_dsp_remoteproc.c |  25 ++-
 drivers/remoteproc/ti_k3_m4_remoteproc.c  |  23 ++-
 drivers/remoteproc/ti_k3_r5_remoteproc.c  |  66 +++-----
 drivers/remoteproc/ti_sci_ctrl.h          | 184 ++++++++++++++++++++++
 drivers/remoteproc/ti_sci_proc.h          | 130 ---------------
 7 files changed, 239 insertions(+), 216 deletions(-)
 create mode 100644 drivers/remoteproc/ti_sci_ctrl.h
 delete mode 100644 drivers/remoteproc/ti_sci_proc.h

diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
index 4b6da3363f6c..2526588853ba 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -32,7 +32,7 @@
 
 #include "omap_remoteproc.h"
 #include "remoteproc_internal.h"
-#include "ti_sci_proc.h"
+#include "ti_sci_ctrl.h"
 #include "ti_k3_common.h"
 
 /**
@@ -114,8 +114,7 @@ int k3_rproc_reset(struct k3_rproc *kproc)
 		if (ret)
 			dev_err(dev, "local-reset assert failed (%pe)\n", ERR_PTR(ret));
 	} else {
-		ret = kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
-							    kproc->ti_sci_id);
+		ret = ti_sci_ctrl_dev_put_device(kproc->tsc);
 		if (ret)
 			dev_err(dev, "module-reset assert failed (%pe)\n", ERR_PTR(ret));
 	}
@@ -134,13 +133,11 @@ int k3_rproc_release(struct k3_rproc *kproc)
 		ret = reset_control_deassert(kproc->reset);
 		if (ret) {
 			dev_err(dev, "local-reset deassert failed, (%pe)\n", ERR_PTR(ret));
-			if (kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
-								  kproc->ti_sci_id))
+			if (ti_sci_ctrl_dev_put_device(kproc->tsc))
 				dev_warn(dev, "module-reset assert back failed\n");
 		}
 	} else {
-		ret = kproc->ti_sci->ops.dev_ops.get_device(kproc->ti_sci,
-							    kproc->ti_sci_id);
+		ret = ti_sci_ctrl_dev_get_device(kproc->tsc);
 		if (ret)
 			dev_err(dev, "module-reset deassert failed (%pe)\n", ERR_PTR(ret));
 	}
@@ -217,8 +214,7 @@ int k3_rproc_prepare(struct rproc *rproc)
 		}
 	}
 
-	ret = kproc->ti_sci->ops.dev_ops.get_device(kproc->ti_sci,
-						    kproc->ti_sci_id);
+	ret = ti_sci_ctrl_dev_get_device(kproc->tsc);
 	if (ret) {
 		dev_err(dev, "could not deassert module-reset for internal RAM loading\n");
 		return ret;
@@ -247,8 +243,7 @@ int k3_rproc_unprepare(struct rproc *rproc)
 	if (rproc->state == RPROC_DETACHED)
 		return 0;
 
-	ret = kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
-						    kproc->ti_sci_id);
+	ret = ti_sci_ctrl_dev_put_device(kproc->tsc);
 	if (ret) {
 		dev_err(dev, "module-reset assert failed\n");
 		return ret;
@@ -526,9 +521,9 @@ EXPORT_SYMBOL_GPL(k3_reserved_mem_init);
 
 void k3_release_tsp(void *data)
 {
-	struct ti_sci_proc *tsp = data;
+	struct ti_sci_ctrl *tsc = data;
 
-	ti_sci_proc_release(tsp);
+	ti_sci_ctrl_proc_release(tsc);
 }
 EXPORT_SYMBOL_GPL(k3_release_tsp);
 
diff --git a/drivers/remoteproc/ti_k3_common.h b/drivers/remoteproc/ti_k3_common.h
index c8430e42225f..f50301a19cf3 100644
--- a/drivers/remoteproc/ti_k3_common.h
+++ b/drivers/remoteproc/ti_k3_common.h
@@ -75,9 +75,8 @@ struct k3_rproc_dev_data {
  * @num_rmems: number of reserved memory regions
  * @reset: reset control handle
  * @data: pointer to DSP-specific device data
- * @tsp: TI-SCI processor control handle
+ * @tsc: TI-SCI control handle
  * @ti_sci: TI-SCI handle
- * @ti_sci_id: TI-SCI device identifier
  * @mbox: mailbox channel handle
  * @client: mailbox client to request the mailbox channel
  * @priv: void pointer to carry any private data
@@ -91,9 +90,8 @@ struct k3_rproc {
 	int num_rmems;
 	struct reset_control *reset;
 	const struct k3_rproc_dev_data *data;
-	struct ti_sci_proc *tsp;
+	struct ti_sci_ctrl *tsc;
 	const struct ti_sci_handle *ti_sci;
-	u32 ti_sci_id;
 	struct mbox_chan *mbox;
 	struct mbox_client client;
 	void *priv;
diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index 6582c7404e54..8216b2ab829e 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -16,7 +16,7 @@
 
 #include "omap_remoteproc.h"
 #include "remoteproc_internal.h"
-#include "ti_sci_proc.h"
+#include "ti_sci_ctrl.h"
 #include "ti_k3_common.h"
 
 /*
@@ -41,7 +41,7 @@ static int k3_dsp_rproc_start(struct rproc *rproc)
 	}
 
 	dev_dbg(dev, "booting DSP core using boot addr = 0x%x\n", boot_addr);
-	ret = ti_sci_proc_set_config(kproc->tsp, boot_addr, 0, 0);
+	ret = ti_sci_ctrl_proc_set_config(kproc->tsc, boot_addr, 0, 0);
 	if (ret)
 		return ret;
 
@@ -107,26 +107,22 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(kproc->ti_sci),
 				     "failed to get ti-sci handle\n");
 
-	ret = of_property_read_u32(np, "ti,sci-dev-id", &kproc->ti_sci_id);
-	if (ret)
-		return dev_err_probe(dev, ret, "missing 'ti,sci-dev-id' property\n");
-
 	kproc->reset = devm_reset_control_get_exclusive(dev, NULL);
 	if (IS_ERR(kproc->reset))
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
 
@@ -138,8 +134,7 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "reserved memory init failed\n");
 
-	ret = kproc->ti_sci->ops.dev_ops.is_on(kproc->ti_sci, kproc->ti_sci_id,
-					       NULL, &p_state);
+	ret = ti_sci_ctrl_dev_is_on(kproc->tsc, NULL, &p_state);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to get initial state, mode cannot be determined\n");
 
diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
index 4c46f4a256a9..9e56acc2205e 100644
--- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
@@ -16,7 +16,7 @@
 
 #include "omap_remoteproc.h"
 #include "remoteproc_internal.h"
-#include "ti_sci_proc.h"
+#include "ti_sci_ctrl.h"
 #include "ti_k3_common.h"
 
 static const struct rproc_ops k3_m4_rproc_ops = {
@@ -68,23 +68,19 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(kproc->ti_sci),
 				     "failed to get ti-sci handle\n");
 
-	ret = of_property_read_u32(dev->of_node, "ti,sci-dev-id", &kproc->ti_sci_id);
-	if (ret)
-		return dev_err_probe(dev, ret, "missing 'ti,sci-dev-id' property\n");
-
 	kproc->reset = devm_reset_control_get_exclusive(dev, NULL);
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
 
-	ret = ti_sci_proc_request(kproc->tsp);
+	ret = ti_sci_ctrl_proc_request(kproc->tsc);
 	if (ret < 0)
-		return dev_err_probe(dev, ret, "ti_sci_proc_request failed\n");
-	ret = devm_add_action_or_reset(dev, k3_release_tsp, kproc->tsp);
+		return dev_err_probe(dev, ret, "ti_sci_ctrl_proc_request failed\n");
+	ret = devm_add_action_or_reset(dev, k3_release_tsp, kproc->tsc);
 	if (ret)
 		return ret;
 
@@ -96,8 +92,7 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "reserved memory init failed\n");
 
-	ret = kproc->ti_sci->ops.dev_ops.is_on(kproc->ti_sci, kproc->ti_sci_id,
-					       &r_state, &p_state);
+	ret = ti_sci_ctrl_dev_is_on(kproc->tsc, &r_state, &p_state);
 	if (ret)
 		return dev_err_probe(dev, ret,
 				     "failed to get initial state, mode cannot be determined\n");
diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index d7d9756afed0..81d73b7d6d6f 100644
--- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -20,7 +20,7 @@
 
 #include "omap_remoteproc.h"
 #include "remoteproc_internal.h"
-#include "ti_sci_proc.h"
+#include "ti_sci_ctrl.h"
 #include "ti_k3_common.h"
 
 /* This address can either be for ATCM or BTCM with the other at address 0x0 */
@@ -135,8 +135,7 @@ static int k3_r5_split_reset(struct k3_rproc *kproc)
 		return ret;
 	}
 
-	ret = kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
-						    kproc->ti_sci_id);
+	ret = ti_sci_ctrl_dev_put_device(kproc->tsc);
 	if (ret) {
 		dev_err(kproc->dev, "module-reset assert failed, ret = %d\n",
 			ret);
@@ -151,8 +150,7 @@ static int k3_r5_split_release(struct k3_rproc *kproc)
 {
 	int ret;
 
-	ret = kproc->ti_sci->ops.dev_ops.get_device(kproc->ti_sci,
-						    kproc->ti_sci_id);
+	ret = ti_sci_ctrl_dev_get_device(kproc->tsc);
 	if (ret) {
 		dev_err(kproc->dev, "module-reset deassert failed, ret = %d\n",
 			ret);
@@ -163,8 +161,7 @@ static int k3_r5_split_release(struct k3_rproc *kproc)
 	if (ret) {
 		dev_err(kproc->dev, "local-reset deassert failed, ret = %d\n",
 			ret);
-		if (kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
-							  kproc->ti_sci_id))
+		if (ti_sci_ctrl_dev_put_device(kproc->tsc))
 			dev_warn(kproc->dev, "module-reset assert back failed\n");
 	}
 
@@ -191,8 +188,7 @@ static int k3_r5_lockstep_reset(struct k3_r5_cluster *cluster)
 	/* disable PSC modules on all applicable cores */
 	list_for_each_entry(core, &cluster->cores, elem) {
 		kproc = core->kproc;
-		ret = kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
-							    kproc->ti_sci_id);
+		ret = ti_sci_ctrl_dev_put_device(kproc->tsc);
 		if (ret) {
 			dev_err(core->dev, "module-reset assert failed, ret = %d\n",
 				ret);
@@ -205,8 +201,7 @@ static int k3_r5_lockstep_reset(struct k3_r5_cluster *cluster)
 unroll_module_reset:
 	list_for_each_entry_continue_reverse(core, &cluster->cores, elem) {
 		kproc = core->kproc;
-		if (kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
-							  kproc->ti_sci_id))
+		if (ti_sci_ctrl_dev_put_device(kproc->tsc))
 			dev_warn(core->dev, "module-reset assert back failed\n");
 	}
 	core = list_last_entry(&cluster->cores, struct k3_r5_core, elem);
@@ -228,8 +223,7 @@ static int k3_r5_lockstep_release(struct k3_r5_cluster *cluster)
 	/* enable PSC modules on all applicable cores */
 	list_for_each_entry_reverse(core, &cluster->cores, elem) {
 		kproc = core->kproc;
-		ret = kproc->ti_sci->ops.dev_ops.get_device(kproc->ti_sci,
-							    kproc->ti_sci_id);
+		ret = ti_sci_ctrl_dev_get_device(kproc->tsc);
 		if (ret) {
 			dev_err(core->dev, "module-reset deassert failed, ret = %d\n",
 				ret);
@@ -259,8 +253,7 @@ static int k3_r5_lockstep_release(struct k3_r5_cluster *cluster)
 unroll_module_reset:
 	list_for_each_entry_from(core, &cluster->cores, elem) {
 		kproc = core->kproc;
-		if (kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
-							  kproc->ti_sci_id))
+		if (ti_sci_ctrl_dev_put_device(kproc->tsc))
 			dev_warn(core->dev, "module-reset assert back failed\n");
 	}
 
@@ -269,13 +262,13 @@ static int k3_r5_lockstep_release(struct k3_r5_cluster *cluster)
 
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
 
@@ -329,7 +322,7 @@ static int k3_r5_rproc_prepare(struct rproc *rproc)
 		}
 	}
 
-	ret = ti_sci_proc_get_status(kproc->tsp, &boot_vec, &cfg, &ctrl, &stat);
+	ret = ti_sci_ctrl_proc_get_status(kproc->tsc, &boot_vec, &cfg, &ctrl, &stat);
 	if (ret < 0)
 		return ret;
 	mem_init_dis = !!(cfg & PROC_BOOT_CFG_FLAG_R5_MEM_INIT_DIS);
@@ -470,7 +463,7 @@ static int k3_r5_rproc_start(struct rproc *rproc)
 	dev_dbg(dev, "booting R5F core using boot addr = 0x%x\n", boot_addr);
 
 	/* boot vector need not be programmed for Core1 in LockStep mode */
-	ret = ti_sci_proc_set_config(kproc->tsp, boot_addr, 0, 0);
+	ret = ti_sci_ctrl_proc_set_config(kproc->tsc, boot_addr, 0, 0);
 	if (ret)
 		return ret;
 
@@ -613,7 +606,7 @@ static const struct rproc_ops k3_r5_rproc_ops = {
  * by the System Processor.
  *
  * This function is used to pre-configure these settings for each R5F core, and
- * the configuration is all done through various ti_sci_proc functions that
+ * the configuration is all done through various ti_sci_ctrl functions that
  * communicate with the System Processor. The function also ensures that both
  * the cores are halted before the .prepare() step.
  *
@@ -655,7 +648,7 @@ static int k3_r5_rproc_configure(struct k3_rproc *kproc)
 		core = kproc->priv;
 	}
 
-	ret = ti_sci_proc_get_status(core->kproc->tsp, &boot_vec, &cfg, &ctrl,
-				     &stat);
+	ret = ti_sci_ctrl_proc_get_status(core->kproc->tsc, &boot_vec, &cfg, &ctrl,
+					  &stat);
 	if (ret < 0)
 		return ret;
@@ -733,7 +726,7 @@ static int k3_r5_rproc_configure(struct k3_rproc *kproc)
 				clr_cfg &= ~PROC_BOOT_CFG_FLAG_R5_LOCKSTEP;
 				clr_cfg &= ~PROC_BOOT_CFG_FLAG_R5_TEINIT;
 			}
-			ret = ti_sci_proc_set_config(temp->kproc->tsp, boot_vec,
-						     set_cfg, clr_cfg);
+			ret = ti_sci_ctrl_proc_set_config(temp->kproc->tsc, boot_vec,
+							  set_cfg, clr_cfg);
 			if (ret)
 				goto out;
@@ -741,14 +734,14 @@ static int k3_r5_rproc_configure(struct k3_rproc *kproc)
 
 		set_cfg = PROC_BOOT_CFG_FLAG_R5_LOCKSTEP;
 		clr_cfg = 0;
-		ret = ti_sci_proc_set_config(core->kproc->tsp, boot_vec,
-					     set_cfg, clr_cfg);
+		ret = ti_sci_ctrl_proc_set_config(core->kproc->tsc, boot_vec,
+						  set_cfg, clr_cfg);
 	} else {
 		ret = k3_r5_core_halt(core->kproc);
 		if (ret)
 			goto out;
 
-		ret = ti_sci_proc_set_config(core->kproc->tsp, boot_vec,
-					     set_cfg, clr_cfg);
+		ret = ti_sci_ctrl_proc_set_config(core->kproc->tsc, boot_vec,
+						  set_cfg, clr_cfg);
 	}
 
@@ -822,8 +815,7 @@ static int k3_r5_rproc_configure_mode(struct k3_rproc *kproc)
 
 	core0 = list_first_entry(&cluster->cores, struct k3_r5_core, elem);
 
-	ret = kproc->ti_sci->ops.dev_ops.is_on(kproc->ti_sci, kproc->ti_sci_id,
-					       &r_state, &c_state);
+	ret = ti_sci_ctrl_dev_is_on(kproc->tsc, &r_state, &c_state);
 	if (ret) {
 		dev_err(cdev, "failed to get initial state, mode cannot be determined, ret = %d\n",
 			ret);
@@ -847,7 +839,7 @@ static int k3_r5_rproc_configure_mode(struct k3_rproc *kproc)
 	 */
 	core->released_from_reset = c_state;
 
-	ret = ti_sci_proc_get_status(kproc->tsp, &boot_vec, &cfg, &ctrl,
-				     &stat);
+	ret = ti_sci_ctrl_proc_get_status(kproc->tsc, &boot_vec, &cfg, &ctrl,
+					  &stat);
 	if (ret < 0) {
 		dev_err(cdev, "failed to get initial processor status, ret = %d\n",
@@ -1066,12 +1058,6 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
 			goto out;
 		}
 
-		ret = of_property_read_u32(np, "ti,sci-dev-id", &kproc->ti_sci_id);
-		if (ret) {
-			dev_err(cdev, "missing 'ti,sci-dev-id' property\n");
-			goto out;
-		}
-
 		kproc->reset = devm_reset_control_get_exclusive(cdev, NULL);
 		if (IS_ERR(kproc->reset)) {
 			ret = dev_err_probe(cdev, PTR_ERR(kproc->reset),
@@ -1079,10 +1065,10 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
 			goto out;
 		}
 
-		kproc->tsp = ti_sci_proc_of_get_tsp(cdev, kproc->ti_sci);
-		if (IS_ERR(kproc->tsp)) {
-			ret = dev_err_probe(cdev, PTR_ERR(kproc->tsp),
-					    "failed to construct ti-sci proc control\n");
+		kproc->tsc = ti_sci_ctrl_of_get(cdev, kproc->ti_sci);
+		if (IS_ERR(kproc->tsc)) {
+			ret = dev_err_probe(cdev, PTR_ERR(kproc->tsc),
+					    "failed to construct ti-sci control\n");
 			goto out;
 		}
 
@@ -1093,13 +1079,13 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
 			goto out;
 		}
 
-		ret = ti_sci_proc_request(kproc->tsp);
+		ret = ti_sci_ctrl_proc_request(kproc->tsc);
 		if (ret < 0) {
-			dev_err(cdev, "ti_sci_proc_request failed, ret = %d\n", ret);
+			dev_err(cdev, "ti_sci_ctrl_proc_request failed, ret = %d\n", ret);
 			goto out;
 		}
 
-		ret = devm_add_action_or_reset(cdev, k3_release_tsp, kproc->tsp);
+		ret = devm_add_action_or_reset(cdev, k3_release_tsp, kproc->tsc);
 		if (ret)
 			goto out;
 	}
diff --git a/drivers/remoteproc/ti_sci_ctrl.h b/drivers/remoteproc/ti_sci_ctrl.h
new file mode 100644
index 000000000000..2f03af36992d
--- /dev/null
+++ b/drivers/remoteproc/ti_sci_ctrl.h
@@ -0,0 +1,184 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Texas Instruments TI-SCI Processor and Device Controller Helper Functions
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
+					bool *c_state)
+{
+	int ret;
+
+	ret = tsc->dev_ops->is_on(tsc->sci, tsc->dev_id, r_state, c_state);
+	if (ret)
+		dev_err(tsc->dev, "ti-sci device is_on failed: %d\n", ret);
+
+	return ret;
+}
+
+/* Request power on to rproc */
+static inline int ti_sci_ctrl_dev_get_device(struct ti_sci_ctrl *tsc)
+{
+	int ret;
+
+	ret = tsc->dev_ops->get_device(tsc->sci, tsc->dev_id);
+	if (ret)
+		dev_err(tsc->dev, "ti-sci device get failed: %d\n", ret);
+
+	return ret;
+}
+
+/* Request power off to a rproc */
+static inline int ti_sci_ctrl_dev_put_device(struct ti_sci_ctrl *tsc)
+{
+	int ret;
+
+	ret = tsc->dev_ops->put_device(tsc->sci, tsc->dev_id);
+	if (ret)
+		dev_err(tsc->dev, "ti-sci device put failed: %d\n", ret);
+
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
+
+	return ret;
+}
+
+static inline int ti_sci_ctrl_proc_set_config(struct ti_sci_ctrl *tsc,
+					      u64 boot_vector,
+					 u32 cfg_set, u32 cfg_clr)
+{
+	int ret;
+
+	ret = tsc->proc_ops->set_config(tsc->sci, tsc->proc_id, boot_vector,
+					cfg_set, cfg_clr);
+	if (ret)
+		dev_err(tsc->dev, "ti-sci processor set_config failed: %d\n",
+			ret);
+
+	return ret;
+}
+
+static inline int ti_sci_ctrl_proc_set_control(struct ti_sci_ctrl *tsc,
+					       u32 ctrl_set, u32 ctrl_clr)
+{
+	int ret;
+
+	ret = tsc->proc_ops->set_control(tsc->sci, tsc->proc_id, ctrl_set,
+					 ctrl_clr);
+	if (ret)
+		dev_err(tsc->dev, "ti-sci processor set_control failed: %d\n",
+			ret);
+
+	return ret;
+}
+
+static inline int ti_sci_ctrl_proc_get_status(struct ti_sci_ctrl *tsc,
+					      u64 *boot_vector, u32 *cfg_flags,
+					 u32 *ctrl_flags, u32 *status_flags)
+{
+	int ret;
+
+	ret = tsc->proc_ops->get_status(tsc->sci, tsc->proc_id, boot_vector,
+					cfg_flags, ctrl_flags, status_flags);
+	if (ret)
+		dev_err(tsc->dev, "ti-sci processor get_status failed: %d\n",
+			ret);
+
+	return ret;
+}
+
+#endif /* REMOTEPROC_TI_SCI_CTRL_H */
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

