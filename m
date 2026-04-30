Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3112447DF9A
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 Apr 2026 19:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777576425; cv=none; b=HNE0iIR85yOLK3uelAqynlypG8GBDexkvsilO4+JKzglp8hu3UNwSGenIe7x9DjyKeSYuj1Fr5wEAOZCYMq6Sn35Wvyp9fHeabS5FL4Bxzqf7XlDXIP2gspB8wmZeqWcn0vbOoxE9WCbEHOYl5W1qqa7PcS+ukWp8tBvbY0cY6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777576425; c=relaxed/simple;
	bh=5A056jzGoE97ciTmd15TMvzUAfqNBpsSYmrnZzYb3T8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sH23LKP73Rw2excGQjpBLXtvBFgi80x+xIRaMzi9MErvQIAS9Nj6gupZmCnSsUB3dO3507SXdX/RjmeKdc7CYYt262IR+1H5yjGhVf/uUt7yeIuD2XV3EcQrjZJzO7xOmiXSA3dl41VhvET7MKcs8hke9IyBPb8OZzkQUKzYDzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=InKNgtBw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sy39ABph; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="InKNgtBw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sy39ABph"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UEkfjQ2943404
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 Apr 2026 19:13:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B2EXjzs7S+kYLNtL9rHiPcEmgW9Hm+LLRRuA2nNHZe8=; b=InKNgtBwe0MTigdK
	3kZwGJUbV4toz2M/idSiiDOu9OaFrBB0OPYI6LzkpW8iYzHNKyygIuepMkhPOsoX
	6bBQ1i04XP0cQKJ3b+RuPiztIBU0DDZlunTZg048+MhW+6EQcclGt0pi6Xgycvke
	DGcO4O0DEMnE6I27H/Kl4Zex+8Iampy4orfyaOAJHTIMefvU82pcf8qtNrFzVDbn
	s8DzoxKwLU3U9uMtGNAMYEfFqfQdzlvo3EM8kboSFCb+/HZY2t6bIUjHhv94VV1G
	rvX6fB1ELuyS+jmHH9cP5tAY16XP7LPw3geg2j3zPrIGRsSwcVWKIIo6FMWsPg/O
	KinjTA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duyr43xp6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 Apr 2026 19:13:42 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c70ea91bfe1so699580a12.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 30 Apr 2026 12:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777576422; x=1778181222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B2EXjzs7S+kYLNtL9rHiPcEmgW9Hm+LLRRuA2nNHZe8=;
        b=Sy39ABphv0174ZYYYd/K++/w7N+zOYkZVYEY51BPKhwrc2pv/PAuwJX5lebf0nJF88
         iD8DLiT2upTsmcBehIlpLU/Y0nOCxXMQpFQpD5U+MgNjldUk8QwLD47vHm8wgpnYNWEQ
         lNyvbiccgBcRJ2Rq4SFoY4BTvGO7pGaXmuqrEbf4OHnePzkjDpNayV9oUNwd9UfRoZe0
         HathqCzmPclLFup2e7vbUJ/6Xlpn9DHR86zju5v8yDMeqsdHO52GhJNhk8EhYDsXMYKG
         kipi3kZ2nAr8+YI3Lcz8tMXqUXn9gFbKv4oJPlU2e7WThG2ZOEcLY4LLgkSH2/9NV/zd
         dxww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777576422; x=1778181222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B2EXjzs7S+kYLNtL9rHiPcEmgW9Hm+LLRRuA2nNHZe8=;
        b=jZHq4o7SMQkpqFJMKBkBNkXTx3CYHo146MINrcDNfJ5BObN1edVJZzu440qfuX1GZq
         JcCfqYCg+NErHpycK4AJyfj4AXWj1ePoSHrFTdwzCDhmnjB5kje9EaHWEWO/xn5P4VjX
         FAQ/rp8OrVUH1DZ/10G5KTC3H5eyIr2WPFJfmbsIIT/1uuFQR17ik1kqKFYdQTU7k+e2
         /Djc40oW2B8nhuybt4iGAWv81EPAtPGzfSi25uduIYBNvdWnUotIrt8y4LZABPEf/rf1
         co5Wd8Awl58ac36XnkwHWvMLGnyiPzzXgUnLKIMs3DdQRRdixa0nDLbbgJy9zNvg7knj
         XhsQ==
X-Forwarded-Encrypted: i=1; AFNElJ/L3P8GSZk/3ztr5sLILyxOoOTGUACsVecaPaagUA1th3eTv4LWSY+5gRo507OvV1tt5gnSOsI4gxNLJmmtSaQJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyGKBOgMMb6X+poiW8nuQufrsftOnlui3G9atXyBuukseNsQx3+
	ziMCNij+1yY9gEXA0pbB7+nTxKpsAWwZaJHokZzLQftUByg4TxQsfDUdhSlF2Oc6dtHUf+xc1Bm
	XVp5Uxxhyoja7V1DImlByO2zBDuz9PNTlxs0GiPnIH2Q3AMVx9+ypj8xOA36K/R+9/xA3Pm/E
X-Gm-Gg: AeBDievjA7QJaSOEX2mwAZ0E77dEVsAqgbfZ8QNVQfzLGi3P1NuooRLn1/HyDI0OzUI
	HmaaWL+3b86q9FNah5rR0DH6RsfLwokpGTQJydLGmjvkt+4FGBdp6T+TVQZKRmhqx7kG9dmr56x
	L7RKqkQh6fZtBmQ2O5RJYzJ8RPS6IKbHqm53QDxsFcC0FLnwZopiRWKqgn4RFNGQfI3n+IxBiQb
	6Hbi7x1hmKoOGOBmIEafwUaKygrLbnFY3jxSah+jbCeA/mZReXFB5vseo13CpSBO5lwo4ZamqjZ
	CCr2aEHRuzoiMfvu5GuTaumxSsjRzAOuO/pHdOtySFL47TAPrugwIzmqO49mpbyfY8njiXQtDVl
	OalBT1OiHE3HgX3aQhZ0Imbq0dAzaT910N/QfIUvjzEqq6u+9Q4U3k/Bc1dI=
X-Received: by 2002:a05:6a00:228e:b0:834:df57:9d67 with SMTP id d2e1a72fcca58-834fdc16541mr4811152b3a.32.1777576421817;
        Thu, 30 Apr 2026 12:13:41 -0700 (PDT)
X-Received: by 2002:a05:6a00:228e:b0:834:df57:9d67 with SMTP id d2e1a72fcca58-834fdc16541mr4811102b3a.32.1777576421239;
        Thu, 30 Apr 2026 12:13:41 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515b485eesm373640b3a.48.2026.04.30.12.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 12:13:40 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v4 6/6] firmware: qcom: scm: introduce keep_mdt_buf flag in PAS context
Date: Fri,  1 May 2026 00:42:53 +0530
Message-ID: <20260430191253.4052025-7-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260430191253.4052025-1-mukesh.ojha@oss.qualcomm.com>
References: <20260430191253.4052025-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bJcm5v+Z c=1 sm=1 tr=0 ts=69f3a9e6 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=g7xFvzIaMl2GvowGQBkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDE5OSBTYWx0ZWRfX13mN/0Tt1zPU
 nYq2u7PhFH7x08D+021wRPPCsv+NkqKnMOM+88AiLFgaYVyYZ1i2Q3QuoNjf0Vb5DB7WRBGz2lG
 hPxqnWisbo95Kjf/geZY2m/q9Xr2LRzMUs7jzxtVZcmK4xDXkBaFPw8Jdfu/aLRYN0h26RDjuO7
 sP9FMYSmbrkn/Vi7d/MyXLGeDZjVNXUpG1jxbo+aIpx1mVBKo2a/WWtnLDWfEC3/5E5aAoDmDNh
 pVhG65lj8027v+ECDNPFGQxdisYnMONIs1Y5Ru2qdzyP89oelUAIwIsWQZ8TpYRDko2QgzgYrBT
 86siIiMsWJbgh9Ja5ijjHErqq2SN+jmTJ6o2E8DLd1K34i6tDk6Szo8wTq7Gt1mQOA+agEBoyS6
 hyaS0qdH53YOOUq30RjIeAN15za8LwtTJsv62zUlOPamJu9hS2KO49H7mt9hH4+3lr/O69ODEgs
 z0F7nNPJi0Kgv5sdWUA==
X-Proofpoint-GUID: U3erCbdCmt6pJM5QJm0fUBhaZxymSs4k
X-Proofpoint-ORIG-GUID: U3erCbdCmt6pJM5QJm0fUBhaZxymSs4k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300199

The PAS image initialization path always retains the metadata buffer
when a valid qcom_scm_pas_context is provided, even if the caller does
not require it. This implicit behavior leads to unclear buffer ownership
and forces new users of qcom_mdt_pas_load() to manually release
metadata, which is error‑ prone and incorrect.

Add a keep_mdt_buf flag to struct qcom_scm_pas_context to make metadata
retention explicit.  Metadata buffers are now freed by default and are
only preserved when this flag is set. qcom_q6v5_pas enables this during
probe for contexts that require retained metadata for subsequent PAS
operations, while existing callers continue to work unchanged.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c       | 21 ++++++++++++++++++---
 drivers/remoteproc/qcom_q6v5_pas.c     |  2 ++
 include/linux/firmware/qcom/qcom_scm.h |  1 +
 3 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 9b06a69d3a6d..2cae35e7c583 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -651,7 +651,7 @@ static int qcom_scm_pas_prep_and_init_image(struct qcom_scm_pas_context *ctx,
 	mdata_phys = qcom_tzmem_to_phys(mdata_buf);
 
 	ret = __qcom_scm_pas_init_image(ctx->pas_id, mdata_phys, &res);
-	if (ret < 0)
+	if (ret < 0 || !ctx->keep_mdt_buf)
 		qcom_tzmem_free(mdata_buf);
 	else
 		ctx->ptr = mdata_buf;
@@ -707,9 +707,24 @@ int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
 	memcpy(mdata_buf, metadata, size);
 
 	ret = __qcom_scm_pas_init_image(pas_id, mdata_phys, &res);
-	if (ret < 0 || !ctx) {
+
+	/*
+	 * Some clients still pass the PAS context as NULL. Until all clients
+	 * switch to qcom_mdt_pas_load() and provide a valid PAS context, check
+	 * for NULL before dereferencing it.
+	 *
+	 * When a valid context is provided, metadata handling differs across
+	 * clients. For example, modem clients pass metadata to TrustZone that
+	 * must not be freed until the authentication and reset SMCs are
+	 * invoked, as the buffers remain locked until then.
+	 *
+	 * Other clients free their metadata immediately after the PAS_INIT
+	 * SMC call. Therefore, keep_mdt_buf should be set to true for modem
+	 * clients and false for others.
+	 */
+	if (ret < 0 || !ctx || !ctx->keep_mdt_buf) {
 		dma_free_coherent(__scm->dev, size, mdata_buf, mdata_phys);
-	} else if (ctx) {
+	} else {
 		ctx->ptr = mdata_buf;
 		ctx->phys = mdata_phys;
 		ctx->size = size;
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 5be3070fd52b..7858e14c0bee 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -669,6 +669,7 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
 		return PTR_ERR(pas->pas_ctx);
 
 	pas->pas_ctx->use_tzmem = rproc->has_iommu;
+	pas->pas_ctx->keep_mdt_buf = true;
 	if (!pas->dtb_pas_id)
 		return 0;
 
@@ -688,6 +689,7 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
 		return PTR_ERR(pas->dtb_pas_ctx);
 
 	pas->dtb_pas_ctx->use_tzmem = rproc->has_iommu;
+	pas->dtb_pas_ctx->keep_mdt_buf = true;
 
 	return 0;
 }
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index 5747bd191bf1..6d8d3deb02e0 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -75,6 +75,7 @@ struct qcom_scm_pas_context {
 	dma_addr_t phys;
 	ssize_t size;
 	bool use_tzmem;
+	bool keep_mdt_buf;
 };
 
 struct qcom_scm_pas_context *devm_qcom_scm_pas_context_alloc(struct device *dev,
-- 
2.53.0

