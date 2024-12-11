Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433E4179BD
	for <linux-remoteproc@vger.kernel.org>; Wed, 11 Dec 2024 07:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733901615; cv=none; b=iuMlYEPkkHergtPat3NGMjSuO5S/fFsArcXFiA5QWWl8LLeCnywGFKlHxNObXXo0ZnB7ftKIfkur8zrLUQTsxTeJcj3ADDx7jTc7rVzltQOjCS3adlpvMbEaFvfyNypdTjvKDbzEdRYgjdfdAIWjB6yIBCtYuREM49XEApPdUsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733901615; c=relaxed/simple;
	bh=Q9qWU0tUxE9edYJc5FMZlnQo7oDzX1C1W1TOLELsPas=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DMH355W+sIWJvWq4qkQK+hke80ORH6WFe5Zpz2+GbuKfndwBFrQbgWCArn/ImeIm6tm1lgmeEh3ViUhRPIvbj4ZOl4eAW+490maXK/DET7s4tyDPAQUcENkRnhrsq6M9V9/qtne/oxwDYNi1vySDaBSjsWq++8t25Sme5Iz7Htc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hTKEFzxR; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hTKEFzxR"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21631789fcdso2602205ad.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 10 Dec 2024 23:20:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733901613; x=1734506413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/cb20aQBdVO9cyiblKIOeV0cEljjD8IS2jrvpmrNd1k=;
        b=hTKEFzxRoBTckS6HFP4E79LyebXVb1SJXHtVrjcxkytHiQDgIDVQxnkiMNrRiC9/K5
         Mu4/aJVpTMZuOntoBY8qTPQA2k/G3YJ73/rD/CDdyuQI4ALsuCgZu1sBUklnn8i2aYxR
         3OpL4yllWy1ggCXUpWC4oofvDSVqu03Yk8Igk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733901613; x=1734506413;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/cb20aQBdVO9cyiblKIOeV0cEljjD8IS2jrvpmrNd1k=;
        b=SOj4ZouDdAGH9B5Uyh+j7h9gyFkx0qrq31fSdxgD6/l9I6kMLMxpLuBpVnJcuw/zWJ
         FPG3ylhi72J4eaUPq34J7HMj8Axs7tJcC0Onnrp47+CUEAM1aT315nYHP4635uM8BOrg
         GLKX0hmyvwOO1PouHSb8E7Nb/UHfEF7f8GU5IxLDNEBPgq/UXlZfs2WmoK1G0wmsZkTn
         C0RwPXvyHh1ALJH36oBsoFlISJRg+wfgG6kVaF5tUzfHgiRn648vu5z7NIJL9Ah+j53S
         VUHiJnPhx7fXgC7LsyfdcXHxH/dJjzz6d0dNro1KlN00L/VoTQaxdb9NohLTMhdn4EgA
         JIXg==
X-Forwarded-Encrypted: i=1; AJvYcCUx9HEkx+NLeo9AH8f69mfSPuhkrHbobn/CBKotDnVjtNLbR9wRENYqwGaMclQuo+0IKBHbS+Bf7qsIHoBlSowT@vger.kernel.org
X-Gm-Message-State: AOJu0YztQhPUYE0q3D7ANVvtfNNNk783rt6iqqaYF+uKnGwRorXp0Pjj
	v25THEsKB9y2MCd2ykl/zvReEbJLlDtXvMJNnhe/DQtzQu+eGUH/OCW8XaqeWQ==
X-Gm-Gg: ASbGncuWYwc5QHm9qvdJxnKMdfaRpNOfdBBXTuDCgIOm1Dwt+bq5gffi3TPFHVaTMOJ
	867cG2f65GDRelk9FGSz6D2W6pcVT9datsFce70XV1/vM/A5UXEkFXv0+zh0HJ4TsPaGBi0tnCB
	6TPrO2kIG0MbqoBRVhW8E3t1YiivtGrr07WlE1CcO8smiepa8pTGAqoHM6anxUHrGkh2GmGGNgu
	4VdmW+xLVG5Gx9WQTtS85artkV8WGX5DUz8OKPoFHssx6SiuNDhIoW6SS2fS6AAZFLv9fW2
X-Google-Smtp-Source: AGHT+IFb/j40l8RyXKKBP91IUhP6PaUxTTbrpQWP3pPlzKpxqE854bcUMGQOoZq9SqoelV4WQPakhQ==
X-Received: by 2002:a17:903:230f:b0:215:b1e3:c051 with SMTP id d9443c01a7336-21779e450e3mr25924325ad.11.1733901613656;
        Tue, 10 Dec 2024 23:20:13 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:4dfb:c0ae:6c93:d01e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8e41e52sm100214925ad.3.2024.12.10.23.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 23:20:13 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Tinghan Shen <tinghan.shen@mediatek.com>
Subject: [PATCH v2] remoteproc: mtk_scp: Only populate devices for SCP cores
Date: Wed, 11 Dec 2024 15:20:07 +0800
Message-ID: <20241211072009.120511-1-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When multi-core SCP support was added, the driver was made to populate
platform devices for all the sub-nodes. This ended up adding platform
devices for the rpmsg sub-nodes as well, which never actually get used,
since rpmsg devices are registered through the rpmsg interface.

Limit of_platform_populate() to just populating the SCP cores with a
compatible string match list.

Fixes: 1fdbf0cdde98 ("remoteproc: mediatek: Probe SCP cluster on multi-core SCP")
Cc: Tinghan Shen <tinghan.shen@mediatek.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Fix commit subject: populate devices *for* SCP cores
---
 drivers/remoteproc/mtk_scp.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 0f4a7065d0bd..8206a1766481 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -1326,6 +1326,11 @@ static int scp_cluster_init(struct platform_device *pdev, struct mtk_scp_of_clus
 	return ret;
 }
 
+static const struct of_device_id scp_core_match[] = {
+	{ .compatible = "mediatek,scp-core" },
+	{}
+};
+
 static int scp_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1357,13 +1362,15 @@ static int scp_probe(struct platform_device *pdev)
 	INIT_LIST_HEAD(&scp_cluster->mtk_scp_list);
 	mutex_init(&scp_cluster->cluster_lock);
 
-	ret = devm_of_platform_populate(dev);
+	ret = of_platform_populate(dev_of_node(dev), scp_core_match, NULL, dev);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to populate platform devices\n");
 
 	ret = scp_cluster_init(pdev, scp_cluster);
-	if (ret)
+	if (ret) {
+		of_platform_depopulate(dev);
 		return ret;
+	}
 
 	return 0;
 }
@@ -1379,6 +1386,7 @@ static void scp_remove(struct platform_device *pdev)
 		rproc_del(scp->rproc);
 		scp_free(scp);
 	}
+	of_platform_depopulate(&pdev->dev);
 	mutex_destroy(&scp_cluster->cluster_lock);
 }
 
-- 
2.47.0.338.g60cca15819-goog

