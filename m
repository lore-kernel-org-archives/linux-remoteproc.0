Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9210D355F22
	for <linux-remoteproc@vger.kernel.org>; Fri,  3 Jul 2026 05:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783055066; cv=none; b=drnysKzu9iP7FY+jcEPyC64Y3BFPXvCypmJSK7WljBMa1FJeqZJFaToG7O0OVoIdz197ThvtcpUQhq5BZ77QFtEXPBubpYCn19dp4do46uLSoIa35DV8Bj2gKUsaqm+2O/BakRc2nDHQjhEe7XMWhX3KRFa0rH2/MQlDrqHwnZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783055066; c=relaxed/simple;
	bh=YLzzOqexgI2OLB1izWL/2pvG5P3Bot9UTn4BCsjmqe4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=prsjl/nWKuFSynE497d1zixTzNuZO7SXs41j4NkGl5KoFT3Jlvsce0JHm5orX+iH35V2sPaWk/sQldqgE5qSBiOPvwf+Vc89CqSpBUeyvcWq274dmON2h7YUAUo4D74hXxNang3w55nNmwQgtKUvciDWtTIw0MAqhg0G4Tdq0/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MrHm0D5r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NHlON5Tm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MrHm0D5r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NHlON5Tm"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66342xw02816866
	for <linux-remoteproc@vger.kernel.org>; Fri, 3 Jul 2026 05:04:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	styMC/RSg/rxk9wJAUjveP0CR5WBpn1D9q8Ul1nzvgM=; b=MrHm0D5rkrAQOwq7
	X+pVipxIDs1YlnK2Izv4dRp8rrmrYE4P4y3zl4Ve4CH+ojxleU0VY+kBLiXHiID3
	jeaDQGPpUI4c6s7n8USc6L8UV7H2KotLP2cAZSHwBHzhnIgtTKwlyTYMS8wJOukI
	+kLp8A+ewYX9a7hOF3LdMPl87IAtbK6yRKkN2JdMx0UtLrFe7QcvVlXhkXeWYh++
	nR5h6HgexWM5sWQJsC/d7aOaE0Y9lKwIpTK6ee6PAQJBMk7YDkgTigxWQaj5x8tB
	eeym2e0QnuThidzlnj8tFihf9Y4XPUQoY8DBem93n6Wghy9raiW7iNgfR9TaiFqf
	DYQL1Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5qnpbjq4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 03 Jul 2026 05:04:09 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c9f0073e20so3096865ad.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 02 Jul 2026 22:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783055048; x=1783659848; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=styMC/RSg/rxk9wJAUjveP0CR5WBpn1D9q8Ul1nzvgM=;
        b=NHlON5TmpAjzz3eVbCMqvOj+BSsEHdu1O3rFZJwuOJ7uiOOdgVfobWXD8SxaKQwvbV
         6RV1WWaFOn93DLeWbmriY4PQQEQXGsj9RaHDQTmCIOk2y9EPlFLNSwR5jRNfQZ88dvVk
         mPB5huv12TljrovnrKWK3V9G+ih5N8/aeWPSf/Uv8MGZRQ9Cy6xVbkEqmMlPWFdasEBV
         odkV976LqneBQ4dbMU8oP6FUHC81K7gDEsc1wvthsY7F4ryIVPK1y5q7q2QgVoShO4yt
         aDmvzBisKg9cG2PGSdWgWNLHz+YwaU2nEhScCs2p5x/0QAFgDlAshi+BMyhwnaNrTqaw
         DkRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783055048; x=1783659848;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=styMC/RSg/rxk9wJAUjveP0CR5WBpn1D9q8Ul1nzvgM=;
        b=ZY0T4AwiSYYt7PtMa6q8b39Jp0PdEfxdVSt8y1DwT/psvOHL1YCEadIWqC7FQCb2yL
         inKiZl0UiNaTZBvuasaX5V2io4+fTVwmJwd2qcGIP0nspWFKrFnZWmrkKE/oBZ1p1LRw
         Wdmlg2D2qEe6689LASBaud8QTY7X1DMepjWMVxtsk7QQ+vDIM8dkKouC71Saudpq3EHK
         7BudI0URqfL7OUf1bpCqc+tSba3ifeU3bZKEHEV3RSnaH0nBSHyS9gs5U6sgdozWct/k
         g2cyHH7IWUPyF89jCYxzF1SaR2yOB/8Dt1xwYqUGULVRZxVIz88wTgD92EB1nBxnG7Zn
         ojZg==
X-Forwarded-Encrypted: i=1; AFNElJ+QZ+0/NkY5/C9p9FFRgnPPIHJNZmcLVPtUdMNfbJoYyEPQG9+4zbobzQ1BJJm17Y7fsLYbJ10Jzngrd9KarwKN@vger.kernel.org
X-Gm-Message-State: AOJu0YzlHKo47lXHUptPeGbTlzkv6S43QoZCjUfuzsgZreuXFZF6gaH5
	ygaPj+pVVbU9m0xmuaZebb6bJfBgg5UMEhayZ7zJOlaJj48o7yCfU6AH+gZK6naNiIA/JQXwHV9
	3HukZ5yWikp/Muz8UNKKSak9eD8p8uT51Bb4h1K2ZQ7tjz71O/BNnY1VrpKMp6B8jPotmEsFB
X-Gm-Gg: AfdE7clCwmYmprP7+YRPKHYGMYJ9Kw4GAMWHDZj66MJU7L4Y8K7CSOSkk5rfzY9WaoF
	2vS3Dvrhe/OLww5nT21DuMH+UY3ay8pw0OP2G0khn9B+F+Q9+sCWgodLltM01n9Z21y8k59wvAS
	DmgLPCnBsDh3MWXee08QiKoKTEGDUUMbXvIhJXqyLjxp5Yi9cUx3WizlvvMb3dHubBw2avDcZDO
	oKOIB6QtMlaaImyEbE4KkAFrEXjFLKRdgbhqVNADucRAZI93c5DlbGXxtol6cWgjtZ3LuWV4xaR
	E+99w9S1V1hbAwPjhRACAglibipWH/LumFLRQLWMXca8usDJ4NT9ytBrBjLXXiha63SvBkVAT7R
	FMM+pYxa50+uPnDN/e62UjNsxUitHbUDlscCV0RIW
X-Received: by 2002:a05:6a21:1b84:b0:398:9b42:69f7 with SMTP id adf61e73a8af0-3bfed3b19b0mr11022078637.39.1783055048157;
        Thu, 02 Jul 2026 22:04:08 -0700 (PDT)
X-Received: by 2002:a05:6a21:1b84:b0:398:9b42:69f7 with SMTP id adf61e73a8af0-3bfed3b19b0mr11022032637.39.1783055047655;
        Thu, 02 Jul 2026 22:04:07 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bbd2362sm16771941eec.20.2026.07.02.22.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:04:07 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 10:33:07 +0530
Subject: [PATCH v4 04/10] remoteproc: qcom: pas: add support for TMD
 thermal cooling devices
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-qmi-tmd-v4-4-3882189c1f83@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783055015; l=5135;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=YLzzOqexgI2OLB1izWL/2pvG5P3Bot9UTn4BCsjmqe4=;
 b=YvqhK7JA8HM8KLaZwwbl8HmRXjMNiXwabJxM3FFxhuxfhoFMyNsz8aacsGcqMcwmDPZdYfbxo
 Yhi/6zZ6v6JBFaxFyyFu/mXMB2GnNHvMVK5VQXVdzCmxMg4sF++uyGO
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA0NSBTYWx0ZWRfXxYyzqA4+WPIZ
 Vo+KTPigUB+FWPwlVglLkB0G+WT7mfu5uh0G5bVmKtM4gKpIpjiuKpRrgkWV0m0sAkV+9jojgql
 0P+OPizhz8ZFFKjZVpnwfrKirVXU1rk=
X-Authority-Analysis: v=2.4 cv=FoI1OWrq c=1 sm=1 tr=0 ts=6a4742c9 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=JsyU97BMdJ6RvXteW0AA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA0NSBTYWx0ZWRfX1Vce0AQXlSDN
 GPLJyU1B0oK5yn+9N8KkDGVsLxR/NZ+y2UPdGod2sOI5FrkE+9p2LTU9E8BSFRPdb9fIb6fLmQa
 2unP3WpCQ4FoDL2yCSKgohcPa6Y5CdTm4d1i0dvzJXNOu1gpqicwuyunfc3d3Ilkkqo2v9CVjot
 QoMBtFNGFj7Db2dxYNJUxKWCCrodjvyEahQPb95px8Jf3EoDCRHCnR1Cu0jNx3kOpV1ul1TXJMz
 mFjOyLy+nbA9FkMJ8/cXxCkmDRzcJe08mvjU0GOwS7GZtkICurURJYb8rMXigrx8owR1ILP4TnU
 FxWWTRBe3rZNNdU5EkLtUvSS5XYA+1C7VKxAp0wSMInbQMRLEkIeVGBEb8aiFCiAMqAjj2BOg77
 T/OTwptuv1UKZqfYH9H+ZnLcGAgS2jIEMne0o5t+gGxTaJihQgFDhL7Git4hZ0iERU2Eu01e5jR
 q8TWrGhFeoMz7BoBUcA==
X-Proofpoint-ORIG-GUID: JmlJoWXwvBKrRjAZvU4ItuGFFL0z-BOo
X-Proofpoint-GUID: JmlJoWXwvBKrRjAZvU4ItuGFFL0z-BOo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030045

Register Thermal Mitigation Devices (TMDs) for PAS-managed remote
processors to enable thermal throttling through QMI.

This allows the thermal framework to request mitigation when remote
subsystems such as modem and CDSP contribute to thermal pressure.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 drivers/remoteproc/Kconfig         |  1 +
 drivers/remoteproc/qcom_q6v5_pas.c | 93 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 93 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index c78e431b7b2d..cd8cc911e1be 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -228,6 +228,7 @@ config QCOM_Q6V5_PAS
 	select QCOM_PIL_INFO
 	select QCOM_MDT_LOADER
 	select QCOM_Q6V5_COMMON
+	select QCOM_QMI_TMD
 	select QCOM_RPROC_COMMON
 	select QCOM_SCM
 	help
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index da27d1d3c9da..ab5bcccc91a6 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2016 Linaro Ltd
  * Copyright (C) 2014 Sony Mobile Communications AB
  * Copyright (c) 2012-2013, The Linux Foundation. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/clk.h>
@@ -24,8 +25,10 @@
 #include <linux/regulator/consumer.h>
 #include <linux/remoteproc.h>
 #include <linux/soc/qcom/mdt_loader.h>
+#include <linux/soc/qcom/qmi_tmd.h>
 #include <linux/soc/qcom/smem.h>
 #include <linux/soc/qcom/smem_state.h>
+#include <dt-bindings/firmware/qcom,qmi-tmd.h>
 
 #include "qcom_common.h"
 #include "qcom_pil_info.h"
@@ -36,6 +39,16 @@
 
 #define MAX_ASSIGN_COUNT 3
 
+/**
+ * struct tmd_name - TMD device name to cooling-device index mapping
+ * @name: TMD device name
+ * @id: Cooling-device index used as #cooling-cells cell 0 in DT
+ */
+struct tmd_name {
+	const char *name;
+	int id;
+};
+
 struct qcom_pas_data {
 	int crash_reason_smem;
 	const char *firmware_name;
@@ -56,6 +69,10 @@ struct qcom_pas_data {
 	int ssctl_id;
 	unsigned int smem_host_id;
 
+	unsigned int tmd_instance_id;
+	const struct tmd_name *tmd_name;
+	int num_tmd;
+
 	int region_assign_idx;
 	int region_assign_count;
 	bool region_assign_shared;
@@ -120,6 +137,8 @@ struct qcom_pas {
 
 	struct qcom_scm_pas_context *pas_ctx;
 	struct qcom_scm_pas_context *dtb_pas_ctx;
+
+	struct qmi_tmd_client *tmd_inst;
 };
 
 static void qcom_pas_segment_dump(struct rproc *rproc,
@@ -733,6 +752,66 @@ static void qcom_pas_unassign_memory_region(struct qcom_pas *pas)
 	}
 }
 
+static int qcom_pas_setup_tmd(struct qcom_pas *pas, const struct qcom_pas_data *desc)
+{
+	struct qmi_tmd_client *tmd_inst;
+	const struct tmd_name *tmd;
+	const char **tmd_names;
+	int i, ret;
+
+	if (!device_property_present(pas->dev, "#cooling-cells"))
+		return 0;
+
+	/* Check if TMD mappings are defined */
+	if (!desc->tmd_name || desc->num_tmd == 0)
+		return 0;
+
+	tmd_names = devm_kcalloc(pas->dev, desc->num_tmd,
+				 sizeof(*tmd_names), GFP_KERNEL);
+	if (!tmd_names)
+		return -ENOMEM;
+
+	/* Build the name array from the TMD mappings */
+	for (i = 0; i < desc->num_tmd; i++) {
+		tmd = &desc->tmd_name[i];
+
+		if (tmd->id < 0 || tmd->id >= desc->num_tmd) {
+			dev_err(pas->dev, "Invalid TMD id %d for '%s'\n",
+				tmd->id, tmd->name);
+			return -EINVAL;
+		}
+
+		if (tmd_names[tmd->id]) {
+			dev_err(pas->dev, "Duplicate TMD id %d for '%s'\n",
+				tmd->id, tmd->name);
+			return -EINVAL;
+		}
+
+		tmd_names[tmd->id] = tmd->name;
+	}
+
+	for (i = 0; i < desc->num_tmd; i++) {
+		if (!tmd_names[i]) {
+			dev_err(pas->dev, "Missing TMD mapping for id %d\n", i);
+			return -EINVAL;
+		}
+	}
+
+	tmd_inst = qmi_tmd_init(pas->dev, desc->tmd_instance_id, tmd_names, desc->num_tmd);
+	if (IS_ERR(tmd_inst)) {
+		ret = PTR_ERR(tmd_inst);
+		if (ret == -ENODEV)
+			return 0;
+
+		dev_err(pas->dev, "Failed to initialize TMD: %d\n", ret);
+		return ret;
+	}
+
+	pas->tmd_inst = tmd_inst;
+
+	return 0;
+}
+
 static int qcom_pas_probe(struct platform_device *pdev)
 {
 	const struct qcom_pas_data *desc;
@@ -855,12 +934,21 @@ static int qcom_pas_probe(struct platform_device *pdev)
 
 	pas->pas_ctx->use_tzmem = rproc->has_iommu;
 	pas->dtb_pas_ctx->use_tzmem = rproc->has_iommu;
-	ret = rproc_add(rproc);
+
+	ret = qcom_pas_setup_tmd(pas, desc);
 	if (ret)
 		goto remove_ssr_sysmon;
 
+	ret = rproc_add(rproc);
+	if (ret)
+		goto remove_setup_tmd;
+
 	return 0;
 
+remove_setup_tmd:
+	if (pas->tmd_inst)
+		qmi_tmd_exit(pas->tmd_inst);
+
 remove_ssr_sysmon:
 	qcom_remove_ssr_subdev(rproc, &pas->ssr_subdev);
 	qcom_remove_sysmon_subdev(pas->sysmon);
@@ -883,6 +971,9 @@ static void qcom_pas_remove(struct platform_device *pdev)
 {
 	struct qcom_pas *pas = platform_get_drvdata(pdev);
 
+	if (pas->tmd_inst)
+		qmi_tmd_exit(pas->tmd_inst);
+
 	rproc_del(pas->rproc);
 
 	qcom_q6v5_deinit(&pas->q6v5);

-- 
2.34.1

