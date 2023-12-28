Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A711749F
	for <linux-remoteproc@vger.kernel.org>; Thu, 28 Dec 2023 11:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vDtxXkeM"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2cc9fa5e8e1so60743041fa.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 28 Dec 2023 03:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703763734; x=1704368534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hHvHY3P8pUAm5EVfyC69y/g7bbhD/gOrqJUHaYKsX0I=;
        b=vDtxXkeM6G5INBnIN53aewNY2fXi7XQXwZawqxTkxiiNr4Sj+AYPdqLJzHbSNE67Za
         rrfOLSkXLcG+RpPVSMhdbQ/z0tNMI44cy15G7XyL9JPEtHtWdFQTY5eokgq+n91Mv0dI
         OYQhg4vBnSgsbrTEPrOYKOGorC+revEhQtxZ4wV62ZX6Y1H6vZQiJwjFwMabRoofdhqD
         A1XgqOK2UZliyiX2Qg/mi+arFRLQoqh5vrHBsUvjz84RdNUyuSTT8BTGc7irATK0eIKP
         M6nvZDfwlJJ5GkRmBjX03extN1coVqYSJWuMxu7qShqwqbpwskrbHPoDkmKYpGayS9JX
         RROA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703763734; x=1704368534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hHvHY3P8pUAm5EVfyC69y/g7bbhD/gOrqJUHaYKsX0I=;
        b=M6wWUDfVxEv4eNy3Jgg718fhMsaVgQGChZfl1qIk0T2Kjn22kuYGVUcepbH90dlJrb
         c6Vt63mP2gp+az5HTc1nTK88iqPpsgA8K+oAnke3JGK9VRt5uEmwiEK3Aqgj/f56Cx5F
         7djWP+wWh+kVOnKT2nTU5mSupaY6FtUNneEz/xwAZgCdHy9jP4wGCiUQWhLVWe6/Nafy
         DUT7w25aPHOF5/Ej+Xd5e49Wh72S4a7JHsUjK/dJGE9LLEljac8I2r+CbnRjCjbyHLeK
         bV9pFpD+1UhMl+E2O9mE9hAao+OMg1cZ0AK2kwozTL5+yrdYuIhqgXMHRJmLQeFGcZLy
         SFGA==
X-Gm-Message-State: AOJu0YyA9Jq9vlqLlSq5hAKsTQNoOUTdqPVP8RELgTMiUGXZqO3DgwbJ
	GacWqS13gPSLQl1E93AtSF1i6XoRV4gTaA==
X-Google-Smtp-Source: AGHT+IGXEp1aTyhSpKGlmAS6ChNv5gUm/vZM9ehIRPavf1qH5PEPD14s2BsLvnJGjyIyvOSQ+DBl7g==
X-Received: by 2002:a05:651c:486:b0:2cc:3fb2:82c with SMTP id s6-20020a05651c048600b002cc3fb2082cmr3350929ljc.75.1703763733742;
        Thu, 28 Dec 2023 03:42:13 -0800 (PST)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id a4-20020a05651c210400b002cc32fbe2e5sm2792867ljq.51.2023.12.28.03.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Dec 2023 03:42:12 -0800 (PST)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	linux-pm@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Kevin Hilman <khilman@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Nikunj Kela <nkela@quicinc.com>,
	Prasad Sodagudi <psodagud@quicinc.com>,
	Stephan Gerhold <stephan@gerhold.net>,
	Ben Horgan <Ben.Horgan@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org,
	linux-media@vger.kernel.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 3/5] remoteproc: imx_rproc: Convert to dev_pm_domain_attach|detach_list()
Date: Thu, 28 Dec 2023 12:41:55 +0100
Message-Id: <20231228114157.104822-4-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231228114157.104822-1-ulf.hansson@linaro.org>
References: <20231228114157.104822-1-ulf.hansson@linaro.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Let's avoid the boilerplate code to manage the multiple PM domain case, by
converting into using dev_pm_domain_attach|detach_list().

Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: <linux-remoteproc@vger.kernel.org>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/remoteproc/imx_rproc.c | 73 +++++-----------------------------
 1 file changed, 9 insertions(+), 64 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 8bb293b9f327..3161f14442bc 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -92,7 +92,6 @@ struct imx_rproc_mem {
 
 static int imx_rproc_xtr_mbox_init(struct rproc *rproc);
 static void imx_rproc_free_mbox(struct rproc *rproc);
-static int imx_rproc_detach_pd(struct rproc *rproc);
 
 struct imx_rproc {
 	struct device			*dev;
@@ -113,10 +112,8 @@ struct imx_rproc {
 	u32				rproc_pt;	/* partition id */
 	u32				rsrc_id;	/* resource id */
 	u32				entry;		/* cpu start address */
-	int                             num_pd;
 	u32				core_index;
-	struct device                   **pd_dev;
-	struct device_link              **pd_dev_link;
+	struct dev_pm_domain_list	*pd_list;
 };
 
 static const struct imx_rproc_att imx_rproc_att_imx93[] = {
@@ -853,7 +850,7 @@ static void imx_rproc_put_scu(struct rproc *rproc)
 		return;
 
 	if (imx_sc_rm_is_resource_owned(priv->ipc_handle, priv->rsrc_id)) {
-		imx_rproc_detach_pd(rproc);
+		dev_pm_domain_detach_list(priv->pd_list);
 		return;
 	}
 
@@ -880,72 +877,20 @@ static int imx_rproc_partition_notify(struct notifier_block *nb,
 static int imx_rproc_attach_pd(struct imx_rproc *priv)
 {
 	struct device *dev = priv->dev;
-	int ret, i;
-
-	/*
-	 * If there is only one power-domain entry, the platform driver framework
-	 * will handle it, no need handle it in this driver.
-	 */
-	priv->num_pd = of_count_phandle_with_args(dev->of_node, "power-domains",
-						  "#power-domain-cells");
-	if (priv->num_pd <= 1)
-		return 0;
-
-	priv->pd_dev = devm_kmalloc_array(dev, priv->num_pd, sizeof(*priv->pd_dev), GFP_KERNEL);
-	if (!priv->pd_dev)
-		return -ENOMEM;
-
-	priv->pd_dev_link = devm_kmalloc_array(dev, priv->num_pd, sizeof(*priv->pd_dev_link),
-					       GFP_KERNEL);
-
-	if (!priv->pd_dev_link)
-		return -ENOMEM;
-
-	for (i = 0; i < priv->num_pd; i++) {
-		priv->pd_dev[i] = dev_pm_domain_attach_by_id(dev, i);
-		if (IS_ERR(priv->pd_dev[i])) {
-			ret = PTR_ERR(priv->pd_dev[i]);
-			goto detach_pd;
-		}
-
-		priv->pd_dev_link[i] = device_link_add(dev, priv->pd_dev[i], DL_FLAG_STATELESS |
-						       DL_FLAG_PM_RUNTIME | DL_FLAG_RPM_ACTIVE);
-		if (!priv->pd_dev_link[i]) {
-			dev_pm_domain_detach(priv->pd_dev[i], false);
-			ret = -EINVAL;
-			goto detach_pd;
-		}
-	}
-
-	return 0;
-
-detach_pd:
-	while (--i >= 0) {
-		device_link_del(priv->pd_dev_link[i]);
-		dev_pm_domain_detach(priv->pd_dev[i], false);
-	}
-
-	return ret;
-}
-
-static int imx_rproc_detach_pd(struct rproc *rproc)
-{
-	struct imx_rproc *priv = rproc->priv;
-	int i;
+	int ret;
+	struct dev_pm_domain_attach_data pd_data = {
+		.pd_flags = PD_FLAG_DEV_LINK_ON,
+	};
 
 	/*
 	 * If there is only one power-domain entry, the platform driver framework
 	 * will handle it, no need handle it in this driver.
 	 */
-	if (priv->num_pd <= 1)
+	if (dev->pm_domain)
 		return 0;
 
-	for (i = 0; i < priv->num_pd; i++) {
-		device_link_del(priv->pd_dev_link[i]);
-		dev_pm_domain_detach(priv->pd_dev[i], false);
-	}
-
-	return 0;
+	ret = dev_pm_domain_attach_list(dev, &pd_data, &priv->pd_list);
+	return ret < 0 ? ret : 0;
 }
 
 static int imx_rproc_detect_mode(struct imx_rproc *priv)
-- 
2.34.1

