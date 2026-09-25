Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AAA84D9549
	for <linux-remoteproc@vger.kernel.org>; Fri, 25 Sep 2026 15:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790351946; cv=none; b=CqtkAC7jcAvyTp19Fdnc21UuIkZQs6EKIgsjsUWt9OlwKrdnnfS5pcfe2VB8GSglRl3ktPKsejq5rCH2nqsnrq9z2zfOf0ZgJN8dRiKzuOFn73fnEnYvxJb2lkeYisczcgMZkqg00mpBlH21lVTxYZkn5cPWbja20+C7JgjebjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790351946; c=relaxed/simple;
	bh=QaVcCt7Cl7nU6VeWY+Vur4I+1RuVSN+tC3sOeWr2eqA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G3SrI1kzrh/N8K8Axr5ALjLzdv8pfmqosc4d/xouEb00XamEgDAu6PEAkLoacgcJd1Fq1cqeKjYq4SnxiDHg1yD5e8Y2WLqyL29FkacZZUA8tzvyBZrOEwceJgeM3kLiGJ0h74dbUCKoXXn/ih04jQ5VzX54lFyFA0flK6eGkTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Je5YtJ+Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DMxhH4OD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Je5YtJ+Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DMxhH4OD"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PBLc8b900186
	for <linux-remoteproc@vger.kernel.org>; Fri, 25 Sep 2026 15:59:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=p+LQPvJJTeU
	1GNlByxbclHTDDGT157UOusSi7k44uBE=; b=Je5YtJ+ZLvxiFAY66mMnDfFDIQN
	R9qeiE+x6COa9tg25fml5sOLY1QiFg24hhrXIruKfUNtaKbitUT6no5g0XOTJOcB
	EFcm6/LaLj3XVn595RsvDa/Afmkmw68JlIvx53aBg9smhjQ92PhP5ZTV6tDmqr99
	21njqzbQ9k/Lpvo5QnrpunBoc4FaTYMtv0zGxTJl/RiTfBOjIsMnWiACLxLUeF8L
	wbVas0Rf/I5utcdI3brpB6B+TY5M/+QWQJCNYcAjE3hu/A+sNeN/qyXRM36f8aVe
	LKgfdh8K5Ks0+olNeJw6im3zs54wUQhAvbbMJ93Gght8pmCmfSMFmLMgNHA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwr100x9g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 25 Sep 2026 15:59:03 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8716b158692so467310b3a.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 25 Sep 2026 08:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790351942; x=1790956742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p+LQPvJJTeU1GNlByxbclHTDDGT157UOusSi7k44uBE=;
        b=DMxhH4ODAamwNSj02yc5WXAbLjAJPecZ0rmiDaTFbWuv0d318s04F8/Yn8gRWjbuiR
         FAAlhF6zixn6QNpLbcJKfKa/0oizzipvELjrvotWJr8YdzOpXL0InzbLgyn7uFwm1tQG
         Ogl7Kt9po5cqDesywuqtURm3PqwVkaBAsi1/1PVmeDCDhNhnR+loaAFxzB+BMJCoV7gT
         dSQ1bDSwl6rJ3G6lJ4OOGs7zML3/w8mmRu7V6zENRYcnPzbuTNxmvHk7tr/B2ZS+9ZM5
         +QPaFJZs2jxQefPM/sMgaKfOBfT7xc6T91++4Dgb4zUE1NAitU784HIE2wcB6PZGgjAD
         Fm4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790351942; x=1790956742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p+LQPvJJTeU1GNlByxbclHTDDGT157UOusSi7k44uBE=;
        b=nfR/yV+Gceh4MTO4ljFf7WLdSlNafiLKfX7kpbPCMEeDBSqvS3LrW2EuBIuXBJjuaS
         rs8w1oBvx46KvV1eIld0Q/D9C+okBPyjQxKeu+ccV5jN5L7c384iocNcAc9mZTgryKE2
         jUcJBXJV5DFAQ7Yj+keCd8qmhZuHpCGAAtaOhkHeXAnQ/2Wczeo3550xuMJkb2VhIdfz
         GvSKvBQvq/GxWSF0EtliSSCjXKzyNu5bP9OvSCADKpQVYv+A/ExncMpOn3ueczFhLuDU
         cw8Rn8p1nWHkTX3/qgM9NIUyeeB4A1kJeBRo1L1oiT9PRO5ozb3+WL7Z0h8XrA4Ahxs0
         kmWQ==
X-Forwarded-Encrypted: i=1; AKwUvBymVRYAc6/55RxdWDQfUEWbhhz7QR273zmYH6LJHUQEC30PQhGrXanulPcbF/UnVfUrwd/muDuw/7D72MbJe4Bw@vger.kernel.org
X-Gm-Message-State: AFuF++n6GQeoyn6vpz36OfRlLJffIIn2D9XTBR8YTq8g5Q/HvSqg/OoL
	h5kXg5Jz+TX4BTsyPWIzk+UBkpy96cuPuZX6xHqcyRqTg5m0en4VV0EEqJUnR0DOcNUCv+bgX3c
	2FDYKGonkmX1vql0yQXGdwEu8Ks+ulOV+UihuSFIsAGLBN0eK3vEkbh/bDnVWQ5UnT/Y++45n
X-Gm-Gg: AYBFou0Omp/YT8C4P1ftiqGKczmT4y3fO2Lu1SJ4GiPbFDrZdny+3UBfHOT9si2WgUb
	xJtdQgOPTAmUrtegRt93eWaCzs7x+ayhx5j3EOM/hk7VJRJlt52rFpK3PiC8ICfcQ38jVDb6ksA
	lkqs8HUTSJkP41mXsSNRQTiTTuwZ4RvQhJAh/oR1ZNBWEbI4S5GQ/dgwwQIYlyTgRDaFtue9lFJ
	3a6HiTA2sg9XXSMjRbSyckPAxB/Sw7JXOWOpqvaakGCgOz/lNru/lPwwS8GS7AJI9MJTdkRVHl/
	h+ZVLOIcgQ2QvayzinT1zOYnD7UMAwBDiBvw66XC61BVWu2GGUaF36Aflrw+oCYFvswI0xDkbU6
	KkyWMNaOmmPx/ubLJ1qSPCvgvfSM=
X-Received: by 2002:a05:6a00:2a0f:b0:874:705d:f640 with SMTP id d2e1a72fcca58-87e9b89660dmr4973919b3a.34.1790351942092;
        Fri, 25 Sep 2026 08:59:02 -0700 (PDT)
X-Received: by 2002:a05:6a00:2a0f:b0:874:705d:f640 with SMTP id d2e1a72fcca58-87e9b89660dmr4973873b3a.34.1790351941480;
        Fri, 25 Sep 2026 08:59:01 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87ff354d854sm1361299b3a.2.2026.09.25.08.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:59:00 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 6/8] wifi: ath12k: migrate firmware loading to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Date: Fri, 25 Sep 2026 21:27:35 +0530
Message-ID: <20260925155737.4161358-7-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com>
References: <20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfX7f3eZXYtMg5V
 fy+U85oknUamuwE2sp6y1Kj1RU9SForB4sFj4y6Whz1T74axVxm1tp7F6Nlw0X3ystFK2u/frLz
 6KVM3tYkE+n95rU+lZCIEKsm8C1hGeTVUIy1IpCrhImQCrmY8ET1N9KV2dGn/TQopOXtbogSxWA
 veHEhg4VHUv0HYTroCojoKTW9bd3PEdsfs+0i/cAIoT92Wx34ZjBS7+oT/0cSxzsefidZYP1bfM
 LfVcB3MYK4vxDg3ghQxja4jPtcWjE1ZSHJmsqZxBu3KkwrucVAiJvxN10w9G/GjA6ikM6xEwl6D
 YcGiP6BC+GtFqJcl4GKgXwhm7QPANX0ObrMZvgolrfSkFtfOH1Ehr67SUqPGCyRYEOYP77sDHeF
 MhLooiMqWNvhzhotG+1xTWm8BzeYtgzlFS+6ftJ5aCrT8jhead15ZkT0F6vtuMn6utzUXrfgJBC
 nDGW5mmb/dxCBfo5bdg==
X-Authority-Analysis: v=2.4 cv=ZfKIpcVA c=1 sm=1 tr=0 ts=6ab69a47 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=MUQpB1KlM5cd8qnWRq8A:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: lRsj2nP_o_9dCO-G0_AIfiIM77oF8zgG
X-Proofpoint-GUID: lRsj2nP_o_9dCO-G0_AIfiIM77oF8zgG
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfX9XJp+ACWwkHh
 0gzMtvlOh0KEQCDTp2TcXgFccAUInoH8B8ICkNOW/D24yH75TiYuc9jFpfJ+rYSs/2p68GU44r9
 xnT7bfBie/PFTNs6n1vH0SYEAwHkPdo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250063

ath12k_ahb_power_up() and ath12k_ahb_load_auth_shared_fw() call
qcom_mdt_load() for SCM-authenticated paths and then
qcom_pas_auth_and_reset() which skips the shmbridge prepare step
required before TrustZone authentication.

Replace `qcom_mdt_load()` with `devm_qcom_pas_context_alloc()` and
`qcom_mdt_pas_load()` in both call sites. In `ath12k_ahb_power_up()` the
PAS context was allocated inside the first `scm_auth_enabled` block; hoist
it to function scope so it remains visible at the authentication step in
the second `scm_auth_enabled` block, then replace
`qcom_pas_auth_and_reset()` with `qcom_pas_prepare_and_auth_reset()`.

The non-SCM-authenticated fw2 path and no-auth path retain their existing
qcom_mdt_load_no_init() calls with the persistent mem_region mapping.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/ahb.c | 31 +++++++++++++++++++--------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
index 85360365aa4b..6f0ad29a83f8 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/ahb.c
@@ -391,6 +391,7 @@ static int ath12k_ahb_power_up(struct ath12k_base *ab)
 	struct ath12k_ahb_rproc_info *rproc_info = ab_ahb->rproc_info;
 	char fw_name[ATH12K_USERPD_FW_NAME_LEN];
 	char fw2_name[ATH12K_USERPD_FW_NAME_LEN];
+	struct qcom_pas_context *ctx = NULL;
 	struct device *dev = ab->dev;
 	const struct firmware *fw, *fw2;
 	unsigned long time_left;
@@ -424,14 +425,20 @@ static int ath12k_ahb_power_up(struct ath12k_base *ab)
 		ATH12K_AHB_UPD_SWID;
 
 	/* Load FW image to a reserved memory location */
-	if (ab_ahb->scm_auth_enabled)
-		ret = qcom_mdt_load(dev, fw, fw_name, pasid, rproc_info->mem_region,
-				    rproc_info->mem_phys, rproc_info->mem_size,
-				    NULL);
-	else
+	if (ab_ahb->scm_auth_enabled) {
+		ctx = devm_qcom_pas_context_alloc(dev, pasid,
+						  rproc_info->mem_phys,
+						  rproc_info->mem_size);
+		if (IS_ERR(ctx)) {
+			ret = PTR_ERR(ctx);
+			goto err_fw;
+		}
+		ret = qcom_mdt_pas_load(ctx, fw, fw_name, NULL);
+	} else {
 		ret = qcom_mdt_load_no_init(dev, fw, fw_name, rproc_info->mem_region,
 					    rproc_info->mem_phys, rproc_info->mem_size,
 					    NULL);
+	}
 	if (ret) {
 		ath12k_err(ab, "Failed to load MDT segments: %d\n", ret);
 		goto err_fw;
@@ -465,7 +472,7 @@ static int ath12k_ahb_power_up(struct ath12k_base *ab)
 
 	if (ab_ahb->scm_auth_enabled) {
 		/* Authenticate FW image using peripheral ID */
-		ret = qcom_pas_auth_and_reset(pasid);
+		ret = qcom_pas_prepare_and_auth_reset(ctx);
 		if (ret) {
 			ath12k_err(ab, "failed to boot the remote processor %d\n", ret);
 			goto err_fw2;
@@ -994,6 +1001,7 @@ static int ath12k_ahb_load_auth_shared_fw(struct ath12k_base *ab,
 					  struct ath12k_ahb_rproc_info *rproc_info,
 					  const char *fw_name, u32 pasid)
 {
+	struct qcom_pas_context *ctx;
 	int ret;
 
 	const struct firmware *fw __free(firmware) = NULL;
@@ -1012,14 +1020,19 @@ static int ath12k_ahb_load_auth_shared_fw(struct ath12k_base *ab,
 	ath12k_dbg(ab, ATH12K_DBG_AHB, "loading firmware %s, size %zd\n", fw_name,
 		   fw->size);
 
-	ret = qcom_mdt_load(ab->dev, fw, fw_name, pasid, rproc_info->mem_region,
-			    rproc_info->mem_phys, rproc_info->mem_size, NULL);
+	ctx = devm_qcom_pas_context_alloc(ab->dev, pasid,
+					  rproc_info->mem_phys,
+					  rproc_info->mem_size);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
+
+	ret = qcom_mdt_pas_load(ctx, fw, fw_name, NULL);
 	if (ret) {
 		ath12k_err(ab, "failed to load RO firmware %s: %d\n", fw_name, ret);
 		return ret;
 	}
 
-	ret = qcom_pas_auth_and_reset(pasid);
+	ret = qcom_pas_prepare_and_auth_reset(ctx);
 	if (ret)
 		ath12k_err(ab, "failed to authenticate and boot shared firmware: %d\n",
 			   ret);
-- 
2.55.0

