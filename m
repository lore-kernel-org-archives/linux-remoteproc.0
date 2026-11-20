Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795180905;
	b=NpF39CJP8do+NyDvonoTI/lvxT53zJI/ucLRxBdOxyEJgNQekWOWB3ze+sjdPWUHivHG
	 Grnk/P5JnO/k7VnU3ZAENx5/1oG20xQCR0WxNwHiDFZJjgAYRJyXRi2nbxOtMBDfo4oN6
	 0UBPv09gl/faIZpjqOEhIdO0I93k+/548hTZcFD8+G/iej8IBXVkVmxlLPTKStVCc9hjR
	 fiq/4IMWN/Usj6qlAjZnDtCDKyk5dGiM4sN2l1aJNqwcnoBnhB6HUiT9xKGv4ITFUB7G9
	 8iltiBn2MhsvGbC1lNBrlaqgFKYG2f7kopaUpsazZihggSo3ySv6BhgTzwSEqsOQxsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180905;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=M8xRW69kBNQ8Kj0Rskt6puJpENL7w9NsJ+tqebELTsE=;
	b=wlHz2QP93KTxcNAcTBYq3nWBevaZWa3LubT6Q4E/BbboYhRrp6Pe2oaUEh0h2oJZhmUz
	 0EhgnODNV3Jmefl6dYEZ7OItcZAQIi+qayYHfhCKHOk2yp+4KWYHh2yX5rKX++Tm8ndEE
	 ihYyYf9JHtJ+LNOdKmdIKr0Xg7IY3QVkeaw/MMKUt5cdyuC6MOO+5zyLwfac46MXVuAzr
	 N3FftdGfdXsErzQAoqlYXy303qGNLgBY8imEGLkY3m8tP87X1HqZ1nvh6cwYuf/WblaLY
	 MtO/uVypDqF6jf4vCdlmGrl14GEOJ5jaqHGlrCIkRklQc+cwuleGTHLdPBlLXN4PzkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S9piEYLS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iH6gDXXr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5FCB606A32C
	for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2026 13:21:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5FCB606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S9piEYLS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iH6gDXXr
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAk1vI556579
	for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2026 13:21:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M8xRW69kBNQ8Kj0Rskt6puJpENL7w9NsJ+tqebELTsE=; b=S9piEYLSAT38ewH4
	57vPxHKJCxdycQEkiZOIRy43U5wFR2BL6/SjmkAa7LSR1H9jMCoS/QYAxHmGhEBC
	loMgkbWXVLgoMN0xpLaxzvOEUkmQbKxY1PPZWZf1mJG2C5uOQyKVakckY7i0SQy7
	0znbckLf9e7kK51Hvc9Kaqqd9sFsOPS1BoSQnZXfXVbjYjSmSwwTxuX3YZwT+6tS
	WehIEIChJm/kBzDSygblpTjhSwD7LYo7fdkT2QB6cgjLoSEdT1X+utHqKYbtM4WL
	XzAveiIcOhr/V4gk9bRUb7ltBKlconXI7rb/GC0Lvi4BXJfK9F0nToFFv6FiJg/Y
	fYArrQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fsbhxt5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2026 13:21:44 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3425098ae4bso2061572eec.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2026 05:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795180904; x=1795785704; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M8xRW69kBNQ8Kj0Rskt6puJpENL7w9NsJ+tqebELTsE=;
        b=iH6gDXXrsCAe9ZNIlkL4H+DhDhgm7yRw7LIGvvU6M3jGgRLKjPzYerrnEKI1n+GwGR
         ACBptUubL6Ur7AktcB8plC+yS9Au5tB8p6jJO25E5K9AZXElQXoNQ0n1t8JgStu6JHI4
         4fRk8kQekJ8HPlC2I3TpsWiFmFeQ2s0/6oO9mOFjtI2hRBNdZMrWQAflyjblmbtCNDmd
         nxQl+XlT8ZpRV6BiISYoOgtbDcQOB2RFynHMhE9M1KXyCrwapyHgJgTWdWR0noi53cDR
         z+q5ADxYGOafMiM25BEVPFCEMqaWLc7g1oSailBLFCjvChW6a2HFZq3zs8tk60wjbh6j
         cAZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795180904; x=1795785704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M8xRW69kBNQ8Kj0Rskt6puJpENL7w9NsJ+tqebELTsE=;
        b=JvSZcS/U7lNYBOTK1OCPxBVKRWowFA/NCnRVSVt2LcmTYxfLlRGCAb5dxOYnvha18U
         +tmYbxu7/xSi5HFCuDAqsaLgDXou8wM8OUebvBYMuwFU6flGkHc5x1XSTaYXahTklLXh
         fG0iUsBj5h1HN8FEhpUkmGRjexI3VHtsdkA6z3H0uWugp293+uFzPAxt9DZBxHRmL8Ky
         Ol1GqBtJt/+zFSZKWYJRfRDIR0DEVzpJvA1+eHgyQeFnBrbQz5X92Z3OYegSwt9UsNBB
         Z3fOjhybEPCURd4ouzoyrx77glMbgabwTkBolohMNtOpD4Rg5eRFkp58+a/fne1NlLxw
         6LgQ==
X-Forwarded-Encrypted: i=1; AL+hErGnLcvulaeTBBvlf49tNVKthydRsoD+1bvKgCHnkX0s5CHb3jVKn5f+HrWUvq343K4AJDtlnnLvp+o/7elfGtY4@vger.kernel.org
X-Gm-Message-State: APuU4Z+nnd18Zb7g4P6yGrl7hl/ttf6fqalOElYkkiFc2kMw7eVe1OiM
	46KfN+sh40F4ic65MyVaJ6CVbkL1AGIBgjO6Uqo769IkiOmX/BxxVz8G7V6zknB6mTgiI9If0d0
	ctdVzSB0bPvuORY5iYf4JplHcXWH1fnwsdQcIGi9jpFQJK96SaaetLVaxwBn9fX4yUNZJ6MFB
X-Gm-Gg: AYBFou1ya1WrFappDgQGtw6fSVC/CpV4PY+8FqgLKXUgNu94vD+B3cE+IIjImixuj59
	1D+JBNItjzdK53PFFxo5j7gNxxcTsElYlq6EXXJ5PJ3gGWo1r1u+q5sQ2fo2SRX5dKgJQTagtqJ
	1i/v0KVe4ATeL1cBt3ppJMgD4W5cz+W8J6Ic3qHRFDMqpxfyKouivVpqma6aVPHTuvNcmnWrEZ0
	BgjATvfS4jBdR8qmtzFz27mQs3MaMLB+Ab7m4DvI6nbA6ewuccHrkDUOM5OSb0EjBAsxNh4RGU+
	3ffGvFkuqtx++0eFO6kMfoAz0SPuKLoVqhstqsJsdBOHnyXOFJQ7SRT2gWaLLqdSBupeBMsNIvc
	jDjK3CwyVoXJg0ohN8aMOZmnKIWBt4uvFHWfzFfFBTEVcFrd6LLtQvDcV/QEoy+n5
X-Received: by 2002:a05:701a:ccc9:10b0:1b3:b3d5:566f with SMTP id a92af1059eb24-1b5568e006emr2782889c88.11.1795180903270;
        Fri, 20 Nov 2026 05:21:43 -0800 (PST)
X-Received: by 2002:a05:701a:ccc9:10b0:1b3:b3d5:566f with SMTP id a92af1059eb24-1b5568e006emr2782861c88.11.1795180902539;
        Fri, 20 Nov 2026 05:21:42 -0800 (PST)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55682d301sm6929628c88.10.2026.11.20.05.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:21:42 -0800 (PST)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 18:50:51 +0530
Subject: [PATCH v7 3/5] dt-bindings: remoteproc: qcom,sm8550-pas: Allow 6
 iommus for SM8750 ADSP
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-shikra-el2-v7-3-9d9000eb50d4@oss.qualcomm.com>
References: <20261120-shikra-el2-v7-0-9d9000eb50d4@oss.qualcomm.com>
In-Reply-To: <20261120-shikra-el2-v7-0-9d9000eb50d4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795180879; l=1816;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=DfSqnikNSHzMY2hBFUqjQHSQRxokU/djZVzyyL26sSI=;
 b=HN1G3El+AirbAIHwGVq7UBAPuTnOV+lQSOajBaUhzrM1R3QOyXalQCjnzefm3B/aTxHHsR6Iz
 E293IXpejcoAgpKWmnpBXiT3MRDJgvb/Rh2hN/aliVr9q3mFVZM5AHq
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MyBTYWx0ZWRfX5kmhkcNyEjix
 Rcf8FLQvlzMJAixWxGnfSgcKOWFPoZDCOK/lIxgcEgoMjuQUaRgSNcUPOSsOuZu43ccRAO8WmU8
 iISxQlgviVX+7HvzlKQ6kBd4RMUq9znuSBzjJSKtchpTxzd5AVP/aL56KVqUFcwpqms542aKQ/F
 2ZGBd/n/IvPUN238WacJTKoUCMpH93DefkdbNNWqKOASFMEKt7YFaq9KgjWiRpZSbAhb0VXMMyP
 lr6pEiV1DYircmCGgS+nH+aLXHVUxbjdo3lftscSPi913C2Y8dUtwjY5vejbasRcq9stGTvOqTB
 1E+nz3jaJClFnfY8B32ACoO3Usm4p8qQmZG8lBU1yns4igW69MyLnQey+lco64eHl5nY1dgPPG6
 jcBSN1JqzaLBQ2rVxdNREui0z3bsKsWmKT6hG2VamXBDq0GGUal/fUun0uZ//SIX/L1vyI5rWbj
 BBQKpO/WAziBCn/k2dg==
X-Proofpoint-GUID: g3y1xED2a53Oo0bEDAvwj1Asi6YQbmQt
X-Authority-Analysis: v=2.4 cv=DeiCOftW c=1 sm=1 tr=0 ts=6b004968 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=heRerMffL7N6zYf9F1AA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: g3y1xED2a53Oo0bEDAvwj1Asi6YQbmQt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MyBTYWx0ZWRfXzeIn/RMLI9DZ
 AgL/XKmQc9M8SxrCMsT3/pvdxaLTikNyc0L+R0viaiDJLGL+ATSwSxaSmTxlivoXt/U28+NCMQ0
 bJBOlXiyNKHb3y1c2WQ2rhtjFLWEdEU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200053

Remote processors behind an IOMMU may use multiple firmware streams. On
SM8750, ADSP uses six IOMMU streams, which exceeds the single entry
currently allowed by the binding. CDSP uses a single stream, while MPSS
does not require any.

Allow up to six iommus entries in the binding. Require six entries for
qcom,sm8750-adsp-pas, disallow the property for qcom,sm8750-mpss-pas,
and retain the single-entry limit for the other compatibles.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 .../bindings/remoteproc/qcom,sm8550-pas.yaml       | 26 +++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index a3131e6417f5..45cc50d9c1b7 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -119,7 +119,8 @@ properties:
     description:
       IOMMU specifiers of the streams used by the remote processor
       firmware for its memory accesses.
-    maxItems: 1
+    minItems: 1
+    maxItems: 6
 
 required:
   - compatible
@@ -323,6 +324,29 @@ allOf:
             - const: mx
             - const: nsp
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sm8750-adsp-pas
+    then:
+      properties:
+        iommus:
+          minItems: 6
+    else:
+      properties:
+        iommus:
+          maxItems: 1
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sm8750-mpss-pas
+    then:
+      properties:
+        iommus: false
+
 unevaluatedProperties: false
 
 examples:

-- 
2.34.1

