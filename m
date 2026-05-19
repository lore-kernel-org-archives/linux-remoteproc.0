Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0D33D16EC
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2026 07:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779175474; cv=none; b=hmAnHKt4VBPP4h+dZ4xSkhgYISebaKA2oHu9AIrme+HT6y+wm53oTiOkM1X38scxJGETzlG/gzwC/I7YEuxebWl1L2yCTlMGlIQKcJNUTsW6Ts5DX3ALBAICWw8lK2k5s1Hc07h7R2rewwHThJ1VbhCPv0oM5si06wWCWS556Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779175474; c=relaxed/simple;
	bh=/AyXfvDgL6xS/1UvCVX17NbhNe6WnF28CEFcPHn4+7w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ARe7XDX5DE7Bk4P9BoEiiFxNidZiJW7kNfNAqo1OH2RduBbkCoRIsqbbwWqhV+jB2u2SF09l4TYSYikldfX3iVYQvcQ9Xc7ZrzXLteoP0B/2ivMupAjJxjNpC7mRKchxsSX0jgjI4SgtC+iNYIaWtdHurZiERoOW1LDa7Yw2QJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yu2CxyIN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jiTIckeD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yu2CxyIN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jiTIckeD"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J5FS022700955
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2026 07:24:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7T5qiIsx+2dwMKk5877pZ1wxVPnaaufjkpooV0Vvk8M=; b=Yu2CxyINOvd9/idW
	trRWA5KyG8ECQ6dTFE23pRUbMdarVfLc00ephTJ/49Li+WE78uBWw9o+Zik0OLNq
	ljrhbCUHJKc/rXJNlhkwfi4Lk7MjqSmgaJkquD89vCcjf5HhG1ifVvUrLagMrrLd
	fgHSaP4PHJ4oV9jLH/59u4qdt2Zv2/ZSx2rjMZpKhnOv0JHpo40GjtZCNd4nLD8a
	8E2PiozikittSlcf0NQ552wYlwYTR6gGxn6qvbVtd2PgcwLyIkG1zVozlH8WQVIw
	SFKauN88fusikZo69zR4uAhT3Txwv0ysDxg3vu2wCR01Sxo7LjdSdFXmWt4tXqmb
	37Qv5w==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e82mekrxx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2026 07:24:28 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-303b38ec2f6so4386959eec.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2026 00:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779175468; x=1779780268; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7T5qiIsx+2dwMKk5877pZ1wxVPnaaufjkpooV0Vvk8M=;
        b=jiTIckeDEfQiQotFJi36U7Yd0B9dW2vqxZ3MVvVH1wRKjypo/EFsacZtGdViAnfBk1
         K9Es8TYO0maCq+fLfTt9VRr5vUKk1zh+n6w4nS1hHULczMttTNSnI86Ot2HND1PdsXaf
         rKh99V/6s0wNBqRtq3kJ5qVhvDsN265amQzpj0ghnn7UW4gHPG1gfjH0fdpVMJ+4ux31
         34a+YoKFyyKssEmj/CxGuF6gdmmeie3HVWoZ72dGCxmiYjkK50UvOn/THyI5RfPDzGpP
         tnioFuJ5SlY+W9B3THG5RotEhSqFvF5kRmQSoEh9ZUrXbk0OC1Jxttejf797FFncIRIF
         vX+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779175468; x=1779780268;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7T5qiIsx+2dwMKk5877pZ1wxVPnaaufjkpooV0Vvk8M=;
        b=Jg24wD/RW0lipXDZClKDmgqr0i0+lZkrgYlSigOH/RCHdfMDoufUnUb6wWkrmMF6Zx
         oksjLDIv5wzgdMNEfYONiRlXL1WtMC9xCkpX2Zw28WbWnf4xefc5CQdYuBHbGWSDUWbx
         11WPEJvrCPyA7VZEFmh2//Qd5ON4u8XWgIQdzt4ykBgzm8/Oa6SKoHiMpRWIPnP1AsJa
         hPosAHFnphs/iTpxN0+Pve1PRln5qncla97uVWNzbbt8vx5yM9/zLM/SASaxNY6JUOGw
         FXU0t43NmxRDLif4j2hCE/ymfJkybdSNgf+7dWlRiewMh8r2qXVCqXLOvBNW5ANJaHAk
         j5kQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Zcxm+1rkA6c27/t1GkaheGnxXHYmuNJsOcxdYzEmTe4qRcIc3mtuxv8eB7XzobibPQR3RsU5uXzlZxKFGWWVA@vger.kernel.org
X-Gm-Message-State: AOJu0Ywuo+aO6qZ8r/PxwdgQqmP0YskKDvIKH0QSkSPy5/pt+xphP2qT
	FihE2BcUCv33lUPz034NAcefVjjU+GE287CXhjYFOKMEwmMoX0dIgefe6Y2TEXj517x1b0lgn4b
	Ueowwz6h90iDPswkHe6QaAsKIT/TfviVjPvsfi1rjm7EpPQUHHKg/QbS4E473t+ZpSmt9xyZw
X-Gm-Gg: Acq92OE63WdzGgoxAOhQTA/ULlzMow85ss7P741vzDr2YFJdVJHrEMdNH4oY8fHhpq/
	10qxT9HFoIioI93JLKfHs7mSwhHggr5RObYPiBDrhcU3VZGkqugpW9ryuAiMPXMMumQIA69Vl22
	HakKJLsLSVE3qX71m+oUXpMYliklEXoMWnaKm1dSpHJWbAuTIrPR02zhWZobhX8zEEpQ0w9MCHz
	Ab+M+Wic3zZzG8v+bBIg+e0DgG31xQuVzqIArMU61aM6YdjSOf3JRSJECbfJZaP+AVzB7LmW3sp
	yWpcbOTpWcMaHOhuZ6q3W2m2z8WkbBxwHGaAAP5bejq3pXzUwE2CnU2dSvCQE6AUKcrTLVzSKIO
	TidZCLI+YEUI81FBMzJzmkQ0Sxy3XjjC9VHWT9VwjbiVfVcSWMu7MMBojrpZAULy3V7uL2X04
X-Received: by 2002:a05:7022:69a9:b0:12d:de3e:86b9 with SMTP id a92af1059eb24-1350592f049mr8723121c88.41.1779175467613;
        Tue, 19 May 2026 00:24:27 -0700 (PDT)
X-Received: by 2002:a05:7022:69a9:b0:12d:de3e:86b9 with SMTP id a92af1059eb24-1350592f049mr8723090c88.41.1779175467042;
        Tue, 19 May 2026 00:24:27 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbed2232sm23337779c88.7.2026.05.19.00.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 00:24:26 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 19 May 2026 00:24:19 -0700
Subject: [PATCH v6 1/6] dt-bindings: remoteproc: qcom: cleanup
 qcom,adsp.yaml
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-knp-soccp-v6-1-cf5d0e194b5f@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779175464; l=2807;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=/AyXfvDgL6xS/1UvCVX17NbhNe6WnF28CEFcPHn4+7w=;
 b=cuOgpRJtHlfYWJtGFnd5LiDPUuT4WcCd02AaKUlrprpWmRqGjO1IlgGFHoi7ZwC5+oQbVZhf+
 zJzEKHN/EvzCMOzwLG+QsVt4VC3jQyuGw7Ur5nBG1fc+9wZlKiWDGda
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=Tr7WQjXh c=1 sm=1 tr=0 ts=6a0c102c cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VspIq9AKIDY_7iLw7w4A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: vp-AaRTa3hmBEvZMWDH6V7oHWcEzhNiL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA3MSBTYWx0ZWRfX9Py+dSPrQJvo
 48NtbEN6zE+Fa5zgZovQ3AZTLUu8FoUyBj6/hmU0livF+RQ+0XpDeQc4FX6JUtOqkR3eVDIPZ+4
 ZGDBOd85H8D6WAkQ36PUStNGROiVteHvzL6oy52H/M47oG1LTobMvHnc/jbDlJCvUMIBRb1Gjlh
 L9Rrl3EItp2VjqK+eihIRBqDvhjDRjzvbn3Orwc34AY0GHU6YOJolnMDSE0Wqm06u10BOsAibXu
 plCTSnWlhNMSqLWJL5dA7jvY4mNh5jmJ9kazj2EkOW8KFBa0mkXQJywt0QEhstHkr1FsWCvPtDt
 idVVVpwFpIxsPWQZI12drjJNk4SaAggHB4KGKQYhAk2tGTUP2oQ71ki4I3VFNehG72NsSiZ6DIW
 JI0eWa0VEZqWR3KjuuqLSsM/2Z8pryWyYBeJVR84XpjY+FZOGzxnzAq5h3KMb3SxtTn5lzogX5D
 +WfNyPIhydYe/iCKcwg==
X-Proofpoint-ORIG-GUID: vp-AaRTa3hmBEvZMWDH6V7oHWcEzhNiL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190071

Items in qcom,adsp.yaml has common clock and interrupt properties, move
these out of the allOf section to avoid list the compatible repeatly.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/qcom,adsp.yaml  | 64 +++++-----------------
 1 file changed, 14 insertions(+), 50 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
index 16a245fe2738..a270834605da 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
@@ -32,6 +32,14 @@ properties:
   reg:
     maxItems: 1
 
+  clocks:
+    items:
+      - description: XO clock
+
+  clock-names:
+    items:
+      - const: xo
+
   cx-supply: true
 
   px-supply:
@@ -49,6 +57,12 @@ properties:
     maxItems: 1
     description: Firmware name for the Hexagon core
 
+  interrupts:
+    maxItems: 5
+
+  interrupt-names:
+    maxItems: 5
+
 required:
   - compatible
   - memory-region
@@ -57,56 +71,6 @@ unevaluatedProperties: false
 
 allOf:
   - $ref: /schemas/remoteproc/qcom,pas-common.yaml#
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,msm8226-adsp-pil
-              - qcom,msm8953-adsp-pil
-              - qcom,msm8974-adsp-pil
-              - qcom,msm8996-adsp-pil
-              - qcom,msm8996-slpi-pil
-              - qcom,msm8998-adsp-pas
-              - qcom,msm8998-slpi-pas
-              - qcom,sdm660-adsp-pas
-              - qcom,sdm660-cdsp-pas
-              - qcom,sdm845-adsp-pas
-              - qcom,sdm845-cdsp-pas
-              - qcom,sdm845-slpi-pas
-    then:
-      properties:
-        clocks:
-          items:
-            - description: XO clock
-        clock-names:
-          items:
-            - const: xo
-
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,msm8226-adsp-pil
-              - qcom,msm8953-adsp-pil
-              - qcom,msm8974-adsp-pil
-              - qcom,msm8996-adsp-pil
-              - qcom,msm8996-slpi-pil
-              - qcom,msm8998-adsp-pas
-              - qcom,msm8998-slpi-pas
-              - qcom,sdm660-adsp-pas
-              - qcom,sdm660-cdsp-pas
-              - qcom,sdm845-adsp-pas
-              - qcom,sdm845-cdsp-pas
-              - qcom,sdm845-slpi-pas
-    then:
-      properties:
-        interrupts:
-          maxItems: 5
-        interrupt-names:
-          maxItems: 5
-
   - if:
       properties:
         compatible:

-- 
2.34.1

