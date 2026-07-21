Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525D4399D08
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 14:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784643624; cv=none; b=einpgoO4whfynxTT6bWd748dGWbep0Lw1mHzUI9wFeRvhLdOCyFMkVp/6S3c4b43+X1noAF3WyG8d6NL/Sj/OT+b6j/mPpT15ra/5OEFYHF01PsTXNrQMpDgewagElayw4Gdq/bLDXB1Lktnqv+zHUSD4iAECQQfdIzOKsFhH9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784643624; c=relaxed/simple;
	bh=fzzUoa+Dil42p+lzeQF1+DhscAcKEl10Z+qImcbAWRg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kvjqkNRTskC9j5qiqAkoduz0KN7uC58uoy8KTJKYEukUee1tBtjjh6REYi75E+bJ6DfTfiaSukaLbcnKXqWIIir1/FnBnDI2uKyv17bvjFLxmVoQfhzs2vYj0jOeHVGDyrxrRwWq/erEMwpd1Muxr21fGz98T5EZXgMNjWhc0k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IN1FlS+7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RyysXIyt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IN1FlS+7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RyysXIyt"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDfwnt1804790
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 14:20:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	94RrMYvNCHTTzn8WKE6y5BR6VH6CzIa62cD5ClQVmRo=; b=IN1FlS+7CNgOpXdX
	eNQAICpKQEHA7llrcE+XX8TCKq+fIwyckjkoFBZK+kuI/8SMwFN4Kew8El/E7XTB
	n1N7DhvIT5rAI/CB8pkWPScmxGg8Q/shjIuWnKcnd14yl1pppQ7eLbMNG1iWAs8u
	OCQcmVzoRC7DET/a6Tx9xAWiV0Ao6IQtnuVXsnYelBK+ZfQSHh0DwlaXgZNO7c5X
	K1xR5l3iZy24tqjxDGiih7iJB6wVbO244ps31aqz/DSs+RS1Hf3o/ZW0qRGHvy2F
	zuIfZOWIUb5jbxPYBQE9vSrrax/+51v0uOsg/ijt+nsJy9GMNKW6k2cEQITuKfoa
	sfJZvA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6pa95bn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 14:20:22 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1e6f602cso173163851cf.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 07:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784643622; x=1785248422; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=94RrMYvNCHTTzn8WKE6y5BR6VH6CzIa62cD5ClQVmRo=;
        b=RyysXIytwc84Q2tA6xUUuUgQQV0lanbLqEv8A62sNZz/Q8vZbefKv2n2ylESBlkfGz
         E+xYgwXkm7V6viELeRl3Xbfrx6rWwvEAhnASgTeRuCGtrbFRcCQmenhMtFWVp//bdQaB
         8W+bd2WKCNrMZ1oCsBTF6vmUkesbIzvo8YM40/kRPrtLZKvz00ohDRpxbxjP1K6sOi5K
         kujzw7uFk4q+eq7kV/Bj08Mt1SxUx9WIowcY7aTaTlgDsozcFE0fryy7SoAKA98oIFgy
         Hwat0z0q3TOoXcrwb7oAdy5XlGospmghh0nYmHgNQnldurc76OZRKTfkGz57nvbA6mru
         tUzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784643622; x=1785248422;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=94RrMYvNCHTTzn8WKE6y5BR6VH6CzIa62cD5ClQVmRo=;
        b=iXZ//Qye2+ruFJ/aQPtYnYe+qyJ7uzoQsAnvdjZq+3iSdq5XM/uKBlU3uU/abDcP+1
         W/o4JBiJt72ST/OkpsbPjteoooR9CfB3OsF7gsO4Ne3YQtLARll4MbQJM1I+vM8K+qyU
         zkriaQukDAlV9X+HlKY4hPvjVXlNXyNnHjg+HQ33B070oRobmY1D5BrFwFbwIODqWX1I
         2Loe4kRwYqJtBCG5qV2dgvZqZWJFrTjDQsKrfvdLMFLIMCGW4sPweqlMenU35sYTq+4Z
         IH+RtSzmXeHwz3u2UNWjzn388OuOI54PDTV3S4Yk0I7RfGwMVCh9Yy7OQfU9DTXlDQ73
         IGrg==
X-Forwarded-Encrypted: i=1; AHgh+RoJvzYxXcMz6LAAtDscHzyX1zetxTbNCsqoLKQknDTeRSvyHVPaQDyiZ8hPP+YHHFbZlIeIwQN5l0/83+akOpfG@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3f7Vw8VQ1UHfDMSX2sU7Z5wogaYhM3RSw5yU6apfbYxD9RL73
	Drf57d1G323Ugssku3wIIfvzYz8II04WZsuIVtgfeWepFuOUasrYtv3OGwsPh0rBe3CSI/O8OFF
	7JLFmAVrjmbIFCXwbRi5yvw0rWQQtDg7Ux6W1pcE44xPlbR9Ip7xWd82YGsFChOYNdX6vMwow
X-Gm-Gg: AfdE7cknAMZEKfe8Tsjd5PEchi3qTDMSZ/761KOEWvqzpGtQsHF/5Dgp0czZYBEjsub
	0nNjhBq2JZvLJTnhbMYyEYFF1fdhEH8LZgPYWcUcOm2BnqBgCLUW1Zw6P6H/OpfaRc/1VDf9oZW
	x/LoUqQ+wCtC0KIAk3qJjJJNlUZ82j6xaEnvJQNrb2/4srLJp7N4vhT+fm1ArntBpjMzsNTVgXs
	T4xCxbXH5VGHjwWPx3C3ImP77vla0bdqDadDiTs27R9GSx16Ni4eXQKqyZsDX/3Jgf252ricseH
	DlXsjLGc6GhKOwHuP/8OgnbKg6TKSxJiIAWVrcNPzIhY7LgNeVAcuZYdi5lP6JeIFvo0Y7h8Bcf
	UfaaU7cz2
X-Received: by 2002:a05:622a:2618:b0:51b:f40b:2fac with SMTP id d75a77b69052e-5213f66a697mr179312821cf.50.1784643621293;
        Tue, 21 Jul 2026 07:20:21 -0700 (PDT)
X-Received: by 2002:a05:622a:2618:b0:51b:f40b:2fac with SMTP id d75a77b69052e-5213f66a697mr179311881cf.50.1784643620475;
        Tue, 21 Jul 2026 07:20:20 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653687b2sm84762025e9.1.2026.07.21.07.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 07:20:19 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 17:19:57 +0300
Subject: [PATCH v3 1/2] dt-bindings: remoteproc: qcom,sm8550-pas: Add Eliza
 CDSP compatible
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-remoteproc-eliza-cdsp-v3-1-557b5d02fdd9@oss.qualcomm.com>
References: <20260721-remoteproc-eliza-cdsp-v3-0-557b5d02fdd9@oss.qualcomm.com>
In-Reply-To: <20260721-remoteproc-eliza-cdsp-v3-0-557b5d02fdd9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1683;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=fzzUoa+Dil42p+lzeQF1+DhscAcKEl10Z+qImcbAWRg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqX4AXzb6Ega1Cr1KJnFqgFaLQ0//oqditlPGUj
 9VHo8zDvXiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCal+AFwAKCRAbX0TJAJUV
 VoSAD/9A64MdJHodCYZSnSouk2ZJexs6P1u0hWdgHANyp2uOQDAGnS8nQAuBHc0GAUX4K3ILWkD
 4cqCKDLqIn8XVhl/CXLvwE9f7Xz2wymTqBjOSDV2MFp6vfBy84epUE8Dd7DR6nJmsonztdcokU0
 OU8YQ7c8Xd+idxFYs3F2D4Srnijf89LAG3zGK898JzRyefTO3Uuw7JraKblj156B5+zEFjGUNLW
 y7fP+6JO9trSubnyu7P2WcsS6UFODqbKcHA1o1PR96mgIN9MNVAVP39/lvGvWHuOPC/Q90HrMzM
 SyxaWGZ8cS9Q73M71SgF/FwjqUfeQuC7LP3aD/FiRMUyvElYcXgXzTCg1uOJ+gkvw8GekcmSpZ9
 KAOVk1OHt3Pxma8GkZU2TV7JDyl+LTuO/00BQjIat2DXLarhc86fPHijFThpanc+zVAHw0WNcGl
 QjMPWqn827Hv3YHtBxHGdsm7HbPf4lRlo0iGFkzOUBGDMFi049TR0cJK9ocpwKrX1OkVA5SqsYE
 kOHoj8vWR8Wod4514jJGyLJ8De/EGyAk1l/Ts/RC5qt93+mA5zLZmH7FUV/qi3XV8FOiHDMezr3
 qeq30rKjp0UIu8s7ZB1Ve0HEfUuBKt82YyVSSasN0EWH1SN9QdQ3qoo9RkhmBGxIsW4DScZXuiv
 13DEPt+ybfkJCFw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: SJQjDV-tWnoSbQHKeTrKMPNUs18EId_B
X-Proofpoint-ORIG-GUID: SJQjDV-tWnoSbQHKeTrKMPNUs18EId_B
X-Authority-Analysis: v=2.4 cv=eYYNubEH c=1 sm=1 tr=0 ts=6a5f8026 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ovmeWcPxak0IfAIrAdcA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE1MSBTYWx0ZWRfX8z3rItgXmc6k
 RGPvJYN/HXt8SSeVL4HSwFknKx9zlHa96q3CzAN9EadWcSnYsuzUzYvatGvnRrozCRCVLH7kJSi
 2Koojo9zxskEn2lj9OpnWYEadcbG9zf9oKhp1Rwn4Xn8YPe1iIBPkB85hbZSRa7oadUrhbB/AvX
 +OmnQS6ztDJB5uT2KR6Q7psg4RNgrew29dkLp0N5N1uW6639dML/qPuEgkRGDE6qmowcPhZwoTO
 Y8zlX68Fy5cNPM61HTY/X8EVv2RHDg1HIie1Td0H7vct2zTfBa9G5ee/i/zW4W3csl7sHJEq5E8
 HyhW3On3zXXsy03OlwViOprHvzgMphwlezhJSfr83X3oajrlUvp7NW5fmrpIPdDdjKVpSR+2PWm
 cCZQBDzZ3Xnnb7jXtXgPaCDy5smCad3eFTmWBOad4edxU2CqrCOvVlvq3updr2OJPItdpGsxz4b
 Ngx8zrsgxRHpj8z7zow==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE1MSBTYWx0ZWRfX2bOat0fjRrnA
 EsTodfDgmkc0N0oo4hCDTFVp7qTw5Xn81ir9tPncVd+GrihqTyzjNxCRCaDuackVPDu//4vc8Jd
 SGFPe22kF5mgN2OmaT+qnMGZS3XopfA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210151

Document compatible string for the CDSP Peripheral Authentication Service
on the Eliza SoC. It is not compatible with any other.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 .../bindings/remoteproc/qcom,sm8550-pas.yaml        | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index 019db91be7fd..5492a88bb100 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,eliza-cdsp-pas
           - qcom,sdx75-mpss-pas
           - qcom,sm8550-adsp-pas
           - qcom,sm8550-cdsp-pas
@@ -173,6 +174,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,eliza-cdsp-pas
               - qcom,sm8750-cdsp-pas
     then:
       properties:
@@ -288,6 +290,25 @@ allOf:
             - const: mxc
             - const: nsp
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,eliza-cdsp-pas
+    then:
+      properties:
+        power-domains:
+          items:
+            - description: CX power domain
+            - description: MX power domain
+            - description: NSP power domain
+        power-domain-names:
+          items:
+            - const: cx
+            - const: mx
+            - const: nsp
+
 unevaluatedProperties: false
 
 examples:

-- 
2.54.0

