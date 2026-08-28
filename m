Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B2A399004
	for <linux-remoteproc@vger.kernel.org>; Fri, 28 Aug 2026 18:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787940816; cv=none; b=XAZRYIEyPcT3CzyhWREYWWx5fQwBSbT5zjIg9RzaCtIOWEOQ0TsST3EtwZWhFcIt49nXy8Og4a2RN24RuqrTRY3Lx5bgHll3swuSiwunM3Lgdl3ofcDAC2ZVub1x0PFATUqmjxRZOLXJOEmVa/ADXKvDflKUCBLfIDvl/F1jWNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787940816; c=relaxed/simple;
	bh=CKyPo11CsL5jCU+7wgWm+ZsnvdzHhva/MCWijS7LyxY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m8NKRXkEYt/CuKJhRUeYjt377MTmQDXXtGDbhB1hjAfGzuxN1q3x8wTEwVteNhq/HN1qj9qGDZaXAMOoe3GEtYqKZGWFcWHAmA7FumK5FyfCKTwcGG9ccmVp+Ih/OH8xGSMQs4dy4VFxzkJDEGhca7UtMNqjZA50a+PQ4JUXetk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OrrK/lOg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=agAVJqet; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OrrK/lOg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="agAVJqet"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SGK7o73887509
	for <linux-remoteproc@vger.kernel.org>; Fri, 28 Aug 2026 18:13:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AuuFrZ1q8N8
	AYFJpDfj/ewIAJJ0zFR715MDu+ro7hc8=; b=OrrK/lOgXEOyKhXtDuxjlm1U0J8
	vGc0NfodKWtgCBp1dQIt2zouAKg25L6wMULlFIZjrGObzswmLTh7TO+UXB9LZ6jB
	XLb/PMuFNCdcY31DO0GzFroZEnDMZwrTbne5J9ZONmnklZvMiILXjq+t/C36UEIM
	tRL9WFvxr0+yW/2PhR382TbExh6QXP4WksXT3Ca4l1/UNTTPMcJTjS/qUPZpx1EB
	t9hHGoIQ6nuJeBjKuV4O6La0e2QRCK1e8xLyliUEsgs0vi3Cpnaqxx22sTiZI6eB
	71nxM65aRcFMsTHQCDrAHLb6cOch56Kygimwa9d6Oq6HGlrL5aG/bu8g1Cw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb47n2wmy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 28 Aug 2026 18:13:33 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb835525b10so1582393a12.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 28 Aug 2026 11:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787940813; x=1788545613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AuuFrZ1q8N8AYFJpDfj/ewIAJJ0zFR715MDu+ro7hc8=;
        b=agAVJqetI72pX6d3ps1I7bT5taep6TE+L2TE2wxWR8gDQMyx4AFH8+TmWHkbm9PBgt
         ZUWyqdHq1Qi5o8HsueZaw/gy/XJzpWgGnOZZxd3WSRzX1bSuXgbDMSf8fYiszjVnZc6t
         jETGLBbUiBTU3kUWai71Lyuq/8gfQNw51Lnc1LHp2sRMW/HYosCUUGrxa0p/z0vnC6bl
         X7M91lj+wXW6yIWHdlKQZhCX4Z4NXnEgHuEZrKqtysoZJJhpB338cOCR86KsMC4qqM3r
         lMCmwbZRX5vRHmglTcX5U9YnYCGOpOHRKjS0TflJBM9g7Eo+8JSeWq7hlvgMrKOu7UE/
         y3Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787940813; x=1788545613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AuuFrZ1q8N8AYFJpDfj/ewIAJJ0zFR715MDu+ro7hc8=;
        b=hi0wh8UUo1FSsDG4E8iayWg8vl97L3HAUvPnSbMiL3OZAnhkYXkzentFHONI1jb/qn
         3ebVTE6gT/vMsQXUjiTE2fQallCO1JyKoY0j83AMlwlEEHNnQ975VQcrJ75ApxXCborM
         f7TnCV2IbYFIfzLAhoZQmiODpoT93UUM6lI3fCnJoesDeO9HFKWL/3g0AsEmO/lv7ZUC
         /9fER4gU4Q97Z2a5fH/kix53GJkkFieL8awpDOXWa1hkJpF4IUEeutqxgZh5FQSeA+6n
         JeAY2nS/FOK/h6KfhNduhndRLnbai+4U8RnsJ4m/t+ev1guoif9TMk6LZIrX1vrfZAEd
         cX3g==
X-Forwarded-Encrypted: i=1; AHgh+RqfnKqYrlGb/5jBAxyqxVuA8BrdpIkNt01u4j88gCyxB0m5a/ERBMneCWXugR8OXnvpYJDwfKU3gICG2v7bWmJB@vger.kernel.org
X-Gm-Message-State: AFuF++n6MGfT+1vfFwb2PP1eRdbOms8Q2h+fTdxPieCoW9PWoLKEJhNl
	+I5S+AMmSqObxYYo5oADlKhV2fH53Xnhwyb9KAFRBk6DO3DuPcf/67KpW2Q50zbRKytwZvLemjZ
	4xbss9reQq/9QOziimxGKoNz2ucrD6vQkxi/zJR7ZeIEWbNAVu8QVQ7k7mM6tZoH2qSTu30Ev
X-Gm-Gg: AR+sD11tX6XdvbLZ0rKU7nC9WSb6TDrHKno3G7nUyep9OUyWv4GRhBPk5OsBe+hhn/0
	3gwST8u371r0mTzX5066BLk7N4MvzG2Eg2XSCqrjXKbefOj7gmUoCbGHaV5vuE5O+qA+5efvH2J
	kVWlFIspRPnkmf3iJ7i1lHi87QXRt9F0TnumXupX0pcpWUbO+IGy/Y44MTvxphLbrszLWY3q/sE
	na017j+I3+pu7HlEQqPNZrvVhA477kOcbjBlE3/WuZMs12H7Xff+wG58WjCyUZunfN/D+sx5rgf
	JfyGz9W2Izp5EuWu5P1ItzlpdP4QwmYwm5EaCr+5Q7YSwGJ+i35aQqJeQZDBcHFSKNTPY2SwCuu
	dSKcbmRYyPdfV8TwIkSmfoBY7AGo=
X-Received: by 2002:a05:6a21:350f:b0:3d3:ae40:51e5 with SMTP id adf61e73a8af0-3d3ae405659mr2757927637.25.1787940812678;
        Fri, 28 Aug 2026 11:13:32 -0700 (PDT)
X-Received: by 2002:a05:6a21:350f:b0:3d3:ae40:51e5 with SMTP id adf61e73a8af0-3d3ae405659mr2757847637.25.1787940812092;
        Fri, 28 Aug 2026 11:13:32 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f784845sm8575600eec.2.2026.08.28.11.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 11:13:31 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 3/3] remoteproc: qcom_q6v5_pas: Add per-PD proxy performance states for Hawi CDSP
Date: Fri, 28 Aug 2026 23:43:11 +0530
Message-ID: <20260828181311.4038346-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260828181311.4038346-1-mukesh.ojha@oss.qualcomm.com>
References: <20260828181311.4038346-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=a8YAM0SF c=1 sm=1 tr=0 ts=6a91cfcd cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=YuuaE7EnXcRg8I4FXWYA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: Fj0dmIRqm-slrMEh_WZF4WpPC-lVgWNR
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDE1OSBTYWx0ZWRfX5DJ3deFbGz1s
 JbR3tYPlAw3lC8Otms6QCQ+DESLrEiK5eaOlKhYZMntKX26VHGj3ccwe0S61RoYPEj/bWonpWDc
 18SZwBcXFQvOQ9ZqpUix1fS7VFsqQfk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDE1OSBTYWx0ZWRfX3W/HmkZttEai
 K7jmJc5yHgCGtWG1VkajWy1PMbIoFiJuZ9hJA9uDdYmgeq7yrzRmH+sfj46BisAoe4XVYlr07sP
 s5djSxtu2VaKulOyhz5GYptIIkIgMynLJF6Fsp/JiqIf1VsYKot/6G090/cKs+E1rqv1SLIFZC3
 riJoPYlgbZQFF5tjP9qJlZy1b26+YY1Zmt14shekKHjAm6lJ0mDhe4Pw/SRiLzXn3jkzDiCp7av
 akkMVU7dboiA4Y0SQHtEIxt34owedzSAmTjQP3vLe8rJVXoIwZXuO0PX2DsKPWI4RqChNvL/LZX
 a0WoYexnvaNlHf62R7hPE31+XyiFPmeQBoCAiW9I9GqTcb3PzzGBbexD8F0+INlai+10+eQtoCS
 /DyMyBbmlv6kvzrHzBrygn8XEH/U6sUaR+47EuTEiNHeDKIx5M7gf43J3HRJIKY7C1vbm4nasCt
 WNl7OS7WkLVPZmv3rJw==
X-Proofpoint-GUID: Fj0dmIRqm-slrMEh_WZF4WpPC-lVgWNR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280159

The proxy power domain enable path currently requests INT_MAX performance
state for every proxy PD.  While this serves as a "take highest available"
hint, some SoCs require specific per-domain RPMH levels for correct
operation during firmware load rather than a blanket maximum.

Introduce a proxy_pd_performance_states array in qcom_pas_data to allow
each proxy PD to declare its required RPMH performance level explicitly.
Platforms that do not populate this field retain the existing INT_MAX
behaviour.

Also propagate the return value of dev_pm_genpd_set_performance_state()
and emit a warning on failure rather than silently ignoring it.

Add Hawi CDSP remoteproc support using this infrastructure with the
following proxy PD performance states:

  CX:  RPMH_REGULATOR_LEVEL_TURBO
  MXC: RPMH_REGULATOR_LEVEL_TURBO
  NSP: RPMH_REGULATOR_LEVEL_NOM

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 43 +++++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 25942200ba03..c270c81e8bb4 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -28,6 +28,7 @@
 #include <linux/soc/qcom/mdt_loader.h>
 #include <linux/soc/qcom/smem.h>
 #include <linux/soc/qcom/smem_state.h>
+#include <dt-bindings/power/qcom,rpmhpd.h>
 
 #include "qcom_common.h"
 #include "qcom_pil_info.h"
@@ -51,6 +52,7 @@ struct qcom_pas_data {
 	bool decrypt_shutdown;
 
 	char **proxy_pd_names;
+	const unsigned int *proxy_pd_performance_states;
 
 	const char *load_state;
 	const char *ssr_name;
@@ -79,6 +81,7 @@ struct qcom_pas {
 	struct regulator *px_supply;
 
 	struct device *proxy_pds[3];
+	const unsigned int *proxy_pd_performance_states;
 
 	int proxy_pd_count;
 
@@ -167,7 +170,17 @@ static int qcom_pas_pds_enable(struct qcom_pas *pas, struct device **pds,
 	int i;
 
 	for (i = 0; i < pd_count; i++) {
-		dev_pm_genpd_set_performance_state(pds[i], INT_MAX);
+		unsigned int state = INT_MAX;
+
+		if (pas->proxy_pd_performance_states)
+			state = pas->proxy_pd_performance_states[i];
+
+		ret = dev_pm_genpd_set_performance_state(pds[i], state);
+		if (ret)
+			dev_warn(pas->dev,
+				 "failed to set proxy PD %d state %u: %d\n",
+				 i, state, ret);
+
 		ret = pm_runtime_get_sync(pds[i]);
 		if (ret < 0) {
 			pm_runtime_put_noidle(pds[i]);
@@ -873,6 +886,7 @@ static int qcom_pas_probe(struct platform_device *pdev)
 	pas->info_name = desc->sysmon_name;
 	pas->smem_host_id = desc->smem_host_id;
 	pas->decrypt_shutdown = desc->decrypt_shutdown;
+	pas->proxy_pd_performance_states = desc->proxy_pd_performance_states;
 	pas->region_assign_idx = desc->region_assign_idx;
 	pas->region_assign_count = min_t(int, MAX_ASSIGN_COUNT, desc->region_assign_count);
 	pas->region_assign_vmid = desc->region_assign_vmid;
@@ -1798,6 +1812,32 @@ static const struct qcom_pas_data glymur_soccp_resource = {
 	.needs_tzmem = true,
 };
 
+static const struct qcom_pas_data hawi_cdsp_resource = {
+	.crash_reason_smem = 601,
+	.firmware_name = "cdsp.mdt",
+	.dtb_firmware_name = "cdsp_dtb.mdt",
+	.pas_id = 18,
+	.dtb_pas_id = 0x25,
+	.minidump_id = 7,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mxc",
+		"nsp",
+		NULL
+	},
+	.proxy_pd_performance_states = (const unsigned int[]){
+		RPMH_REGULATOR_LEVEL_TURBO,
+		RPMH_REGULATOR_LEVEL_TURBO,
+		RPMH_REGULATOR_LEVEL_NOM,
+	},
+	.load_state = "cdsp",
+	.ssr_name = "cdsp",
+	.sysmon_name = "cdsp",
+	.ssctl_id = 0x17,
+	.smem_host_id = 5,
+};
+
 static const struct qcom_pas_data eliza_cdsp_resource = {
 	.crash_reason_smem = 601,
 	.firmware_name = "cdsp.mbn",
@@ -1827,6 +1867,7 @@ static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,eliza-adsp-pas", .data = &sm8550_adsp_resource },
 	{ .compatible = "qcom,eliza-cdsp-pas", .data = &eliza_cdsp_resource },
 	{ .compatible = "qcom,glymur-soccp-pas", .data = &glymur_soccp_resource },
+	{ .compatible = "qcom,hawi-cdsp-pas", .data = &hawi_cdsp_resource },
 	{ .compatible = "qcom,kaanapali-soccp-pas", .data = &kaanapali_soccp_resource },
 	{ .compatible = "qcom,milos-adsp-pas", .data = &sm8550_adsp_resource },
 	{ .compatible = "qcom,milos-cdsp-pas", .data = &milos_cdsp_resource },
-- 
2.55.0

