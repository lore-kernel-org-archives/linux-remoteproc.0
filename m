Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5BE175D48;
	Fri,  2 Aug 2024 15:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722612086; cv=none; b=qZH7U8TnmbkS+4XQ0hU+NJkOl8dnhbztusAGkItSVB+DZa7xLTkw+y6q+al8Ycf6lCuK1+nVKrE6dPXVzn9m+ufYe3RV/CvlQd7nTOIoRFBZvYIxqrsZ9Yj7SCKen4kBYY0tRyiXC+R6bJwLKBwUXCWSwXukLUoOCGcaOIDMYwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722612086; c=relaxed/simple;
	bh=JHwPWSbGZk9yJ6YsdYy4pvkBrgUJQJHxyulOivKDawA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HmG41HoeuciF2znkVIEh0+n8e9r35yH7UzjKMGw8jz0cGQyp1DKwfO1Pb1MWEbheeNf4XbNjKP2dGBgE8kAYOU3IzGyF2LQ7IEFMH4YY2q4sWO4G/BWuq2WrVraLTcjemPzQ7me1KeGibCAniljNpSv0NAC0e4ZYJVwxRrvFPhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=DZK2/2V8; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="DZK2/2V8"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 472FLCln036915;
	Fri, 2 Aug 2024 10:21:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1722612072;
	bh=kxtqeU9yPHQ0Gf1t0EcY+QNoeqShmhwf08kZhfmgCSQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=DZK2/2V8Vf72ntGqHossvU6HppHg+jLImE+i84F4VWiAzohzmzzfsx2luUmDT7swK
	 wvyV85i3Mmj65MYVRTEeozHCDNwLSEhrFd7sDgyHwUr7lpMgpM8Ngdjruv+X8tHbHl
	 m81bYZH54Oxv4t9l3wFT5pJ+0R9zXZIn3Hxh7qV4=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 472FLCO5108200
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 Aug 2024 10:21:12 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 Aug 2024 10:21:12 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 Aug 2024 10:21:12 -0500
Received: from fllvsmtp8.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 472FLAeq007504;
	Fri, 2 Aug 2024 10:21:11 -0500
From: Andrew Davis <afd@ti.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Nishanth
 Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo
	<kristo@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Hari Nagalla
	<hnagalla@ti.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Andrew Davis <afd@ti.com>
Subject: [PATCH v11 2/9] remoteproc: k3: Factor out TI-SCI processor control OF get function
Date: Fri, 2 Aug 2024 10:21:02 -0500
Message-ID: <20240802152109.137243-3-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240802152109.137243-1-afd@ti.com>
References: <20240802152109.137243-1-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Building the TSP structure is common for users of the TI-SCI processor
control interface. Factor out this function and put it with the rest
of the TI-SCI processor control functions.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 28 +----------------------
 drivers/remoteproc/ti_k3_r5_remoteproc.c  | 28 +----------------------
 drivers/remoteproc/ti_sci_proc.h          | 26 +++++++++++++++++++++
 3 files changed, 28 insertions(+), 54 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index a22d41689a7d2..1585769092924 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -636,32 +636,6 @@ static void k3_dsp_release_tsp(void *data)
 	ti_sci_proc_release(tsp);
 }
 
-static
-struct ti_sci_proc *k3_dsp_rproc_of_get_tsp(struct device *dev,
-					    const struct ti_sci_handle *sci)
-{
-	struct ti_sci_proc *tsp;
-	u32 temp[2];
-	int ret;
-
-	ret = of_property_read_u32_array(dev->of_node, "ti,sci-proc-ids",
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
 static int k3_dsp_rproc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -711,7 +685,7 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(kproc->reset),
 				     "failed to get reset\n");
 
-	kproc->tsp = k3_dsp_rproc_of_get_tsp(dev, kproc->ti_sci);
+	kproc->tsp = ti_sci_proc_of_get_tsp(dev, kproc->ti_sci);
 	if (IS_ERR(kproc->tsp))
 		return dev_err_probe(dev, PTR_ERR(kproc->tsp),
 				     "failed to construct ti-sci proc control\n");
diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index 39a47540c5900..dd6294ab81e2e 100644
--- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -1533,32 +1533,6 @@ static int k3_r5_core_of_get_sram_memories(struct platform_device *pdev,
 	return 0;
 }
 
-static
-struct ti_sci_proc *k3_r5_core_of_get_tsp(struct device *dev,
-					  const struct ti_sci_handle *sci)
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
 static int k3_r5_core_of_init(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1633,7 +1607,7 @@ static int k3_r5_core_of_init(struct platform_device *pdev)
 		goto err;
 	}
 
-	core->tsp = k3_r5_core_of_get_tsp(dev, core->ti_sci);
+	core->tsp = ti_sci_proc_of_get_tsp(dev, core->ti_sci);
 	if (IS_ERR(core->tsp)) {
 		ret = PTR_ERR(core->tsp);
 		dev_err(dev, "failed to construct ti-sci proc control, ret = %d\n",
diff --git a/drivers/remoteproc/ti_sci_proc.h b/drivers/remoteproc/ti_sci_proc.h
index 778558abcdcc5..f3911ce75252e 100644
--- a/drivers/remoteproc/ti_sci_proc.h
+++ b/drivers/remoteproc/ti_sci_proc.h
@@ -28,6 +28,32 @@ struct ti_sci_proc {
 	u8 host_id;
 };
 
+static inline
+struct ti_sci_proc *ti_sci_proc_of_get_tsp(struct device *dev,
+					   const struct ti_sci_handle *sci)
+{
+	struct ti_sci_proc *tsp;
+	u32 temp[2];
+	int ret;
+
+	ret = of_property_read_u32_array(dev_of_node(dev), "ti,sci-proc-ids",
+					 temp, 2);
+	if (ret < 0)
+		return ERR_PTR(ret);
+
+	tsp = devm_kzalloc(dev, sizeof(*tsp), GFP_KERNEL);
+	if (!tsp)
+		return ERR_PTR(-ENOMEM);
+
+	tsp->dev = dev;
+	tsp->sci = sci;
+	tsp->ops = &sci->ops.proc_ops;
+	tsp->proc_id = temp[0];
+	tsp->host_id = temp[1];
+
+	return tsp;
+}
+
 static inline int ti_sci_proc_request(struct ti_sci_proc *tsp)
 {
 	int ret;
-- 
2.39.2

