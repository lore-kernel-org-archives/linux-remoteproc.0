Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3DB3D79FF
	for <linux-remoteproc@vger.kernel.org>; Fri, 22 May 2026 11:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779448838; cv=none; b=Ygr7Li3EeooXpg8Po9+9OFl1CY6HSiwt3o7OeEv0R0Jxyga5v6id9qacovhTB8vwukF2uuws3nBCkpkM4WFeUEeDxEwAM6Lim0p8tVzvkso7M57RIPj8OLAZm1XrtCMtzyJaMlc/pTYXYBb5YNRc8Iht3JY2cc7koEn9EpO2XjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779448838; c=relaxed/simple;
	bh=VR+oYjaqTda/ojWwOj+jXMPjefM4/+bZEZNGcaE/kiY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qsypeN+SffWXGymFdwvCNNXDav+X6g+b8erz00CtKLJVBzfdLb9lpLlMwKvQG/rCUFAR+4xbXBJtIbBJamP2eouJuiDyg2pwyu29jPV0wd8wwfE/kbE9UZaq4UvpJk3IunkzD66UJGquPsLVLB2ys/R2ZIoOz8lVKltjF9VBBzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SlwI+ZZr; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SlwI+ZZr"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so99300835e9.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 22 May 2026 04:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779448835; x=1780053635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wzM3FKLrWhS9Bb2TjExjJmxAKhc1IFpSqwHPLv7ULGk=;
        b=SlwI+ZZr2xCU9EFicwD6pvECxT16cLRDwDgExusWPTvld/LNDnbxng6bs6JW1SefDR
         c6KkdAww/ze806MSXbtuUivp4rOmwc1DAti2U9eLJ48Jg3qq2ROc8CMj0G/T16ElcFev
         nkMariuGDfDL/CcW+4Xt6Vt/V9LbAuJlJq22JNSpUEuCn6qoR6LD6cQyj+6QgxC7KQoi
         Ojz5OgpR2wF5GNZKPRHE0ikUBYs6Ebl2rt3hZMAHb4WUCP1Yy+kYLQF5u0rmWoooPvee
         8QHZgKmadNDopMAM4Thr6GBS7MUVoHTR2cDEno984pnmfrnbJkYQyS4EJdRZf0CDyn/3
         YPaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779448835; x=1780053635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wzM3FKLrWhS9Bb2TjExjJmxAKhc1IFpSqwHPLv7ULGk=;
        b=dfTolxPxtN5o6G0kks7FzkKSf422ddNQ2s37kKXFDchS/ruRDjjmkIFEGa02Z1doVa
         uZQv44pC2yNnuyWmbwGDgs/lHZF/Q4HgovB0ABzJ+xv5IuvAJS/Lx1bAZonBrNuKwOpw
         EEvZqzBDhKEWabDxA/qLTAKIOstI//Ee1M3DlRTbi1V9k3Fftt8o0yDMiSBsKNqgy1MZ
         8EaP4ae9ktAp4zlgMoWdqTwfY4Y9qBGhl/vMckW0h0mdn2rrkl4EeVAa14TrFAXlGQmq
         EKaq4X/EvC6NOhb0TR9V5MtO64s4r03NwFY4dgVv/TNGI8836GnUwn00Faj3Wv9waZRf
         yiQw==
X-Forwarded-Encrypted: i=1; AFNElJ/SiHBJYWrkxIF5HvfIaSgtz0MGcNmUd1A729iWjs3Z6BDsk/cP5/jtw9vWjMUldjijB2n/B2TYL8av185v2zB7@vger.kernel.org
X-Gm-Message-State: AOJu0YwkSoEOAR7Ls37lB+++6AIWYAoa8qtIt4/4BSuJ4M5JyEPeakq2
	oKIG7G64mHMut04+8c6H67+3cKo9lwGZ9HHBTgF1S/DXfsigK5o+ASvp
X-Gm-Gg: Acq92OHtPOidWbPQaq4MuguwOHkwqs1PrKAIrSYa4e9ghBJUf882/TmUXNpq8zD6Zob
	glKdDjSno5fbGfmebGR/VB0jeil2taZyVjNfKZy7cVPaXqY9NtAZa44HQWQQAUKNRZo4eYt2ld/
	w2uR2NGCCPfQHbUffx0L9RousAR6bueWsmKLbFNvMzGXSb+GDp8DRD3OQVT7I5udrGw3JH/L5vR
	SOqYVZzIvyxTVO9mmemMbSk2uCaK9psZwqSFx0PBiKC/QhR2oxqR3obX0LedWUjFg9yvbMnMUMa
	JA1fLptGpZ4JQADgnEl+Oz7+clWRKWRsUmTSNytBTivxNbWwrzaI4PMnqosWT5Gd9AKpxli4z5t
	Tvt2YCZTLCeaQSl17lT8WpTt9T9vfbhoKAZbtNddHubRY4bwms9FBjfFLXqZi3I69zmyF3eml7S
	ZGxKwYEVvV5WPnm0SGsgeaU0bfI/VB2S5cyKXMrStk0cxgre8gjQ==
X-Received: by 2002:a05:600c:4510:b0:489:1c1f:35df with SMTP id 5b1f17b1804b1-490424a682emr41205515e9.10.1779448835090;
        Fri, 22 May 2026 04:20:35 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904526ca21sm34388355e9.3.2026.05.22.04.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 04:20:34 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] remoteproc: imx_rpoc: fix carveout name parsing
Date: Fri, 22 May 2026 04:18:46 -0700
Message-ID: <20260522111849.783-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522111849.783-1-laurentiumihalcea111@gmail.com>
References: <20260522111849.783-1-laurentiumihalcea111@gmail.com>
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
 drivers/remoteproc/imx_rproc.c |  7 +++++--
 drivers/remoteproc/imx_rproc.h | 19 +++++++++++++++++++
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 7f54322244ac..1ee1c658dcc1 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -672,7 +672,7 @@ static int imx_rproc_prepare(struct rproc *rproc)
 		int err;
 		struct resource res;
 
-		err = of_reserved_mem_region_to_resource(np, i++, &res);
+		err = imx_rproc_rmem_to_resource(np, i++, &res);
 		if (err)
 			break;
 
@@ -850,11 +850,14 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
 	if (nph <= 0)
 		return 0;
 
+	if (!of_property_present(np, "memory-region-names"))
+		dev_warn(dev, "using node names for carveouts should be avoided\n");
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
index 0d7d48352a10..58e9daa41afe 100644
--- a/drivers/remoteproc/imx_rproc.h
+++ b/drivers/remoteproc/imx_rproc.h
@@ -45,4 +45,23 @@ struct imx_rproc_dcfg {
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

