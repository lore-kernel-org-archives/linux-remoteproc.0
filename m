Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62465433C8
	for <linux-remoteproc@vger.kernel.org>; Mon,  8 Sep 2025 04:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757306650; cv=none; b=WDAWttYtDR69EzZWDCplzhrlrMByJ8kJOFk5C4a0VwZVD25AW2q9uIpJKW9SCXUOownlKIRn3J4Egf2MtVODkftOGjPETcrSx9x0FK6XNA2r6Xq7WVVYHnkibxtLPYo9CWnGZCf0HuEKEqmIN5iJsaNkahlSH5rwkFJk2PgV+sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757306650; c=relaxed/simple;
	bh=fiTshjH0OpRnli85QCvwaBeHrIw83h8O238HTJIpU/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Mv3izt2lRYlbbrkerqKRh1SHOpj6MyxPyDhtZqSTmgTHDcI1t/YFLcs6M3QT6zFkoT730ApuLWCvAPQj7MLyNNx+3wMk57EfEa5H3hs6THht5LZvn67mxp7xgaOTsrFztSKd+QpmCfn7+zDJswNpNKH5rQYttCKoleCZDE9U8fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kj+OdWpP; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kj+OdWpP"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b47173749dbso2642911a12.1
        for <linux-remoteproc@vger.kernel.org>; Sun, 07 Sep 2025 21:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757306649; x=1757911449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+xbE3C5wFV+o/JT6/YEPlxnk3f9fN47mPZGkai6aV5E=;
        b=kj+OdWpPMQfMU/ZxCqmlDMAvylFD4/v8g2G+wTC6Cc8IPYKPNKwJzylza/AZw1Oy1i
         iq9TdEEKk4vKd/sz52ns1IKEr9mtI4u61+E9i23JixvBkCPS8IYDcOICDfOte/0HyY4C
         SrTxh3JMo67Dw4GlcNEhfilcLr/lhYrjmeQ0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757306649; x=1757911449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+xbE3C5wFV+o/JT6/YEPlxnk3f9fN47mPZGkai6aV5E=;
        b=KDgKYQSfFliIoXI/UCRCUxb6uRy4de5EZxpExzzqfuVKsTtDt5Y42rVy01YcJx1Yw0
         aeXkJQUlBD21NYVyzSpEAoHWLx9YmM0oP9nE6ufnhqB7Hhpizs4bG2SAyImcLOzUHvxd
         lC5aF5eZw8IQIBO7k2NYGN3FFGS0eRMZVAd0mw6VTxtPIQPMoc6hJmZaNEyicf74LxGV
         Cx7boZCADmGBPfq3m4rnCrTaXO2ChK4WH3pHJhBlHpAckX9ybOVvxkPFB04LY0Ypsoo9
         hZ+AoH6F1VoFSoHxosF0CgEW//3XK36VUygeAAVkzBObrOT+8EVSQT1aR7XwlZCERD3H
         jjdQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4aTcLYMI6K58X1oCH4QT9L8Gy6rsIm84y2EE9fixN+DtHqY+Cy82zO7/6d6BHB79ATO4h2uMjOvSa134eErri@vger.kernel.org
X-Gm-Message-State: AOJu0YzgJ12eOjLKhpgp8Zne9V2NNcp8jp83xBmICEzNQVSqGUa1scNF
	NS4b0V99b4jWAZr5SOo9luKncujb76TOA4fwHP806lor2hA6n+9iO6oI9wgtP48wXA==
X-Gm-Gg: ASbGncvKylIXUAX5MrEMmWTVAiJ7V1i/FLX0BVAsH9oHb021dJPjXHrrEmjZO6sdSsU
	GgwUmJf0lDZ1GHoTlh8EUgC8FeUbs6r3PNeiPxsfc8dHYJR5U5JWGianj84O5pRuRZt0+xO6RV/
	mcD9TJ1qoQEVEiD6YD+xqlhGSrMZTcCyGWWsUhK1vZKGgfbs+aN0iNzkByW1jlwEdTWrULQEOHN
	wn60kjpD+DQ8PGZx9Q9idBJNqH96cvug28rpsIRplVBqrieSztheggOS5j2kLgmmYGAUvMm65eN
	vY9oiFnWCBmzn1F+owB42gzR01AOBzMg6vaHFX+mW0EkdvwujPCw5JPK5S80XUp4QOWMJYbr6th
	uQcug6NYTICnwmYhvCzFW1f4vKKS+lhUlMhdxxCyThNBk4QIXutQzZsPpffLCMlP3aJpjTvWQ0Q
	zHbDoHj5zTcwcJqUAnkYYJ5G4b
X-Google-Smtp-Source: AGHT+IF6EqSsNgeRlOG14nqU9rpBfRr7iTBMf+lspK57Oo06mCVbJuf9Ry2wvH4TilganydG5n2WLA==
X-Received: by 2002:a17:903:f8b:b0:24c:d342:7616 with SMTP id d9443c01a7336-25173118d31mr75029465ad.57.1757306648632;
        Sun, 07 Sep 2025 21:44:08 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2a00:79e0:201d:8:d9c6:a89:402f:11c7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24b1ba1718bsm153320605ad.39.2025.09.07.21.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 21:44:08 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fei Shao <fshao@chromium.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH] remoteproc: mediatek: Use for_each_available_child_of_node_scoped()
Date: Mon,  8 Sep 2025 12:43:25 +0800
Message-ID: <20250908044348.2402981-1-fshao@chromium.org>
X-Mailer: git-send-email 2.51.0.355.g5224444f11-goog
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use scoped for_each_available_child_of_node_scoped() to remove manual
of_node_put() calls from early returns.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 drivers/remoteproc/mtk_scp.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 8206a1766481..b123698feb52 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -1234,7 +1234,6 @@ static int scp_add_multi_core(struct platform_device *pdev,
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev_of_node(dev);
 	struct platform_device *cpdev;
-	struct device_node *child;
 	struct list_head *scp_list = &scp_cluster->mtk_scp_list;
 	const struct mtk_scp_of_data **cluster_of_data;
 	struct mtk_scp *scp, *temp;
@@ -1243,11 +1242,10 @@ static int scp_add_multi_core(struct platform_device *pdev,
 
 	cluster_of_data = (const struct mtk_scp_of_data **)of_device_get_match_data(dev);
 
-	for_each_available_child_of_node(np, child) {
+	for_each_available_child_of_node_scoped(np, child) {
 		if (!cluster_of_data[core_id]) {
 			ret = -EINVAL;
 			dev_err(dev, "Not support core %d\n", core_id);
-			of_node_put(child);
 			goto init_fail;
 		}
 
@@ -1255,7 +1253,6 @@ static int scp_add_multi_core(struct platform_device *pdev,
 		if (!cpdev) {
 			ret = -ENODEV;
 			dev_err(dev, "Not found platform device for core %d\n", core_id);
-			of_node_put(child);
 			goto init_fail;
 		}
 
@@ -1264,14 +1261,12 @@ static int scp_add_multi_core(struct platform_device *pdev,
 		if (IS_ERR(scp)) {
 			ret = PTR_ERR(scp);
 			dev_err(dev, "Failed to initialize core %d rproc\n", core_id);
-			of_node_put(child);
 			goto init_fail;
 		}
 
 		ret = rproc_add(scp->rproc);
 		if (ret) {
 			dev_err(dev, "Failed to add rproc of core %d\n", core_id);
-			of_node_put(child);
 			scp_free(scp);
 			goto init_fail;
 		}
-- 
2.51.0.355.g5224444f11-goog

