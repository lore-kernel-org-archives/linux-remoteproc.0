Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243F13126C3
	for <linux-remoteproc@vger.kernel.org>; Fri,  2 Jan 2026 12:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767358115; cv=none; b=MAZE2HkU3cFpm7t71KUvvN2PA3LhvxYqovwtBdOIilr+zPGP3EClpLbP3BlEg2ONYquoprkn6UWfQRA5hkw5a+dzvnErlVt1QoedMFJxZqFPe2mrdlL4fsXqV9EeH+DM//qxKfSFU2RC82BRmBxzFyQ2AflMzQ8l3uWKtLYf1yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767358115; c=relaxed/simple;
	bh=dzGr49X7pVPoasOJF2oYtnntvKo8ogEdwOOo7jST2g0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sK3NLXx82xT3pPYQZNNzvD6Eziqf2NWZRpZm/PuotEWum9uTxFmIGLC7eHuuAwiMs5CMtgnKoBsO3Mix0v98LJt6RRkm5dmnHHI9NQk5cv18BOH78Cxr7UbTc2E/IAKTsrDUZDk8d2aKX2O1fykyIjUqMQcJtDAEELmICSY06Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c+5gwj02; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G9m05yux; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c+5gwj02";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G9m05yux"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 602C00Tp314484
	for <linux-remoteproc@vger.kernel.org>; Fri, 2 Jan 2026 12:48:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=uANIKOB+RK7h0H66+H3re3NKPwe1VSy909B
	Us6pWqv0=; b=c+5gwj02MDHXrCpqkQRmgfGdCJaGC8nB/fUDmeXrB4SD2s4kDIZ
	H82LJY67s4R/UPd8VBNaUGEQBhmYwX+YskLKjt8VgcLGgPrVjCljvJ1/743Wqkwv
	Ym9+/lwYYGO+4rrLNPfqriDvWUm4EmAQUN+oARmXwA/7RESNfDfBBXXdFPbR6eq7
	XMpvbZkaGMxe4Iq2PjQilXvfbUv9fEwQ9zbASfy0AfuvJgg5m1pDxLPBIkTBFffl
	mvjlDVApUmnbEWDSdit1fwYAwKVaNDKobd0tcgqP0o9h/ULe+vBHxqPySlsLvdeO
	Id90ABfS/PlpSU1nkb0AJlZukBRysjgLozQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bedmxr2nu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 02 Jan 2026 12:48:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed6ff3de05so337572381cf.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 02 Jan 2026 04:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767358112; x=1767962912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uANIKOB+RK7h0H66+H3re3NKPwe1VSy909BUs6pWqv0=;
        b=G9m05yuxfRHxNhnBcMYS6eoajNh9VfdUEiRspIo/P+jRfMyJkGtGfmE5eU6WYL2CRo
         CzVHBOR6HRDhR2p5yQHV4LuflkWv18vaUl2OegGhf7QZP4aGytFKCvAuDYbAiayMjU7s
         gtqbLTf1waJgyk1sCAAEyFCRSpfCophzIGF9u089zx6ZnXpR9DR2dCmPl5bAxXTGsbd7
         IGzVrH0bH4yAk34M9EKACY6yDfqOFAb/bEJC8ksF0pKUUxric0Ln6ItcnEzetY90/s4P
         bQrRe6PH87MijAgeXiS0pB+1Xxk54eaKAyEn0/aiwIXTt2a959gToFwe60EsUPPqOcXM
         Y1vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767358112; x=1767962912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uANIKOB+RK7h0H66+H3re3NKPwe1VSy909BUs6pWqv0=;
        b=CEYAgIVTe2rYSPbeTd+jdr4v+ZpTuAWYeMmhvK4fwG5cpXSRto5y6mRHb2Z89RqdZM
         oeMcLZ3wjbZuNHV4U8pRwvMod7CeCQNbqpCtsvGuXxtnVDIMzTW7QYkkSlCBqFJ/6r6z
         o8qVJaKE1RWmuRStlp13uZ3DmyK2uci+rmCTEjE7l5ZBXGLC0plpasUIx0DawrhQOQJV
         aQpfd+3I1rGkynfVDOcynexUBW3NyUS71zx/pB0Wa3Ax1m4y/+EGOUQX668paGfYtvuV
         zcBGYznwx7R9uaiFkiQdVHGgQZUErULx8D57obEpfrswM+8gFnSVzQvDeE+di02rQTTY
         V5Og==
X-Forwarded-Encrypted: i=1; AJvYcCXuMh8uJexbxRNr0cQkwmploKJ2rk9W4+hRNR9AotHHWjljXF42t6x1wvHU+If38GY+x9x3my6zBB4btRokPiLC@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ8vT1jNdlmVqvqJNukxOtllKKQJiF5PT8R+9Rx8JslsAja46O
	gFX5cn+jEskbAe+9eqwCmQFz/bimKEbMTQAILafGqq3W04801vpUP2AuCSwOjiBDcuLAbmKo7yg
	yvI4PysOlXtZ9Ks0tMLXIgZY4DJ+mtCY9WpjfPbNlB8Rx5sZZExiQZ6sYh3eBHZD5zIKIbZJ4
X-Gm-Gg: AY/fxX4mygQ2D/xm0n4lfGw6aBPE0tYm4crzIqzJvIfV9WsEdrz1AH37dSxsmhW2aTn
	JpDL8N5VzLH0f1c1lUxlA4HXotVeVFxTLzOqn37887phWM9+OkSrqmIenMMdDJjiVzGeSXFnHhm
	Jd/ArAAHbterog1jTJyY2XqOAPCnhFJW/n2vIrDVSJtTLlK3jH4ZI5Ha4KjviprBTCknSw/w16b
	vXgZu55dggYLUNyb7urzV4kbB+kohftaDsr5/VxCZSYs0UZf8OERpYmPTOhIxKYOuY0zhrVrbHD
	zflp04ZLERzAOERRIR+vCmENMstbYi5DFXFdahJjkbspEci46HgiY9mHM5Nh32h66fUUlAyGD57
	ZsccRdEnkjBrmjPIyF+A0jatLpQ==
X-Received: by 2002:a05:622a:1aaa:b0:4dd:ca89:8d7d with SMTP id d75a77b69052e-4f4abda9b1cmr610424751cf.56.1767358112378;
        Fri, 02 Jan 2026 04:48:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHvshfH6YpqD2T9Jiaku9k+FmB6y1mx6ndyOz7J57ibttgf7Rz/Y34vvy5uZeYBR7krdFoVfQ==
X-Received: by 2002:a05:622a:1aaa:b0:4dd:ca89:8d7d with SMTP id d75a77b69052e-4f4abda9b1cmr610424411cf.56.1767358111904;
        Fri, 02 Jan 2026 04:48:31 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be27b0d5asm802892105e9.13.2026.01.02.04.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 04:48:31 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] remoteproc: mtk_scp: Simplify with scoped for each OF child loop
Date: Fri,  2 Jan 2026 13:48:28 +0100
Message-ID: <20260102124827.64355-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1968; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=dzGr49X7pVPoasOJF2oYtnntvKo8ogEdwOOo7jST2g0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpV76beJpfHm+9A/PvJoGz+yVfq6jzxeF8622ek
 DqLv6WXyLKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVe+mwAKCRDBN2bmhouD
 10y4D/9vRkVBemHeQz46eCPcRk84lgBw2ITsDBkNHR7kwph4QhVsT9nPx8YRV8m+2Mx3VMqoA1Q
 pOji/yCcX02+tnM4jCjBezVrNReilXqh/2gIGQnsha+LRvA97jLZ7MZMutXc3HObG70IHX9xpPM
 ig4k6NAVVbtCoBBHXhTeq1xCaCv/F+h6J7mfjBIIyZL4YeqsHGJjUickS3tbCRzO6LF32QpJiWN
 KDeOUF3fqmvkekD8uNj/Spqqvg2A73t9tki6VA0HXfrgVKhnFsXGRsJ6XReQz08ceOaS4Y0RWtC
 ZtyMeCNMSYlUbUrUoSy3o0UR8K8Fpil+f9ju0Fo+QShOsk/4RdFrI7XauzkW08LQQzTKR7+1F5y
 DdJMnYPOxwBuBTM5OxuSt7eYzAzRQF16dNl3Pz/BHboKn8HAsWPJfIOaOHBHcJxlPaRso2dHIkK
 4tRaSApCctpxk6fLBIhDH40zdbk+0HiNIlmKVrcXe7L/+dw7Ic7ADZFlyP87QJVy1iq/H0xUKTl
 C1qbmRwhFhv92XReNhzdOUydd2bvCiEW5cGeVeGF8cdI7YXL5wi4gbpt+25glLZ3Cg3Jv0ua3f3
 RftOmvvva2KlhLsQWWRSI+r9JUHkgq5ZEv1B5E8Kc0//xzrviNsNcZ1P9F9FGc9MKBrda/fqh1N DQumYlLepdJsyXQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GupPO01C c=1 sm=1 tr=0 ts=6957bea1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=3Ptd9em2v2g2-VwuqrUA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExMyBTYWx0ZWRfX7PK5Zf3KX7Mw
 riTdSs306yW9vNtN2qSspR89VJyf9z756HNlHI63KjwDAphvEuSzci2faql0xyZc7Sy0YEANQCA
 WHth8ryUwxCPEjGiBm+n8Kw3N7kwSbrZDNaEUJ9KMcu0GhCW5LpcjsQKy+rMvz6hFaqj/bcUYnm
 WASVpF5/p6oZjpPonXGXvo1+rZZxj+gAyvOj/UiV2pqWeTNTA6W1lmFWb+D/HyznXM0B8+W911T
 FOMsbPVseu4yrIk5o2Lq7WFHpOtJY22Dz85np4y+VUQLhiQKuVUyCPm+pf4E4sHHpd8ZySux2xf
 4APUWD9v9Ono3OLYwpW0tvlgOVU1fprsuO48bGpCANk44EnSKhhC6gPQ7eTfyKfMmYPltBO1/2S
 7XUXFuCh+Ppuvil3hwwB/BTKguo8oBB5iih28BMOuzR5NZjAx4zxKavYFkd+9+Qy4v/tLHtfBa3
 NZG7S0yz1VYXcE5osng==
X-Proofpoint-GUID: caYUEa5V2B3V55DGe2-zlZmrGjbr-vYk
X-Proofpoint-ORIG-GUID: caYUEa5V2B3V55DGe2-zlZmrGjbr-vYk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601020113

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/remoteproc/mtk_scp.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index db8fd045468d..328541e62158 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -1287,7 +1287,6 @@ static int scp_add_multi_core(struct platform_device *pdev,
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev_of_node(dev);
 	struct platform_device *cpdev;
-	struct device_node *child;
 	struct list_head *scp_list = &scp_cluster->mtk_scp_list;
 	const struct mtk_scp_of_data **cluster_of_data;
 	struct mtk_scp *scp, *temp;
@@ -1296,11 +1295,10 @@ static int scp_add_multi_core(struct platform_device *pdev,
 
 	cluster_of_data = (const struct mtk_scp_of_data **)of_device_get_match_data(dev);
 
-	for_each_available_child_of_node(np, child) {
+	for_each_available_child_of_node_scoped(np, child) {
 		if (!cluster_of_data[core_id]) {
 			ret = -EINVAL;
 			dev_err(dev, "Not support core %d\n", core_id);
-			of_node_put(child);
 			goto init_fail;
 		}
 
@@ -1308,7 +1306,6 @@ static int scp_add_multi_core(struct platform_device *pdev,
 		if (!cpdev) {
 			ret = -ENODEV;
 			dev_err(dev, "Not found platform device for core %d\n", core_id);
-			of_node_put(child);
 			goto init_fail;
 		}
 
@@ -1317,14 +1314,12 @@ static int scp_add_multi_core(struct platform_device *pdev,
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
2.51.0

