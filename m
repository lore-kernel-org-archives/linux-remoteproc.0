Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620483314D9
	for <linux-remoteproc@vger.kernel.org>; Thu, 13 Nov 2025 10:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763030205; cv=none; b=sao9IWZcl2rKWXqgZ0Yqcb31YQIGFwi9ErkgcpUgGlEFN6NbMpeUOJtEGNJ0U47qiKZVYtfC3HKFW5pTRBGYEYuWm89OnA/IBOgriandqxfF5JGQVDNr7rkRVBGAvW9T0qxlsg+gEaK+pg9Cl8p1XFtttHaGoPxPYMFSxK0WcVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763030205; c=relaxed/simple;
	bh=Rixybg0nsr13QM27UZ58Fss8pUWR5Y6GFHVIXzlNn1Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qZfodE33ELZJWYEeZOAikM0nC75UN3SS5FQBp0Kbnvfhf6l9SxjwAJmhjRrxdfr81O1QfiQjEADU7BJbk2SDFyZ/jotmxazxdHpqfJHwkeo8bvAeE4Py2o5oA+TGsmuXPPYM53FkcImpmwjRP1HFkAVQu68QaAnJ7aDKUvfsUrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UnZDl55D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SQ1USp21; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UnZDl55D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SQ1USp21"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD661VJ3564153
	for <linux-remoteproc@vger.kernel.org>; Thu, 13 Nov 2025 10:36:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PcEo95RGQd3sGnxFzyabPD6ez+nlwUdDEO/uN/UXRGQ=; b=UnZDl55DnG9pu9qt
	BRfzjMKSwGCWxBUatefjb43mjyEM3rclauYU1sOGEvQgRjsZvLIyv3HGSSiDDMvk
	I49maBeNhd3Cv2uBivT3XIL4UN9zk4QK7Hp+RwYuZOIOBD4qmVOh0AGn3AgmoixX
	GKJ6bB4xU4tcJYuwFVh/rsNLDAp3MFGLyNp8AsQgzSNRd7/7xI+VM+h4kJLMkPrY
	GeJoK279/ybFpRAYe5UbUSQmySD628hZQmh49X90ZlSLB7FcGUa5PHlmsCK5cXbC
	Tvv11j07CxHMSKPlZWRC9GFl5prYg7421/rjUFI8I+q9ntBhok6LTE+do6e/w8Rc
	WkNG7A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ad9rvgtty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 13 Nov 2025 10:36:43 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-343daf0f38aso929042a91.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 13 Nov 2025 02:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763030203; x=1763635003; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PcEo95RGQd3sGnxFzyabPD6ez+nlwUdDEO/uN/UXRGQ=;
        b=SQ1USp219kgQaPfql6WB38O8lqCJ5aidM82CHvvn4t/8BGWHagrmMvnvdj1J5FDM5a
         FrTiB8QAZApKSbuEYflf/+Q8QpuBf3i1rjDfbBOGVP/xw2Aw991U1pnZHk/L+oyVct5d
         4j1HUmwJQnLOvqd4H7QVYUF3meZE0gZVa8cacgwoE9WIDJ9sGjP2Zj2H1A1jWFh/xQit
         tmXG3as+/TqZQJIz3vuB2wFDlrlwUiROQaP0V73CdHs+8Keczyl1ODCN8n0uYeaegOW9
         wq5zkyeubnuDG4NJ5VKI9vPA5zUZxBHU7MK8y4cSwn1o3sJfDsZzrvIRkQ9t3s85qVGk
         AuPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763030203; x=1763635003;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PcEo95RGQd3sGnxFzyabPD6ez+nlwUdDEO/uN/UXRGQ=;
        b=ADoi7fddv9QpPRJ5ZRCIEyyfhgUBRms2KH3uNUe2topoO7UmQU1Y54RLwgU+bXtDFu
         OWWoE/M/lTfkbB+QHA6e0FRn+0y0jcTjzZP5uWggKscm4PzcVR6qPpYDGrHzvl5223EN
         0YYKTT4o7g6CMmXszjx1ZzTB5sr2twski3PCa8W+kakc2tK9OCZjHsCeqw1mVdtGe2xZ
         MIRxR0dezkSUGXxwCf6STymUgD0dd33H3KOH24bO5uDrjTpKvR1De1N+MWuTs9ZO/VvJ
         7f9XUX/9xoj6i9m9acFy5nJXJVzt9qyRX0y1SLo0VzbImrGAA0segUK4RKVVhzK9q+QZ
         LWIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJWRC839djgWewboKoL4qztdWRQqTzukGj6XYVFoE1IB4N+Q5QqD4yC1FJ2sBlQW7RonvoF4bt6XZZuPo6zhQA@vger.kernel.org
X-Gm-Message-State: AOJu0YyyUTm0i1e5wUMxexEoKSRZu9ixN8OKLz+t3wI45eaI+Ye5TCLJ
	Juy72wosdHdFiTsPRPAtny36FfrUrH/mtEhMwypMJNWOvF4vBlU/Vlp/GNJh1V1axP7epdnbXsD
	AgHiSgGvdgAJzxiQmHUnmtIWpuxZDSo1blNxMWX2xsHssKtFdjgFCuJlBD1B0L20paGY6U/zx
X-Gm-Gg: ASbGncuNinP+kHbGuISFidLCGmHa+WlbAvOF1kckDaqe1knMj790WwebfrE71Wc3qkc
	SkXTp4uOz1ix6O+xPOrFwgBJrbEocfLM61tcOxpo2SK8JTtpDbr4KN/pbAtOBHwp2Wy+oQUbSPt
	PNPfkbbifqFmw7xNXG4mZ+mcDXnivrMFuksnNBRZQAKLUdgXDPyhYIaFHAtuiEyUXmvLY1xBlN9
	kowNetLttQkQhvKm8N5MneGWxztMmbFnrDG57JVcZrIveFsrjMfMNYOcaaeohlCIiV3/uwZJ3Ww
	lm/RMMBHCf5Om3Tv/JMstGlQSqreOg0ZUz2ineUte+cePYSapZXsK2UG173gir3aWpHBWRbB316
	+QEH5kFNkTwSIZotRbAywGPzf6A==
X-Received: by 2002:a17:90b:3b52:b0:340:d511:e164 with SMTP id 98e67ed59e1d1-343dde8a8f4mr7289063a91.19.1763030202817;
        Thu, 13 Nov 2025 02:36:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE9NPj80JXCoZnsGrN6R/U0j3ZrmSWpSgxRDBU1ba/XJeQ9MOHyZg+Bw/xjGnVsiTx3sM6kqQ==
X-Received: by 2002:a17:90b:3b52:b0:340:d511:e164 with SMTP id 98e67ed59e1d1-343dde8a8f4mr7289028a91.19.1763030202110;
        Thu, 13 Nov 2025 02:36:42 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b9250d2d16sm1886922b3a.22.2025.11.13.02.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 02:36:41 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 16:05:59 +0530
Subject: [PATCH v7 09/14] firmware: qcom_scm: Simplify
 qcom_scm_pas_init_image()
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251113-kvm-rproc-v7-v7-9-df4910b7c20a@oss.qualcomm.com>
References: <20251113-kvm-rproc-v7-v7-0-df4910b7c20a@oss.qualcomm.com>
In-Reply-To: <20251113-kvm-rproc-v7-v7-0-df4910b7c20a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763030164; l=2933;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=Rixybg0nsr13QM27UZ58Fss8pUWR5Y6GFHVIXzlNn1Y=;
 b=oaQRTVkCrSII61AJEfLhhD5zuum9iVDoqDeXjj00zyjuT7CjuoWX7+6TZq2bGWajZtBeY9AR/
 Qp+KwdIJZfbBvZ5xso6pwzV+ltUmUeEleEvhZ3pQsjGBtfawHSVbzV2
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Authority-Analysis: v=2.4 cv=XrX3+FF9 c=1 sm=1 tr=0 ts=6915b4bb cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=4CDOrE8EU7KXtL0i2UkA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Z9TK5rREnxGRVkxbeZ2omkFL4Ad0bEZH
X-Proofpoint-GUID: Z9TK5rREnxGRVkxbeZ2omkFL4Ad0bEZH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDA3OCBTYWx0ZWRfX5pjhGuhZpaM9
 +HZB16SYTPz7oP858Yn1wOjTpl9rPo9G5ChAX00QNe28Yp0whHzRvupxmR9xy1PufdcbHYDRw8j
 ey1y/G7oXG7pnD8NX2wouIEWLMfuHCzZP5zH0KzOy6DaOy60Rj+4d8XLixp/z63luYiz8dQK9EN
 UmNh3IxeexXelL1ckj9w7gD+Shc3ps+dOez+KPgaQWZdUB9o+KZ6FLS01vZOtCtb9fQC2XWnh6n
 TJAwX9zF8lUsVYyMj8H7TyGoBO1pVzY6AoW9pJgz01eljnk8yG7UwrzY23O8aweZOToTHtouQ1g
 MsMeH93nUROlqnLmt6Xa/H0qFaxSjsYt2KdLGTpLWQKqBWMo77/dP34JhAfyh4w6V2syEN5YaLd
 b5p6OytnRREDG87lCMflsQjRSpMFhQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_01,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130078

Simplify qcom_scm_pas_init_image() by making the memory allocation,
copy and free operations done in a separate function than the actual
SMC call.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 58 +++++++++++++++++++++++-----------------
 1 file changed, 33 insertions(+), 25 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 550707f2b46d..1d8a2c537c44 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -590,6 +590,37 @@ void *devm_qcom_scm_pas_context_init(struct device *dev, u32 pas_id, phys_addr_t
 }
 EXPORT_SYMBOL_GPL(devm_qcom_scm_pas_context_init);
 
+static int __qcom_scm_pas_init_image(u32 pas_id, dma_addr_t mdata_phys, void *metadata,
+				     size_t size, struct qcom_scm_res *res)
+{
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_PIL,
+		.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE,
+		.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_VAL, QCOM_SCM_RW),
+		.args[0] = pas_id,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
+	int ret;
+
+	ret = qcom_scm_clk_enable();
+	if (ret)
+		return ret;
+
+	ret = qcom_scm_bw_enable();
+	if (ret)
+		goto disable_clk;
+
+	desc.args[1] = mdata_phys;
+
+	ret = qcom_scm_call(__scm->dev, &desc, res);
+	qcom_scm_bw_disable();
+
+disable_clk:
+	qcom_scm_clk_disable();
+
+	return ret;
+}
+
 /**
  * qcom_scm_pas_init_image() - Initialize peripheral authentication service
  *			       state machine for a given peripheral, using the
@@ -610,17 +641,10 @@ EXPORT_SYMBOL_GPL(devm_qcom_scm_pas_context_init);
 int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
 			    struct qcom_scm_pas_context *ctx)
 {
+	struct qcom_scm_res res;
 	dma_addr_t mdata_phys;
 	void *mdata_buf;
 	int ret;
-	struct qcom_scm_desc desc = {
-		.svc = QCOM_SCM_SVC_PIL,
-		.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE,
-		.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_VAL, QCOM_SCM_RW),
-		.args[0] = pas_id,
-		.owner = ARM_SMCCC_OWNER_SIP,
-	};
-	struct qcom_scm_res res;
 
 	/*
 	 * During the scm call memory protection will be enabled for the meta
@@ -641,23 +665,7 @@ int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
 
 	memcpy(mdata_buf, metadata, size);
 
-	ret = qcom_scm_clk_enable();
-	if (ret)
-		goto out;
-
-	ret = qcom_scm_bw_enable();
-	if (ret)
-		goto disable_clk;
-
-	desc.args[1] = mdata_phys;
-
-	ret = qcom_scm_call(__scm->dev, &desc, &res);
-	qcom_scm_bw_disable();
-
-disable_clk:
-	qcom_scm_clk_disable();
-
-out:
+	ret = __qcom_scm_pas_init_image(pas_id, mdata_phys, mdata_buf, size, &res);
 	if (ret < 0 || !ctx) {
 		dma_free_coherent(__scm->dev, size, mdata_buf, mdata_phys);
 	} else if (ctx) {

-- 
2.50.1

