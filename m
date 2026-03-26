Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE62E35B658
	for <linux-remoteproc@vger.kernel.org>; Thu, 26 Mar 2026 04:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774499617; cv=none; b=NzpJbwr4223MyjNiZc9ALnGLL15UIhmKrZzfjDTsvPWxJCMl6iotjjVQ6bVq6C7cNz4O/jseLujz0sFk3YgqiO/cDM1+1hrPSy9h/+gUH17gRaKGsBkA5oUC3VnzPmgH2azBGGFaBr6O0xdOr61xXJb4gjmKs0UN9h21zn7bVjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774499617; c=relaxed/simple;
	bh=aBT1PdwjdNx1+M+MvBs+mg6b92K0E6DC77yGQdHQuAs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Csu3DnHE7ed4s9a7srccEHtHa4drYKFOlT3L9qg9lF8K0GdHpDzom46q0yG2PjP9V5GIvK62wlc2oEzRny5FHTdupdmUCVHpcoQgM7rwF8/H1EKuFX7fdvs3fMT1/LeJ9r/grZSW7SE6iR6DOQMbBYOnyXUFuVyircl3iw+wTgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QhpKn4II; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DNwUldgF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QhpKn4II";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DNwUldgF"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q0PMlv1432140
	for <linux-remoteproc@vger.kernel.org>; Thu, 26 Mar 2026 04:33:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=V7GsGH689fM
	rj+lpWrTL+ysDdRauI7b9YYAiBDzdW4o=; b=QhpKn4IIo+pEgTl166rBFCFMO2X
	DNEyWgOiMbYdaQIHXuiKYAk2Y+5h+/QvuYuoTtpG2CeA2ljKM3RXBJnHnDo4iPZ+
	aAwPUYv8gobQj5lW8ouQpzHNsRohtzZVEo0ylEq9Z03SgGZG7Ij5ndky8tVMz5x4
	j1JdEIFGblse4wuMEPXQQk/WQnmgb5L90AB7rAtIBQWnwRbJYabwNyRkVLN0SOlV
	wk2kKERIbqpryxOn6m5L9CT0QP0uIzun0UrKpYZKcAUyid7Iabe37RI//VdpSgY5
	xwXifsqTWtOWXLZ9OpBqthqmqwOY/fx3AirlzCZsfX0UCegTdJBYqtfJFow==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4jc52bfc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 26 Mar 2026 04:33:34 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35b991171deso507893a91.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 25 Mar 2026 21:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774499613; x=1775104413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V7GsGH689fMrj+lpWrTL+ysDdRauI7b9YYAiBDzdW4o=;
        b=DNwUldgFDpcFSA8iWYDb1CfqqA98MsaWySK0B+V1zTGXnj1lf4HNvdLM20b94k8vPd
         anTkV2RXLT30ANir6MBTxkohilwhdmSYSkH7240pYkc0gDd52qwlbzNyHITd37dsd7Jq
         cprg5YUfrV5zjuIxCDxOTBGxsfc0zQxSWU2K1RVQH9P1HfugLhL/Yw7hpf399fKoLKNT
         r9YjMOZ63FxSPGam50WIbcTYEBSo7ajzEAb+IbrzPQLy0pXMdDRTDgoAsYO+bE3fqJ27
         uXyavWOXRGN0HikEtlYjyORjMEC3R+kd26FNeyiXe8AI1tBCbE1+bLXx2PVXmNr+3X1h
         nWwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774499613; x=1775104413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V7GsGH689fMrj+lpWrTL+ysDdRauI7b9YYAiBDzdW4o=;
        b=PHPchvPQVQoWXIjAJo6aTc4pQ0PU6vflriuurcum2APgpAw5gip0Mvuc78HZHjM5r9
         bB7Lmpf1Cy+sNpMESahacOXSAZbRt9cfRh2ZAVzxt/xK0re9i548RcBsewfFEH8Yqi40
         43lxP7rc5BKoe4I91cgIc9S25TS3cRw/ThJ6y/lR1FjMxx9Ki302dma+usNFK5gqUSRf
         YmsFqcikqxTZDwC1sJTuMB+K2tUjb201hswBOLRQSxf9mLTi5qlY2np7md0cUTFH8WmX
         I3KXS8/6gA8oq9HrqThb15EpPYVez2nqPR7t7V7FPMv6rT5OjVrP9Q8UUFfwuZ033mf4
         DdeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIMrwbvSISXE+CaIEXDpBoDs5mk6CoRatmwc1SdagFzeCGL8xE4AiTd1DXkdhhD/J0WbBwsVe4pA9qExC4M9Kn@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1fGXCABVFR7dzCh96BM9g5IQP5Yp5J/eONGEiMqMwAQ0hkUpC
	V2tQ24iAHoYk5esNUUs3LPwcxJMbMFeqx6WQDo4auEcXsaVlQUYkW+T7W2O/8sqJjZB8oXGJ7oU
	dNPRnBMSCSDKliY7ht8TTVBNVfgiSnwTDocdfFQJ3E50Wo1tgmWQVX9qwdy8qBWIq8eab66U7
X-Gm-Gg: ATEYQzz8ukFaOcsVClnUBMNdvXVfahwM+DOtTHkChtpza+Fqxr29EANfiQJ1Q3ZArGT
	fGzhJKG1vk5hAEZt24jwSdmgVLBo5glA5cfiL02VIZEiqscjvQo3pxVOU1SdGl8IzuIl08xDXOz
	B6JMzcGsfgtsRpTK/cEyPKKlzNrLthzePA0a18xGa4mbuw4fTD04bFys0dKfLHZyHnhjZfudiBm
	tUkjsqyHGGwH6HuqQjy/IQ8XwKqBLVKoBDn2UWR87/zXZktd0mfcB1qJfpVUZmPHos/6MY5VQVc
	cHzQNdL+oi+0mtos21iZHQm3F9SNibbQBZ+s6ZI0W2TiLSmK3xVPq10VZjQCypvS1r1htVz3PyX
	tPW58EWzej0CbcHQkAs1U4hBXL0jdCVIStEeKTVb3It+E1ddNjPpfTfYH8haRJJLxcRad9YzoxI
	bbFQGZd5BBanZjwu7qfWSSOM7iO2rAY8+muY3S2dUgJ2SIN5kkoPk=
X-Received: by 2002:a17:903:1666:b0:2b0:5682:6973 with SMTP id d9443c01a7336-2b0b09e732cmr65230385ad.19.1774499613507;
        Wed, 25 Mar 2026 21:33:33 -0700 (PDT)
X-Received: by 2002:a17:903:1666:b0:2b0:5682:6973 with SMTP id d9443c01a7336-2b0b09e732cmr65230105ad.19.1774499613019;
        Wed, 25 Mar 2026 21:33:33 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc7b233fsm15163715ad.32.2026.03.25.21.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 21:33:32 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v11 1/6] firmware: qcom_scm: ipq5332: add support to pass metadata size
Date: Thu, 26 Mar 2026 10:03:15 +0530
Message-Id: <20260326043320.2507890-2-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260326043320.2507890-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20260326043320.2507890-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: iJ7tfbxnIHAZH3odEsJEvafhhPTxN9d1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDAzMiBTYWx0ZWRfX65xyxYjMVgDh
 eKzUzaZt7j+GNm5XMpQ/60dm+TFcP4vzG/vYnFNlYlWdLPEQf2sSi3z1OG501raPERHhknJIj6y
 Rho33f8YwNB2rlYFolxwcjVD18hpX/r/Jrn0pnX2RIyG06j+RXCo6zer3yKae6wXTwvAdzDSqht
 IlxFkwcHV8EicxFlcqKl9u9im8Nz37dHYMi8EktqzxBRHkwvyN96d/iogP0fd0NThLw0PFhG63E
 2hUiWgNs6OT8s25fBf3wzqnECs6QjSGX48YcKgZ2i1EDDVVfIEXOy5zskS+UugD/0FxYKtggJaX
 wLU7ftzAKsbFhwSVLXaVyBZ9ptC7Jgxhn162ROqZDG70quAuiNiA4JMxZ9MI4K+TEp/wIswQiG/
 q4nhRTnRFvrO3Rzp7jqz+01L7vR3FXrnyoWGjYavuTEmPN731Xj6V4KYAmB6D68dFejvIx+gt2r
 wcjC+ortp/5uxVGhVtw==
X-Proofpoint-ORIG-GUID: iJ7tfbxnIHAZH3odEsJEvafhhPTxN9d1
X-Authority-Analysis: v=2.4 cv=KaLfcAYD c=1 sm=1 tr=0 ts=69c4b71e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=Hho1wTqgLjreKoR7ChkA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 clxscore=1011 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603260032

From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>

IPQ5332 security software running under trustzone requires metadata size.
With new command support added in TrustZone that includes a size parameter,
pass metadata size as well.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
v11: Rebase to top of tree
v10: Added r-b Dmitry tag
v9: Added signed-off-by tag
---
 drivers/firmware/qcom/qcom_scm.c | 14 +++++++++++---
 drivers/firmware/qcom/qcom_scm.h |  1 +
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index d1082695ec38..9770c0b75b57 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -605,7 +605,7 @@ struct qcom_scm_pas_context *devm_qcom_scm_pas_context_alloc(struct device *dev,
 EXPORT_SYMBOL_GPL(devm_qcom_scm_pas_context_alloc);
 
 static int __qcom_scm_pas_init_image(u32 pas_id, dma_addr_t mdata_phys,
-				     struct qcom_scm_res *res)
+				     struct qcom_scm_res *res, size_t size)
 {
 	struct qcom_scm_desc desc = {
 		.svc = QCOM_SCM_SVC_PIL,
@@ -626,6 +626,14 @@ static int __qcom_scm_pas_init_image(u32 pas_id, dma_addr_t mdata_phys,
 
 	desc.args[1] = mdata_phys;
 
+	if (__qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_PIL,
+					 QCOM_SCM_PIL_PAS_INIT_IMAGE_V2)) {
+		desc.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE_V2;
+		desc.arginfo = QCOM_SCM_ARGS(3, QCOM_SCM_VAL, QCOM_SCM_RW,
+					     QCOM_SCM_VAL);
+		desc.args[2] = size;
+	}
+
 	ret = qcom_scm_call(__scm->dev, &desc, res);
 	qcom_scm_bw_disable();
 
@@ -650,7 +658,7 @@ static int qcom_scm_pas_prep_and_init_image(struct qcom_scm_pas_context *ctx,
 	memcpy(mdata_buf, metadata, size);
 	mdata_phys = qcom_tzmem_to_phys(mdata_buf);
 
-	ret = __qcom_scm_pas_init_image(ctx->pas_id, mdata_phys, &res);
+	ret = __qcom_scm_pas_init_image(ctx->pas_id, mdata_phys, &res, size);
 	if (ret < 0)
 		qcom_tzmem_free(mdata_buf);
 	else
@@ -706,7 +714,7 @@ int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
 
 	memcpy(mdata_buf, metadata, size);
 
-	ret = __qcom_scm_pas_init_image(pas_id, mdata_phys, &res);
+	ret = __qcom_scm_pas_init_image(pas_id, mdata_phys, &res, size);
 	if (ret < 0 || !ctx) {
 		dma_free_coherent(__scm->dev, size, mdata_buf, mdata_phys);
 	} else if (ctx) {
diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
index caab80a73e17..cb80e22a3d90 100644
--- a/drivers/firmware/qcom/qcom_scm.h
+++ b/drivers/firmware/qcom/qcom_scm.h
@@ -105,6 +105,7 @@ int qcom_scm_shm_bridge_enable(struct device *scm_dev);
 #define QCOM_SCM_PIL_PAS_SHUTDOWN	0x06
 #define QCOM_SCM_PIL_PAS_IS_SUPPORTED	0x07
 #define QCOM_SCM_PIL_PAS_MSS_RESET	0x0a
+#define QCOM_SCM_PIL_PAS_INIT_IMAGE_V2	0x1a
 #define QCOM_SCM_PIL_PAS_GET_RSCTABLE	0x21
 
 #define QCOM_SCM_SVC_IO			0x05
-- 
2.34.1

