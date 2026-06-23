Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6185436E493
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Jun 2026 10:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782209141; cv=none; b=jxvuhrL6Jx9DiYianLSHKlwzCYp/NXkSHkFCvn/z+R0QiTY+pZH/nAkzi6NEX80mhRXELu1pA/8KM0hSh38pP6mpjSh7MawR7XkcrKIlD4/OQGQ5FSyXCmUpuXyZE+mz1tEc6jv4+0gR2mJo4YM/RbkymChxjoL714HYWvWWEk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782209141; c=relaxed/simple;
	bh=/AyXfvDgL6xS/1UvCVX17NbhNe6WnF28CEFcPHn4+7w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tnjImUJ57lJcbH4dbGdB89AkKUt/lXW6eIZcg1aiKR5U3SJg9e6jJ0JB3gHlTsT2tB3oLMkRrq3RfOyAERjjYGsZ6gUO37IxGhptKjJUUSB7qBcdjBJcork338bbbp4ocjga+hk3zwKpkr4q477/FqxxfdjBRVKUkmpIba+qPno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m4DgDeat; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gPePOslM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m4DgDeat";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gPePOslM"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NA3QMs953078
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Jun 2026 10:05:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7T5qiIsx+2dwMKk5877pZ1wxVPnaaufjkpooV0Vvk8M=; b=m4DgDeatgXlwGJKX
	cgzU0Mj3MKNi3z2S7XCkDU3Ip9i1B+/emvWAIoNXRlF4XLH5UAQAYDo0qs5ZCB/S
	Jqr3Xs/uLZShgSIDVgvSrXKt7/q7u9u2tQ0Z8BniENJqeeV6LUmdbgo1Ise4hIZQ
	myqLJlIGFod6E1KwBEHwJYciNjjueBy35nA0QlAiC4L+Mdm76o8TZHm8coTqoICU
	C34/qiBfDAaCe/MWRiBtXQ4sOArXk6uloGnaSOqQNik2sUXV4+RDKNBMR9Byr10b
	P/OAZlbWdAlYmPUb6B0c7M/g7ycuOAKrlAE7sHGbzLyrlwn1Ae0bO0JwqHBOVGOd
	t4QG4Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyr28r0hm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Jun 2026 10:05:39 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bccca5620so7486925eec.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Jun 2026 03:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782209139; x=1782813939; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7T5qiIsx+2dwMKk5877pZ1wxVPnaaufjkpooV0Vvk8M=;
        b=gPePOslM1ZASeQO8r9DGeBwWlIKAdgnBt5AExyu6PNf3ZrLsZhYTVAkXeu63dHyRQf
         hZHekmpkoYNgs/gcEMA6OhbrUt8A89zumxQ7f/g3dpAK6Xg6GlRBcaUAF2zAqUdbuC36
         ELytuSs26MybWkl9zaZW4QFQE2dwqsmHSo084oJmWj4fsLldmhle+/UC2Du64zv9APZu
         6I0ooPQGXU7iVFjda0aZZczdi58en4UMrDsSZd/fqxOABerx769l+lJ1xfM9WVmXbnvo
         rupSB06z50YnW77awt8kS2d+1AalTd3tchD4Vm3v+kh9dLsgQwlfNIzoeZC/la+5U17W
         Azow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782209139; x=1782813939;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7T5qiIsx+2dwMKk5877pZ1wxVPnaaufjkpooV0Vvk8M=;
        b=ZCWHPm6pHr4mML8WNX2HNlnHawghIpUD1TYEz5GeQ0vhDFjXSf436tlvVW98HBk8as
         qOT6qpaxyAAH2WRgKJSehgiqDUgfetqslGDEOTNJTit0kxgyNgVE7p37bI40dx8qwppk
         IVxaGr+Ttu27/3sCUgZBvGq6mU8Z3Y+NZBEnunJWb7lbeJiFN8bu1MDxCDSfqyKwnJt0
         J1ILPhKxzd6b8RLlFbQcqP2mXDRmqwUTNe6x1YGoPUqDTcdKym0FC48h6O9Rle7vEymH
         CARpdFogFeE8FlXcaouFb0Tx1UhBU/mMR2DAa6f6p2IwbR9OlMO8qPBgbhvZUBpugYH0
         vBPQ==
X-Forwarded-Encrypted: i=1; AFNElJ/TZAS8c/fPA6Et+fIUct92m2PgmrpbHe42PX/k5Abgcy1tPn3nnM1y4vr89Sk0ijNbdzqvEbW59vIP2vWWeSTC@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ9mnRlv+rpBdGbKBoDZmeUERpLvhe7HJyRQkdSg1jxOdF8pI3
	WuGGM7dcktg9kq9aqMMEaNujN4kf5J8HJJJF5TOeZKHjiHgHFe4MTa9Oxq2NQBz8i/u4s6egWN8
	i5JIRVDgLRDvo6AzZmFx34zN4/9UNBChvCeWDtnRrQ9vJ+BrxuR4hMXzR36aH1DFqzwm2zG5y
X-Gm-Gg: AfdE7ckl6f3ScwiSxubSJM1L8FhaxthXJzqLIhp2a4fF+qX7oBYciAf8ax32T3q8IhQ
	5w7+aNDimyiYe2UJT5x2lbQxVktXncimL0NDEtzit1cmi3jxcc/Aom9kflG4NFaO6457305XEQA
	tkQTy1qKNF/2dTqFY9C4zjhdjcsDNS7oJf2dLQfTqMoNP4uufZMA2bZTIOsrmGlDBD9z/4u5oOd
	XBhsbe9ddQPmRKKK5DzjJMp+NXq1e6ZEzVFdxZLG+5OU+pI2jIVDiD5WKmPnwbDFsCWcvBxxyLt
	u/0NUX87NH8NnRB6I0wMx89bQOoDOGskg5arlXzCAGqwb4OICHgPF9YK3l2WK+Yb0qsJCG5h4XO
	RUeG4VuiQulCL+fTknsQS6V5hK68FMme+Lr6HlWKNk4kUP22TnlmJOQEsrm/bdQ==
X-Received: by 2002:a05:7022:6093:b0:138:6027:b768 with SMTP id a92af1059eb24-139a3880c01mr11720725c88.27.1782209138751;
        Tue, 23 Jun 2026 03:05:38 -0700 (PDT)
X-Received: by 2002:a05:7022:6093:b0:138:6027:b768 with SMTP id a92af1059eb24-139a3880c01mr11720674c88.27.1782209137153;
        Tue, 23 Jun 2026 03:05:37 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139add5824csm11607495c88.10.2026.06.23.03.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 03:05:36 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 03:05:17 -0700
Subject: [PATCH v7 1/6] dt-bindings: remoteproc: qcom: cleanup
 qcom,adsp.yaml
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-knp-soccp-v7-1-1ec7bb5c9fec@oss.qualcomm.com>
References: <20260623-knp-soccp-v7-0-1ec7bb5c9fec@oss.qualcomm.com>
In-Reply-To: <20260623-knp-soccp-v7-0-1ec7bb5c9fec@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782209135; l=2807;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=/AyXfvDgL6xS/1UvCVX17NbhNe6WnF28CEFcPHn4+7w=;
 b=7xdpDTCpx2iK7E3J6J2bs0WvfqwcdzG+erfMrjBxniPOikOuzIlJnHnStAJvqXKbmxanC3C5j
 wKRkUSg8lyYBwTjM4Vllbuw0ajwBPgji20LmcA8HjQESh2Wz8/7FvgW
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA4MSBTYWx0ZWRfX/74VcoyF3I6v
 J2BL3u/RfnhMAq+rhRbZOlJNEylSuoN4An37w5J8w0X+n7uio/twS948GgIqxx2pGMMzufy4Npc
 0LmJyxn92A6OR3wGo5kohXyAnhRXxTg=
X-Authority-Analysis: v=2.4 cv=b4KCJNGx c=1 sm=1 tr=0 ts=6a3a5a73 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=VspIq9AKIDY_7iLw7w4A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: QPSWdAzYdXTtXrKOW8fNG1g8RDacAoeo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA4MSBTYWx0ZWRfXygzXsHv5kL2h
 XNTipC6oZ3HIAEhJdnMcPgBCrbJsbRjg9KjH5WLGVOaF30KMYmp/eHuTh+KifhMtlvbE8Cy6S0R
 ZwcMpLJC7Hd1kmxVEAMYuPf/0pSAKXWZf1teX1H5RrNgRVh3yenwwOhRZzGZw9XGJTRqeLempwW
 crGQJaCMEDvyPXZ7upOSuXzB37Vy0PKWUM7EltzGLBT30SQgbcT2LGmMmb5RqQMW7aECiu7Tl1p
 Lcnsrrc+T66HEXSsB1TdACZB/pPOM1RJrtDZBIvmWAlc5sYsWEGUffOUHfd+OYkWboLGuQElO3b
 sBhPTR0JbyZvAFlDRx8zBEmrCDZkHXIhEIjiCN5+LNw8ewNtw7o9coHp3JfE43xwUuoC4Xjlmqz
 JqFsvIq5QWJRv4U4oDIHR06YroIJAevFc4o7bfXBARl8gn94kzBlmdFDXsyWzbOO+iotAJU5IDK
 NYZmiJQ5sE7iOs1PH8g==
X-Proofpoint-ORIG-GUID: QPSWdAzYdXTtXrKOW8fNG1g8RDacAoeo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230081

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

