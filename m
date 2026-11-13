Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596084;
	b=Y7nQRdkLyKqrMYypgNZHGg/eo4uFpO0QXafIGQYKY0Z6VtTHigNzsaT8C8v4CBt7mbbT
	 F88OxDApH+jZYJ1A20PnwXk16/hxZ2MZQ7e7G6P2mywXDQnJtPvPDyGUgn14bpHed6OUD
	 dGX0EQla0rvtcKhsrqGX9tjtznUYRMZVPP0GqdkZghwcWSDZvxtzpEDGYxgXbbZuQFmif
	 vxhq9e1L/YGLl6uWjvPXlESndznslSYvSTuTpKnpyuo83hWiFytSZuvV5tZ7z9iTZZIli
	 2hrHDx2wV8u95h7RXdZL4wAdWVCGGOfXwFw5iMTS14iqWNb5CUafsdT1iXpUA2Tqp7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596084;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sFBq9fRHwG6vJeIthGk0I4jMp83as5rl6WW7bRc8g/s=;
	b=sm/jxgFDxkUkVnQw3vHd4OdBioDkXt/V40MIG9rBDYbD5PEgZ2gU309yoq5wSRasHRQP
	 SNmms4pw/Fo1WJz16SbK7bm9rlWj0j9yZcGGHwDtRTrNutJAseO4uOlvTvqJ3FontY+NC
	 FTMP8Kj9MXg0HXfSxGdgVxG7W0CWYqkySRxTIK/kfiGRUECQn/IbwTClyC0inJXNJ6jEs
	 cl/rvdCqdWj5jXuOL2HK8zIgKw5pAAGQAJCK8VTPm/AZg7O+1eIpkAX63WRIMizDZJVN/
	 R4mz1Xb2NrP7fuDM1KD50Gf6Fxms0RYV1D6mccN2zjXIoPWSht+E2TxM8Pf15TbnnIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fURUUT0X;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PL6UMM46;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E77606A331
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Nov 2026 18:54:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1E77606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fURUUT0X;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PL6UMM46
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFQwJP074887
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Nov 2026 18:54:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sFBq9fRHwG6
	vJeIthGk0I4jMp83as5rl6WW7bRc8g/s=; b=fURUUT0XleKiE1C/Vux+befwt+/
	dPsCZuHNQAShw3zqmbbPvnkWmciAMOJmcPPjX/Ypz5i8xGx5igroHMccVx+b153T
	uIpQ7885fRsHjkWRYpoBVsESepqQQcYBw2TwRc+AQxQQzBPmipPxvz2QTuBrcg/U
	fxflhQRaD9AWLlT0VkEyW8xmO8xeOm7gg0EuYPIqqxROMDx8T0RNRi2GJT+72Zzf
	BRyN7VhBSQrTqV5w2Gbr8XxWutaOeSSTe4uIT86yAJhpD14B7KdLcqKJBttPaHBk
	Nu7PpBDZGbwJEUEyWxW2WkQw3GHZ29zfEI+9kF/mEEv+0sfWto/DrsKryPg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwu2mu457-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Nov 2026 18:54:42 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so1940900eec.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 13 Nov 2026 10:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794596082; x=1795200882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sFBq9fRHwG6vJeIthGk0I4jMp83as5rl6WW7bRc8g/s=;
        b=PL6UMM46eYQPQNHBRg0A3fKGyfhPh12Rr5pcPcKUNK+15OTKQ0QhK2o364XuIwTKOy
         6Aiq5TH2ur327F9D2UlUfRWcWILhoHa5BSiLBZz15dYHzi9cXK6/SK9JZlKhiCXo075J
         IR8LpJnkDZUiQ2/U4imCOSY3JzjrDATsn75bE4wY6R/tKyQL7IITRWVzBzy3iHbrPEw7
         ROd3KlVn860K5lx1LNHaLlvZq4nwngmJJV7tS79PbMgdTfAFHA9LcXDb++Mylxx5fir0
         kKeZfAiiOWl61UFVkBQZ14T+vRaK/DyB3dJd090VYwYUx8+6A/Zg2s+5/dVS5pJOar9+
         TeKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596082; x=1795200882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sFBq9fRHwG6vJeIthGk0I4jMp83as5rl6WW7bRc8g/s=;
        b=flvjzexkXHNkaeWqdolqx2E8m4URbq3HYP24N2o/vsVzBs8gDxzpXjgeKzkfebgoQP
         s+TJ6mFqZAjeg02/RTJhje9egQMw8LJnyds0my9RQhIWgEAmBYHdkd6MSMM+N4VnJe6n
         YJ8Ijm7etdDSe/yZJvm3eM3lPaAo5VJHYdczvId7Pt41auTGqblzJWzivOBr9CQT5H08
         KXC8BwyOF/jKS76QCKoLd2Lvf2gAFJRp6XPD7G2eA4Fx6tuMMFO+kHjjSJLlTZiuL/9r
         Ls5oGqybMVFgEP6+Gx5/s9VWntNv+P4VaAux3gNe1UiZy15Yg2694q1heopDocOF97by
         r4Ng==
X-Forwarded-Encrypted: i=1; AL+hErGORFlzzlLAjig6GUWaGTejZ3yM5Hk6MQDEX1Nze2VrJp9PAZACFxOT6U5AEpg0F5pWWfPKs8NK52TUjGnfsGTL@vger.kernel.org
X-Gm-Message-State: APuU4Z9V14ed4/9Ay7GExBQQm3R1/kR014VZNeGtC7RiXQbJdZff3cUy
	i5dPv9RPY7izSItXKVRLtWPsVV7GvKYk0dPFaZmvVniLnJekgMaP95ILmnxV9DqZ1OBsRjFETed
	1CKNylStkqP+16QJzT2ot1nVkLeROag0uDh1XCMobBwPzqFdNcvycUeY8Z/jYh62XmIO2OHcp
X-Gm-Gg: AYBFou3R3xx2641txjBzV1U6yp5S5oA3HbqZqL7iueZ4Zk5bpofZco1f0GcH5hcdjj+
	LZFDm78oeCAwfCjUxjBHedwNfiyBcRXNAdpMpZQng6xzVHaROoKEtdApQCE5aipw5rXPA1VTkVa
	zdmKgCzAwbAsTZIGEK+bwf5W5oXpLAfU2+ye2m3uGkLgcHYHRdOqJ1flwQKfCMij4HZ+huLiSC3
	UZLG0zJl1bbZPz6y7UHlBOHGP/iw0zofPnZ6TTRPxxjyR40tH+xhcEhGxeb+XyFTpwBCCBskx5r
	exKzWiVKqPYYWazc/TALxohHqnxMg8g0V4SWlNgHRB9lHJLntUfOPQAaska8tnBUlX2HU89MWLV
	0pu2uCeFTF3sGUnVm6EuImnQOPefSLdFkrEKelkUxNX1XyY68z+52hS4P7sfe/a1GiRp5sha6R+
	s=
X-Received: by 2002:a05:7300:c7c3:b0:377:ee18:c290 with SMTP id 5a478bee46e88-3796676b12amr2938745eec.21.1794596082064;
        Fri, 13 Nov 2026 10:54:42 -0800 (PST)
X-Received: by 2002:a05:7300:c7c3:b0:377:ee18:c290 with SMTP id 5a478bee46e88-3796676b12amr2938703eec.21.1794596081228;
        Fri, 13 Nov 2026 10:54:41 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm15547667eec.21.2026.11.13.10.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:54:40 -0800 (PST)
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
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
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
Subject: [PATCH v2 9/9] firmware: qcom: pas: remove qcom_pas_auth_and_reset()
Date: Sat, 14 Nov 2026 00:20:09 +0530
Message-ID: <20261113185009.157893-10-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113185009.157893-1-mukesh.ojha@oss.qualcomm.com>
References: <20261113185009.157893-1-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: jcybDpVq_fFvqgS470q-8sv3LasPt35y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX4Y7yjiVnjVaq
 Kp83zsRFCbMpA7fxjV2zafn4t7L/CnvnW6ciLSXXAxkxJT95pSYjAjO28xYstDlHka9Y+hvDyft
 QtRkoeSmUjXQhcbLNMC5WIgPkkbowxQXs0aG1zekPUapJAvbPrzs11rrIaWhq2Mo548745ikY06
 DQooGG3q0XXL5DfLzMrgMI2g5Qc/t0M3hJo0LbpA3jV5RRz2bFCzZ5HTWN6bPGmv/y8fxqXsTz1
 IPMMOsnkh1GFPdDyREf2/mCRwRGvySN4fsfY53dxAohorkWyUVnAjracr6dpveP1U5yptYxfz8E
 A1246o6TdmdRRB9qUbyDzk70A6tUMJEFk2AIcR0UWXlRtFoqdWuPoaRIAHJ2beXZ0Ylw5atBB21
 dHqvrOBKE+9VxtBuEZfsyGeGierwUMH0oJwUoq7FG4UNADrZWAa2mDavWc5fj+ZkcBG3qjh110A
 DFHdjds8vPxh/XWJ8Kg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfXxNN1XF8xECNP
 WjNa0KzQsm21RYFmRzcx3h18xLs492m91OxkzljBUY3akI4udKiul1Q0b5dmB8numC9L/UuFWgk
 KMz7pN/V+phk80l/y8fojUONCEhrSow=
X-Authority-Analysis: v=2.4 cv=ddQVTnXe c=1 sm=1 tr=0 ts=6af75cf2 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=sV0Ut8U-cAKt8JUqj3YA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: jcybDpVq_fFvqgS470q-8sv3LasPt35y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130075

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
index fdf62003fbf1..08bf3a8d3bf6 100644
--- a/drivers/firmware/qcom/qcom_pas.c
+++ b/drivers/firmware/qcom/qcom_pas.c
@@ -184,22 +184,6 @@ struct resource_table *qcom_pas_get_rsc_table(struct qcom_pas_context *ctx,
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
index 1fca2712d791..525b8a02ae82 100644
--- a/drivers/firmware/qcom/qcom_pas_tee.c
+++ b/drivers/firmware/qcom/qcom_pas_tee.c
@@ -331,11 +331,6 @@ static int __qcom_pas_tee_auth_and_reset(struct device *dev, u32 pas_id,
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
@@ -412,7 +407,6 @@ static struct qcom_pas_ops qcom_pas_ops_tee = {
 	.init_image		= qcom_pas_tee_init_image,
 	.mem_setup		= qcom_pas_tee_mem_setup,
 	.get_rsc_table		= qcom_pas_tee_get_rsc_table,
-	.auth_and_reset		= qcom_pas_tee_auth_and_reset,
 	.prepare_and_auth_reset	= qcom_pas_tee_prepare_and_auth_reset,
 	.set_remote_state	= qcom_pas_tee_set_remote_state,
 	.shutdown		= qcom_pas_tee_shutdown,
diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 030e4ba90812..b0f96e751167 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -855,7 +855,7 @@ static void *qcom_scm_pas_get_rsc_table(struct device *dev,
 	return ret ? ERR_PTR(ret) : tbl_ptr;
 }
 
-static int qcom_scm_pas_auth_and_reset(struct device *dev, u32 pas_id)
+static int __qcom_scm_pas_auth_and_reset(struct device *dev, u32 pas_id)
 {
 	int ret;
 	struct qcom_scm_desc desc = {
@@ -896,7 +896,7 @@ static int qcom_scm_pas_prepare_and_auth_reset(struct device *dev,
 	 * memory region and then invokes a call to TrustZone to authenticate.
 	 */
 	if (!ctx->use_tzmem)
-		return qcom_scm_pas_auth_and_reset(dev, ctx->pas_id);
+		return __qcom_scm_pas_auth_and_reset(dev, ctx->pas_id);
 
 	/*
 	 * When Linux runs @ EL2 Linux must create the shmbridge itself and then
@@ -906,7 +906,7 @@ static int qcom_scm_pas_prepare_and_auth_reset(struct device *dev,
 	if (ret)
 		return ret;
 
-	ret = qcom_scm_pas_auth_and_reset(dev, ctx->pas_id);
+	ret = __qcom_scm_pas_auth_and_reset(dev, ctx->pas_id);
 	qcom_tzmem_shm_bridge_delete(handle);
 
 	return ret;
@@ -987,7 +987,6 @@ static struct qcom_pas_ops qcom_pas_ops_scm = {
 	.init_image		= qcom_scm_pas_init_image,
 	.mem_setup		= qcom_scm_pas_mem_setup,
 	.get_rsc_table		= qcom_scm_pas_get_rsc_table,
-	.auth_and_reset		= qcom_scm_pas_auth_and_reset,
 	.prepare_and_auth_reset	= qcom_scm_pas_prepare_and_auth_reset,
 	.set_remote_state	= qcom_scm_pas_set_remote_state,
 	.shutdown		= qcom_scm_pas_shutdown,
diff --git a/include/linux/firmware/qcom/qcom_pas.h b/include/linux/firmware/qcom/qcom_pas.h
index 458075868bf5..53b8d9631f22 100644
--- a/include/linux/firmware/qcom/qcom_pas.h
+++ b/include/linux/firmware/qcom/qcom_pas.h
@@ -48,7 +48,6 @@ struct resource_table *qcom_pas_get_rsc_table(struct qcom_pas_context *ctx,
 					      void *input_rt, size_t input_rt_size,
 					      size_t *output_rt_size);
 int qcom_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size);
-int qcom_pas_auth_and_reset(u32 pas_id);
 int qcom_pas_prepare_and_auth_reset(struct qcom_pas_context *ctx);
 int qcom_pas_set_remote_state(u32 state, u32 pas_id);
 int qcom_pas_shutdown(u32 pas_id);
-- 
2.55.0

