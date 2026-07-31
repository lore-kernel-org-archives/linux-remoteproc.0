Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E034141A4FC
	for <linux-remoteproc@vger.kernel.org>; Fri, 31 Jul 2026 10:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785494085; cv=none; b=jWSFys7WGlbuW0AViGeRcxXPP3wKkb6lh6c4xC0fm8M5TI3I2BNENQAPBTvL5tvv55VZCHFCEVJh+dhXadsSCc6hhBATMRoxE9FRUz3HRdm9SP6SPvBjstoV3mlU5tiJFSR8ltrQkEOq9MC7Cg/vkRJgr4easdNyAIbEejD3A+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785494085; c=relaxed/simple;
	bh=LjX2uu5uRns9aB9+huzFuwyv8G8eDp/UqYn/3VCYmRY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s+tVAOiTjCGqAylE6bcs1X97BDZAwcujmZ5WGOvWITfkEtL0rJSFOtAn6yksxGPDAlKng9MzkfY4PywW1XJjv9HKlkW/4Yh1ySTxybAjQC5AOO8fziQLOEbvUd4ET1Fvbf8DIulxaLydD783L+zo6s7aY+HqjhskspXkEtY4Zrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VpAZ9TyE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UycNZF4n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VpAZ9TyE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UycNZF4n"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VAC7Id693375
	for <linux-remoteproc@vger.kernel.org>; Fri, 31 Jul 2026 10:34:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pYF9h6alUVBD7tym5vNqQYIx2ehof1mwtVNRI9CjH2w=; b=VpAZ9TyEoc15/jBZ
	BcEWFlksd+tNz2xLa5zhh8EJLwlzJlClxyh22KrknxFZ2NGmervUkceyJQSlYXYl
	jwdhzgkZN+vPQ7smfn/hRKxtAfaj2qAN5dR1PFFe5B0YBsL/IQBE0VXAh0UBaFXe
	6e4iAAKnaRAngoPauGatFB5fzAOhF2e9727ns9t5MCRIKVFURNrGvPCovI5/zrgr
	OzJzUZ5xAc02HLTvHuPCPjmKUAH1SGcyyJkrFg1JyrOjqQPFI5ERy2nQDySffj0I
	FBQe4ZrHXP6pRrfWwTtHSI6oDJFM7qXhha2G9cYdA0TJfu0CrSK4CduOhtyCq4Yb
	6ys3gw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frsn5039w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 31 Jul 2026 10:34:24 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85798977dcso1347600a12.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 31 Jul 2026 03:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785494063; x=1786098863; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pYF9h6alUVBD7tym5vNqQYIx2ehof1mwtVNRI9CjH2w=;
        b=UycNZF4nGPTuyW9c8AYwlH7MUX6qqsT/Is04HTtItzqo10LhEAELxtTgV96SRR3NxB
         Le5Z5yntQvszxFJoDbzKlwkcTMt3yXWXGHJMyUW2m+HSJwjjq2hYbM7RZ9nEjcB3ZZbS
         rmunmWCdTBaOaajXtVcwgw0r+4f6ELGYbOufWr1VdmgbNRDhTmO9PbKn3glwM+n+uCUk
         HaT5EvB5a7FWIneU4Ev2xP/43HR5tsN0g5Be+h/NEPgIZ7jcFI185BWudA7ytKc17oo+
         918EMpKPNK+PRXY6lbZzC4BXRHWDLnNQI0SOaabGDW+y4+Jx7v2SrQgvHTa1WCj3DQuE
         CwSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785494063; x=1786098863;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pYF9h6alUVBD7tym5vNqQYIx2ehof1mwtVNRI9CjH2w=;
        b=adFQ0+xyrwLFpFOAXpIm7KPBTHaxZyL1q9JfwvT7rZUL0EIcS0in6u3+flitqpuLhI
         08zUQoZ/4BhvSRWywiV2U2d6pUezHy7xvyuQKfYszAuMffHqJtOSHYtDbmRWlnMXrASQ
         8geaCuM3VC/Hqif5OwUGtzjehZgp0ELEfutMmH4TaMvMIlso73eAEfcnlia0Ei070LrA
         WpS6K9BaOZpbcHPZi9Qkh2xk3mJfMOvWDZOBeBAF6R4NnTHAB5ywQ/IC8PWl0hKlF+uW
         VFTba2rmNJxVkHQbNy9pn2PJ3Un04muU0jis3yLvdxdPnTCwFPJgRIb/tfJXj6yuro3k
         3DVA==
X-Forwarded-Encrypted: i=1; AHgh+RqmBAHes5DcPbp5cdO5GB1r8e69NYfO9dw/yKFRnV+HpjUqVg3VqdnBmZraWp7Gg6A2Pu5xAwgC+i+tNdh046rw@vger.kernel.org
X-Gm-Message-State: AOJu0YwWu6cOpuTwDTzDl0pnJxt/4mk2mUwps4pACwXid4hm8VJIqBsu
	AhUXfWbVb7mwfum5L2Oh49EaOcYTSWqz9RB3YtOdXNLDqA2FqV61CPQh8ksZLu+PWvh56vymwfJ
	Y3d/Eh8Br3QC+LHcDO1E33UUYdAjDSmKMlGMu/YDIEJXfQIK20OffNbujcjbOu8c5XLTo4wD5
X-Gm-Gg: AR+sD12TpNl4WsAytbx4jOSMXouGKCMZFdPmY5AWbLXAPZOhJ81LBNcuj7g4g6Pn4jG
	bKIqj0E9bnW2lOvOZ3OaFEOZun8oywokje84sVmXAjOUZOsYpJonPWfrqx3UqPE0/GBqNjhW2eM
	ggO2dBtX29p6nwScNXQ4SvNixInp5q94rGk9VBL3mNwo3Lba4if70s6HCp4s9exeBUyJ6ujO8v3
	WV5mmCsgwHoNaEduPHBhivsC1Q2Xxl3azAz88R14qkjOp/tySibZK5ICTGPvgZ08wobzAyMFF7S
	mRx5jvLc4EmZPkQ/KOcq1cMxI+TSAC6nWPiaeEqSOi8ifNSrlXRdJeoiO7QyrstDpRMfN80KN/2
	QT8oZ6ASvja1AgBM3pcZJBG/mYGIQNg==
X-Received: by 2002:a05:6a21:790:b0:3bf:49c8:f7b with SMTP id adf61e73a8af0-3c91b08f204mr1566977637.13.1785494063357;
        Fri, 31 Jul 2026 03:34:23 -0700 (PDT)
X-Received: by 2002:a05:6a21:790:b0:3bf:49c8:f7b with SMTP id adf61e73a8af0-3c91b08f204mr1566958637.13.1785494062924;
        Fri, 31 Jul 2026 03:34:22 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e18e114sm8493680eec.28.2026.07.31.03.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 03:34:22 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 16:03:41 +0530
Subject: [PATCH v7 1/9] dt-bindings: remoteproc: qcom,pas: add
 #cooling-cells property
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-b4-qmi-tmd-v7-1-3befd44403d5@oss.qualcomm.com>
References: <20260731-b4-qmi-tmd-v7-0-3befd44403d5@oss.qualcomm.com>
In-Reply-To: <20260731-b4-qmi-tmd-v7-0-3befd44403d5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785494047; l=3338;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=LjX2uu5uRns9aB9+huzFuwyv8G8eDp/UqYn/3VCYmRY=;
 b=+Ty/Bcvly1jI+WWQz/dApbymnZLZER2rXS661XRs7pe3SHqPe/N0DFN3Z0fT9/uJVNWsaPp1W
 JJRfLpyXyJSDyCoaqmH+yLurQ5VxvNfbF8+46zkOH9FFdOLqDqrKLNM
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-GUID: 6bKzdib9KLrbz6Qn9uSCSFOlwJyuBl24
X-Proofpoint-ORIG-GUID: 6bKzdib9KLrbz6Qn9uSCSFOlwJyuBl24
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA3OSBTYWx0ZWRfX+GcDQg/KCOwm
 l6l4m8OQkeA2+aaHOlnAwrhj/ON3Ps8PGFG7HOUUi9yHhvRsv+LHMAjrtKjxfFVHRKhYF0zG5jU
 pf1943M1s8r+0Q268TS2V/L2vNEOEaw=
X-Authority-Analysis: v=2.4 cv=ScbHsPRu c=1 sm=1 tr=0 ts=6a6c7a30 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=T6nhelsJTOTiISQcNXMA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA3OSBTYWx0ZWRfX9+E77ceuopS4
 tKusyjj0AgihkXyiCUkEA3P6/INl3DqgX01zBSs/Qu5J5mx8om7epjFdox11icrvUMfdeCfD2od
 kTRFwgS7YyMCf1BKXMtuiR5C0xEqolbsWTO6J12H3O2jx+u8rxqBWA5hqYB2g2r23/1nLvurlMj
 kygFdHz/wEt3zlkTlT+VGeOm0Ifx2uN89N7Fw+82MRGtQBcFLQ5sNqbv4VA7oWt7ZeH/uoYgSkV
 hIP0aezYVlenb4PxYzuFterWXO27zvb1s0YEdK1qiPtFgNTDEyrLrMspdhCu2K5ZVckMe9bSBee
 SL4cTuk3AlL3NlZiIE7spnZLkOshIF0PhA+x9adxrr80JTyT859//4W533GyPiTfE+HL0C16zJy
 63GALxUAHaHdyf8IDZHeQ0V26u+5LUNBMGnsJ6Tr2UQFnGPPGhZo22uIpEA2Gvg9Xh3oTbpd/T8
 /44nHBx1pOXepuZcksQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310079

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

Acked-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
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

