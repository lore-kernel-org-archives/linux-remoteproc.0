Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770478;
	b=J0X5EBJhwcw9avLroq2UpzX0OlmoIQX8HFcY2mwjYgtvd1xIbNEfl+gjL/9VcM+CDgvf
	 q9Jpz+duapvjWj015tWdrmIdHnXhOtfS/ld0v5I0OWzVAWzFDb+sQv1MJQK3d4k00Ma86
	 Q1Y5FdLzKeB0whHHWg9o8U65kH5BMplVp938vHNYAhUejUOArastNTmvLwHp4xZtCouA8
	 IaIxbSMQ9XzvSfGSuEfK1Rg5m2dbpSQEBpBdeszuAiylNd0g4aUhot+9qKz+PqZoKZ81i
	 KtlutprU2Z7BaXnUpy1y7N/+GMrbtNYpZbm96utHuiVn/PD5OJz+vvfKFsTNdC0lWNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770478;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=R5TPuNKCZQoB/rH+DJ1mz+PJVWJcEoh0teKtyWwe6lE=;
	b=moajIZ4CvFEbX3Ad0kc4jPCdEB4MX329UivnHAujYsNGxII5HQ1/2xEEo5wbilni1/1e
	 gvvwgHYw63EBJVoSOXAfyXZE/VINctIM6fFenb2lm2+BmT36mKcJALudBwQQa6vn8E9Pl
	 43mP58GVxQ3wAIif++N0nxsrEbiixfZcyRY50+unN6nRQz6Db56sZ4ZInbu1r1XCAMkID
	 MTBJvhfL+lAk8UmHHPhUjoTV5kg6OxRCstd5Dl/Q83Hqz5fESADSeB4XtWdAJoMG7Oe+6
	 e+xzZclaQuhlHKsZb2jzI6tvq7A0aifKKbYH6YEr7LB4bfJ2D+lFJ0IHkBi6bgwW9cA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=APiwDKTy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WLGTNqxe;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B273E606A33C
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Nov 2026 09:07:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B273E606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=APiwDKTy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WLGTNqxe
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7Gg3o3759130
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Nov 2026 09:07:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=R5TPuNKCZQoB/rH+DJ1mz+PJVWJcEoh0teK
	tyWwe6lE=; b=APiwDKTyGpBd55kf8Ukx4CI4JUP7ql9EzkmRQ/UTdXmVXTiWp8v
	hY2Ez7Wh6MOW9R942mYNf+A2Wr1GjYA5ip0v0GqAlDbWcddakp/y2HWAInQGuggs
	cloTvldFE0KB43C/xJLLSn2u1GnoHpSxmq3svOzwVj9hY2ENWu4F94eN1/XdNR4q
	8Wpt8ULJtXR3kWVUU/uuoud8lqzDlGPJ3xGDBuJQQekaH2Pa+zS5XQ1zsr61832V
	1fCOX0RCqwW+Bu9uwQ2ufgYDsetMOR2lFJJLcGqclS1y72nnVoDXFtJqaUBWq9Ov
	KP1JR/Y91apcSYlO/BAPeeFFjUyoh7kQJTw==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74g6rm84-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Nov 2026 09:07:56 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-719112c89f1so6605342eaf.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 27 Nov 2026 01:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795770476; x=1796375276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R5TPuNKCZQoB/rH+DJ1mz+PJVWJcEoh0teKtyWwe6lE=;
        b=WLGTNqxemrDEWXREmLqzWg3KHMtiNqWXVBy/5zYYSq3pVMkmrhUzAn6/3qdY11XmJe
         mFrCmP1gaDF3sbimC+TwfpryZ5V94lSd3Lr544OE8jltOegUpaJn3Oj5owGQeRd1kerQ
         O8HKrnL5Do9HnxaEHPiHYAKN/yQN3h7nKpBwnJFnfdeDtcA6uP++ERA4eoq2mR27V99n
         mDfvfWtMz3GjNs3R4eVF2dhN6ZH1xiWMDl0vHaV/LjDN/WTwbqs/8gC9eTSn8hoVEXWr
         Ujmc+REW9bJe3no/F6W6xXCF0Gf0HpEi3p4Ixi/kZqGZopgIwM6L19lmcf2XFJ/yy4c0
         3hEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770476; x=1796375276;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R5TPuNKCZQoB/rH+DJ1mz+PJVWJcEoh0teKtyWwe6lE=;
        b=Dsc8WnPJE330T4wbz/wRRUkVxXStyaaSWgHGavaFKqKgTzZHH3UgB3fVTvveukiBk7
         mt2dIura1JByO/FD3KKQZ69j2EzbN4kjFiV9q3tcppv59BTHM16luVlu1HqoO4DNMlTD
         uvlEtcELrdHTsW0X7+escBF1vmb6P5WmEWOr/kTOdugoG/94sP+egIHkrp+/wVQJlNk+
         vs3GsBlBPICF2Z52Rwz5YgJhsIgzVe1crv7+ejA6k4sUmMaNxv46iQ/UQT8AR6ESD4tg
         3tqtTrmKzZ5lYftOdU+X42BoHRUfL+DudRrX8vgHjjtVaFGQLFFy+uaVONV05FIpPwZK
         HkXQ==
X-Forwarded-Encrypted: i=1; AL+hErEm1t7EzD9QWoLa+0y4HIwWg65J2qAuSeiPmQY9c1eFFMc8KlXztn8cBI4GUynDaHpBQOjf+EewwrjO3GLcgG9b@vger.kernel.org
X-Gm-Message-State: APuU4Z848cziCfJn1i6njBBJCl1h7rEky4wejq8xGm/YL3Iewdr+yLLJ
	OsOipHgNVQo9IiGBWnYeVZ4foWGsU3xYXYJkoEH/Sh9ZNQXuA7wwaBf3tr67x83zBt9ZUrG8kbl
	Ksd3+5rJSS2kyx5WQEGaCrHu64X2kQ4M4/a+JB65iG0NzdCk1maZFJVeQTRU9CxO3qwolLnHh
X-Gm-Gg: AZFdTZfgCXMlmFeVWVfdaCrCYHUoGsOJdcFSVWbna6MzHyLyztkIbEcV8JcwT4k5BYx
	DdbOFjgx7UjEyPboX006Dx3eXdUx4LZOKE1YY+c4R9SmgandnWlQ9ZnhztaLf47oSQ85fJYX0To
	0QgtNP70BW3D69RVKxzHb6SVIPAWrrQtMcsHosyQdexueSrUgYNkysc+kS7rT7MFLdCYZ5ce8DO
	XmbEno+sDwJ0U1I6psQyhM/Afi76x65U9cbs1b23bfxTUNbY/CpEwDEZTAEMTe5KdMUIH0Lmomx
	Kc7dQD1pxnnQac+QKO/CX+SIZbjkOFwrhiImWMnBcQaHZ9i9pjlOfL5DhV2sPRqXs8UMLHGVrze
	Nwuh/ItqWvFchO78MeRq77hXPIBS+J/npaS1BV9l/KCHZmb86Ab+1IF89bVWxuV9AI2IVpNU9wa
	2WavxyH8Vpxl2Y7oRYmFziO0QK+fb27Z3ub4qoRg==
X-Received: by 2002:a05:6820:f025:b0:6f6:b13f:5d2d with SMTP id 006d021491bc7-71b392612c6mr20395019eaf.12.1795770475816;
        Fri, 27 Nov 2026 01:07:55 -0800 (PST)
X-Received: by 2002:a05:6820:f025:b0:6f6:b13f:5d2d with SMTP id 006d021491bc7-71b392612c6mr20394998eaf.12.1795770475381;
        Fri, 27 Nov 2026 01:07:55 -0800 (PST)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8631690f53dsm15719276a34.19.2026.11.27.01.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:07:54 -0800 (PST)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org,
        konrad.dybcio@oss.qualcomm.com, abelvesa@kernel.org
Cc: niklas.cassel@linaro.org, rohitkr@codeaurora.org,
        sibi.sankar@oss.qualcomm.com, robh@kernel.org,
        quic_srichara@quicinc.com, konradybcio@kernel.org,
        rajendra.nayak@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: [PATCH] remoteproc: qcom: Fix da_to_va() offset truncation
Date: Fri, 27 Nov 2026 01:07:50 -0800
Message-Id: <20261127090750.2059755-1-gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: yN9s6MNHuZACPMFlMt3-Zbne218cH7zR
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b09486c cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=TkQF8GsBrQEj9MWfvNYA:9 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNiBTYWx0ZWRfX75PbjUN1dAS7
 n4fDYWkwtFO4ChvDXEulQrm9yfWlE+XfpU0XYg28+IwzSkuE8KmiEKgFSKmVLCLK3hrPv0pf9+w
 DwxlCRgPztquJT1izz72T2u9WcGzKW8=
X-Proofpoint-GUID: yN9s6MNHuZACPMFlMt3-Zbne218cH7zR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNiBTYWx0ZWRfX/65FWwS8fEjB
 uMv4qBAVqMV1XYD3CM3zKX9MxxuevM9ILWukJ9akgxdS0lwZZe3Mlpsq349fljS+KoEWIOdk1oK
 Ipfmg/1EDFpD8tnOCFNQ4Py1KUmqQ9/r3pTg7pfY0zJZzdV4U4+hCassyVw9gstbeqHQ/2vI1bJ
 uJ5tz7/iyZXxz0cun3eZcsc2G58J0Ft1vmSwcrWeHNmGcYTMVULYYDEDIKHZRL4bVdfNGPdPUPx
 xqFBLSHTKO2OQMFe+56oGnMUNCuL7jGEbnFBI4WnpHhnSgTQn7l/w/22QwtmLa0l93mh4yHLoIU
 jP7Bvl4i3u26JXw+WRIYsowtJCGLgnYitauoZzCJVNhQokXID1IIJKpt8iKJ2wzYh37VA4q88VG
 qqgPrC1FWsQWQd7Y14lDAdA4E9a9lz8hqGe+EfdafA9BetXrC12xQfkOLS5EgkZKq9KAv3B5VRk
 2ejvxMnWz87CYuCQb5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270036

The da_to_va() callbacks compute the offset into the carveout as an int
from a u64 device address. An address such as mem_reloc + 0x100000010
truncates to 0x10, passes the bounds check and gets mapped to the wrong
place. The check "offset + len > mem_size" can also overflow.

The device address comes from ELF program headers and the resource table
of the firmware image, which are parsed before the image is
authenticated.

Use a u64 offset, reject addresses below the carveout base and compare
without risking overflow. Apply the same change to the pas, adsp, wcss
and wcnss drivers, which all share this pattern.

Fixes: 9e004f97161d ("remoteproc: qcom: Rename Hexagon v5 PAS driver")
Fixes: dc160e449122 ("remoteproc: qcom: Introduce Non-PAS ADSP PIL driver")
Fixes: 3a3d4163e0bf ("remoteproc: qcom: Introduce Hexagon V5 based WCSS driver")
Fixes: aed361adca9f ("remoteproc: qcom: Introduce WCNSS peripheral image loader")
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Assisted-by: LLM
---
 drivers/remoteproc/qcom_q6v5_adsp.c | 7 +++++--
 drivers/remoteproc/qcom_q6v5_pas.c  | 7 +++++--
 drivers/remoteproc/qcom_q6v5_wcss.c | 7 +++++--
 drivers/remoteproc/qcom_wcnss.c     | 7 +++++--
 4 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
index 23fabf4ce84d..d9d12f67ee25 100644
--- a/drivers/remoteproc/qcom_q6v5_adsp.c
+++ b/drivers/remoteproc/qcom_q6v5_adsp.c
@@ -486,10 +486,13 @@ static int adsp_stop(struct rproc *rproc)
 static void *adsp_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
 {
 	struct qcom_adsp *adsp = rproc->priv;
-	int offset;
+	u64 offset;
+
+	if (da < adsp->mem_reloc)
+		return NULL;
 
 	offset = da - adsp->mem_reloc;
-	if (offset < 0 || offset + len > adsp->mem_size)
+	if (offset > adsp->mem_size || len > adsp->mem_size - offset)
 		return NULL;
 
 	return (__force void *)adsp->mem_region + offset;
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index ff2483529d73..232bf9b349cf 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -473,10 +473,13 @@ static int qcom_pas_stop(struct rproc *rproc)
 static void *qcom_pas_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
 {
 	struct qcom_pas *pas = rproc->priv;
-	int offset;
+	u64 offset;
+
+	if (da < pas->mem_reloc)
+		return NULL;
 
 	offset = da - pas->mem_reloc;
-	if (offset < 0 || offset + len > pas->mem_size)
+	if (offset > pas->mem_size || len > pas->mem_size - offset)
 		return NULL;
 
 	if (is_iomem)
diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index b391724cfd08..52d9b5174e8a 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -740,10 +740,13 @@ static int q6v5_wcss_stop(struct rproc *rproc)
 static void *q6v5_wcss_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
 {
 	struct q6v5_wcss *wcss = rproc->priv;
-	int offset;
+	u64 offset;
+
+	if (da < wcss->mem_reloc)
+		return NULL;
 
 	offset = da - wcss->mem_reloc;
-	if (offset < 0 || offset + len > wcss->mem_size)
+	if (offset > wcss->mem_size || len > wcss->mem_size - offset)
 		return NULL;
 
 	return wcss->mem_region + offset;
diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index 02f38fe29f20..cf8d1aa8f38f 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -321,10 +321,13 @@ static int wcnss_stop(struct rproc *rproc)
 static void *wcnss_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
 {
 	struct qcom_wcnss *wcnss = rproc->priv;
-	int offset;
+	u64 offset;
+
+	if (da < wcnss->mem_reloc)
+		return NULL;
 
 	offset = da - wcnss->mem_reloc;
-	if (offset < 0 || offset + len > wcnss->mem_size)
+	if (offset > wcnss->mem_size || len > wcnss->mem_size - offset)
 		return NULL;
 
 	return (__force void *)wcnss->mem_region + offset;
-- 
2.34.1

