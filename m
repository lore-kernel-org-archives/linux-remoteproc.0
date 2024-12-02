Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E931F8AC5
	for <linux-remoteproc@vger.kernel.org>; Mon,  2 Dec 2024 06:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733120913; cv=none; b=cBYkUaeKP3YhNhf76wUAoYevQFNCVYycbCgf5DVkUoagAUFGiYsA16cRUpdfwWeM9OV/jYUe7Qqv9vJXn+5hVZrOz80mCXhnlhCzMR6Ujek4P9rmoja/7AapabcSOitpE1glwq/vGrXKvkzKL/3yeEMcL1RDb8f6Bcr1gAtzzqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733120913; c=relaxed/simple;
	bh=L6vPam6TecuC+9PWwxZn42pGAfseG9v3kpLLropKN3s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MhUETXb/pvYcw0xOlyRQ9kLfb1FUvyK0ZvfqSvDBL5o+MSuq3xvveVM17wBDlwJIk4QqPeE0IndmQb33W2dvIn1yAm/JV5wuzpyLClGb+YqekW8sU+snFV/RYfnZtXYO9H3GHVJeRkp8IQv4JtErIBQLnivNtTWXEk1CFGSrK9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gQvEyVmB; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gQvEyVmB"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-211fb27cc6bso28858965ad.0
        for <linux-remoteproc@vger.kernel.org>; Sun, 01 Dec 2024 22:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733120911; x=1733725711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bn0LDqdl1s00AOGHv9alMWMkV5CbY2Y3h7DtmORE+v0=;
        b=gQvEyVmB8Dewea9XCIsStCuBl0PrUC0CKYrG1LRAsQPUMLZxuqyaZTBhw8FDJyw9TK
         /iDN8SiJuQW6FCPD5000D/52xycNNJHoCKl5u9MAvMMe6qJxJ4BAeKZAJdqFw+Nkt7fJ
         HbTtI5twDY1m7ZjbmAAeo7em30l2istIHrq/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733120911; x=1733725711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bn0LDqdl1s00AOGHv9alMWMkV5CbY2Y3h7DtmORE+v0=;
        b=JEtic0Gp0ez8BS21BYK1k1r/NbyiwS70zkigCUHaFH0ocxKkSVxwCxUmtJTlO5Odci
         QY51aLhLXtITbX8bt88CSm2NqnqER0LF3BX40dFGyChAqElloh30feCXbrvGiFAKTAOl
         AFETHRp9ptwZgYaEOxC5zHCobgP16PwuMyNYL6L+bPNBZaDGprM5oJaSd515KOFF9sEo
         +mteKrMHWZFbhyHprC40Q+39yTqMdcZJqyeHtRMvoxOE5LLRnUedW4r9y5lp2TjssGZe
         k8xUopoal+xfLxzcgZClDOoK8xZGUflHOhW162QL3Ek8ypiI09HkPucf9zb87/9lnyG1
         j/Xw==
X-Forwarded-Encrypted: i=1; AJvYcCWIaBaXVbFkHLWgNHHsyQ7m8kLYSR5YxBqjlJAVtSoh1/d8a12zjAp3mTTtYAgK50glD44IYq865enVQkUolwoz@vger.kernel.org
X-Gm-Message-State: AOJu0YxYIDSGvKTq0Jz+iMpT7jhbL2r4VUJVy/dbsq5RDkjQxrCyxofp
	T/V1hhyPValKTdXItrkps1s4AWJZ3l4vry4BscIKnd5GqwacyeULGGyHoheugzSxZmTAvrTmDds
	=
X-Gm-Gg: ASbGnct4ecwB0kaA0Nbnvd3c0II9lgN4MtvbDZNF6uaZ2+DCQCAGCxj2rG9fb2gzEmO
	jGhPkTIBUNC1ftsx96PItQcTRtdAMUsbmt/K/vSYzdyOpIU1+VvfJZuK/WgRVatmd13qU9F8ML4
	GKUnHC2hN4Mj5dUMU4xffqaZ7T4yn0K91L+jO1xMZAR8AVP3ByYivANRZ0uM76HJDu/NG332Px0
	bxClunIls6s0hWsCtQnJwRLK3u7f3Ho51YpiWRPXbU0A02cbsJd25IlX/DWFApT2aQG
X-Google-Smtp-Source: AGHT+IHrImvV+P3fnp6O9oKMYzWe60hrfjJ4izSDkEkKWNLOabp7zSbgf2dW9C8Dph+qT+k/E/6L3A==
X-Received: by 2002:a17:902:cccb:b0:215:89a0:416f with SMTP id d9443c01a7336-21589a04ec8mr55693695ad.30.1733120911505;
        Sun, 01 Dec 2024 22:28:31 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:94c8:21f5:4a03:8964])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215361fd5a6sm58878555ad.94.2024.12.01.22.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 22:28:31 -0800 (PST)
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
Subject: [PATCH] remoteproc: mtk_scp: Only populate devices SCP cores
Date: Mon,  2 Dec 2024 14:28:25 +0800
Message-ID: <20241202062826.66619-1-wenst@chromium.org>
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

