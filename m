Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56AA749B5AC
	for <linux-remoteproc@vger.kernel.org>; Tue, 22 Sep 2026 19:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790104525; cv=none; b=aFeKSJPv2eV9TOvZ1P0jWMx82ldIQ1giCcHrKRwuZ5bmAjx5foODJqvExvhykJvx1nYBuEIsEiix68AynMBIS2BczSw6PHw1Tm99uG/FWseEjF6EzaOshsAVAD0w7ZZrl1JZ2AKeSvgzA1oqD8JK2h1WGvqknN9zDb2Y268b944=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790104525; c=relaxed/simple;
	bh=k5Qyor29tzBsTWmwWdVh29APqoc4vh744onEzj9T7Mo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MQGyTVbqdqx6Bna46QSfEhrSkphIQzy+a+49u7T3gp4Bf/R4QLPakv7Ep7kBokl8kciix2vfprg2T9wprk65vtFlge0sytFgL41DFwOOPJmETPsqMKJitWw93wFv09gXecBLcd3tPTnL6aLCEzpUNqvUxr4SUuHH5+4HgvvJAW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=avbrS/8T; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="avbrS/8T"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e62211987so172758eec.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 22 Sep 2026 12:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790104522; x=1790709322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wpfV3RKytzyGrgL5fJq8xvrdmnsOtkjkjFMt1Pl1qgk=;
        b=avbrS/8TT9caeZYAIp74hjTLqF+K5Lz5nl2G24RvZJXB6jrPlJkMg2XoUlNsgrU0Tw
         r1YA3cilyB6ui9zsXzRsdB6y5DyGpEXrKMV0BvFIrBHgLlj7StweoxJoZs7CvdD7g7G0
         WiCpo5kgVAKSJbf2kzpDRRTTZnrmhS3O0X5aMsREY2U7KYKLy495wM76cHcbqOGeyb2f
         0/MjwLss8/8GitYpdGhjizH3sTYkxa6DvITZ1Ev5HQq9FdiA4APdq9R2/vILRVbqp5MU
         sVgJqNHLj4Dw6Z89Jifd3LKDiHizWbO3HEhwfo4u9Kez0rn00WTwQNUKJ5lPDx9V6ai8
         QZvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790104522; x=1790709322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wpfV3RKytzyGrgL5fJq8xvrdmnsOtkjkjFMt1Pl1qgk=;
        b=CkPvCAzIeQQZNZnCDQ34TR9DY1r34U+ELHvrRM69GolAWNVTTkt7fRLJPyRhnf3Rzx
         glGljSfVVfw4SQWdXSHl1uEooLOd8EWg7lcKSsQOsfbjE7WsreMxuz+HPGig4e6ro3s4
         C5euosFbMBHKPBj+YpOEUtXWVT13TXZrp99iBuWLCEWZH5pjvYYllMeDptrfhlp6wU9y
         TXql98f3cvK3XUsLOup3k79h9Tx0wHsEtcmd6SpEQY+UQP4unE668INEznCMdVeeyXV1
         aHgD7NQLfWIvdUtol7d6KxBP0/Q2DRy9cEGRuUPLB8Lyps2pL48LzzvTXF/GmOq8Cfl1
         Bxyw==
X-Forwarded-Encrypted: i=1; AKwUvBw53IujyXk5BlirvjrNKpdMJ33eZKSH/CClrN8paJXF2c3otO8KTa+ffCcaCtLm9Flo2YMcUdW5AX9hOlCIexcC@vger.kernel.org
X-Gm-Message-State: AFuF++n1HFK8kOkvkzMgTdpHn/UahkO8eyDHYp4X2sd4Gx/rMYPOrywp
	V/OFbyqX+rnkEnjKy5okglPAEV1JIm0I18XkJQc6ZKD3TtGTpKfkii93PdJKVJ/gwTA=
X-Gm-Gg: AYBFou0d+aio0f3tKVQqjTroxOUkdfTARYOgkAhXSL45Fn5KACF8XXR5CoIOpF995Lh
	ZruoAasj8vGldWIctT+c0+Jni9jPK3scIfpTPYSB6EKmCotFDaoy0Dk6sRcglVoZnhiXiHUiyQR
	5/lAzRI8OqrwLXzlQJa1hQPml7Xaq4r7dog0w56vpqaADyYd2Lo8YD10HdwzLMo5P+4HVls2HKV
	6iTcXmqzIdd93Roq52cztuc7mN0Mr+Ov6vmBFSTYYDBqlHwj7j8OBiPWbR9IFEW16/j1wnt0CNR
	HRgV0auhYrA8PKZ5dpVAFVBr9+mNQBhlzewBcC+uIc/XXiA2z0qkftskwBRMZ9nGY1m4UrJt2P8
	iKNHHO62SiWbc2Em5vN4wz4/Aka03/5TA9nXNRVT6z9Gov8TETy8/ZRag0MCyeT9Vla4ZQdAbk7
	A8SZOE1Y8IgVIV7PYuKlsJ9VHykech1rGNt7Rqd7KBjQaIwax8HkoRY6S3uaf6C6V4AeIfvZDEo
	f3aBKuQHA==
X-Received: by 2002:a05:7301:2e34:b0:33e:6812:29d7 with SMTP id 5a478bee46e88-33e8d9ce170mr187897eec.19.1790104522199;
        Tue, 22 Sep 2026 12:15:22 -0700 (PDT)
Received: from nevers1dd ([118.95.161.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96d497e1sm310518eec.25.2026.09.22.12.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 12:15:21 -0700 (PDT)
From: Siddharth Karanam <sid9.karanam@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	Siddharth Karanam <sid9.karanam@gmail.com>
Subject: [PATCH 1/2] remoteproc: Add ti_sci_dev_ops abstraction
Date: Wed, 23 Sep 2026 00:44:52 +0530
Message-ID: <20260922191453.324983-2-sid9.karanam@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922191453.324983-1-sid9.karanam@gmail.com>
References: <20260922191453.324983-1-sid9.karanam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of invoking ti_sci_handle's ti_sci_dev_ops member directly
in the driver code, this abstracts the property read of
"ti,sci-dev-id" and the function pointers supported by
ti_sci_dev_ops such as is_on, get_device and put_device.

The goal of the patch is to maintain a single source
of origin for all ti_sci_dev_ops call sites. Any stray calls
to any dev_ops function pointer members in driver code should
eventually be abstracted through this header.

Signed-off-by: Siddharth Karanam <sid9.karanam@gmail.com>
---
 drivers/remoteproc/ti_k3_common.c         | 16 ++---
 drivers/remoteproc/ti_k3_common.h         |  4 +-
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 14 ++--
 drivers/remoteproc/ti_k3_m4_remoteproc.c  | 13 ++--
 drivers/remoteproc/ti_k3_r5_remoteproc.c  | 40 +++++------
 drivers/remoteproc/ti_sci_dev.h           | 82 +++++++++++++++++++++++
 6 files changed, 120 insertions(+), 49 deletions(-)
 create mode 100644 drivers/remoteproc/ti_sci_dev.h

diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
index 3cb8ae5d72f6..befa9a9bea3a 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -32,6 +32,7 @@
 
 #include "omap_remoteproc.h"
 #include "remoteproc_internal.h"
+#include "ti_sci_dev.h"
 #include "ti_sci_proc.h"
 #include "ti_k3_common.h"
 
@@ -120,8 +121,7 @@ int k3_rproc_reset(struct k3_rproc *kproc)
 		if (ret)
 			dev_err(dev, "local-reset assert failed (%pe)\n", ERR_PTR(ret));
 	} else {
-		ret = kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
-							    kproc->ti_sci_id);
+		ret = ti_sci_dev_put_device(kproc->tsd);
 		if (ret)
 			dev_err(dev, "module-reset assert failed (%pe)\n", ERR_PTR(ret));
 	}
@@ -140,13 +140,11 @@ int k3_rproc_release(struct k3_rproc *kproc)
 		ret = reset_control_deassert(kproc->reset);
 		if (ret) {
 			dev_err(dev, "local-reset deassert failed, (%pe)\n", ERR_PTR(ret));
-			if (kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
-								  kproc->ti_sci_id))
+			if (ti_sci_dev_put_device(kproc->tsd))
 				dev_warn(dev, "module-reset assert back failed\n");
 		}
 	} else {
-		ret = kproc->ti_sci->ops.dev_ops.get_device(kproc->ti_sci,
-							    kproc->ti_sci_id);
+		ret = ti_sci_dev_get_device(kproc->tsd);
 		if (ret)
 			dev_err(dev, "module-reset deassert failed (%pe)\n", ERR_PTR(ret));
 	}
@@ -223,8 +221,7 @@ int k3_rproc_prepare(struct rproc *rproc)
 		}
 	}
 
-	ret = kproc->ti_sci->ops.dev_ops.get_device(kproc->ti_sci,
-						    kproc->ti_sci_id);
+	ret = ti_sci_dev_get_device(kproc->tsd);
 	if (ret) {
 		dev_err(dev, "could not deassert module-reset for internal RAM loading\n");
 		return ret;
@@ -253,8 +250,7 @@ int k3_rproc_unprepare(struct rproc *rproc)
 	if (rproc->state == RPROC_DETACHED)
 		return 0;
 
-	ret = kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
-						    kproc->ti_sci_id);
+	ret = ti_sci_dev_put_device(kproc->tsd);
 	if (ret) {
 		dev_err(dev, "module-reset assert failed\n");
 		return ret;
diff --git a/drivers/remoteproc/ti_k3_common.h b/drivers/remoteproc/ti_k3_common.h
index aee3c28dbe51..7ba0903ebe0a 100644
--- a/drivers/remoteproc/ti_k3_common.h
+++ b/drivers/remoteproc/ti_k3_common.h
@@ -72,8 +72,8 @@ struct k3_rproc_dev_data {
  * @reset: reset control handle
  * @data: pointer to DSP-specific device data
  * @tsp: TI-SCI processor control handle
+ * @tsd: TI-SCI device control handle
  * @ti_sci: TI-SCI handle
- * @ti_sci_id: TI-SCI device identifier
  * @mbox: mailbox channel handle
  * @client: mailbox client to request the mailbox channel
  * @priv: void pointer to carry any private data
@@ -88,8 +88,8 @@ struct k3_rproc {
 	struct reset_control *reset;
 	const struct k3_rproc_dev_data *data;
 	struct ti_sci_proc *tsp;
+	struct ti_sci_dev *tsd;
 	const struct ti_sci_handle *ti_sci;
-	u32 ti_sci_id;
 	struct mbox_chan *mbox;
 	struct mbox_client client;
 	void *priv;
diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index d6ceea6dc920..b6042fe7bae7 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -19,6 +19,7 @@
 
 #include "omap_remoteproc.h"
 #include "remoteproc_internal.h"
+#include "ti_sci_dev.h"
 #include "ti_sci_proc.h"
 #include "ti_k3_common.h"
 
@@ -69,7 +70,6 @@ static const struct rproc_ops k3_dsp_rproc_ops = {
 static int k3_dsp_rproc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *np = dev->of_node;
 	const struct k3_rproc_dev_data *data;
 	struct k3_rproc *kproc;
 	struct rproc *rproc;
@@ -110,10 +110,6 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(kproc->ti_sci),
 				     "failed to get ti-sci handle\n");
 
-	ret = of_property_read_u32(np, "ti,sci-dev-id", &kproc->ti_sci_id);
-	if (ret)
-		return dev_err_probe(dev, ret, "missing 'ti,sci-dev-id' property\n");
-
 	kproc->reset = devm_reset_control_get_exclusive(dev, NULL);
 	if (IS_ERR(kproc->reset))
 		return dev_err_probe(dev, PTR_ERR(kproc->reset),
@@ -124,6 +120,11 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(kproc->tsp),
 				     "failed to construct ti-sci proc control\n");
 
+	kproc->tsd = ti_sci_dev_of_get_tsd(dev, kproc->ti_sci);
+	if (IS_ERR(kproc->tsd))
+		return dev_err_probe(dev, PTR_ERR(kproc->tsd),
+				     "failed to construct ti-sci dev control\n");
+
 	ret = ti_sci_proc_request(kproc->tsp);
 	if (ret < 0) {
 		dev_err_probe(dev, ret, "ti_sci_proc_request failed\n");
@@ -141,8 +142,7 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "reserved memory init failed\n");
 
-	ret = kproc->ti_sci->ops.dev_ops.is_on(kproc->ti_sci, kproc->ti_sci_id,
-					       NULL, &p_state);
+	ret = ti_sci_dev_is_on(kproc->tsd, NULL, &p_state);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to get initial state, mode cannot be determined\n");
 
diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
index 3a11fd24eb52..ddf8cb9974ca 100644
--- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
@@ -18,6 +18,7 @@
 
 #include "omap_remoteproc.h"
 #include "remoteproc_internal.h"
+#include "ti_sci_dev.h"
 #include "ti_sci_proc.h"
 #include "ti_k3_common.h"
 
@@ -70,10 +71,6 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(kproc->ti_sci),
 				     "failed to get ti-sci handle\n");
 
-	ret = of_property_read_u32(dev->of_node, "ti,sci-dev-id", &kproc->ti_sci_id);
-	if (ret)
-		return dev_err_probe(dev, ret, "missing 'ti,sci-dev-id' property\n");
-
 	kproc->reset = devm_reset_control_get_exclusive(dev, NULL);
 	if (IS_ERR(kproc->reset))
 		return dev_err_probe(dev, PTR_ERR(kproc->reset), "failed to get reset\n");
@@ -83,6 +80,11 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(kproc->tsp),
 				     "failed to construct ti-sci proc control\n");
 
+	kproc->tsd = ti_sci_dev_of_get_tsd(dev, kproc->ti_sci);
+	if (IS_ERR(kproc->tsd))
+		return dev_err_probe(dev, PTR_ERR(kproc->tsd),
+				     "failed to construct ti-sci dev control\n");
+
 	ret = ti_sci_proc_request(kproc->tsp);
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "ti_sci_proc_request failed\n");
@@ -98,8 +100,7 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "reserved memory init failed\n");
 
-	ret = kproc->ti_sci->ops.dev_ops.is_on(kproc->ti_sci, kproc->ti_sci_id,
-					       &r_state, &p_state);
+	ret = ti_sci_dev_is_on(kproc->tsd, &r_state, &p_state);
 	if (ret)
 		return dev_err_probe(dev, ret,
 				     "failed to get initial state, mode cannot be determined\n");
diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index b1d04d082e44..a387848ac400 100644
--- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -25,6 +25,7 @@
 
 #include "omap_remoteproc.h"
 #include "remoteproc_internal.h"
+#include "ti_sci_dev.h"
 #include "ti_sci_proc.h"
 #include "ti_k3_common.h"
 
@@ -140,8 +141,7 @@ static int k3_r5_split_reset(struct k3_rproc *kproc)
 		return ret;
 	}
 
-	ret = kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
-						    kproc->ti_sci_id);
+	ret = ti_sci_dev_put_device(kproc->tsd);
 	if (ret) {
 		dev_err(kproc->dev, "module-reset assert failed, ret = %d\n",
 			ret);
@@ -156,8 +156,7 @@ static int k3_r5_split_release(struct k3_rproc *kproc)
 {
 	int ret;
 
-	ret = kproc->ti_sci->ops.dev_ops.get_device(kproc->ti_sci,
-						    kproc->ti_sci_id);
+	ret = ti_sci_dev_get_device(kproc->tsd);
 	if (ret) {
 		dev_err(kproc->dev, "module-reset deassert failed, ret = %d\n",
 			ret);
@@ -168,8 +167,7 @@ static int k3_r5_split_release(struct k3_rproc *kproc)
 	if (ret) {
 		dev_err(kproc->dev, "local-reset deassert failed, ret = %d\n",
 			ret);
-		if (kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
-							  kproc->ti_sci_id))
+		if (ti_sci_dev_put_device(kproc->tsd))
 			dev_warn(kproc->dev, "module-reset assert back failed\n");
 	}
 
@@ -196,8 +194,7 @@ static int k3_r5_lockstep_reset(struct k3_r5_cluster *cluster)
 	/* disable PSC modules on all applicable cores */
 	list_for_each_entry(core, &cluster->cores, elem) {
 		kproc = core->kproc;
-		ret = kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
-							    kproc->ti_sci_id);
+		ret = ti_sci_dev_put_device(kproc->tsd);
 		if (ret) {
 			dev_err(core->dev, "module-reset assert failed, ret = %d\n",
 				ret);
@@ -210,8 +207,7 @@ static int k3_r5_lockstep_reset(struct k3_r5_cluster *cluster)
 unroll_module_reset:
 	list_for_each_entry_continue_reverse(core, &cluster->cores, elem) {
 		kproc = core->kproc;
-		if (kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
-							  kproc->ti_sci_id))
+		if (ti_sci_dev_put_device(kproc->tsd))
 			dev_warn(core->dev, "module-reset assert back failed\n");
 	}
 	core = list_last_entry(&cluster->cores, struct k3_r5_core, elem);
@@ -233,8 +229,7 @@ static int k3_r5_lockstep_release(struct k3_r5_cluster *cluster)
 	/* enable PSC modules on all applicable cores */
 	list_for_each_entry_reverse(core, &cluster->cores, elem) {
 		kproc = core->kproc;
-		ret = kproc->ti_sci->ops.dev_ops.get_device(kproc->ti_sci,
-							    kproc->ti_sci_id);
+		ret = ti_sci_dev_get_device(kproc->tsd);
 		if (ret) {
 			dev_err(core->dev, "module-reset deassert failed, ret = %d\n",
 				ret);
@@ -264,8 +259,7 @@ static int k3_r5_lockstep_release(struct k3_r5_cluster *cluster)
 unroll_module_reset:
 	list_for_each_entry_from(core, &cluster->cores, elem) {
 		kproc = core->kproc;
-		if (kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
-							  kproc->ti_sci_id))
+		if (ti_sci_dev_put_device(kproc->tsd))
 			dev_warn(core->dev, "module-reset assert back failed\n");
 	}
 
@@ -827,8 +821,7 @@ static int k3_r5_rproc_configure_mode(struct k3_rproc *kproc)
 
 	core0 = list_first_entry(&cluster->cores, struct k3_r5_core, elem);
 
-	ret = kproc->ti_sci->ops.dev_ops.is_on(kproc->ti_sci, kproc->ti_sci_id,
-					       &r_state, &c_state);
+	ret = ti_sci_dev_is_on(kproc->tsd, &r_state, &c_state);
 	if (ret) {
 		dev_err(cdev, "failed to get initial state, mode cannot be determined, ret = %d\n",
 			ret);
@@ -1023,7 +1016,6 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct k3_rproc *kproc;
 	struct k3_r5_core *core, *core1;
-	struct device_node *np;
 	struct device *cdev;
 	const char *fw_name;
 	struct rproc *rproc;
@@ -1032,7 +1024,6 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
 	core1 = list_last_entry(&cluster->cores, struct k3_r5_core, elem);
 	list_for_each_entry(core, &cluster->cores, elem) {
 		cdev = core->dev;
-		np = dev_of_node(cdev);
 		ret = rproc_of_parse_firmware(cdev, 0, &fw_name);
 		if (ret) {
 			dev_err(dev, "failed to parse firmware-name property, ret = %d\n",
@@ -1067,12 +1058,6 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
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
@@ -1087,6 +1072,13 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
 			goto out;
 		}
 
+		kproc->tsd = ti_sci_dev_of_get_tsd(cdev, kproc->ti_sci);
+		if (IS_ERR(kproc->tsd)) {
+			ret = dev_err_probe(cdev, PTR_ERR(kproc->tsd),
+					    "failed to construct ti-sci dev control\n");
+			goto out;
+		}
+
 		ret = k3_r5_core_of_get_internal_memories(to_platform_device(cdev), kproc);
 		if (ret) {
 			dev_err(cdev, "failed to get internal memories, ret = %d\n",
diff --git a/drivers/remoteproc/ti_sci_dev.h b/drivers/remoteproc/ti_sci_dev.h
new file mode 100644
index 000000000000..897998a97d7f
--- /dev/null
+++ b/drivers/remoteproc/ti_sci_dev.h
@@ -0,0 +1,82 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Texas Instruments TI-SCI Device Controller Helper Functions
+ *
+ * Copyright (C) 2026 Texas Instruments Incorporated - https://www.ti.com/
+ */
+
+#ifndef REMOTEPROC_TI_SCI_DEV_H
+#define REMOTEPROC_TI_SCI_DEV_H
+
+#include <linux/soc/ti/ti_sci_protocol.h>
+#include <linux/pm_runtime.h>
+
+/**
+ * struct ti_sci_dev - structure representing a device control client
+ * @sci: cached TI-SCI protocol handle
+ * @ops: cached TI-SCI device ops
+ * @dev: cached client device pointer
+ * @dev_id: TI-SCI device id for the consumer remoteproc device
+ */
+struct ti_sci_dev {
+	const struct ti_sci_handle *sci;
+	const struct ti_sci_dev_ops *ops;
+	struct device *dev;
+	u32 dev_id;
+};
+
+static inline
+struct ti_sci_dev *ti_sci_dev_of_get_tsd(struct device *dev,
+					 const struct ti_sci_handle *sci)
+{
+	struct ti_sci_dev *tsd;
+	int ret;
+
+	tsd = devm_kzalloc(dev, sizeof(*tsd), GFP_KERNEL);
+	if (!tsd)
+		return ERR_PTR(-ENOMEM);
+
+	ret = of_property_read_u32(dev_of_node(dev), "ti,sci-dev-id",
+				   &tsd->dev_id);
+	if (ret < 0)
+		return ERR_PTR(ret);
+
+	tsd->dev = dev;
+	tsd->sci = sci;
+	tsd->ops = &sci->ops.dev_ops;
+
+	return tsd;
+}
+
+static inline int ti_sci_dev_is_on(struct ti_sci_dev *tsd, bool *r_state,
+				   bool *c_state)
+{
+	int ret;
+
+	ret = tsd->ops->is_on(tsd->sci, tsd->dev_id, r_state, c_state);
+	if (ret)
+		dev_err(tsd->dev, "ti-sci device is_on failed: %d\n", ret);
+	return ret;
+}
+
+static inline int ti_sci_dev_get_device(struct ti_sci_dev *tsd)
+{
+	int ret;
+
+	ret = tsd->ops->get_device(tsd->sci, tsd->dev_id);
+	if (ret)
+		dev_err(tsd->dev, "ti-sci device get failed: %d\n", ret);
+	return ret;
+}
+
+static inline int ti_sci_dev_put_device(struct ti_sci_dev *tsd)
+{
+	int ret;
+
+	ret = tsd->ops->put_device(tsd->sci, tsd->dev_id);
+	if (ret)
+		dev_err(tsd->dev, "ti-sci device put failed: %d\n", ret);
+	return ret;
+}
+
+#endif /* REMOTEPROC_TI_SCI_DEV_H */
-- 
2.55.0

