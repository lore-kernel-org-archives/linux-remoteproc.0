Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83155474F
	for <linux-remoteproc@vger.kernel.org>; Sun,  9 Aug 2026 12:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786278643; cv=none; b=WmF4HtFyiyFRIDq3vOGrIYTOMqWYYyOhbMt+qnkn6orMcS8zla30Erv7X4jdBjrbCayKxpp2CVQxoatpz5LsZqi0A0DgdjS6RVzYDlHZlag2ikT41cXnOoyAyIDFaJLIeyLosJkUFeNEECWIEhECAcbWEpCqbbZKeuiO0grBLAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786278643; c=relaxed/simple;
	bh=B4aq1yOKEZGsE775NUNcG7RD3TIx3tEAKPyIW0OCFew=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FTaV8B6qSIxmgLa1roBaI0sClg2FANhS9x8KzWANLshyJLEde30WVoKGUvkV1Q3L0c8YZU7ibqF7tPR64PEPz977//xnm74ZKktoys5sN9vTo4z+JcG7JC43a77LWcSayl34JhpwBeNbvOzhKIimRjmymtHKcngmescJVIOmuCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z6AtAXLW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R8Vpv7Pn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z6AtAXLW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R8Vpv7Pn"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679C1Rlv1944933
	for <linux-remoteproc@vger.kernel.org>; Sun, 9 Aug 2026 12:30:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UYo5Cg7K0tncVfDjQFA209BANkgOUDdVw0Wtrd7/h48=; b=Z6AtAXLWozwOSU3l
	JqyB+QodsjJXb/P+YmoZSPFw3deOCzedkHEMtjzoZwhQ6elXF31QxhHwC9f4dN40
	T25FTv4cBtbYZtiJbEhbum5e4x/DDwXilh4RGZbweqTpBerTi3v1nxbi7oSlcrJP
	N1InntDJHxdrtEwD0cQliUbq+PUfXeD3854uzpJTsmF/3sE4ZyyyRKpQ69EALRqw
	e2EaFYzCzqDanwxdhBGxgCedVBK/5XARz2t6Eouo0uETh9eHfmpnzd5TpV/fylO3
	Ar/DGEobFoL06oDcM4kSqFFwl/x4DwckBVbhAf8awJoSZvVSr+AHP10UeIjjXQ7S
	QYH0AQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwwmgtreq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Sun, 09 Aug 2026 12:30:40 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbb467e56aaso1300137a12.1
        for <linux-remoteproc@vger.kernel.org>; Sun, 09 Aug 2026 05:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786278640; x=1786883440; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UYo5Cg7K0tncVfDjQFA209BANkgOUDdVw0Wtrd7/h48=;
        b=R8Vpv7PncAUhfcF8nsIRbgYWZqsAfEtI60mWH3xLp1Y4xOEJmqmjqS2W2P56BFRBIp
         BNcJAzDJegI/lmTqHLvM4Xp3c++T41H+XHnF/CeWpZrNt0PswLrafpS4NLu3AwX+xOFq
         0r8UAyYxt/H/yCmQ2WSI0Z2dkrtS8GViK0LNTwyNUcigwcpzxuCmgdkpA9Kf+cxpe6qQ
         YGZ3Qi1WLjW3cwGJbGSdqAUKKAWfGgvEZnf63qo92g29KMqEu0m2mKxMVRtnIuQ2PGzU
         sSbWr4ArcsIW+A+sk5HiqZ2yP2tUb2i7dBKJ2e55es4Va9yyZ/tvZF31h0/bK/gnvPc1
         o9qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786278640; x=1786883440;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UYo5Cg7K0tncVfDjQFA209BANkgOUDdVw0Wtrd7/h48=;
        b=A9j0X64k+YJ8Ci1UhyujT+2YfHej8djq+UUAPWGXUJAR8TccxvF5t9q8M8gvShpsM5
         c1y0CkUFnBmWL2F/r5b1sEWdpW1hQ918nEn/MTz2Q1DbFUljnrk1l31XQKhi6Ne6Lyb3
         PH3WxH+VdgJVtUh3WWSX/ewECNwVtpprbMv62TX1UK3n+xLfq5qPXwOhz5TSSkIEHg6O
         f7y1fbD79gA22SKpwdZ13bOL40/QVEnY7sD0uKbCQKIDw0XAXrGllWXd7e/pHDg3ZA+y
         b8RLAHHweZ+/SeoiD0ewt0vt3IvSvGGBzzyPz65TARcHXUuTEFL9eH/2UsA2WUo35lh3
         Iwow==
X-Forwarded-Encrypted: i=1; AHgh+Rpx47DrtTJrmbfwUWfvTpFj+0RWvMrbR9YZGZ827sD/JB6CymcxletwmFuOaPAtk6YsWag3kfQ4stzpcU4ewCS7@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt30NZW9vhgvcSGJSQiOfXBAauyJvOkJdZcM3eLl2vUJQ6+YL2
	XIygyDxvwNH67T4xi8Z9c2baC1AWIrAYHhqyz8XCjdydDky3+YIIBoP/NemgxSuzD+rtwl3/7iN
	gzJfrG8rM+ZEtoJvnBxvCr4Z6j5LEqXwZLWZ44BHkd0ZlKa93w+u4fpMIMrKrX/iqaym0RlbE
X-Gm-Gg: AR+sD12/xILmAZ7YKZAE0BUdusHLVVXJlPSj2cBhpPXoPsIZrgqptnR2FwgR93IL2Y+
	r3NbcTbvF/QDz1u3II/DpoUYbq73BwQyin9+DIiBZ8724+DymxHYxRRhGZBAhkTXdTX4Qob1vdF
	qQKib1WGi4z07hASNx1G1nf7Kdf+vkSqoSTrUou4bYwjPLNlPZ87haskiCWw/nGlsWfYvy7h5CL
	kRUsTcAIT5iB4ZoMGPVGlx3dICz7Qw0nYuhqu3yb7TBDCgwLDmwLQnjOLzP7TPKCUOXPT1J6LNb
	8F3I68TbWn0cX/9FlOpkWWohjnm2JCRw2cHBBzInyxmOnQPWeUXxudond3zUikzGtM+kFVpvvxD
	9IQSMgC159rw326HkoyQYD7xSx3JQPg==
X-Received: by 2002:a17:90a:fc47:b0:38d:f5bb:e0f4 with SMTP id 98e67ed59e1d1-3903c599361mr40201704a91.1.1786278640029;
        Sun, 09 Aug 2026 05:30:40 -0700 (PDT)
X-Received: by 2002:a17:90a:fc47:b0:38d:f5bb:e0f4 with SMTP id 98e67ed59e1d1-3903c599361mr40201572a91.1.1786278639160;
        Sun, 09 Aug 2026 05:30:39 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315beb88413sm51842997eec.18.2026.08.09.05.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 05:30:38 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Sun, 09 Aug 2026 17:59:00 +0530
Subject: [PATCH v8 4/9] remoteproc: qcom_q6v5_pas: enable QMI TMD cooling
 support
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-b4-qmi-tmd-v8-4-b15d47adc379@oss.qualcomm.com>
References: <20260809-b4-qmi-tmd-v8-0-b15d47adc379@oss.qualcomm.com>
In-Reply-To: <20260809-b4-qmi-tmd-v8-0-b15d47adc379@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786278595; l=3908;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=B4aq1yOKEZGsE775NUNcG7RD3TIx3tEAKPyIW0OCFew=;
 b=jCpmO6L8cXhdRBW9Wt+P9cCZ/Xw0NU9eM5cRXhlOXAVsc0LTaypQYNlUKBuRbcqG2qDaxK7kR
 Z8goDg5+xHdD/iUAcI1OTwd6w4lnc85pdRU6T5PsYrE/NGG9I4Qh+mD
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDExMCBTYWx0ZWRfX15jOvLCc12t4
 khSzp5Xn76+wIjaUE+SSqev/UzkxktoIEqrN0SuoA8C6V53CrEBmlrAWxFC4ht+CrBU+8NF3AJb
 FWIo7BVFOhVrrU+GZWAT0iAS1idNLVc=
X-Authority-Analysis: v=2.4 cv=HodG3UTS c=1 sm=1 tr=0 ts=6a7872f0 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=j6jQExit_mXiN_RbaP8A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: BjRMnEV-bsWb15u7oGQ-qxZWV3ztPu0y
X-Proofpoint-GUID: BjRMnEV-bsWb15u7oGQ-qxZWV3ztPu0y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDExMCBTYWx0ZWRfX2rlJB9GNM+Ka
 uuG11BWsETtIg6jXVRIimKR1gKWU/T6MKephY+VtA8YM0VpB75g/amM1xPyp31nA6nr1zEzpeB+
 TaGFuac8ugL9C0VIOjrgl6rL/NnKIiOepgEJTdYHbIpQDqebE2hN8gGy5hmvs2rG4MVrmqECMdu
 WwnSBNT3L8IemFD2luuYTaVBXChZiGwu7Ka5bCcfC9B/LlaAS3WLk8hXPJgzoR/fK9jtO6tnX1y
 aeA6A/l2hcIVc+S9NG9qaOXImEd4t/+HemC29+Dc/GY/jCPbATpwIbtL8ecF27sRLtK4jcOfFOP
 +VCZAV3ZvSx42bmcG6O/c6+SPHcUg2P9Ursso68mdSl5cs2zbPOJCdAmbDe74SnWWKR1b76G2K0
 Cl2U0+wOuWB/Jw0l/VHc/CstgZFIdrfNP6IXB7ylLjTRfNnUmZLVZoEZWktSGV4gg7VjRUTRvEb
 7HvMUEu7hkxE115UrVA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_04,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0
 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090110

Enable Thermal Mitigation Device (TMD) support for PAS-managed CDSP and
modem remote processors on platforms that expose the QMI TMD service.

This adds per-platform TMD configuration in qcom_q6v5_pas for:
- Hamoa (X1E80100) CDSP
- Kodiak CDSP and modem
- Lemans (SA8775P) CDSP
- Talos CDSP
- Monaco CDSP

For each remoteproc, the configured TMD QMI instance ID is used to bind to
the TMD service running on that subsystem (e.g. CDSP: 0x43, modem: 0x0).
The driver then uses the corresponding TMD endpoint names ("cdsp_sw",
"pa", "modem") for cooling-device registration.

QMI TMD identifies mitigation endpoints by name, while DT thermal bindings
reference cooling devices by id. This change provides the mapping
between DT cooling indices and QMI TMD names, allowing remoteproc nodes
with #cooling-cells to act as cooling devices in the thermal framework.

With this in place, thermal policies can request mitigation from CDSP and
modem subsystems via QMI under thermal pressure.

Reviewed-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index b9c01ce5024e..36115b24b859 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1061,6 +1061,15 @@ static void qcom_pas_remove(struct platform_device *pdev)
 	device_init_wakeup(pas->dev, false);
 }
 
+static const struct tmd_name cdsp_tmd_name[] = {
+	{ .name = "cdsp_sw", .id = QCOM_TMD_CDSP_SW },
+};
+
+static const struct tmd_name modem_tmd_name[] = {
+	{ .name = "pa", .id = QCOM_TMD_PA },
+	{ .name = "modem", .id = QCOM_TMD_MODEM },
+};
+
 static const struct qcom_pas_data adsp_resource_init = {
 	.crash_reason_smem = 423,
 	.firmware_name = "adsp.mdt",
@@ -1218,6 +1227,9 @@ static const struct qcom_pas_data sa8775p_cdsp0_resource = {
 	.ssr_name = "cdsp",
 	.sysmon_name = "cdsp",
 	.ssctl_id = 0x17,
+	.tmd_instance_id = 0x43,
+	.tmd_name = cdsp_tmd_name,
+	.num_tmd = ARRAY_SIZE(cdsp_tmd_name),
 };
 
 static const struct qcom_pas_data sa8775p_cdsp1_resource = {
@@ -1236,6 +1248,9 @@ static const struct qcom_pas_data sa8775p_cdsp1_resource = {
 	.ssr_name = "cdsp1",
 	.sysmon_name = "cdsp1",
 	.ssctl_id = 0x20,
+	.tmd_instance_id = 0x44,
+	.tmd_name = cdsp_tmd_name,
+	.num_tmd = ARRAY_SIZE(cdsp_tmd_name),
 };
 
 static const struct qcom_pas_data sdm845_cdsp_resource_init = {
@@ -1263,6 +1278,9 @@ static const struct qcom_pas_data sm6350_cdsp_resource = {
 	.ssr_name = "cdsp",
 	.sysmon_name = "cdsp",
 	.ssctl_id = 0x17,
+	.tmd_instance_id = 0x43,
+	.tmd_name = cdsp_tmd_name,
+	.num_tmd = ARRAY_SIZE(cdsp_tmd_name),
 };
 
 static const struct qcom_pas_data sm8150_cdsp_resource = {
@@ -1278,6 +1296,9 @@ static const struct qcom_pas_data sm8150_cdsp_resource = {
 	.ssr_name = "cdsp",
 	.sysmon_name = "cdsp",
 	.ssctl_id = 0x17,
+	.tmd_instance_id = 0x43,
+	.tmd_name = cdsp_tmd_name,
+	.num_tmd = ARRAY_SIZE(cdsp_tmd_name),
 };
 
 static const struct qcom_pas_data sm8250_cdsp_resource = {
@@ -1362,6 +1383,9 @@ static const struct qcom_pas_data x1e80100_cdsp_resource = {
 	.ssr_name = "cdsp",
 	.sysmon_name = "cdsp",
 	.ssctl_id = 0x17,
+	.tmd_instance_id = 0x43,
+	.tmd_name = cdsp_tmd_name,
+	.num_tmd = ARRAY_SIZE(cdsp_tmd_name),
 };
 
 static const struct qcom_pas_data sm8350_cdsp_resource = {
@@ -1430,6 +1454,9 @@ static const struct qcom_pas_data mpss_resource_init = {
 	.ssr_name = "mpss",
 	.sysmon_name = "modem",
 	.ssctl_id = 0x12,
+	.tmd_instance_id = 0x0,
+	.tmd_name = modem_tmd_name,
+	.num_tmd = ARRAY_SIZE(modem_tmd_name),
 };
 
 static const struct qcom_pas_data sc8180x_mpss_resource = {

-- 
2.34.1

