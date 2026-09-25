Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33DE4E8E02
	for <linux-remoteproc@vger.kernel.org>; Fri, 25 Sep 2026 15:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790351972; cv=none; b=PtgEbwI8E60OcvAY2Kk4D1SXrvScffmpr0v9koXi5FoevDl7ZxPQ+7JIAF1klKu322lbPzgBm2gWGRip+TB//n9OYe4TTPrhp8cYS0TIRirCBrL41lsggk8bqDkDW1SpLW4xO/qxQBv+q9upcGO2cSJzc51mz/hHYSKCYkUggOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790351972; c=relaxed/simple;
	bh=zDuJCdpny4nvDijWnjUood5Ogh4JDdDd4/+inxDkgqY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bDQbsNox/vMM7BJr0N75MbMceoqg3kZ2st7gNA22W5BPrbocCqI3X2CEbBGR/UEiJaBryG2qKhfwLEPb+GEMnYKz8cp/2uP5gbJg5984YkhdZqXrcBF828C451+QiIZwBC4BRBSQAywjb3CFxoCU9r56+NlrYLrYSa30oJAu4vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QI86Rg99; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZBACQaXf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QI86Rg99";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZBACQaXf"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PD8ST5289545
	for <linux-remoteproc@vger.kernel.org>; Fri, 25 Sep 2026 15:59:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9+1rwJEQXq1
	lO/cD3GiWTUUYzCO5JaKWtBAY2RhYZaI=; b=QI86Rg99O/cQBiooeAMdGH6d2qr
	/2ApE7DEiMzD3YrXNmwz+AFIQiuSiyeU538+94tBUEGoj2itMo2gej/TfPXlqIaF
	zZ72GNYlwbjhiqHnwtDgSSGltE9iecu43LiWKRH0DKQEAzXnXEZewprdY2FRNWfm
	3wweR+e6s0j74nJNxeHevQQbBp3T3hxokyJL8PRt6yueJf2AFuxy/RkmsnSgBBNn
	TXc9twwC6JYh28lCZk+wcQNgeeVN+eTQiS0oTdNHyZe+4VJlNRsnfvPoTUwC1OCN
	6/DfLq+X7JrgAdJpeU7WAmXzD0xZrYB28w+K3rYTyvBwyJiFwLIJro0IqDg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw881vb2d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 25 Sep 2026 15:59:29 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8663802b58fso803469b3a.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 25 Sep 2026 08:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790351968; x=1790956768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9+1rwJEQXq1lO/cD3GiWTUUYzCO5JaKWtBAY2RhYZaI=;
        b=ZBACQaXfXwuZSie5Xf/cymAsazzmoch9lZLODMcttal12kHi+8oMpxAd0mCb7T+juk
         DBBo7lYqORVlwGl99zJCXMQlQ629PhRWBYxKC3ellxMpkcxruEfQGCitTVq28xd8nsyZ
         krE54l3hbfuou38bQUSRXzQ7iFaAlVT4pxPp0iRwAnGWbRcY4lbtAHgZXh2/E1kn+Kx6
         UTg6P+iPoA2nkaX1H54Ogxnomd6nfuUyIIdv6P5HNcwKPGfm0sUYLDL/MoTkvUjiQ2Ru
         zI9p03kqNDb6hcVSewXWH78MCFQ427Ljg+NlmMwTZqeqypfdGgawjIklfBWTU8Uu7Hzs
         UAnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790351968; x=1790956768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9+1rwJEQXq1lO/cD3GiWTUUYzCO5JaKWtBAY2RhYZaI=;
        b=j8pg06TPcSdivRv0PQZu9QlbFX6q+6nEuDrPkdWofz5Cki6UZ/3bWB+XzS8XogmsHc
         FlHuq+RLPwGowXJsiCNqJBqQUTl55OahDiGudXeftKSMZEuODf+glGMzYVVeFvTEJXyY
         pqpgbNcb45s+Q0RM47ZRULkjhLGCZNRfiXhCrsScPnojFAsBtDDGjodGP7pLBo9KaSBF
         vHLth4WuD51SXepNtlAGLqkzg/MORUmR3gb5NIFD08U2o3+gcDnl+YUR06Lpy9VjMERV
         XnMSdYvGKHeA+lMigQjPbFpWcnkIpeDn15GnhHncBKE1KTKOTSI6EiQAzt6K1Dopu3Aj
         OQYQ==
X-Forwarded-Encrypted: i=1; AKwUvBzL3hm94ri8JZk+OETt4cdTpt7Ntsb24Mc8s2DuHl4zSlF6C+yDb1dr4DaTGx9rIKTvTBtAJM7H1mC+MsJnkI33@vger.kernel.org
X-Gm-Message-State: AFuF++m9z7rygyXRlN1bvmsMdFrh3gRUow55SGoat7GkeBhfwwKuqQmw
	6NASG/Ae/uYydEsM2N+XHUQ2Z0HE6kNFgFMjmGNL6ZF6b8UrYOHSrHizBwlZP10J0nx9F4AFaiU
	hq2eDCDn6HxqCUfbt4W/n12FVUZjnYXcYUENx4L+Y5F3LrcYbZ9hUoYl+Cen17U2ivyGXTvXr
X-Gm-Gg: AYBFou3Bzxp0oNpXzCwf8IsUKzLPL/s4db5v7C9uPoI01cbbc4g/yJC/p6LEM0+HxNl
	AHZMWBDRy97twPRpxcHilakKsIAevw0SyZmWCrgVdpZIbUmfooGfxvd1WsFrbVJpFk8Fp4f0wy7
	B7oMYdWmvMky8wFEVHu3KVrg5q2y4V8GCFc6rg5BYVrxV1EcFgTaSV9gfJHuME4iGSRCfaVJNe6
	tyE6gG6tmWJto5gmr0f+AyqKOv5bR87/KfdTQxuEjsEXCvIQdinEwEbEzkAh9AUMOOUXibO8R69
	3lnqkiDp7p8smRO9cR+ezE7Ti1/yKzvVnJpkfLANxJ+K496zdD9BwffIQy/1cSOP3RDmddsoUb2
	4BFWrfPot6qMhGTuihk1YGfG0xOU=
X-Received: by 2002:a05:6a00:6f12:b0:880:a842:bb06 with SMTP id d2e1a72fcca58-880a842c13cmr906019b3a.45.1790351968035;
        Fri, 25 Sep 2026 08:59:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:6f12:b0:880:a842:bb06 with SMTP id d2e1a72fcca58-880a842c13cmr905860b3a.45.1790351962748;
        Fri, 25 Sep 2026 08:59:22 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87ff354d854sm1361299b3a.2.2026.09.25.08.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:59:21 -0700 (PDT)
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
Subject: [PATCH 8/8] firmware: qcom: pas: remove qcom_pas_auth_and_reset()
Date: Fri, 25 Sep 2026 21:27:37 +0530
Message-ID: <20260925155737.4161358-9-mukesh.ojha@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=TptzFzXh c=1 sm=1 tr=0 ts=6ab69a61 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=sV0Ut8U-cAKt8JUqj3YA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfX9UcxTzOT1lA4
 tsHRE5pkKjZvsQF8jS8Ljf0joeI2efS+BxWe9+C/bDBLV7HN7RHOJnfd5ur3PQsGsecah63bQG1
 ZvgAlLwvgbYQLNS5YiOqu7WLqALw4j290f5xyi28GVWKEWst585MWjiC7G3BFgcRz8RFy7lQFxg
 +oLB9Y1K71hk9ibnw6JTB1J28Z1CJ/UmJk+ZMeK63iW15cqRf7UwyTHgoVR+5zd1FL9O4lZQDiU
 I8jHlcb6tJicGyHs/aF3hI7g25UOSMkDZKHduaSe1N9HnHNGd6G09wziQK8KllQElCjQzxKsbLn
 JsRhg19dApHlXK2VWzhKYRTvfyYqgrpZwsEUk/FBL6y+iymAEgFNQ/XkZwiE/l4JY6G+b4M/F4L
 ue2x/W8BfGRhkFzyJsw7s5fhkRSODkmBf42H36LTGgocFEbrvTW6d8JhJeJHCi4fog4xJrG2sbn
 H+sx4+u0+xY3xUpFK0A==
X-Proofpoint-ORIG-GUID: 1XJ7smkhpi0iUuzWUk39zMzl5XF12A9e
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfXx6GdtNc5N78D
 MQx53zLk2m9v8xTQ8KR0xqpd8dfKquZpDXfbBhuE3SZ/QBtcI1A2ikMknuAUD6xBjd0Dd+rQEK1
 6lsXP80G27t2THbExStPQrMsad9xr6w=
X-Proofpoint-GUID: 1XJ7smkhpi0iUuzWUk39zMzl5XF12A9e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250063

All callers have been migrated to qcom_pas_prepare_and_auth_reset(),
which additionally sets up a shmbridge over firmware memory before
TrustZone authentication.  Remove the bare pas_id-only wrapper, its
EXPORT_SYMBOL_GPL, the header declaration, the auth_and_reset ops slot
from struct qcom_pas_ops and both backend implementations.

The internal helper functions (__qcom_scm_pas_auth_and_reset,
__qcom_pas_tee_auth_and_reset) remain as they are called directly by
their respective prepare_and_auth_reset implementations.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_pas.c       | 16 ----------------
 drivers/firmware/qcom/qcom_pas.h       |  3 ---
 drivers/firmware/qcom/qcom_pas_tee.c   |  6 ------
 drivers/firmware/qcom/qcom_scm.c       |  7 +++----
 include/linux/firmware/qcom/qcom_pas.h |  1 -
 5 files changed, 3 insertions(+), 30 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_pas.c b/drivers/firmware/qcom/qcom_pas.c
index 93d78a5c1201..6de6d62adfde 100644
--- a/drivers/firmware/qcom/qcom_pas.c
+++ b/drivers/firmware/qcom/qcom_pas.c
@@ -166,22 +166,6 @@ struct resource_table *qcom_pas_get_rsc_table(struct qcom_pas_context *ctx,
 }
 EXPORT_SYMBOL_GPL(qcom_pas_get_rsc_table);
 
-/**
- * qcom_pas_auth_and_reset() - Authenticate the given peripheral firmware
- *			       and reset the remote processor
- * @pas_id:	peripheral authentication service id
- *
- * Return: 0 on success.
- */
-int qcom_pas_auth_and_reset(u32 pas_id)
-{
-	if (!ops_ptr)
-		return -ENODEV;
-
-	return ops_ptr->auth_and_reset(ops_ptr->dev, pas_id);
-}
-EXPORT_SYMBOL_GPL(qcom_pas_auth_and_reset);
-
 /**
  * qcom_pas_prepare_and_auth_reset() - Prepare, authenticate, and reset the
  *				       remote processor
diff --git a/drivers/firmware/qcom/qcom_pas.h b/drivers/firmware/qcom/qcom_pas.h
index 8643e2760602..a296be2be8c0 100644
--- a/drivers/firmware/qcom/qcom_pas.h
+++ b/drivers/firmware/qcom/qcom_pas.h
@@ -18,8 +18,6 @@ struct device;
  * @get_rsc_table:		Peripheral get resource table callback.
  * @prepare_and_auth_reset:	Peripheral prepare firmware authentication and
  *				reset callback.
- * @auth_and_reset:		Peripheral firmware authentication and reset
- *				callback.
  * @set_remote_state:		Peripheral set remote state callback.
  * @shutdown:			Peripheral shutdown callback.
  * @metadata_release:		Image metadata release callback.
@@ -37,7 +35,6 @@ struct qcom_pas_ops {
 			       size_t *output_rt_size);
 	int (*prepare_and_auth_reset)(struct device *dev,
 				      struct qcom_pas_context *ctx);
-	int (*auth_and_reset)(struct device *dev, u32 pas_id);
 	int (*set_remote_state)(struct device *dev, u32 state, u32 pas_id);
 	int (*shutdown)(struct device *dev, u32 pas_id);
 	void (*metadata_release)(struct device *dev,
diff --git a/drivers/firmware/qcom/qcom_pas_tee.c b/drivers/firmware/qcom/qcom_pas_tee.c
index ac33a00687aa..dbab9a43e6ca 100644
--- a/drivers/firmware/qcom/qcom_pas_tee.c
+++ b/drivers/firmware/qcom/qcom_pas_tee.c
@@ -320,11 +320,6 @@ static int __qcom_pas_tee_auth_and_reset(struct device *dev, u32 pas_id,
 	return ret;
 }
 
-static int qcom_pas_tee_auth_and_reset(struct device *dev, u32 pas_id)
-{
-	return __qcom_pas_tee_auth_and_reset(dev, pas_id, 0, 0);
-}
-
 static int qcom_pas_tee_prepare_and_auth_reset(struct device *dev,
 					       struct qcom_pas_context *ctx)
 {
@@ -401,7 +396,6 @@ static struct qcom_pas_ops qcom_pas_ops_tee = {
 	.init_image		= qcom_pas_tee_init_image,
 	.mem_setup		= qcom_pas_tee_mem_setup,
 	.get_rsc_table		= qcom_pas_tee_get_rsc_table,
-	.auth_and_reset		= qcom_pas_tee_auth_and_reset,
 	.prepare_and_auth_reset	= qcom_pas_tee_prepare_and_auth_reset,
 	.set_remote_state	= qcom_pas_tee_set_remote_state,
 	.shutdown		= qcom_pas_tee_shutdown,
diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index dc57c87870cf..08b9c5049dd9 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -845,7 +845,7 @@ static void *qcom_scm_pas_get_rsc_table(struct device *dev,
 	return ret ? ERR_PTR(ret) : tbl_ptr;
 }
 
-static int qcom_scm_pas_auth_and_reset(struct device *dev, u32 pas_id)
+static int __qcom_scm_pas_auth_and_reset(struct device *dev, u32 pas_id)
 {
 	int ret;
 	struct qcom_scm_desc desc = {
@@ -886,7 +886,7 @@ static int qcom_scm_pas_prepare_and_auth_reset(struct device *dev,
 	 * memory region and then invokes a call to TrustZone to authenticate.
 	 */
 	if (!ctx->use_tzmem)
-		return qcom_scm_pas_auth_and_reset(dev, ctx->pas_id);
+		return __qcom_scm_pas_auth_and_reset(dev, ctx->pas_id);
 
 	/*
 	 * When Linux runs @ EL2 Linux must create the shmbridge itself and then
@@ -896,7 +896,7 @@ static int qcom_scm_pas_prepare_and_auth_reset(struct device *dev,
 	if (ret)
 		return ret;
 
-	ret = qcom_scm_pas_auth_and_reset(dev, ctx->pas_id);
+	ret = __qcom_scm_pas_auth_and_reset(dev, ctx->pas_id);
 	qcom_tzmem_shm_bridge_delete(handle);
 
 	return ret;
@@ -977,7 +977,6 @@ static struct qcom_pas_ops qcom_pas_ops_scm = {
 	.init_image		= qcom_scm_pas_init_image,
 	.mem_setup		= qcom_scm_pas_mem_setup,
 	.get_rsc_table		= qcom_scm_pas_get_rsc_table,
-	.auth_and_reset		= qcom_scm_pas_auth_and_reset,
 	.prepare_and_auth_reset	= qcom_scm_pas_prepare_and_auth_reset,
 	.set_remote_state	= qcom_scm_pas_set_remote_state,
 	.shutdown		= qcom_scm_pas_shutdown,
diff --git a/include/linux/firmware/qcom/qcom_pas.h b/include/linux/firmware/qcom/qcom_pas.h
index 1d132e89536e..07d0f1fad85f 100644
--- a/include/linux/firmware/qcom/qcom_pas.h
+++ b/include/linux/firmware/qcom/qcom_pas.h
@@ -46,7 +46,6 @@ struct resource_table *qcom_pas_get_rsc_table(struct qcom_pas_context *ctx,
 					      void *input_rt, size_t input_rt_size,
 					      size_t *output_rt_size);
 int qcom_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size);
-int qcom_pas_auth_and_reset(u32 pas_id);
 int qcom_pas_prepare_and_auth_reset(struct qcom_pas_context *ctx);
 int qcom_pas_set_remote_state(u32 state, u32 pas_id);
 int qcom_pas_shutdown(u32 pas_id);
-- 
2.55.0

