Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3DA411F9D
	for <linux-remoteproc@vger.kernel.org>; Mon, 14 Sep 2026 08:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789375423; cv=none; b=F64hnDXaWSZUBZUYlx+n54tzAkKKlcmyUODGU1QlB40ILMYCBYnsP7zND4v0j5jMY8h/eSTs4JJgwf6z5HSggDX1qU9QDa+fkgIHJoHcO0tWym40E3rcaUhC50stRMhE1itwDogxSMhMZdYzw0o1dY1preT3mPFY9ecya4gdTcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789375423; c=relaxed/simple;
	bh=vqE0EoMrlaW3tUQpmOPadAmdMy5Z9QbC3HqKAUDOUuM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jXmzDq80tAJClDvRso7sSbX0iWphjGe9Befl2VdpY0dRy3cl+FQ+tX6/VBKg9M+Sos2r3gk0su07tOBYZLbAMvLvJ7DX1ZainG0O641+FW5ZgHb05yzIQ5HniXc+iR3X6ILBliwDl5mYHG9b9OXjVeK7tAuGp/XwfikWpJ2K32A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gX2kYUav; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P62LKLyo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gX2kYUav";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P62LKLyo"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5ikNC4057510
	for <linux-remoteproc@vger.kernel.org>; Mon, 14 Sep 2026 08:43:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Ga1VKYJb4kZ
	EzQaYZ2oJoM7S1SqpasGSncxMKcHofsw=; b=gX2kYUav5ISCq4fftUsbdbQFdV6
	J8F2r/uDVcgmVT8mgZ3CKa3/t1UzhoQFSKV3CaqsonsM70MHWaX+Ws6mTDGD3Zih
	WmnoQeatyWSsGLx0VlXiImMi0U5UmNnhEB+g2DAilope6wPWLIrVrfAhclBsAXuc
	QkDnsONBT+MEjW2t0QhkBhSu2FIa+pA91PeH4HiiWUSAS1d2sX4H7blJPLCruHiG
	BeunEWmAaDfniN6J4khk7TcYSDObvN4vgl25R0zc9ZEXni8/J0eG/rsXj7j/v4dd
	YHtqWmGv/dxIvtoytoSip/Vt1RfJBFQVp9wF7WVYjBoExzMArA1uPHX9WlQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hssk5x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 14 Sep 2026 08:43:33 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-396901263b6so6359187a91.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 14 Sep 2026 01:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789375412; x=1789980212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ga1VKYJb4kZEzQaYZ2oJoM7S1SqpasGSncxMKcHofsw=;
        b=P62LKLyot+WhOKifOkOXK9sViVPDl1+GGp/ml/dyEUP0cVOjTREDpFpph2VlixckMe
         W2KvFuLprLcvCScoQVR7wUAfx0j/CmMkd8xlVims5vXFh06T18zo/WWyxl1ejBLxI2BT
         iYedeujLcJ9HhegpB6XvP9dRDakt74LYEO5je8fCur7kKQJY8i7KP5thKoaYuE+aFzs7
         AHHLSI6gzx8irrMRA514jFRmbRT1BoPxX997iLfRODttz55bsng3siQL1md17Pwnz3Wc
         TdUmetsK22jR+jNbvHDJx7TKXV59Qd+2eDzWXCN4VE5QfQTdMsZsuFszXaQaSNbDURGF
         NTew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789375412; x=1789980212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ga1VKYJb4kZEzQaYZ2oJoM7S1SqpasGSncxMKcHofsw=;
        b=pzoioRL3mXfWjRdYOwFRp5lzF/PNwm4OKcAMg1X1pjkmHqPcXogzKQu7iMdQuLaE6B
         apqBv1ua48e/9m2hiBNOm0isfZ11FWKF6HJSUWZjkRsBLwO2HPvUIfdzvOrEz/8eSZiF
         CqSbSgT1++mnDC2yR5L3pC6L+YHv900PBbSJu6H66Rq8oRrS0av/M7TOs7ubaVUPg8BR
         T5NJty9hMtcWbxsMOT2Zo0h/sFfORISGoEnyZmjJFQuCra1mo8ENxRr3ztSOvOZclGvD
         bQck2RtJg/Bpn0Z8XQc7ZbRUYI85N3R0Y0i7vuqeDsynHnzjkY8SuNHht37iYElm3n79
         1hDA==
X-Forwarded-Encrypted: i=1; AKwUvByRJr10etFslDT6cdCgfNGCwUyAOahZ93tNjjTJw1oBbVj2w8dbkxAH0DeR15HAgIkkdGvZZohA2XrJZdPLKhGQ@vger.kernel.org
X-Gm-Message-State: AFuF++mG9CGt8r4xACUdXPUMmchwSMFC/IcHwv56F9RG+IwiGBMeu75i
	RIIJRhykE11paLbe+pZKMxuk9GtiTWctYeDLt5lRiBzTcewkC4Qew+rpy82bh3Nx588g82f0J2p
	eXkMqvy/oCZr+JQExMoehfPPaSY+5r9vBQNEH6eWU5lE8E60nmUjnSFkFOVLnDrdPOLpddWrD
X-Gm-Gg: AYBFou1527F05ja7M2vretORgX6ZCPhADjFACqljZ/E2pMZavxOCdSf6zNRI237lXa1
	NUmJcjX/Wk2rT9aFfX6itp6/Alb6IiKH7deoJTTZF1yKEyGH1uSmeEjMQuX8Iy4qNtlkcA1+win
	Wp5tuyp2luARpGxDPwJjNhU547mT6ddRQVIJxH4HDrnfKVcJjKUWCauswD5cFICqqhbPDR83Y5B
	WaGtX8Sju9EmHn4eoArq97oUnIxIz7SYoZHphLxidt0xskBCvjRU3q4OnM6BLPTqGnrdauQKcQd
	MtRejVOgW68JVdp6TBU6dNN8EiTQjoXpnr1lWVu38cHOLsEOxHMtuOUuzmG/gFT+pYDneToGIxf
	eyxl7UJ0PIAYqkYJVWUCp/ixtbSs=
X-Received: by 2002:a17:90a:ec8d:b0:398:e73e:5a0c with SMTP id 98e67ed59e1d1-39debf548dcmr4039377a91.1.1789375412220;
        Mon, 14 Sep 2026 01:43:32 -0700 (PDT)
X-Received: by 2002:a17:90a:ec8d:b0:398:e73e:5a0c with SMTP id 98e67ed59e1d1-39debf548dcmr4039280a91.1.1789375411648;
        Mon, 14 Sep 2026 01:43:31 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b97994sm44692673c88.12.2026.09.14.01.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 01:43:31 -0700 (PDT)
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
Subject: [PATCH v5 2/2] remoteproc: qcom_q6v5_pas: add per-PD proxy performance states for Hawi CDSP
Date: Mon, 14 Sep 2026 14:13:12 +0530
Message-ID: <20260914084312.3812408-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260914084312.3812408-1-mukesh.ojha@oss.qualcomm.com>
References: <20260914084312.3812408-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEyMSBTYWx0ZWRfX3PQ4phL9uRWV
 IW4B1HBPSdfGE4yp9KcEo6BM/qHNKoRGBbgJ9y9SDKYLEVHmoxuoJGkny4/Jlu58n6yxGIonzRH
 ebLczBil3WBI+2erK1gBEIwSSaNG2UOdk1s6ooa1le5f60sY+bddeH9mkil/Oqr2LtrgQBMkW+0
 G8KtNHnlQdf36mhPjWJ4Hh4FNVae0G5C6WKK/OqBeMMo4UjJ7Xcb2z2hbtT6yXvoZuavvXqNoJa
 eA8soFGCIhNRW7StDPBLAz4S8m/Xhkq5mvq6zv4U40nbgebJSmAqAeo7zkFDHxpGRzDlEEKoEtk
 Oi1OOOOJUGLVVbK0QpzBPaY1v+otuMxP6iseFe0oA2SCy2m+Q+Z0LIzVQA2c/RGJ7nbz87wTGVp
 Lu7KZScP75UXrQJT1w9CZrvnSv3mglA4kmnVjlYsQCkxOdNcDK7VITIslOVGtHv/jrPEdaI1j8h
 YgomUxOmpjVoXCsrgpA==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa7b3b5 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=EzEDkhfgfUAEW4_RwPsA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 02OUsqYZN9vRjitPnpSTOdE2qLj1Qh_l
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEyMSBTYWx0ZWRfXw/xljFIMHBBl
 GOhwzbuO6ZXGcHbEXEgnTXUEqEgDoVnkE/j3fflUuCYQ8Fbwvub0zP/jlhhy16ZD7NE0krUUli6
 gxDeqnoyTxlIWrGSq4GCo7KbW+o28GU=
X-Proofpoint-ORIG-GUID: 02OUsqYZN9vRjitPnpSTOdE2qLj1Qh_l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140121

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
 drivers/remoteproc/qcom_q6v5_pas.c | 49 +++++++++++++++++++++++++++++-
 1 file changed, 48 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index a005546c265d..879c465c4a7a 100644
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
@@ -908,6 +918,15 @@ static int qcom_pas_probe(struct platform_device *pdev)
 		goto unassign_mem;
 	pas->proxy_pd_count = ret;
 
+	if (desc->proxy_pd_performance_states &&
+	    desc->num_proxy_pd_performance_states != pas->proxy_pd_count) {
+		dev_err(&pdev->dev,
+			"proxy_pd_performance_states count %u != pd count %d\n",
+			desc->num_proxy_pd_performance_states, pas->proxy_pd_count);
+		ret = -EINVAL;
+		goto detach_proxy_pds;
+	}
+
 	ret = qcom_q6v5_init(&pas->q6v5, pdev, rproc, desc->crash_reason_smem,
 			     desc->load_state, qcom_pas_handover);
 	if (ret)
@@ -1798,6 +1817,33 @@ static const struct qcom_pas_data glymur_soccp_resource = {
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
@@ -1827,6 +1873,7 @@ static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,eliza-adsp-pas", .data = &sm8550_adsp_resource },
 	{ .compatible = "qcom,eliza-cdsp-pas", .data = &eliza_cdsp_resource },
 	{ .compatible = "qcom,glymur-soccp-pas", .data = &glymur_soccp_resource },
+	{ .compatible = "qcom,hawi-cdsp-pas", .data = &hawi_cdsp_resource },
 	{ .compatible = "qcom,kaanapali-soccp-pas", .data = &kaanapali_soccp_resource },
 	{ .compatible = "qcom,milos-adsp-pas", .data = &sm8550_adsp_resource },
 	{ .compatible = "qcom,milos-cdsp-pas", .data = &milos_cdsp_resource },
-- 
2.55.0

