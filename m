Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09660357D1A
	for <linux-remoteproc@vger.kernel.org>; Fri,  3 Jul 2026 05:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783055051; cv=none; b=L2T5m4fv4yPJrmWegAdCh+t4Pc0Eop0y2c8jYti8QHY2KHhS8KsgdM3QOysqO/y6uvX87tTrrErOPmgHpzFe2QRm+PI3hWPRu3SU8TBj9mnh1v9fny1wIze/T8FVdDvrTmW5GxGLLBb+2H9BajRnzkT108cR98n9xOJsdD4DIho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783055051; c=relaxed/simple;
	bh=AHfQqxqvUWEpKg7THeGPiYVTmEIZJi6on0qcJOPK+0M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f18HiMGx+lmFScQlQafZRKCmy2sKKXqq+xKQLodhmg6EpS2FKGvxXy3Cwo7lwrGLM1OmS2U2XhjuK0l8D2cr6AhBUfSnwJd82T/fdnhd58K3wn3q+m4lXWGMZnomK83Uf3IqXvwzfAP4aE0UPM+h3PY0HsE712xtlKRTx3Aj4+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b2nQYXfU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zus1RwLY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b2nQYXfU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zus1RwLY"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66342cKC2817861
	for <linux-remoteproc@vger.kernel.org>; Fri, 3 Jul 2026 05:03:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mMrBdqNXSo2PZU6K/xNM4G+bRIzioC1tVR0BqX8fGXQ=; b=b2nQYXfUm2eGaYpi
	VZ8gZEPjRadBwTJIrJgb/q1hux53hTu6YV0UkHgy0+2XOdXiVxRrOM7Hlrun+0OT
	cYpBW62VsoI4QwlmGaIQLZbynAXl9cE3RNlfgfsMBlptECgHgldYCHSAPvWDvEdG
	sph6Aj+0ng3UfOXzIvrF8OMprBI5vGANv19ypXQpxMhd0oTJD+Nw3yvhFdWVhQ3G
	JNcWzR+ZY4u5/TQuZAlDjlhOzIlrDIjAUyNIBEZyYonX+/fDIwx2KQlNtU78vPkY
	Te2XDCzw9afm8PxJDdSUx57HF7OxiH7wzdSyBF+Lr+oSZ4L72Nvw06KC+OAhRNT5
	QLju+Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5tpnjmvf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 03 Jul 2026 05:03:56 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88fc985a65so357136a12.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 02 Jul 2026 22:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783055035; x=1783659835; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mMrBdqNXSo2PZU6K/xNM4G+bRIzioC1tVR0BqX8fGXQ=;
        b=Zus1RwLYPx1s9tviEY+z2iTPv9tz+rR93s8XXFG76xqpbd65qCqSsDQ25u9em9ecbc
         qirgFt3NEF07vEeNz+CVQ/IMb+CUBvDkPIBqQI6niyTJMDazwVIIigJGsrT06Idxs91c
         4mIqYyQQ1NzVmlfxSBWZMI5nf8nn+WQxmXh58WlTMxiT9nRuBSWk+/b+/msKXIr1+3Ka
         zvrz4TILqLGYdJt9sLhP13PuqfndPrFK0VndvO9RzQ++wiSu6gzQ0ccq9Xz1dSKSZ9PP
         HVNMYtP39s3rdcDq18lxnTl/BqU7c/jZVdjb87RB6jLIOaiCmhyTEOm9JO7V8V21sOs1
         yo/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783055035; x=1783659835;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mMrBdqNXSo2PZU6K/xNM4G+bRIzioC1tVR0BqX8fGXQ=;
        b=oVLJLSIhrARPrqG8kjSJ901GplHtnD8L0whDN/VfXX+Q0MbIcK7HEx9pgDRXDwwEgB
         pExbZhlT3bjXWB3d+By/Anh/+8ixPzHg9w5pgeRIGhC5zWsaOiAcLhOYl4ifpAmxTeMg
         BjFCbG3f1n2yrTD5e9BzMh/TAwJYdW7VJISFG0Z+SOz892npXcDPW0cbR1Uk61lJ43xv
         3PCu5tWMPgHDLybgc9AwTNfzhTm/Qm2mi6dVe24CA2JkFAvFSw6hx8T2FlVaik7kY3tJ
         ZCr3z6K1GWsknC4dOEpJli01+zAU4pQXhjOewX8/CSJ4N2ezAS/2zpeaL/X8OH8f/mhk
         Bo8Q==
X-Forwarded-Encrypted: i=1; AFNElJ8vvsvORGwOZR0aK5oxfxvasByjX/+NdxsdxZ7CBRzHo1grie1/L1rkE7X1tv8lNAZvkN3KYPvalyYPd7thcVa+@vger.kernel.org
X-Gm-Message-State: AOJu0YwgOaMN5lmZN7nO6QjCL5JoxfmurAiVUTfDRGqovvAhU5ET/LfF
	KKEV+fmCQ11TYJa75VQgpNH2KnNO+D07+wT6wJSuY99rJTH97L+f5hUdLzjYJnyKyWqfYQvWsB0
	brg6XAv98QLFz9Du6W5bT1LhxEgs9RG9w+MTKQ3OlWLlTi72w8/5TgKgQImO4OpdcX7PBz6nl
X-Gm-Gg: AfdE7ckql8jR5JH57szZ0ew4KVnfHlnSl6EUad2qLrvwyu/ffyPJDqqEALZi5Fs1EdW
	x2E7ir70lPZwTBhKMVU95cPdm3L6rl4Yhozo4Yn6viHTVM+VJKSOuYknigDboKjX78ByVHikLYl
	aIT6ZSKmqE2KuMlk6WeIpU6dpI5MQDzbRstt7EKDG7hFUBgp8Yg5X99Qdg7AQfG2mc/3bf4CUcc
	nY0cEonTxVN2MNV0a0AktIOAuK0YHLHY+cVcAAHScdTMg7bvsjYZPLD/GOq5+JLyl5JbhkAGlvp
	W6XBrmPlvSbN66LuW60Cs/CP1kP3J5ZryIa/fEjsmeeJK5IOdUd+B4w+ex5eKowMY5R2zBWPgCd
	CWkOFL6gLHBYGotjJor5RSmKRWOfxtewDlWmI/G5c
X-Received: by 2002:a05:6a20:7486:b0:3b4:65ac:e2e6 with SMTP id adf61e73a8af0-3bfed362212mr10430109637.36.1783055035299;
        Thu, 02 Jul 2026 22:03:55 -0700 (PDT)
X-Received: by 2002:a05:6a20:7486:b0:3b4:65ac:e2e6 with SMTP id adf61e73a8af0-3bfed362212mr10430053637.36.1783055034786;
        Thu, 02 Jul 2026 22:03:54 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bbd2362sm16771941eec.20.2026.07.02.22.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:03:54 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 10:33:05 +0530
Subject: [PATCH v4 02/10] dt-bindings: remoteproc: qcom,pas: add
 #cooling-cells property
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-qmi-tmd-v4-2-3882189c1f83@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783055015; l=2326;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=AHfQqxqvUWEpKg7THeGPiYVTmEIZJi6on0qcJOPK+0M=;
 b=UImge96cIdZ4CYD7PRKR4dfZ7NsDhPZlNtKO/+BLXVmJD68rxmIrTitXhlHIyHyjcpNJYfrY0
 euRG1xFLIEdDTvmuyWrMOn/QY8QxhxkqjXlKR+tzdlPuLiDBY8vCCtr
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-GUID: 20H2ErUe4UpSeoySFdRSf3n65DXWyQ7G
X-Proofpoint-ORIG-GUID: 20H2ErUe4UpSeoySFdRSf3n65DXWyQ7G
X-Authority-Analysis: v=2.4 cv=UMft2ify c=1 sm=1 tr=0 ts=6a4742bc cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=glLd2v_-c-plxm5TIp8A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA0NSBTYWx0ZWRfXyO0IeW3t2U8C
 M9mitvhCT7mSP+zwOBYvaiTHnaMAf96YWDVF1ewDoduzrNF+UY5nLVfXBTXsORuMX9kY1mwBdaF
 zZGBt882f2QTWEIu4gHuzhAuHNsMl9U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA0NSBTYWx0ZWRfX+TI3xqQdc3v6
 /3J+b+BYPDQkrkqZ7C50lHADUsewop4a1qDdTi6x/huvGjtPooOaKh/jtrT0XedDZmzbNgTYXQ6
 6d9DsVr5VaR32Tt35KaGH9U1w1o3SC/YqawGwL4MLUtRRGFh+xptz1d5TaP2xvlum2U+jYptbzF
 b4JOrTo+sx6hzDRgROZThij37ea3GcPTqxC5Gp5NJa0w9rZP08O/S/h+wook6fYjfXzk7UJcq2R
 RCg9aM7jYYGsx9sSEfWvFHTsAA+Txo1kbM5Wm8cFj7aiO85Tbh3IXwReSGvfioUi0lDNLK+YdOW
 L/RGgqkTnKfbpZFOkqrfkxaX1dVhpdeb6hVZSV1T0DwuThzp5D9OKTFQqmGAw+nrVNvgtbM2ZzW
 EFZHha60NckFl26O42LBXEtY6zwKtPmAxMPnkITkJUr9Xm/JmYh8NuuNhSwjl5H83ptaTlZePaD
 SWE/zYc1xqTIxWHqglQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030045

Document the optional #cooling-cells property for Qualcomm PAS
remoteproc nodes so they can be used as thermal cooling devices via
the QMI Thermal Mitigation Device (TMD) interface.

Qualcomm remote processors expose TMD endpoints that support thermal
throttling through firmware. The cooling-device specifier uses 3 cells:

  <&phandle device_id min_state max_state>

where device_index selects the TMD endpoint (for example PA, modem,
or CDSP software mitigation), with constants defined in:
- dt-bindings/firmware/qcom,qmi-tmd.h

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 .../bindings/remoteproc/qcom,pas-common.yaml       | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
index 4607b459131b..ef11371058c4 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
@@ -79,6 +79,14 @@ properties:
       channels and devices related to the ADSP.
     unevaluatedProperties: false
 
+  '#cooling-cells':
+    description: |
+      Cooling device with three cells:
+        Cell 0: Cooling device id
+        Cell 1: Minimum cooling state
+        Cell 2: Maximum cooling state
+    const: 3
+
   glink-edge:
     $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
     description:
@@ -95,3 +103,34 @@ required:
   - qcom,smem-state-names
 
 additionalProperties: true
+
+examples:
+  - |
+    #include <dt-bindings/thermal/thermal.h>
+    #include <dt-bindings/firmware/qcom,qmi-tmd.h>
+
+    remoteproc: remoteproc {
+      #cooling-cells = <3>;
+    };
+
+    thermal-zones {
+      subsystem-thermal {
+        thermal-sensors = <&tsens 0>;
+
+        trips {
+          alert: alert {
+            temperature = <95000>;
+            hysteresis = <2000>;
+            type = "passive";
+          };
+        };
+
+        cooling-maps {
+          map0 {
+            trip = <&alert>;
+            cooling-device = <&remoteproc QCOM_CDSP_TMD_CDSP_SW
+                             THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+          };
+        };
+      };
+    };

-- 
2.34.1

