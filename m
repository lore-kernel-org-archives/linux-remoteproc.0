Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CF93D413A
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2026 07:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779175477; cv=none; b=eGmJyt49vTEuTAyv6Qgm2isgwE1gtVNOHsTLlbvwGveNXo1NdswTKyJa1yPT0ATiXe5Ei1HsDYv+YwPu0mX3xGOggcbnSBVZgjt2Gxv3VceQScn+MlA5RCTxyovbG7i0MrSbOVEu5sgkxZixTU/aglUPGeXVSFO2HLDZYoqRdh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779175477; c=relaxed/simple;
	bh=T44s3TASdJnSBhWvx3N7ChQPB/5DJbCT54AUqTmjxB8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hmAemqGO3rn/AgQ/pT00jtX7Fu8BGe4duHMnNEor2KNld4TitJJKyjOBrfgTctdsxBPwraGs0gX+kfjRhDwUyUThQXgpn7Y8bKeAz7zxaWjgIKzl9jH2fBsK68rGSxCr84Djxayi+c0ZQXNQYyqrJ8KWfxx9EYdxYTgl4WdAM3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gtLNAinw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NY24tvAF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gtLNAinw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NY24tvAF"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J4oLd12482404
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2026 07:24:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jmqp3mmuKa++YH5YsnTqYgztsMnKTWnZkLg92GCMCNc=; b=gtLNAinw4jjDSCiw
	t6Mpon3EoVXm3K2JeSHFmbZbJs2P8jfH1L/5rjcI6Oi4eQRekElJ9lfl6tML6xhD
	SeJKzKCmtuwpUMtytRrjgRRcNtvrPUulG8bkcsxJE4L2vjeUd1owwSV82T46ESyN
	+LbisWhifLdSF4ZV/OhgV0EtDd7Ha+8qGFJqITOx5PCot0AhVVxKNURjQ42nIvfi
	0zGw3hUUltJrHrBqDYVUT9oALDtXGTjdYF//JS0kcYRckAAKWBeUIj6UQD0lcWQt
	d8zKFhHiLGjBW+miY1AViLrLM2Wo0Q3iqy+Uyy94/cA+pDdfkk2q1nIxQwtTU6XM
	FM71xA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e81rvm0tf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2026 07:24:34 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2f3ec2e8d07so14624439eec.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2026 00:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779175473; x=1779780273; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jmqp3mmuKa++YH5YsnTqYgztsMnKTWnZkLg92GCMCNc=;
        b=NY24tvAFN+KuM8eVafyYnbCus0bQjkpJd3Q5HN3R46jC591UP98zKqvT6eDMpjmoxk
         e66f0mMLQwBCFdeerEORzlI6+tho1qThK3dZzSBoDDKsjEId2cruqPt6nnMVZwZz9Tav
         oIi8m+QtiqfhMxEhI52EsgKQFNPG+yEZN5PYpLlKAqVsl3iyryqx7UCZgB71XN6Dx/i1
         iGuL5kBq8gvzVTYahwejdfaGO0d3Tqundg0Sn+hPUIm5uPQLTcUcPy5FQTMaY1pyEKgo
         a6bck3mQVXF1X7b/fIJkl1vwh9yAQshitI0vCmPb1QhhIUBEOd4ROPyVFbxAy0Yp1J56
         C2gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779175473; x=1779780273;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jmqp3mmuKa++YH5YsnTqYgztsMnKTWnZkLg92GCMCNc=;
        b=gvRfvq1zn2Ooz85kgHjdMZPQB7mK2lL5VdEC8XFD1QSmO4gLXA7fQ8rLAmEFqSJ0XO
         5TH2Wsl7uiBcUNgPfKVQLmm0be1X96z2DuNYJL9C9EYDwxHXKWAjmtsiZ624phIDqLBW
         KJ3e/Wv7sErR3JvI9w7flMhY5Mxs3PDq2QesjgtAmqkZNIsXpD+0ETW117tENgySI7+C
         qIhlQCZxAcH0xXdALlTMIghLdRyIrmjtxUoqJrq66+mdTvKPoyC7CexpjKFBOmcYFaBT
         Q64d5Rx63JN3dc+o7vaA+3VfoTtiw/F1+DPtzxrt0/e0RQMMocclY5kwQGzhbiNhsE5s
         6CQQ==
X-Forwarded-Encrypted: i=1; AFNElJ95tC1aQ8Z1n6KGD9XcSpSx0dvu7WXxNYnihNw5pU/XEk3z129ut1SRe3RGdq++vHbSswetHsp/YWWKH0IZq8aL@vger.kernel.org
X-Gm-Message-State: AOJu0YwR5GvMLBcsINU522UfbVTHtumeMViJJf6har2Wug9hEtSEGlfW
	R3qWM+a7A1XgAFPVwHmWO0uN0OkUvIgpHsAW7of9N8bVPZ4vqpod+BTkuc/lxPsjmqSgSeBFQUh
	DxTo03H7O01wYdhAbK+s6aMLpSeoFbKHd5Ryxrn40wMRhP0H2SiA1C8J+HoTF7W1YRd9npQf+
X-Gm-Gg: Acq92OH5dCYkjAwi6bJXT9sSPciKPivTQb0srG4dnCTiX5BhiDARfsTRASg73Oeh1HS
	5oum8VrhqYlU/L5v4T57qEw53FnDt/ejGDrFSgGVBSFA9KGR3Pq8xQkSqdEfzdA7GhgNYU8BNsQ
	350r13slYg7/opMI6FaW7RubDvO1beBSNHOy8WaV7gFQFz2C829ZXB9EU8Ho4dp0QOqjxOJ4maZ
	eBsxtbV1H4VNwKaBPPpaH23NklsuFpuCrwzqlMdICGeF98+Mqviq9O8xFgQkbuKnhpPVfNTfm9D
	8pjKUtE0YTM8x+eIaFMCpj72blKH9IJfYrW7A3pPeG/EmF7gMzbdhOTDxYJvaBiTVDwYpfsXCJa
	fU6vlvhSeub/KOTYkaFmcFU+XNdltZUVC/NLnY0m0xSIWYAUAodsT31k1O45/1RbYRKi8ozf+
X-Received: by 2002:a05:7022:2397:b0:135:43d3:284c with SMTP id a92af1059eb24-13543d329f4mr5539955c88.9.1779175472913;
        Tue, 19 May 2026 00:24:32 -0700 (PDT)
X-Received: by 2002:a05:7022:2397:b0:135:43d3:284c with SMTP id a92af1059eb24-13543d329f4mr5539943c88.9.1779175472389;
        Tue, 19 May 2026 00:24:32 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbed2232sm23337779c88.7.2026.05.19.00.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 00:24:32 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 19 May 2026 00:24:24 -0700
Subject: [PATCH v6 6/6] remoteproc: qcom_q6v5_pas: Add SoCCP node on
 Kaanapali
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-knp-soccp-v6-6-cf5d0e194b5f@oss.qualcomm.com>
References: <20260519-knp-soccp-v6-0-cf5d0e194b5f@oss.qualcomm.com>
In-Reply-To: <20260519-knp-soccp-v6-0-cf5d0e194b5f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, shengchao.guo@oss.qualcomm.com
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779175464; l=1799;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=T44s3TASdJnSBhWvx3N7ChQPB/5DJbCT54AUqTmjxB8=;
 b=3R2bur04NLC9mbzUIEVCHdRIjCSiX7c8tDr4/ZvfHNleQwg5SpI/XwPd+VQtlHlQVM7lrDEH2
 /KBVnDvsOKNAXw+teUkL2UaquJHrLlbKE5A/DTxSk9mO2XuyqlgSWnW
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA3MSBTYWx0ZWRfX0NmUlExHWMIv
 MxHGAjSSFEmYTLY54EC4Ew2crqIJSe7yw1O/uWu2eDN9woiXIssSCqyYQwRS2/uBEdrDJ9Ou3UB
 D7SDursXVVCldBCpuhYPIKxW7bAlHU2xJAunm6rnn7abX3ht8xyGI+hSSWbw98RK5+US8A0v103
 lMF9fOAVgKrlek5nJVYNaHNvwIGqOPgyLKrh6+qLmH0/wqQJ79/E3046a+ajq4xTSbPiQJcuuhS
 IMg2rA9YMZQhZ0n1Omd/ssDeDHxlY0SteoCBaBPcvhAMJ7SRekaaKOo093QwvPevmJDzow/8DUY
 xXNC+jy85boo4P7LyAaQ8r02/DF/fFUmeqmF2NP2nHdTV0+YwQBu9//Yd2dgP7FMdj3pqWsYxH+
 byTZw7Mhx8NQKU8wPNIc7Iwa4WpMCvHT1NGEIKrIbFItJkASfSTiK2duWZkdRaw+LIEAWJkOwKC
 56avaD//N8S+9TNqP0w==
X-Proofpoint-GUID: 1tjlJ5hNfksPvD6esYIXy0N036LjPJ9O
X-Proofpoint-ORIG-GUID: 1tjlJ5hNfksPvD6esYIXy0N036LjPJ9O
X-Authority-Analysis: v=2.4 cv=Lf0MLDfi c=1 sm=1 tr=0 ts=6a0c1032 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=-54vo4t_4OUFHp6kYXwA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190071

The SoC Control Processor (SoCCP) is small RISC-V MCU that controls
USB Type-C, battery charging and various other functions on Qualcomm SoCs.
It provides a solution for control-plane processing, reducing per-subsystem
microcontroller reinvention. Add support for SoCCP PAS loader on Kaanapali
platform.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index ac2a00aacd2e..d2ea26562c07 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1588,8 +1588,26 @@ static const struct qcom_pas_data sm8750_mpss_resource = {
 	.region_assign_vmid = QCOM_SCM_VMID_MSS_MSA,
 };
 
+static const struct qcom_pas_data kaanapali_soccp_resource = {
+	.crash_reason_smem = 656,
+	.firmware_name = "soccp.mbn",
+	.dtb_firmware_name = "soccp_dtb.mbn",
+	.pas_id = 51,
+	.dtb_pas_id = 0x41,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		NULL
+	},
+	.ssr_name = "soccp",
+	.sysmon_name = "soccp",
+	.auto_boot = true,
+	.early_boot = true,
+};
+
 static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,eliza-adsp-pas", .data = &sm8550_adsp_resource },
+	{ .compatible = "qcom,kaanapali-soccp-pas", .data = &kaanapali_soccp_resource },
 	{ .compatible = "qcom,milos-adsp-pas", .data = &sm8550_adsp_resource },
 	{ .compatible = "qcom,milos-cdsp-pas", .data = &milos_cdsp_resource },
 	{ .compatible = "qcom,milos-mpss-pas", .data = &sm8450_mpss_resource },

-- 
2.34.1

