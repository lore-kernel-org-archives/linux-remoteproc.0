Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52AF737C93C
	for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jul 2026 14:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785162196; cv=none; b=N/Ih3Z2Vfz3vnZ69LPr9cUiodQtAXX5XSoqr1jIK71HGSV6kkj7YO4NP4f8OgCsnjaQWWl5JrjBByOTqCrVsBlJ4kZ5ZPJVp3dNLUeAc+DCk1cwnyMUtyX9SQbkc00kySTxpIF3+SDoLMHuGEmDVidlELqRAI6TN3MV8Yh6np9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785162196; c=relaxed/simple;
	bh=PXSF6vkFlEhCfK0LyvLgZoPU7bFhvKJwsRbKyMRblis=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fjkX/11QUubxe89pZ9fbKIYkXEr9hm5pjfPTb5iO6pLqhVmXj5kSbMjDVpUuvjvopFLu3tl6M3XdPZDfuh+gILdpqWKMaCeW0kBdjzF2HbPEoWXUtQXc2zVR1p0FPHlqPrB0LbSraJvjpGTKs31yAyHRsR7nJM3KgwGKxWPNW2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E+knv/TR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BsCBktfH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E+knv/TR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BsCBktfH"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlWPs3663456
	for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jul 2026 14:23:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sFwWcc4KyJZhvy5Ht2M4dKaSAVjHgP23MglcWOMuwzg=; b=E+knv/TRE2HCqRtl
	dh81QxPKVOv09Guu68Pk/OHUTHjndfmC5DeemV7nAnNlKXeoFSA2GSNzWKWTtAEM
	MFSUbYr9el5st3V8gHO3EI9JOKugL3J5g53fR6FCi4VI5dNz6s0Bo/BnWuSwnZY6
	+nA+9L18pITQ7jjyUp/nKtpIUqxuNuIQO8bOmmcDFDogxPOreu1srQlJND1lw/au
	n6kpu+FYoD+sS9iaQQRb9P1DfgVv5wcigo0iCjctZA3LON4J2tLEtrfkYHmmgudu
	OC8g6oSeS6j9WQ9QKZTswt8W2EeIQ2ECWxCsKG5zq/d5bRoKkrqHh0BgBpyQDJl3
	/qCfbw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp2ashubn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jul 2026 14:23:13 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ccb6f6a3f4so42916625ad.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jul 2026 07:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785162193; x=1785766993; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sFwWcc4KyJZhvy5Ht2M4dKaSAVjHgP23MglcWOMuwzg=;
        b=BsCBktfH92qWvgRcmtRI4UBaRiiJ3voygZHoZIc3nOm1nUla++j2y7xI7QZXaF16Eq
         OQx/bW+atWP96kbbPnyDTX1K/lZsjpul8tHWNHt4tNv2i3GWek9L6oeZmmE4slpWhStI
         P5xaIkQpYu/9HHq3kOPW0Kh3JHSmnIyKtnuii3afIMkliv7KejsXQeTB1NpUA8WExxmL
         aEOLZ1IqA5cY0zvQh0j7JJZstXmDJcRFL6i7XtF1OOnsrmY21eehcnoTACMByQfZg4v8
         8F/ldwRvVQ/vR92m9h6Ow8NkmkAo4pgVYcSHLx4a2SL6HILSs+0gkjJJ3u1L+YFntpLU
         JoWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785162193; x=1785766993;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sFwWcc4KyJZhvy5Ht2M4dKaSAVjHgP23MglcWOMuwzg=;
        b=S6TZ5Ti7x0UfYm94fYrUMKMjhyJSy4INvf3iGKS0CHZMQVU4OZRq6dff/UeKZRrz8s
         tafXw6NfhH/Bdt3952llOqsuZKIJOAbaLFanGqlEvdOY3aO8sptVQhc3VYcYmyGPN42W
         7IM1GnsS0x9mrflo5KTkPO+jocKviJVgtKXHYSHjC4HjkzaJC2EWa2BSV1jACO6/AtoN
         fblJ/GF1S43WYnT7hnCE4VsvBb4xBtwIrAD7vdBHfvQWe6/jfT0nmUMJBQ51OcbV0mnZ
         0Yq4JEztiDTdsA5PO7JHio/1kEcTfJZGS1ztPcKQs+0L7LHfw2awZRPaiPHP970ZOgT5
         9FBg==
X-Forwarded-Encrypted: i=1; AHgh+RryTfaO40158iwB5hv5xA1OZ9L1ewIN3vZLIX9cbUXwaon53b1fI8U7yNL/l8E53xMrk/xFoPuqfBatNl/t96p8@vger.kernel.org
X-Gm-Message-State: AOJu0YysnlGtZ99U3QR5/2kjpMOZAPzNEDwWFpfrUy5p97JEezkjpVvi
	wYkzFPtR9svDQ/ZYPqHkrgtkgyJZ7yqR0IDBxj9EwpYkFBqkt+CXOyYV9ICbAJkC6sDx8R1teim
	7OgOLTiLWQbQ6lhu/RoQDI+9Rkd5ImWMDmxhqcNu2sLWQEbAsZyiTeYMT0oUjUFvTLKo2ITRD
X-Gm-Gg: AR+sD12w6ugoJCJlBaPc8mxbGaA0xuRLtAsUgh80pQHhVNwzBWFtbmzo671mMQm7JCP
	RXi8kV727q4ioa9VKLsV01He+iXP+efgjdsfuxuC945NfmZo3/7pa76IZIWFydvOjNuxJAI4IYI
	ZgxSGOU+lw7cPBl766LGNbaRSAOz07lRzvmxUwcaoSleyKfCOTjqYIj0NNuoUq3D5JC77NZ5/ck
	880M7ePqgCRAA+J6Me0xNimImN6Q8XL86WE59J5qNxU7C5iv7UIvuPNaSbAf4SH6onVeHbiWR/m
	S3Wz7qmk1Z1nR9xzl+DOFMRWFWhutri0Q0P9sUZOwXisfajvceHPU+R6D94MUECqk1/gRAyXEEA
	pUwVIA7+CxS1WqqPA3d7NbA2M8evZYg==
X-Received: by 2002:a17:903:2f08:b0:2c9:c517:d08b with SMTP id d9443c01a7336-2cfdf45f0c5mr76064215ad.22.1785162192686;
        Mon, 27 Jul 2026 07:23:12 -0700 (PDT)
X-Received: by 2002:a17:903:2f08:b0:2c9:c517:d08b with SMTP id d9443c01a7336-2cfdf45f0c5mr76063745ad.22.1785162192180;
        Mon, 27 Jul 2026 07:23:12 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde81d7f5sm36608755ad.83.2026.07.27.07.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:23:11 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 19:52:18 +0530
Subject: [PATCH v6 1/9] dt-bindings: remoteproc: qcom,pas: add
 #cooling-cells property
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-b4-qmi-tmd-v6-1-973cd3a226af@oss.qualcomm.com>
References: <20260727-b4-qmi-tmd-v6-0-973cd3a226af@oss.qualcomm.com>
In-Reply-To: <20260727-b4-qmi-tmd-v6-0-973cd3a226af@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785162177; l=3278;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=PXSF6vkFlEhCfK0LyvLgZoPU7bFhvKJwsRbKyMRblis=;
 b=SEtokr6pFfBIcdHQa10reU2F19U7op13kUhoziapXmY3pFG5ZHMmqU/Rucu/LAaiLYvG07Zm2
 n4rzrXBnk2bD57BQPnG/4T8kIFSfhLRq15hapH9WH4b8ysle83UI5ff
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzNiBTYWx0ZWRfX6bscQr4Pm/jb
 o8w8XdoDieHD0putTeIB0yHGqGaUqok7x33jkQiyilS8BZc0unD3IJe/FkM57Pu4fYb11Wca/9y
 jWYsnqhUsh0DyT2QIffsB2rB1C7Uk+mEPzOf52f/uOKh0rdaMoEo/rwo23zX7HkxVGyr+RecrZ1
 IMX+0YzXiSkm3a5ceu8MMJ8k/FlRNOsnYkphueRlBm9ImHfNrc4IOw5YVGINJg+RuAx6orGONZ/
 WZTDvrz3Ms5r94VrRfTvTjn9elnp3brvJjczWTO+miUtx3bqApvnLPaOkCnMhf//c9MOpSCKD/3
 C3Ra0wqxi0FtFRtjaVxvNVUyxnCfcBeYSSqBadEVGTFEHW121NFZcoeBfqVK3WIzEabrV/WuxLp
 T8VG8KHOJb1GwKFNqTDO6WoSceIng04QjD0l9X5OoNLbfeHNsXsVGlxd6yZflakNYO9gTWQPO0V
 2gejIfKkG1FrpaKUXsw==
X-Authority-Analysis: v=2.4 cv=UPbt2ify c=1 sm=1 tr=0 ts=6a6769d1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=T6nhelsJTOTiISQcNXMA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzNiBTYWx0ZWRfX+AA6mansHNLx
 R6QbRHX6CiPpXvyU8RRD6XHhmtRVcPEZSV9StoceoVVLd4RTFRRnPku/djucMJCjlD30WJJ07zn
 KqKX+uY1mTPTxxo8e1ddHEHcKLso3yg=
X-Proofpoint-ORIG-GUID: jGo3vfi-0YjC1c7BBD76GYEwHJqg8PGJ
X-Proofpoint-GUID: jGo3vfi-0YjC1c7BBD76GYEwHJqg8PGJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270136

Document the optional #cooling-cells property for Qualcomm PAS
remoteproc nodes so they can be used as thermal cooling devices via
the QMI Thermal Mitigation Device (TMD) interface.

Qualcomm remote processors expose TMD endpoints that support thermal
throttling through firmware. The cooling-device specifier uses 3 cells:

  <&phandle device_id min_state max_state>

where device_id selects the TMD endpoint (for example PA, modem, or
CDSP software mitigation), with constants defined in:
include/dt-bindings/thermal/qcom,pas.h

Example usage in a thermal zone:

  cooling-maps {
      map0 {
          trip = <&cpu_alert>;
          cooling-device = <&remoteproc_cdsp
                           QCOM_TMD_CDSP_SW
                           0 THERMAL_NO_LIMIT>;
      };
  };

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 .../bindings/remoteproc/qcom,pas-common.yaml         |  9 +++++++++
 MAINTAINERS                                          |  1 +
 include/dt-bindings/thermal/qcom,pas.h               | 20 ++++++++++++++++++++
 3 files changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
index 11faf655f530..f75cab6b4ed9 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
@@ -77,6 +77,15 @@ properties:
       channels and devices related to the ADSP.
     unevaluatedProperties: false
 
+  '#cooling-cells':
+    description: |
+      Cooling device with three cells:
+        Cell 0: Cooling device id as defined in
+                include/dt-bindings/thermal/qcom,pas.h
+        Cell 1: Minimum cooling state
+        Cell 2: Maximum cooling state
+    const: 3
+
   glink-edge:
     $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
     description:
diff --git a/MAINTAINERS b/MAINTAINERS
index dcffe9fc54f6..3f1e2bbf7099 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3423,6 +3423,7 @@ F:	drivers/watchdog/gunyah_wdt.c
 F:	include/dt-bindings/arm/qcom,ids.h
 F:	include/dt-bindings/firmware/qcom,scm.h
 F:	include/dt-bindings/soc/qcom*
+F:	include/dt-bindings/thermal/qcom,pas.h
 F:	include/linux/firmware/qcom
 F:	include/linux/soc/qcom/
 F:	include/soc/qcom/
diff --git a/include/dt-bindings/thermal/qcom,pas.h b/include/dt-bindings/thermal/qcom,pas.h
new file mode 100644
index 000000000000..f603bddef9a8
--- /dev/null
+++ b/include/dt-bindings/thermal/qcom,pas.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Qualcomm PAS remoteproc cooling device indices
+ *
+ * These indices are used in device tree cooling-maps to reference
+ * specific TMD devices provided by PAS-managed remote processors via QMI.
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+#ifndef _DT_BINDINGS_THERMAL_QCOM_PAS_H
+#define _DT_BINDINGS_THERMAL_QCOM_PAS_H
+
+/* CDSP thermal mitigation device id */
+#define QCOM_TMD_CDSP_SW	0
+
+/* Modem thermal mitigation device id */
+#define QCOM_TMD_PA	0
+#define QCOM_TMD_MODEM	1
+
+#endif /* _DT_BINDINGS_THERMAL_QCOM_PAS_H */

-- 
2.34.1

