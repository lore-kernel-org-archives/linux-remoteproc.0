Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BC13B961B
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 03:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773113803; cv=none; b=mbn9zefp/CJEmQovr79TomF+LD5urF1R8iGxoyhKOrL557DUQd11dAhV3jdq3r08FUwZ/h4BurXaMeQw7WA2Ya9/1KnyZl6s0pGqHsnZX90EgNFhBv59jcZxpXbVE8LsoP1JSjT6sRyfi1Xu1g0yWbStiJzVOgRySxd8/unA2Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773113803; c=relaxed/simple;
	bh=mg31LB+leIUTk+NAma1u/7Avcu+s85265QudNG2Rx6Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OOf9O7k1ylplmaNpQKzKEaRxsD7FlAkWyXCLFehPdAizQyIZu0IR5yD+oAnxisUm4TCvqEhwWwOK06pZUjjy20T23SOu5beKgAg7zinIKgoYMXdB1Zzp8TZv98aQEIyHIsg2Tdpsfi+rh3yooucaJy8p+kExyP5nI8WAIg/9Yms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VYTa55Be; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VcUit5ub; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VYTa55Be";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VcUit5ub"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2F1a92021596
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 03:36:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YUSWifLnFZE
	lfRttPzEiIk0stf+6yjPu+zvqN7hjHrU=; b=VYTa55Be1sv0sS2GRTS2HCzm8sG
	c8g3Pn3xXaX2Bk2BuaAU6hHfIyl+ucjPjHBr+EtplhbDieHfQ9dPepkkd6YTYjMr
	TtlfyXPi/T70RxxE2nVdhyYZ2ICxnyxljBRAbisRH/y+XJAUVqpIrar8JO1nXSky
	IZWkdPof5A34kE4Y1LbzoP8u3ZJkJ1vaUNFdlov/PM122IWfCi5HDKlkjjhTjFGi
	tptMNMQIIvzMRz/yHO1k02NzGLxO608vJqMPT4T6Fj09B129NDB0LzgPtjGpw7GZ
	VH8vjdWKRg21HyQDIQU0r2BFckOEHlhNdCuUDSlPx4Vwv0vL26KmLwE+RFQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyhbtd4v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 03:36:41 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae53ec06b0so438008465ad.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 09 Mar 2026 20:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773113800; x=1773718600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YUSWifLnFZElfRttPzEiIk0stf+6yjPu+zvqN7hjHrU=;
        b=VcUit5ubeJ++sRv/5OkKlxBMDyoL1UqLjeOirpLjyzB5pIulsZtvBerccgg8ryIuFp
         pdDyUscU9m7N7F6uxU6ZAcug8Jt1e6NG5d0h21xRPufJUTIBD0QS3fbc6bJJEcgJZMEo
         B468djnl5TWzSGUFEYVstA5kAU8SR6QyV2hoMM9SYzcUbBNuYVT91BXkNADuvYAdXZ1L
         oVdIACABzl4LNlOU9/JwOlZYXOX2m9wk+7DFpyzlluFbgSTRKvS1A40m9xzzNHJTZthq
         7esT6Env0+80k+12PkUPc2oof+rrCL6wpeWPgGkjk4ZP99H47+Z8OgcAI1g7Hir3w4OW
         qEgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773113800; x=1773718600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YUSWifLnFZElfRttPzEiIk0stf+6yjPu+zvqN7hjHrU=;
        b=YCm2rbljoyLPa/kOAraHQjRVxqRJCe7goDI7G1XeRz85BgtLhAoMWg7wI+WLSR+bJ6
         bsosQUD5WwCDGC/66drDo5abD2Dlxel1clKACOhxKGEiuZ10NH1WGUUhx45EMbsMzsx+
         +OgZRtGuGEEfdzjq0ZIHQ1bwUJ9GNLixLNgzr+OqGXyVVJiVr1HTpxoYXpNic4TgzcGz
         kSBjXjdHfmPC3ZjDtDsOXLFe2u3Z6oUXBsukIEieEq2OMpGQOH4t4wVHl/xsHwPv7+bg
         4O6lrJmFLgxUnABRsdFsDDYj034kWz/yC7s7LD7lPs6jNqELzRx2sXnLlDi07L8ONZJb
         8/Dg==
X-Forwarded-Encrypted: i=1; AJvYcCUYaG7yevOCDfRkLSAvbY0D3DHdFeX9dK0cAMjBcDu/NFQHU/JeIeSnVrHYyZ0gJJ9bNTAntVKvuBGanb89oB3h@vger.kernel.org
X-Gm-Message-State: AOJu0YxrwIP75oAMHposUrVdjCZ3oQHEgp8KE5D2x70hp2xjzdJptLLv
	oynWLcgHRe+Xfy5Ic/XVXvDS54vMl9ooeWUOIVul8EVQ55M2YKYMFfvy2UuFwCTdvbkukZnKFzv
	+J0VW5nquFthVVRAazPnastSRtMojh6khZz24BTB87eK1KpK39ohcXhCygJiS8n0pyu2z2Fds
X-Gm-Gg: ATEYQzw6N+WR5s+PmIrDXm4K1QWmp9G42OKDD61/Z4PtZc7D1cjYlCR4pW4QJwXKW+p
	VDil1dMsYEo7oM009Jw9BUEeOVYiOinHiT1wIQGp16QOyDF8/JgNcVZSMsFQeKA4vfSpW93BUK7
	osXvwy7Msc8wS/VB++4CuCIVwL4i9lg2Vzq/T+eOs1x7bVfNie3CLLksGu7CHs54647BGEzFJ+l
	eTl9pVEb4teSWZKJv907NU9vWiiZq8ztbeJ+bxnWvqT/LGeiWTRmZwC8oZkb9iJGGTq6802aHdi
	pnb/hi3Jhk9aCpwfq9NWgCVPujXo9G9plh6/YcgFmXYc70phOYmy1//x42VCHCKN5n0HZCg3hqq
	Q55MnMT0UT84ydliTr58hL0Q/S+kTpHMmeKLHKUyKqHS6JCif+zB8aQrZGkkdacTR5HcsYlAE5l
	qC3OLjumNxKIBRHDPWOrzxOjhpdy4lkfdRc3+q
X-Received: by 2002:a05:6a21:9d8e:b0:398:4b6c:5121 with SMTP id adf61e73a8af0-398590c6fd4mr12098021637.60.1773113800485;
        Mon, 09 Mar 2026 20:36:40 -0700 (PDT)
X-Received: by 2002:a05:6a21:9d8e:b0:398:4b6c:5121 with SMTP id adf61e73a8af0-398590c6fd4mr12098001637.60.1773113800088;
        Mon, 09 Mar 2026 20:36:40 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c739e182d72sm10272923a12.25.2026.03.09.20.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 20:36:39 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        mani@kernel.org
Subject: [PATCH V4 2/5] dt-bindings: remoteproc: qcom,sm8550-pas: Add Glymur CDSP
Date: Tue, 10 Mar 2026 09:06:14 +0530
Message-Id: <20260310033617.3108675-3-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260310033617.3108675-1-sibi.sankar@oss.qualcomm.com>
References: <20260310033617.3108675-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Rcmdyltv c=1 sm=1 tr=0 ts=69af91c9 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=iOP-JMljhTESenzhlaoA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDAyNSBTYWx0ZWRfX9lNxmzx5Pr/T
 ccq2WqK8GrrsO74MeHZmynz+aAn8aDlJKEFARLpBB5KtsRBoOeUX7DhGmu3ts7z0sr68r1Z8fY2
 ICe7B1cr76RQME7V1RaWrPxXCmftFpc2+zYFlF0awfTKw70WEcOxji42VoApNqU5EJbcrDU6j+q
 DMbOStCRCS0w2Pr1s+g62TMMoZTiGbstZyDoK9pcdMmWl2KAh6z+0Uj6B8eN4GUUEq8YIO+WoFe
 NDNqZlR/BL0qFJn2A6lB4Z8faiBvm/pNA4z5I8lhCbWaGtzWVaBG/NL4cLz5AIzsKrdR8oHpP16
 mhsDun2V5pnMfLRX/x1GehdZPTu72LFXC/0ZXY+xzQvLth/0dJcw+nRdjDG3RlkMGFAcfbZRfJM
 XNlkNR1Z7cadWE1HTQNITIQKY/UfrVwF6Wpugqsx3Pk8n5TCCskFJP2dyGsOGCC6JMdJmAlB3I0
 S+i5HovkpE630DZQhIg==
X-Proofpoint-GUID: cajZnZLCzf1KG1ZjQRUmLabCO3Wpch_u
X-Proofpoint-ORIG-GUID: cajZnZLCzf1KG1ZjQRUmLabCO3Wpch_u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100025

Document compatible for Qualcomm Glymur CDSP PAS which is fully
compatible with Qualcomm Kaanapali CDSP PAS.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index fb6e0b4f54e8..6a29d239ef41 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -35,6 +35,7 @@ properties:
           - const: qcom,sm8550-adsp-pas
       - items:
           - enum:
+              - qcom,glymur-cdsp-pas
               - qcom,kaanapali-cdsp-pas
           - const: qcom,sm8550-cdsp-pas
       - items:
@@ -103,6 +104,7 @@ allOf:
           contains:
             enum:
               - qcom,glymur-adsp-pas
+              - qcom,glymur-cdsp-pas
               - qcom,kaanapali-adsp-pas
               - qcom,kaanapali-cdsp-pas
               - qcom,sm8750-adsp-pas
-- 
2.34.1

