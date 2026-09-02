Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EA34AA1CD
	for <linux-remoteproc@vger.kernel.org>; Wed,  2 Sep 2026 20:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788381842; cv=none; b=lC6YDRGf5NXDafeynEQ2YnKX/vvCCqouL179Kw78HBHoSJf+h7NvbdbJosinSn9KIHJu+gitMnpPWLjZBjO4gBQ+LnpVWLzwfhg/k3Ac19/d1WRKtIbf8WkbQodErYqeUh7mhoz1qG/B+dALXYQtjefBVDvfIpbzt/8xy+5+2LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788381842; c=relaxed/simple;
	bh=1z4hVKzisxhIRAyUw1nUzgWZ8W2mVCExFvXktTWACio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BAAUPIYaIt9UdFWRO2VT0XwfFGTHheahVymidHbRkhVmKqts7TqQuQiXcKQ8msX4ptlDhTWt8cqFJiuWT7NZv/AiXoRWBnt6AYgiyVtmjnjI+AL6ZLCE0+FRw2aGnOPpt6W3EatbVH9PQ6wPzZKDx8bQf8nifHwbCjgpm9Ze69k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FV1B1HSm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XRXsCEvv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FV1B1HSm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XRXsCEvv"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682KHP2w1383217
	for <linux-remoteproc@vger.kernel.org>; Wed, 2 Sep 2026 20:43:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=anNy8s/uZds
	UFbHr0PSErFrn5JflynV/wHlQiG06h5o=; b=FV1B1HSm06f0R/HNIafhtB49I5c
	YN09Aw27Q6EyVsunlo5GvQWhlWrza+Pz/pl1CtiaSy9KFIWjoTDAmXAkLRJroE3W
	4QZgKDMswho5MH/nsJgXZgjrB63WGYT049TbkZQuNyZ9CDj+flYSDrxgvqsrbLwT
	glfptu35bZ/mdigTHDmmJ0MI4yF7QgUJ37x0SNwYiDkkr3NW3fUMjVFMwo3eAtud
	oitv64Y2zOYmE4bcUlJpklm2q32WTy6rvwoB9N0uqR1KVWnpK2ITHlvOAAxV1wwR
	nQLEKEyukJy4ldCoqrYK97IvIrYrtpDcOqLnZQmgne75bSASPW/YZyhvhsg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemja1vd5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 02 Sep 2026 20:43:56 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e7ff7b375so2157231a91.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 02 Sep 2026 13:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788381836; x=1788986636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=anNy8s/uZdsUFbHr0PSErFrn5JflynV/wHlQiG06h5o=;
        b=XRXsCEvvm/Q1EMLZ3zVnlQKcMY5/bOnnxXp4o41W9goBcODfGxP5NZLIta0D5IiUlE
         +5C8qyJZGfWGkDB9uZmx4lJyaTXX7Rbys7Kfv0vKL9ezcM/A9fQHwAu0LgzXQRpEEGTs
         bwzh4TaRiGxzHGsAUtPivMARY7WSR1Re8zN2xETx+e159vxEkzw2hUx3s3Tqyj86vWqq
         rDUWnmwnXoBglAV354EjcWbC58C6EL2MiurdPuxR+uGenKSJ1vA6Mrpog7Qx9UxQoX3y
         Xx04nnfWYcFeosADRtJssy9k6IPoX2cQzgW/WvOqB0Bvq5+mwrCwRLTPptQEggNRgI2J
         WUWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788381836; x=1788986636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=anNy8s/uZdsUFbHr0PSErFrn5JflynV/wHlQiG06h5o=;
        b=MpT0eNXMCjzlOjXk8SQUo0srNEtctxxbeQSi7Vyhou0nBIo+rrjbVpLjA54+irgs+w
         RWsxj5N2xRexJiEYLj5P3fuDhCu6Dy30vU3yOUcbOb0sanoarfgHcuWHo5nC+k4hHR+t
         xdr7nyQDVjqJYJ5WPj/UXlCi/iXRNxVK8C8A1IVHwcl9Kv4spt5iK6lOgZ2SZjpXgyX8
         1xRSTXNzPeYYk84HqlsWo0viVUGJWMScVQYyJbgcCgmQm77tueBAK3OTgZA0ZXPUyjs5
         K+l7Ia3D8GuKfmZ4yf/aMD33a2PmjsCSdZxSfaER52+ohreSAZNkbGIL35nRf041zAYm
         +dwg==
X-Forwarded-Encrypted: i=1; AKwUvBwfYKOOopidpxilP62zd/bFpmqjyB7c80rTbKCcl3ZJ8veUNt9aa5eKFnR5LQ8tWiJ0UBVq21UgrnmtXn07QEeT@vger.kernel.org
X-Gm-Message-State: AFuF++k0olI7nTl2fP8HvAoOT9zCG/WnWjuYBubEFK5tf4rb4nh2zSiZ
	SjZ9WITz6d225MyuDyWJAd+r+EidaqRL1KfBxYgIkgKcWH9bMIMgw195KER77wQp5xkWAXhbWFp
	SMRwL2PPVOPFMt5R9MpN1JeLsZlVKRqAdEk42EfCi+DKGcjeNVyPZo3/0WqeZjlb7EkbgPnIG
X-Gm-Gg: AYBFou0+wqhfNgpYDuOhcvNeaZNDIk4cqkno/YgFDK2NxN1YO8RqmwoL1AXvpQFdjWW
	DdPC3bq8OpMEV+N86aQKZjXlzYVC5zbPIdiIDzYCa7dZV5rMtphcWdM7+JQ9Jt7g8adExX9BGuK
	LYmPY9aF7SA9rNwKoxtmFQ+iDf93ns0nu1iCcY99i3EXMzKF9exc/+rycIbKN6x2jP2j+iMtyx/
	6h0jE23GX6OE2bofkwcobLZYrglZSht+2OlKIISjMCaGZYljDMZTgSpNGc5XggMhbvrV3T1gdXl
	MWDbjwSogZi9W4O0xL+V8Zh7KHbFQwPMzKTc6m2vwpwuYYaMPMbO+ycHBF06rTFhi18s4p+sZN4
	Z/gblWpGdrianO1gtPHwz5Rbo/cc=
X-Received: by 2002:a17:90b:280a:b0:38e:250b:122f with SMTP id 98e67ed59e1d1-39aee085053mr11007114a91.16.1788381835976;
        Wed, 02 Sep 2026 13:43:55 -0700 (PDT)
X-Received: by 2002:a17:90b:280a:b0:38e:250b:122f with SMTP id 98e67ed59e1d1-39aee085053mr11007070a91.16.1788381835393;
        Wed, 02 Sep 2026 13:43:55 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33255d39d21sm613338eec.16.2026.09.02.13.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:43:54 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 3/3] remoteproc: qcom_q6v5_pas: add per-PD proxy performance states for Hawi CDSP
Date: Thu,  3 Sep 2026 02:13:34 +0530
Message-ID: <20260902204334.2061226-4-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902204334.2061226-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902204334.2061226-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 60zdvgSbW_zi0uSh5dCl42xZt_pudCd8
X-Authority-Analysis: v=2.4 cv=FeAHAp+6 c=1 sm=1 tr=0 ts=6a988a8c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=EzEDkhfgfUAEW4_RwPsA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE4MyBTYWx0ZWRfX+EPLfjprLWIk
 bl9p3v316v0DDFK3z5uMtJpirNHi5IAJ242pDIo10aC8c9B19AUSbG9RCSPcu7jlQzVabEZf04i
 NRy1BhPeDb5FCWwapsaKBiVIx7aRE+g=
X-Proofpoint-ORIG-GUID: 60zdvgSbW_zi0uSh5dCl42xZt_pudCd8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE4MyBTYWx0ZWRfX9csm6zNrGZh2
 KyR6l7boD8GvX4drHIE13KBf8sHw3SQEB3eHL3HSp1F5MLzwK6KDWYNELV3zoaBwjepYCMXV0gP
 rxlTLYM4I/auWNYFpOjzDHegeohC+OXZys0bAgxliz9R64ZGszIRRnBKvmU2g38HQ5HKkHFg5Dc
 YeI5LG+NQqBsJtBDbmExVFRsV/EnFmpEH5dFJjWPmwyb3BK3PWeLALn84cLv13a9VcDZhi0Z2Oi
 mnQAofOE+nJZDPOqpMV7TMT2pGZYHMBaYK/fiGlnTJT3mMwJPA53HwVtEMFGH4dJmgXDvRRwiin
 /slPHT5GWkZwklO4t0DtEqbggsAyNem+QQtdVbYScmCylTk2Hxr99/THel4jHOmZ9BKYGPV5NNo
 ZgTJM9qYEij7D4k7vhgvVXZRh7tp2c8sPQVnxddbqQj+NxdfI5lFtTZZ0DAjem+BOyqSrNIkzUF
 TfNKpe6ZBn3wjs3qD5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_05,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020183

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

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 50 ++++++++++++++++++++++++++++--
 1 file changed, 48 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 01dc0194e130..c8bba2418d0d 100644
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
 
@@ -167,11 +171,16 @@ static int qcom_pas_pds_enable(struct qcom_pas *pas, struct device **pds,
 	int i;
 
 	for (i = 0; i < pd_count; i++) {
-		ret = dev_pm_genpd_set_performance_state(pds[i], INT_MAX);
+		unsigned int state = INT_MAX;
+
+		if (pas->proxy_pd_performance_states)
+			state = pas->proxy_pd_performance_states[i];
+
+		ret = dev_pm_genpd_set_performance_state(pds[i], state);
 		if (ret)
 			dev_warn(pas->dev,
 				 "failed to set proxy PD %d state %u: %d\n",
-				 i, INT_MAX, ret);
+				 i, state, ret);
 		ret = pm_runtime_get_sync(pds[i]);
 		if (ret < 0) {
 			pm_runtime_put_noidle(pds[i]);
@@ -877,6 +886,7 @@ static int qcom_pas_probe(struct platform_device *pdev)
 	pas->info_name = desc->sysmon_name;
 	pas->smem_host_id = desc->smem_host_id;
 	pas->decrypt_shutdown = desc->decrypt_shutdown;
+	pas->proxy_pd_performance_states = desc->proxy_pd_performance_states;
 	pas->region_assign_idx = desc->region_assign_idx;
 	pas->region_assign_count = min_t(int, MAX_ASSIGN_COUNT, desc->region_assign_count);
 	pas->region_assign_vmid = desc->region_assign_vmid;
@@ -912,6 +922,14 @@ static int qcom_pas_probe(struct platform_device *pdev)
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
@@ -1802,6 +1820,33 @@ static const struct qcom_pas_data glymur_soccp_resource = {
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
@@ -1831,6 +1876,7 @@ static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,eliza-adsp-pas", .data = &sm8550_adsp_resource },
 	{ .compatible = "qcom,eliza-cdsp-pas", .data = &eliza_cdsp_resource },
 	{ .compatible = "qcom,glymur-soccp-pas", .data = &glymur_soccp_resource },
+	{ .compatible = "qcom,hawi-cdsp-pas", .data = &hawi_cdsp_resource },
 	{ .compatible = "qcom,kaanapali-soccp-pas", .data = &kaanapali_soccp_resource },
 	{ .compatible = "qcom,milos-adsp-pas", .data = &sm8550_adsp_resource },
 	{ .compatible = "qcom,milos-cdsp-pas", .data = &milos_cdsp_resource },
-- 
2.55.0

