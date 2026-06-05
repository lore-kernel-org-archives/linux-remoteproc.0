Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7AE4D8D87
	for <linux-remoteproc@vger.kernel.org>; Fri,  5 Jun 2026 11:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780659484; cv=none; b=AGViLtcbpCMJZ4qMdcAH9V5e6QUEgFMBw41ClbgkNekCJ5wTT+BSMYRumpFZ/q+FjKbsvUNg3UW8hWXtzM9Hp9cooPnqwHhPSKzFpTbn+iXD6oJLbATkDUn6GY4lqZ0rZuLY1vEVepNNybm50NaFz13m7HGZ9VIRCalt9ZKXNNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780659484; c=relaxed/simple;
	bh=0vd+vO7kT/Bwe+zNKztgtx34weofQNBHZTUxt16DUFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C1POnfMwdsGCGwxQed2if9Eyos240EQMgA+o/aw9NTyZPylaLMYXxYI0teAbbqLLZiel3RkrPvozjd4Bh44PackLQxUp6QpyhgNtaLrpPlNmQ08itNY6FOxV86xSst/zdGK+0EgctWxkPKdXQlwmwAF5Uc9T7FguGZxS5ZOqFr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=je4y5F63; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="je4y5F63"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490be03d47bso14886015e9.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 05 Jun 2026 04:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780659481; x=1781264281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6daWXnyshURFrvLbUnWsTDQNHdO5cag/yMoMIvHA3zY=;
        b=je4y5F63vJ0t4nHG4Qe82KFnMnixF7PIQSfbaVCqTHot5p/CkaW/OP8OofAdWPTy/g
         VTKsOcCVgKFqAZPJ7BjXvT+UQ06SymjNFe5kkqmWf1Am9cLUmxMpGfcinxTRvbPsG28G
         LJpWvftRMd7sJxjY6aLJhDnmz4NlXdbDTszLIj6PZtNV8k1v9ZWdnXwD10S4/OfuKXpg
         5NM7DMgHNroUvJiZqlhOo4CMGTfk90ZlFiIllFDHtsO965PeZ3u3EvpFQasNaob/mAkP
         gpeJ1ZjZA5UJGGk+RFeRpZTnMU0HC0VGwOfvE7X5/ukMr1QNCauF2nji8JnYzRVTlunc
         3O8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780659482; x=1781264282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6daWXnyshURFrvLbUnWsTDQNHdO5cag/yMoMIvHA3zY=;
        b=qF7UvEbe/ooG6aNnd3vhDgnpHALafg+3fKOzODMY4JlJpAPIHdaWRV91gnb38h7nlk
         FDeEd05VngBxOKnbrLDva8K/tzPOQq9WumuIvWXC14mlWCiaIm9IWdpoePNI5sTEVfGr
         YTql8tBso6hjXSp1Fg5ULRmZM4JiMWBx1OQDPMeo8SKhGnWJm8dHHkabjkPCdMvl4okX
         MxhGWm7KscOSfsMF8p2lIAvbJjkniXFf3/7ALoIJgpFe3WC3k+4dwCuluMi1cRQj/Jui
         yEqBq9Q1l4L5459X9Azt1QACik3r6zXEXuTYofSvTUvlrc2GZMbuEqyAbKNH1JuArWwE
         Ev9Q==
X-Gm-Message-State: AOJu0YziXqVykthZsY+662BFKqI+iQCrkvOybpKylZsZBQbRarNxQfJU
	KpU8fojmoc/Vni0eEp9kWA/5a6OAQRx+NbGrDOJHcg80dj8ktRVGmRUc
X-Gm-Gg: Acq92OHDtIPreN3pigzs5e56CDSYK8kJPifDZ1WDAQvs1M5E3RYKGBAPMRvDH/KWQsD
	r2WZcLKxItV/cPQXPPwCPYHN5gvg3F77ILFF79UBL4DV3+sptW46YZhKrvjx24BMJP1ADOVVBqq
	pHfMnNSM8daKxOs35raKW8PrkrXtz6QaHzV13f03Yaub9p6a3EORGrD+vjlIdFwfQSYHkd/C4tK
	yUJ5CkBJM35HyJBeUCXfcyN17b6s4dmuMKgQg/FecqESdu/iehpWzTLrdWpBWmQc+KxKyE98s+3
	9dJlQC8wFCU95f+AlxHvSR2gbaY7XJY6MuXYgSD/IIIM1sM8CUbyM9RDbVPHZlW80qE4IEF6THR
	Y4QU9vUKeZ1M3ntygwYs4Jgh0yUuHPg9HJgTJW2Qg0CtmpJ0LGqsrIXs1o+hwH0au/wyNaQUPX8
	eQm7G3ZcaIyK79JY5DHVa6HPcEALY8dCEHNCKdK372BECiX0e37AZQy1WEGScy
X-Received: by 2002:a05:600c:c0d3:b0:48e:6db3:ff33 with SMTP id 5b1f17b1804b1-490c265c091mr36372165e9.14.1780659481627;
        Fri, 05 Jun 2026 04:38:01 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46028a6dcbdsm15262439f8f.7.2026.06.05.04.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 04:38:01 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@oss.nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] remoteproc: imx_rpoc: fix carveout name parsing
Date: Fri,  5 Jun 2026 04:36:19 -0700
Message-ID: <20260605113621.1479-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605113621.1479-1-laurentiumihalcea111@gmail.com>
References: <20260605113621.1479-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The imx remoteproc driver assumes that the names of the reserved memory
regions reflect their usage (e.g. "vdevbuffer", "vdev0vring0", etc.). This
conflicts with the devicetree specification's recommendation, which states
that the names of the devicetree nodes should be generic.

Therefore, instead of relying on the node names, use the names passed via
the "memory-region-names" property if present. Otherwise, keep the old
behavior.

The definition of imx_rproc_rmem_to_resource() is added to a common place
as imx_dsp_rproc.c can also use it given that it suffers from the same
aforementioned problem.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 13 +++++++++++--
 drivers/remoteproc/imx_rproc.h | 21 +++++++++++++++++++++
 2 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 7662ebd9d2f4..74719066905d 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -672,7 +672,7 @@ static int imx_rproc_prepare(struct rproc *rproc)
 		int err;
 		struct resource res;
 
-		err = of_reserved_mem_region_to_resource(np, i++, &res);
+		err = imx_rproc_rmem_to_resource(np, i++, &res);
 		if (err)
 			break;
 
@@ -850,11 +850,20 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
 	if (nph <= 0)
 		return 0;
 
+	if (!of_property_present(np, "memory-region-names")) {
+		dev_warn(dev, "using node names for carveouts should be avoided\n");
+	} else {
+		if (nph != of_property_count_strings(np, "memory-region-names")) {
+			dev_err(dev, "invalid reserved memory name count\n");
+			return -EINVAL;
+		}
+	}
+
 	/* remap optional addresses */
 	for (a = 0; a < nph; a++) {
 		struct resource res;
 
-		err = of_reserved_mem_region_to_resource(np, a, &res);
+		err = imx_rproc_rmem_to_resource(np, a, &res);
 		if (err) {
 			dev_err(dev, "unable to resolve memory region\n");
 			return err;
diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
index 0d7d48352a10..3632bc375c71 100644
--- a/drivers/remoteproc/imx_rproc.h
+++ b/drivers/remoteproc/imx_rproc.h
@@ -7,6 +7,8 @@
 #ifndef _IMX_RPROC_H
 #define _IMX_RPROC_H
 
+#include <linux/of_reserved_mem.h>
+
 /* address translation table */
 struct imx_rproc_att {
 	u32 da;	/* device address (From Cortex M4 view)*/
@@ -45,4 +47,23 @@ struct imx_rproc_dcfg {
 	u32				reset_vector_mask;
 };
 
+static inline int imx_rproc_rmem_to_resource(struct device_node *np,
+					     int index,
+					     struct resource *res)
+{
+	int ret;
+
+	ret = of_reserved_mem_region_to_resource(np, index, res);
+	if (ret)
+		return ret;
+
+	/* "memory-region-names" is optional */
+	ret = of_property_read_string_index(np, "memory-region-names",
+					    index, &res->name);
+	if (ret == -EINVAL)
+		return 0;
+
+	return ret;
+}
+
 #endif /* _IMX_RPROC_H */
-- 
2.43.0

