Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D884A68A7
	for <linux-remoteproc@vger.kernel.org>; Thu, 10 Sep 2026 15:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789052841; cv=none; b=CRG6iosK0xJYzHsNowmpsjtlMkQkjPBtx/BUL1qo4jDsQezE+nugXOx9vI5y8IVejHHvdvCLEBeezs0H4+PQZVzVsoiLQf5cFaj1zRVtq5/TvVKBuShqFynRN8XiOMdy91edGl/GsAXS7E2KDscXNVLUzasubIQMI6OtrpLe8UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789052841; c=relaxed/simple;
	bh=E88cDnynQv3HnPcm4uO7dMBnqIizydtK5X9+r637agg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u5GAW7kNvmRgJ9k0XF6NXo7gVd5aW2ivmiKCZZseX+pFhIsXUTAbvepGIhyqTA4Q682lC0tZm7iX2r5RPxtdwP58Amo3dE2PqCf11G7qAA25gdu5jeQBIh0ePhmZKAZs8fL8WlWNSyI2KKZDC9D6VYKVbD7C+/Al2RPn7cBSSGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XZrXuKyb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ebv/BTCW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XZrXuKyb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ebv/BTCW"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AF4lYM1652852
	for <linux-remoteproc@vger.kernel.org>; Thu, 10 Sep 2026 15:07:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=x1PtJB+V44p
	G+pMdvHfWiQQyxDHRsQYqIEhYQsVQ/Qs=; b=XZrXuKybu18DtITtsx4R2fcFe3z
	c9khbhNyN4Fp21yuCJKnDtnhQT5d0QXf2u/w3UYZw7+m5na6KOxSM1xB/58GVbHq
	nS0X/QIsT4MVow92gUF/Q/RHZuWTaf6SNovTk+R8qQqTQgy1PKLGj9oYFlH2G14G
	UUckKEuflgbZHhdTcYKwS7d3ZqGNtNS0Cwlfbstj4lhuOFrQHKH2j1ewkrsO1MMO
	EkLogM1zxCFNbCCg81ww3GFfpSMA//yk6MDwwHNq6HnXQbe+AZ0sNIj40HWMbLDc
	T6iM2ZILq1a83vRfMNjov24jrV1Li1YN23F3uU35urBY8thLpn6iKMuEOCQ==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkrcjt128-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 10 Sep 2026 15:07:10 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4b28deb7ee3so9091149b6e.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 10 Sep 2026 08:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789052830; x=1789657630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x1PtJB+V44pG+pMdvHfWiQQyxDHRsQYqIEhYQsVQ/Qs=;
        b=ebv/BTCWbPKV1O/qm4XhNJ1DrwtNpN/cfsXKzKJQZQ/dXgZU+bVZziK8yhinV6OnY6
         CmVDp1vrbYcRYuM04uZpVPWWzYdhOSIDlhma7K8KSe/+MJlNvmoJjp3rR+VCgzFgzMvU
         pH3iSUB1q3edrxrM18kPIapqhCit2YEXIoyGYMm9L3CjsCDRp15gMKbzE71A0FKs7Afl
         qLSpQoNLvm2Bw8Kfwktun1n2mkmkDZsg5hRgWjsGP3bqmP3LbmIwpoADU6u3NKRHQ+p0
         VekOSTpa/uXieon8ZuQFFE4w1aKHXqyfT+5G5rhucN0a2jngQrVGpH3STjWURBikmJjB
         gDrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789052830; x=1789657630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x1PtJB+V44pG+pMdvHfWiQQyxDHRsQYqIEhYQsVQ/Qs=;
        b=BDBuvXUn1ckMOw+tPjPYcpDNp45FeEfRtKTWovgrDSAgNh9f8G6ZCmjRo/7pb3qhyc
         hb/chtkQRslbfaQ8U28dC4Rb5LBZz1p+gdJ4oP805789Gqpbxijc1eq/m91+WBSn5X/b
         bTiTEYhiBxwYaIuGcGOdL2l2TmP4JDfjD/nvIRFi4gAMTeUrTEZWKFWLH4xFZlDadT0k
         WAug/QQ2Kw4Xx4RIWurvWikO8obt6ZZNB0PXc38hmKrboxtTTkCnvtMSt9pUNVQcpiqQ
         rtewLOb3KGAh2LFpvdayOY+l1qx7uS6vyT8bKXGiYfdse+N865QjWKr3VOZB5Y/PEA81
         +HXQ==
X-Forwarded-Encrypted: i=1; AKwUvByqksJNhjXswvq7BfOs5gunE02Wt0tW7YwxYzFeLBIytWc+2J/xXH2H2kXipcirQ3VE5vpTZsV6VymxPpyaYRMH@vger.kernel.org
X-Gm-Message-State: AFuF++ldfQuiEUUdILhoMhhlWu2DrvuxWc89rouskEQBkPoA9HSwmZRF
	X4qONk/a5sch5KhVEFEiRfhJJRva5gCRQHIQaQ8PXp8kt9TZCNE/PF+27gsDiUnYUca+2S8DB6m
	Bilmy6D8f92tRfq4rRF7Eu5DBKPDE8i9olWvMiDkrN5JL+a7UlUT8P7cvBJ7RlLbaHUsQ3HeZ
X-Gm-Gg: AYBFou1Iy878SExt9pM0IdiuoaeaxBZITV755B8731OZk9tRmGvKRRc5R6A2JtfC/cW
	M0CmuzbiasFBYFOE6YVsnyJlmf/3hCXedoVeOjJOKY1UakzsReOycUjCu1S9+A0DnMZfWl8nJas
	veUNBRXEU2Gn1FdoM2SNjbnanVaFmxMVLRlfZOgtNy53XWT652Z4OzS2RWZkiA21E7HeS9OaeSf
	CKgx+6qmLRTnRI64mGyFRFvblZqKRz7y5nRo6/Ai0bjqFzslolNuZm6yovd7boLfXQlNi4+wAAq
	XNkxt4xRUFcE3SXZyXU986tayBkPXuek/MTeUlMfRbZPZfX6Y96PksHc+WlFEm7+wabpXQ+toFa
	EdlipFqAJJJTRqE3j4TmsuOWu4aU=
X-Received: by 2002:a05:6808:4fd4:b0:4b2:98a3:a567 with SMTP id 5614622812f47-4c13fa87a8amr5633949b6e.4.1789052829852;
        Thu, 10 Sep 2026 08:07:09 -0700 (PDT)
X-Received: by 2002:a05:6808:4fd4:b0:4b2:98a3:a567 with SMTP id 5614622812f47-4c13fa87a8amr5633876b6e.4.1789052829260;
        Thu, 10 Sep 2026 08:07:09 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b97167bd69sm19340773b6e.13.2026.09.10.08.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:07:07 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Yijie Yang <yijie.yang@oss.qualcomm.com>
Subject: [PATCH v4 2/2] remoteproc: qcom_q6v5_pas: add per-PD proxy performance states for Hawi CDSP
Date: Thu, 10 Sep 2026 20:36:38 +0530
Message-ID: <20260910150638.3270162-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910150638.3270162-1-mukesh.ojha@oss.qualcomm.com>
References: <20260910150638.3270162-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE4MiBTYWx0ZWRfX1V+3AyD8WXSe
 6E6G5oP43/u3qbj1j8ookTV/z2w/0p332rkrucDMjNkfx/0atrkZkIpf2OOiCjw21YlT2oDSy1w
 hEYysyOsDvHnfgoU4PIJ3R9Lv7yP8pA=
X-Proofpoint-GUID: Rlsviy0GRfbYLRMxpQe0luC25UxRKNrL
X-Authority-Analysis: v=2.4 cv=aef0Dhot c=1 sm=1 tr=0 ts=6aa2c79e cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=EzEDkhfgfUAEW4_RwPsA:9 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE4MiBTYWx0ZWRfX1Ox9yMIJ/NQ+
 nfW6e/XnxyiuLnN5vIsSfOZwHyVY3F/0c8n4YTW5TSJhpp502X3uf93wmHAI9R6OofeuXKiaMuz
 vkaB2Di4yvgrSZHCh5fYkzxd7viR///EcXaCW1+TPRQ1lyeqaqAocsjpkiexpFSllhBDIAI11RE
 cyt2AtawLYuhfINYRCjWZqTIqFyZz6K9ebAh2lM5U+YJYqNm0M2eUmsKb3VCpw8PR6N0sA2/B5d
 kGBMe51B6holWsZd3Vry1CswB1TjXoenMvLCaPLRM7QWwHpd7KqIYafDs5k8BOrKa79BkUttJGP
 DV75AedcavLRKRrxobyUPPF5nXlNiQInpdZepXX2HphlZ/Dx9WWvre3XWgfX66C665I7prnlDdE
 MRwxVk15qZKJCKJDkDYrpmQRKYkwBxPXtmq/BdkJ5HzdpDx+WP1Rx6aaeAXA8uoMlDzeJYNvPsp
 CYQ88826+dWylWtt9PA==
X-Proofpoint-ORIG-GUID: Rlsviy0GRfbYLRMxpQe0luC25UxRKNrL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_05,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100182

The proxy power domain enable path requests INT_MAX performance
state for every proxy PD. On Hawi, the NSP proxy power domain's
RPMH power domain has no OPP at INT_MAX, while CX and MXC accept
INT_MAX, mapping to their maximum supported level.

Introduce a proxy_pd_performance_states array in qcom_pas_data
to allow per-PD RPMH levels to be declared explicitly. Platforms
that omit this field retain the existing INT_MAX behaviour.

Add Hawi CDSP remoteproc support with the following proxy PD
performance states:

  CX:  RPMH_REGULATOR_LEVEL_TURBO
  MXC: RPMH_REGULATOR_LEVEL_TURBO
  NSP: RPMH_REGULATOR_LEVEL_NOM

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Tested-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 48 +++++++++++++++++++++++++++++-
 1 file changed, 47 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index a005546c265d..96a2436b777d 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -28,6 +28,7 @@
 #include <linux/soc/qcom/mdt_loader.h>
 #include <linux/soc/qcom/smem.h>
 #include <linux/soc/qcom/smem_state.h>
+#include <dt-bindings/power/qcom,rpmhpd.h>
 
 #include "qcom_common.h"
 #include "qcom_pil_info.h"
@@ -51,6 +52,8 @@ struct qcom_pas_data {
 	bool decrypt_shutdown;
 
 	char **proxy_pd_names;
+	const unsigned int *proxy_pd_performance_states;
+	unsigned int num_proxy_pd_performance_states;
 
 	const char *load_state;
 	const char *ssr_name;
@@ -79,6 +82,7 @@ struct qcom_pas {
 	struct regulator *px_supply;
 
 	struct device *proxy_pds[3];
+	const unsigned int *proxy_pd_performance_states;
 
 	int proxy_pd_count;
 
@@ -167,7 +171,12 @@ static int qcom_pas_pds_enable(struct qcom_pas *pas, struct device **pds,
 	int i;
 
 	for (i = 0; i < pd_count; i++) {
-		dev_pm_genpd_set_performance_state(pds[i], INT_MAX);
+		unsigned int state = INT_MAX;
+
+		if (pas->proxy_pd_performance_states)
+			state = pas->proxy_pd_performance_states[i];
+
+		dev_pm_genpd_set_performance_state(pds[i], state);
 		ret = pm_runtime_get_sync(pds[i]);
 		if (ret < 0) {
 			pm_runtime_put_noidle(pds[i]);
@@ -873,6 +882,7 @@ static int qcom_pas_probe(struct platform_device *pdev)
 	pas->info_name = desc->sysmon_name;
 	pas->smem_host_id = desc->smem_host_id;
 	pas->decrypt_shutdown = desc->decrypt_shutdown;
+	pas->proxy_pd_performance_states = desc->proxy_pd_performance_states;
 	pas->region_assign_idx = desc->region_assign_idx;
 	pas->region_assign_count = min_t(int, MAX_ASSIGN_COUNT, desc->region_assign_count);
 	pas->region_assign_vmid = desc->region_assign_vmid;
@@ -908,6 +918,14 @@ static int qcom_pas_probe(struct platform_device *pdev)
 		goto unassign_mem;
 	pas->proxy_pd_count = ret;
 
+	if (WARN(desc->proxy_pd_performance_states &&
+		 desc->num_proxy_pd_performance_states != pas->proxy_pd_count,
+		 "proxy_pd_performance_states count %u != pd count %d\n",
+		 desc->num_proxy_pd_performance_states, pas->proxy_pd_count)) {
+		ret = -EINVAL;
+		goto detach_proxy_pds;
+	}
+
 	ret = qcom_q6v5_init(&pas->q6v5, pdev, rproc, desc->crash_reason_smem,
 			     desc->load_state, qcom_pas_handover);
 	if (ret)
@@ -1798,6 +1816,33 @@ static const struct qcom_pas_data glymur_soccp_resource = {
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
+	.num_proxy_pd_performance_states = 3,
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
@@ -1827,6 +1872,7 @@ static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,eliza-adsp-pas", .data = &sm8550_adsp_resource },
 	{ .compatible = "qcom,eliza-cdsp-pas", .data = &eliza_cdsp_resource },
 	{ .compatible = "qcom,glymur-soccp-pas", .data = &glymur_soccp_resource },
+	{ .compatible = "qcom,hawi-cdsp-pas", .data = &hawi_cdsp_resource },
 	{ .compatible = "qcom,kaanapali-soccp-pas", .data = &kaanapali_soccp_resource },
 	{ .compatible = "qcom,milos-adsp-pas", .data = &sm8550_adsp_resource },
 	{ .compatible = "qcom,milos-cdsp-pas", .data = &milos_cdsp_resource },
-- 
2.55.0

