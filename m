Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1734833F594
	for <linux-remoteproc@vger.kernel.org>; Fri,  3 Jul 2026 05:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783055073; cv=none; b=SJZjaM3oh2gUcz9kxoejzhL9RFsTOsMJBblwPhfvuJ1H41ZNri5EFsHqZWJRYLcoJZtfJJixAA3Y3S4IMTIGZaD3ne/35dv36XRXok28iN0BbPRQ/EvkBm2P0NuEuKbrdPBqBF8D4AmwJnAOHXdE4sI9Zkt7UcqEsMcqOr8vbnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783055073; c=relaxed/simple;
	bh=mw2xywDtGE86eMiTObjMgtV9IqdLC+USGzaPZvRA/pk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Akp78TFP7w7TXYvdWh8N6YDNNTHmyHxlWygJvC9ga61/DqcOCzlzkegfzP+0FWoy1M7WqSDOdGU3cqILmBoIaF0wppXfujKcnKQPDqB04drpNoHQdfCKDiyWIPLLe84UsbsdLMIN9wo8IzAyP1X1/N7LqmDxnq+hXzp9YLunmlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j7ybRX7o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U0RwNDdS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j7ybRX7o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U0RwNDdS"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66342waO2838509
	for <linux-remoteproc@vger.kernel.org>; Fri, 3 Jul 2026 05:04:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	md8wWc6/cgAOJXI2yDz++qo+slmTKVQf5dEfPIb96Jk=; b=j7ybRX7o89rK6kKu
	/G3+cqhxVEaf/oFTjSHPoCgSuQuP/4WzvDXZCeYbKKYKHUoVp1U9aAvX9xzWQSo0
	oud29xUyfv0iTHdkzbIKklSIsErlht4XidYcnKrunC5z4A3dT1A9rdbSvpC6gUa0
	EWUJpcZs09+hGYc/hSK5f8RWdhUzilHjEFoiQGybOKeCmKTCLCsrlSK286SE3js7
	7OaZLixqFcogRYT49HMkCB3W51uTTvg9Hj9ZDIlTx6t6DZ52hCNM982dFEo6NbjS
	spTT/RPehHg+zb5DvIcaOTBjshwU6/G6JSZwuz3iY4Nj6HWL/khgVDHWohJrQhOo
	ZswItg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5mvwvdf1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 03 Jul 2026 05:04:15 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37e1f96b248so408235a91.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 02 Jul 2026 22:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783055055; x=1783659855; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=md8wWc6/cgAOJXI2yDz++qo+slmTKVQf5dEfPIb96Jk=;
        b=U0RwNDdSfbMXx084KS9S/y7u6A2YJmxu091bVSO234Rf6pcusQWpwAXXNwzAiO2MmM
         I/iUwiwTbnnioza9nEX0bd1eIh2DLgrI39/B/ggsC452JcSqhC6qL3UD4+uJ7xMpzJj0
         XIbEVm0N/oveB9Optfytk9VER6dlmUPQG+6jJ+KEXVqmcAZQErAYAbNL7mfGyXRroC34
         Zompz0btS0R3assV3qKY9YMzsGHg8XhG1dHVjfbn9/M3jbfvk54hmbdJ8N2sH8tRjE2F
         nfAJe2Lky93pM5dai2fbeQJfYVoWaTOm9GPsXz4xMWxokdjCSWsFIICo29nEZ6pSt+4c
         GAcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783055055; x=1783659855;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=md8wWc6/cgAOJXI2yDz++qo+slmTKVQf5dEfPIb96Jk=;
        b=j9DI4dOl643aAv+Eo5RlTa/+LjzZ4C1m/Gd+JYiOb6aT7zw8nxxfUK6w3LM+zSP4eB
         7BCOmT7ByrKLOaKJ5jVeUfJShQqS3g/jCrL630fNHHzk0THrT92D9xSPqd2+EaYdocZx
         5vY5Yl7sXfHLYoBQyp3mMvurfDwQeoX381eE6raRk7erXnhdnoBj0/HVyCy6IMOQaiAh
         /N1puMjy5L1F6g7kqijsNYrP0mfy9vQouuXEO9Z3PjK8qnGzCDkwYyA9khqx0M20DE0X
         i8NS+j/wcvZhxtmljDdE9tUxclsQIpk/Wna+Ki9Ug2mb6H6fbHJj4tH8w9AFaWMKapJh
         0Seg==
X-Forwarded-Encrypted: i=1; AHgh+Rp2d9855WgsQoGKI5NrQ8/G6JsY3f4TAnZRQ8l9VT91ov5yQQLnXYH+LAz/YmZBbiYmDT3v1gnVf3zAG2pSjgpx@vger.kernel.org
X-Gm-Message-State: AOJu0YzSP0ZZIlyfaAVqNF0RBvGzGpBPZky2zVTOWflaolyzHyh3hy8C
	6EjyAl4B4ZRxB5uUuPmx5Vmr0PN5OcohmMXVOQlHQpBkF0VvEoHWW9olGD8GWTQ0+uhLaZedPu/
	n1APu/RV+hS1YfQrmvmQRAb44fS8kT8mX3l2Z0RxrEOcyk8v8dwU8LSQkAxHtxtyOl5+aXbRA
X-Gm-Gg: AfdE7cmAKd21dvlxGiv6bZEJ/C7NUThoVkLBZGTw6TlJS1J79+HMREAizxjRNCd4KSB
	hYkl6V6xdWsPON7YGBhnZyaJaImdcNYwU7qm/sMzbUfz23vzIqW6AOUKM8Mnd7cXQrb1CRWvvJ3
	xSFHP4Ey/ncLwCuwQ1quD0jBaqtATSyPH/HSDmK1WUxiqSfPIQpjXokY0rPqkwnpz6wcM95Q7W6
	sf+O0yLoZE04A2LSu7O3eaUI8MYNO8wMJtGaWYXnPiNykbvi4GGW4qf2Oe5Jv12je7n6H7lRcRf
	kCcw7QnALJODjr2/CCqRizcvReWu7ekLVh/vdaX6ngz1HdeZLWbL2WvM6LitWYwvpdGNhRNOIRq
	QZLKR29g4R1KCbGPYpebHURMtgblLFL2+mvxpmH9A
X-Received: by 2002:a17:90b:3811:b0:381:5ede:1296 with SMTP id 98e67ed59e1d1-3815ede1635mr77863a91.11.1783055054651;
        Thu, 02 Jul 2026 22:04:14 -0700 (PDT)
X-Received: by 2002:a17:90b:3811:b0:381:5ede:1296 with SMTP id 98e67ed59e1d1-3815ede1635mr77838a91.11.1783055054031;
        Thu, 02 Jul 2026 22:04:14 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bbd2362sm16771941eec.20.2026.07.02.22.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:04:13 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 10:33:08 +0530
Subject: [PATCH v4 05/10] remoteproc: qcom_q6v5_pas: enable QMI TMD cooling
 support
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-qmi-tmd-v4-5-3882189c1f83@oss.qualcomm.com>
References: <20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com>
In-Reply-To: <20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783055015; l=3860;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=mw2xywDtGE86eMiTObjMgtV9IqdLC+USGzaPZvRA/pk=;
 b=ikEWVDd9kQOc9aRYdLrIQRqy20EpLvW9r6pThjNeNOGwddivHx9OZ/0ZkxdGjXxxIaCKgSOFX
 LOXWhMa5YioCLK3ChMQTtJcVx8h012+foUjbvpUg3oqYjlxd7w6lT7E
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-GUID: eG_VEv4my4c1O_8zjaYfYdZlapc4p6gA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA0NSBTYWx0ZWRfXwbJZsN2Y0/+P
 xZKk3X5O3D8wXPJhZ7GFVIKeTUZT9bbaGpmJKqJ0yFh3+5Ov5YcHScKsjKcHVLI7OWkqVmYDeKZ
 dvK3h8QVKU7wW0FKJLSi9urE3YsV5wIeWHxxEdzADkxfHZcD2n+L+4910/9Ea7Q/csUa8IaGiu2
 aWEiRJidi5nuRISlEpg05J5SAZ4Ng0rJYA7cKrppVFnIu5CJZIt9ShpWhO2ohQByqhZZnqtC6x7
 6cOTZATFMSJwNdcKZG/wk0EsTtS/foxk31rXmt1kzsdzP1A8t96tC8XCegQ/nMHdAWefBnxbAdy
 bMVjI3m4jDUeQFIX22jxBUE7uCyXO0r5AlDV34YdvKc3ggyayNFA43BMUcXUyY4T7dCQ4jOvIPo
 cYAzu+bmhX07DGU9Z9qETeS4z8hyKB73tIU6FmhYEB7HaGIozYtl60Rw+YVyrjlYpZwGwAxF2eR
 HbNPRfB/9+9NMe7pHvg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA0NSBTYWx0ZWRfXwwhc1aJ13q4v
 8uF6ShHu2yyqr5ZNs21BmgYrG6NqLBcwcxdGCy997DtWTMDhg4ukmHONxBQ9iXzzHUu9k/ZGPdT
 hxgsjZbfzb02S+Vs/r6kXAkj3sLT78o=
X-Authority-Analysis: v=2.4 cv=N+UZ0W9B c=1 sm=1 tr=0 ts=6a4742cf cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=j6jQExit_mXiN_RbaP8A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: eG_VEv4my4c1O_8zjaYfYdZlapc4p6gA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030045

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

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index ab5bcccc91a6..974526195e97 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -987,6 +987,15 @@ static void qcom_pas_remove(struct platform_device *pdev)
 	device_init_wakeup(pas->dev, false);
 }
 
+static const struct tmd_name cdsp_tmd_name[] = {
+	{ .name = "cdsp_sw", .id = QCOM_CDSP_TMD_CDSP_SW },
+};
+
+static const struct tmd_name modem_tmd_name[] = {
+	{ .name = "pa", .id = QCOM_MODEM_TMD_PA },
+	{ .name = "modem", .id = QCOM_MODEM_TMD_MODEM },
+};
+
 static const struct qcom_pas_data adsp_resource_init = {
 	.crash_reason_smem = 423,
 	.firmware_name = "adsp.mdt",
@@ -1144,6 +1153,9 @@ static const struct qcom_pas_data sa8775p_cdsp0_resource = {
 	.ssr_name = "cdsp",
 	.sysmon_name = "cdsp",
 	.ssctl_id = 0x17,
+	.tmd_instance_id = 0x43,
+	.tmd_name = cdsp_tmd_name,
+	.num_tmd = ARRAY_SIZE(cdsp_tmd_name),
 };
 
 static const struct qcom_pas_data sa8775p_cdsp1_resource = {
@@ -1162,6 +1174,9 @@ static const struct qcom_pas_data sa8775p_cdsp1_resource = {
 	.ssr_name = "cdsp1",
 	.sysmon_name = "cdsp1",
 	.ssctl_id = 0x20,
+	.tmd_instance_id = 0x44,
+	.tmd_name = cdsp_tmd_name,
+	.num_tmd = ARRAY_SIZE(cdsp_tmd_name),
 };
 
 static const struct qcom_pas_data sdm845_cdsp_resource_init = {
@@ -1189,6 +1204,9 @@ static const struct qcom_pas_data sm6350_cdsp_resource = {
 	.ssr_name = "cdsp",
 	.sysmon_name = "cdsp",
 	.ssctl_id = 0x17,
+	.tmd_instance_id = 0x43,
+	.tmd_name = cdsp_tmd_name,
+	.num_tmd = ARRAY_SIZE(cdsp_tmd_name),
 };
 
 static const struct qcom_pas_data sm8150_cdsp_resource = {
@@ -1204,6 +1222,9 @@ static const struct qcom_pas_data sm8150_cdsp_resource = {
 	.ssr_name = "cdsp",
 	.sysmon_name = "cdsp",
 	.ssctl_id = 0x17,
+	.tmd_instance_id = 0x43,
+	.tmd_name = cdsp_tmd_name,
+	.num_tmd = ARRAY_SIZE(cdsp_tmd_name),
 };
 
 static const struct qcom_pas_data sm8250_cdsp_resource = {
@@ -1288,6 +1309,9 @@ static const struct qcom_pas_data x1e80100_cdsp_resource = {
 	.ssr_name = "cdsp",
 	.sysmon_name = "cdsp",
 	.ssctl_id = 0x17,
+	.tmd_instance_id = 0x43,
+	.tmd_name = cdsp_tmd_name,
+	.num_tmd = ARRAY_SIZE(cdsp_tmd_name),
 };
 
 static const struct qcom_pas_data sm8350_cdsp_resource = {
@@ -1356,6 +1380,9 @@ static const struct qcom_pas_data mpss_resource_init = {
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

