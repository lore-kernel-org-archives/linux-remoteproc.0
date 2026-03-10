Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB8A2D94BE
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 13:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773149844; cv=none; b=tKeT00qXwOrlOnqrcWPfcHyaerRULZHJOHgebLw841f5O/awNT1FCGO9KoYWt17Sn9915tBr7aqgQE2SzI/uUozlSjb8itY25w0ytVubp85SeXineNT49MOzG6gKk2TtmlA9tUPNwm8EaXTlyBWH7lofgAjqa4VbZynnCd1HxDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773149844; c=relaxed/simple;
	bh=KIze5ZrQxZz4Phfuk49pAhciBmV7OwVVldEXZctNS5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fQJrKwSDBUvJSApyFC4CMUcZSlb/FGtqq0ymq0CdFZ/4Ih5ipcY7smBao4Nn6eKoqlnupIcQmVWbCAZTYD1iM0WnQvyK9cLISs5LHOKCcHPrthFHcVRQs8Z9zD+96TKLAVhl3A9agffkNfEnENN3JALY6wP37do+I/FlRS43Grc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JcRtDGNm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WzQFl98j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JcRtDGNm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WzQFl98j"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACab0F3296079
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 13:37:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Zmv6BusZuzBbAou7SIt9IZJa+C5TK3C+6Y6
	Fy8mQT2A=; b=JcRtDGNmPr9X52DnNFB+Sf/H0LQdpNhY/Bpy6S9yJcqXenPGUNN
	iM58dPsLbG+jqPwpNzvroBkwAh/ULdvThr1+Pe6Z+T/vhRY1f4Iy5AccoML7u7V6
	TFgt6/MCKWI9WgQ+e7WpzfrlMJR2wSXpFfqWMn8OLKyvaqg7Cd0G/RfgJJmHVJdA
	gx1NpZA8i5AYfFZeKFC9/hFRRPBB8fZTPZUFFeMpwzls3p8pej25gOg93LnFhE+b
	cn4JjCloI7XNhuMxAEoBe/kLAsNBZNC2wHOOZ759xNP1HaZUSRXUpjXfN/2tSZ5q
	5FYiTYnWjnXFRPQ9fOuzk9BIWQ7TqdAd/Sw==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctg1ms35f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 13:37:22 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-67bb43260a2so21710281eaf.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 06:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773149842; x=1773754642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zmv6BusZuzBbAou7SIt9IZJa+C5TK3C+6Y6Fy8mQT2A=;
        b=WzQFl98j+RGy9efp79Q+QjZW1NrVSeK9JTRP2lCbH9ZKDgCBB5AbxdhAbw55mRqyIt
         cgDroOUlIfzXoMzb2sNG96hI2g+GIKnh/6nXD9rIXopZ1EyIQm4QPTDCnRXzpiMoyJXM
         /eLCOE1APa90lPgMbMHkz40BB2Lfdy/dYwAn2w88/kuLDbTiT1xaljkF2Tmieaj69UM5
         2LDSo1+SuNIDDy8IRbFHzsAozutbelJ7hupD4UnyVa0LU3yIcldt1ynNLA8y6KPJZ9xS
         yhqLKN5TxDou0y0QLW69Rlq2J8TXtEQ+MmfmoE/coKZjB7o/Nsc4X8N8cAMMhSuL8gGB
         Vd5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773149842; x=1773754642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zmv6BusZuzBbAou7SIt9IZJa+C5TK3C+6Y6Fy8mQT2A=;
        b=OgyX/w6Mt5TxKHiy/RQL1267KKjIM8AT2z1vifF/G47JP7rmKAfJwQAqNeMY3XJTcU
         men4LlP8zVKXv4ZiKahp0Y6MRS22N0lUcUnJcAMDB44GNUmP0UIKMNLyG1HkZUL0BfGz
         uG5bX8et3MRji/ukFi1OtZQ39cYZb8Pg5ZSXJP5EbK+RoUZZZyUXKoW7eRJSmCfRR/6l
         /VhlRWH/5Jf5BqKde3Gwpp+GYK8c6btkCesUGh8WTSYS6kaDEIn1pGvgg1i2XnfLSVGd
         JATMNbgDS2t3swTK2AAriAIq/czlrWtdcjazCdFwJ8eGhIIk420mRpr3nKBy6i2nQvl3
         v14A==
X-Forwarded-Encrypted: i=1; AJvYcCXOSfe7z5/YsTOmhp3E+jf8tGpnCg0UESGQzohGs5Xwtd+KOAkby4D2U8qVRBFJQktMZ19XQ2TgxUu0Wga7NmVG@vger.kernel.org
X-Gm-Message-State: AOJu0YwGoKtDEZkwgv1KPPszYtepRAYOnxWVX+wWDkWVGO5SSQabrjXW
	tUJrlRnjRRCeyxazrLcWv+wbF6PY2LrXWsqd9XSuw6qFuIiemJ6HeRjMB/eqaBWb9gcu7sds+Aa
	lumABGDARA52w2SqW9Tn+XKMc9tAihXY4vy/jAghOIERxg2MKlD2SpLUltZM/FHWEBmmQKo2H
X-Gm-Gg: ATEYQzwl2ZVXbzZfS5S7wt8BRsx5eRpeAIobHyitWVf40lUU3M9y86bnbecvTclQxNc
	LG/fjmYGCXRTvAtc/MFd/camCs6OXNQRnyj1ZvJ4aTpEJqtP/UQWfUTs94ZfognEHsLHtZzDFL2
	/Gzsq4i/CvzygFVo4Sb8amjyRZcQ7dmA5PBjqeJA0wPHwGdE0VThJW90i9Y8Ttmw8WZ+jyItab8
	b5bm8hDizkKhpHSb0cVfSf6n6bqt01bO5zuP8n5NMVcuxVImvYfl/7Q4ocseCzeR6ChAH2SfH2p
	EF0ijnN9mi0ZPoYyD208iWldHjprY3FBD5U8W8n+80kJ09Qzkcxq7ViNR5RIp2bsB4SN2C7aAUO
	gXrA1clsQ92X4jvdr7UVFXSO3xtOBUoytc9lqFzGV3zRaIL1c
X-Received: by 2002:a05:6820:221e:b0:67b:aaf6:821d with SMTP id 006d021491bc7-67baaf6aaaemr6265048eaf.42.1773149841569;
        Tue, 10 Mar 2026 06:37:21 -0700 (PDT)
X-Received: by 2002:a05:6820:221e:b0:67b:aaf6:821d with SMTP id 006d021491bc7-67baaf6aaaemr6265038eaf.42.1773149840983;
        Tue, 10 Mar 2026 06:37:20 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67bb1eb3591sm4265084eaf.14.2026.03.10.06.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 06:37:20 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] remoteproc: qcom: pas: Fix the dtb PAS context creation
Date: Tue, 10 Mar 2026 19:07:10 +0530
Message-ID: <20260310133711.2452445-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YOeSCBGx c=1 sm=1 tr=0 ts=69b01e92 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=Zzg8c1LOEvFJJv0PgygA:9 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-ORIG-GUID: J_PCbeStEqxDU7afXDQKbPNXUjQHKSPL
X-Proofpoint-GUID: J_PCbeStEqxDU7afXDQKbPNXUjQHKSPL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDExOSBTYWx0ZWRfX6tMwCxxT+bCM
 JmX/wfpboMLuRa+5izf8OQhkM57/3R6JbghMx54NJBKB3RvMNftxJmGyYKd548TlhWH4aMRNzUO
 blRzC6hB9XUM3WiPP7OiS8qJsRrE8wKiGRvDjyvcSZafNfodBMyWzhAN5LKM71FiKjrqTcE87hP
 vC83Q116HQsutQmKjdVEPHxAQnOwoLxD1J/iPf8BVejk6nYoJX5m4GLZesrRlfZTjPRcJlgWII5
 yojG8TSx36NT7a7jHEQrlivVeGQ3n5ZiFKx18Iq9GNbeRm8nzUrFXWSZGPxU8KSsLxEncKjfug5
 4ghi5+gq4s9jXGi1ZdyoU3CgaPeOha3HEkDYxq5WR358fBdyb4Yn4QUXlv4mZEd5nJBQJBcW7wk
 IaNmj8bBYtPaueNq65PpZdeJHt3In+jylnr1R76QtrHXQ1xrbO7iL5uW3Qq/x573KJnYDhoxfPx
 UagP+AzkPjuI56nPorQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603100119

DTB PAS context creation should be done only for subsystems that support
a DTB firmware binary; otherwise, memory is wasted. Move the context
creation to the appropriate location and, while at it, fix the place
where the DTB PAS context was being released unconditionally.

Fixes: b13d8baf5601 ("remoteproc: pas: Replace metadata context with PAS context structure")
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 35 +++++++++++++++---------------
 1 file changed, 17 insertions(+), 18 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 46204da046fa..74596b82aa74 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -250,7 +250,9 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
 	return 0;
 
 release_dtb_metadata:
-	qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
+	if (pas->dtb_pas_id)
+		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
+
 	release_firmware(pas->dtb_firmware);
 
 	return ret;
@@ -640,6 +642,12 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
 		return PTR_ERR(pas->mem_region);
 	}
 
+	pas->pas_ctx = devm_qcom_scm_pas_context_alloc(pas->dev, pas->pas_id,
+						       pas->mem_phys, pas->mem_size);
+	if (IS_ERR(pas->pas_ctx))
+		return PTR_ERR(pas->pas_ctx);
+
+	pas->pas_ctx->use_tzmem = rproc->has_iommu;
 	if (!pas->dtb_pas_id)
 		return 0;
 
@@ -657,6 +665,14 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
 		return PTR_ERR(pas->dtb_mem_region);
 	}
 
+	pas->dtb_pas_ctx = devm_qcom_scm_pas_context_alloc(pas->dev, pas->dtb_pas_id,
+							   pas->dtb_mem_phys,
+							   pas->dtb_mem_size);
+	if (IS_ERR(pas->dtb_pas_ctx))
+		return PTR_ERR(pas->dtb_pas_ctx);
+
+	pas->dtb_pas_ctx->use_tzmem = rproc->has_iommu;
+
 	return 0;
 }
 
@@ -838,23 +854,6 @@ static int qcom_pas_probe(struct platform_device *pdev)
 
 	qcom_add_ssr_subdev(rproc, &pas->ssr_subdev, desc->ssr_name);
 
-	pas->pas_ctx = devm_qcom_scm_pas_context_alloc(pas->dev, pas->pas_id,
-						       pas->mem_phys, pas->mem_size);
-	if (IS_ERR(pas->pas_ctx)) {
-		ret = PTR_ERR(pas->pas_ctx);
-		goto remove_ssr_sysmon;
-	}
-
-	pas->dtb_pas_ctx = devm_qcom_scm_pas_context_alloc(pas->dev, pas->dtb_pas_id,
-							   pas->dtb_mem_phys,
-							   pas->dtb_mem_size);
-	if (IS_ERR(pas->dtb_pas_ctx)) {
-		ret = PTR_ERR(pas->dtb_pas_ctx);
-		goto remove_ssr_sysmon;
-	}
-
-	pas->pas_ctx->use_tzmem = rproc->has_iommu;
-	pas->dtb_pas_ctx->use_tzmem = rproc->has_iommu;
 	ret = rproc_add(rproc);
 	if (ret)
 		goto remove_ssr_sysmon;
-- 
2.50.1

