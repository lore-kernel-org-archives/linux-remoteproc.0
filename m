Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF76D2DE6F8
	for <linux-remoteproc@vger.kernel.org>; Thu, 15 Jan 2026 06:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768459397; cv=none; b=QBS5B7Be/kNHMKGXl/he7AKQ5NwfcWMwCZkpH06E2RJeZn6cpXShHnnJ/Sx4RzN58tafrd4ykSm0hw2Lys2/qInA9P0LOvMf49d0OW0BgWsgXwO+2sksW4br7RBbIMBgvdQDD+RKYpfurcTvHLM20Ric6qbD+BT2AgivQ0sy2/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768459397; c=relaxed/simple;
	bh=cuUwUuj4xccTZJ0uZTOAJPjw+SrCAbNU0A1nzSPt3rQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Eh6xX2MaS7kLBqcNLHaDrrotTpMofZfhf83xgd1tSns0a3N/s09bxFscEJ6dSQww3rQ4DbkEzUt6VQXpfE5Yfcj/t73Qrc9nYuIzVUkV7i2QNWGu1Ca5+360amTpr6XLnBhykXoYaT0e2PnFI2CdRlv6nBQd1JQsfnhp45ICKRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U8kqZTw7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X1qxB4Cf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U8kqZTw7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X1qxB4Cf"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6fcLa606204
	for <linux-remoteproc@vger.kernel.org>; Thu, 15 Jan 2026 06:43:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n9VPi88Q+Ldbr4QJ/w3fFq/CzZF6fSA6/By6s4GlNuY=; b=U8kqZTw7MWyB6yc3
	+i6MAuRpHEkLEiDTyhqlyPwKfkuposT1nweB2xsrYqXMSUEER5qrlzehpR+wepqK
	5dwkeK3hakhnlvFWPEN9dZuEtSk1ErGjQTMsqScW9mAnPI6uDPdYxdnUhUB2MPXk
	+lD5DHeL3ZYXuOlo51T2Vl49gY95MlxAwOHad4RcTnuM6SEwRBSDOGAupFmV5Zu2
	7sOPHs6YVFLtGiXW1t/wgHfX/DhzgnaF3ypVznwsnMuCcl4mcpQ781tZ/p1jcITb
	8I6rATosk9BKUt6gm7aGVHzwgAlsvQhnvJSFRqnZA2w68O9Dki5Wie49wsN+bG7S
	XBQEdg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bptna02u4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 15 Jan 2026 06:43:07 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2b048fc1656so2040058eec.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 14 Jan 2026 22:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768459387; x=1769064187; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n9VPi88Q+Ldbr4QJ/w3fFq/CzZF6fSA6/By6s4GlNuY=;
        b=X1qxB4CfvSIS+qQtrpghwZgyzC2RPQjc5U+kCfpqHLtzYdo6hK6+61kkvwDZW2sKnO
         HVmw47Ch+DO8gng+SI88Hjct54/6eh0KYAKNqsGA3qch+Jo0mvH5XwPzFWQ5n8tu6jV4
         1LzmWHs/9Yv3RKzYTIGjR+GbSoguQVjJU24HYTNDBo6gglVC2f++RfHXSuP96bPYDxqo
         QIkwuMohB8vqlV1ztFXaPcrGjx4cUf5PygbFjiGo9auojbCze/8OJeU41n9LK+vOuNFT
         IO07h6wHiJe0S1RfJHuCtOufA3bFhBxwrF4loYY2rVsJXYin0dIKNO+gnaNDIdsJNrVn
         O6zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768459387; x=1769064187;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n9VPi88Q+Ldbr4QJ/w3fFq/CzZF6fSA6/By6s4GlNuY=;
        b=nQBZ2BrlVl91i/WPXwfO7HF48fGktenbaWIzoAGjjKae5aU/DZ69mCl3emxuvmJBsg
         XDR7o0fzI1QjTdQBGXESLA9mP8En4P29bJ2QQPWXp97iJK6Rqzx2T6oey7NBZ82xpF6Q
         aiXS5cjNvz8a4ID2DJ/NrYXEVJCD7iceaph7QayNuoBBhB1mxnvwSEiz2RXNRypdP1o3
         oEDu8eIjG4GQ++MkVgNVeqmBQWXk+uSYBHewBFqOE9TKE7kydznVwz0ozqEWcwM5YbK/
         4fwbbn/wlLdW+X3V0xFkKpqzYLPqCOHnmDo/4iwR0XJWaCPsJ8nJ/BDS333x0SjszaG8
         pZ6g==
X-Forwarded-Encrypted: i=1; AJvYcCU8TuM07cl5HkiIjsUay151I1/ea06qtm89FCECv6dOrAQq9VEM7fSlfPLHhPaxGo3OtFO9PQ5EsKwa3gxasl2a@vger.kernel.org
X-Gm-Message-State: AOJu0YzKR/EVTyPrUXbXN0VRGkpC/jWzMUZnMHuEu8kNVbFqwAGUC6Po
	iqVYWBEa2DRV3Z8wr5LmY5qMNoKszxN3kweqdWjbFkB3XPvhD8L1fARA2YT+R+4oDQKNaFzSfZg
	JudwloGEEN/ds6u0PBejh9hqTLbCANIS6PS616sRaPGQXdNwkDN5SlN9AAEY7ACsqM6T085tf
X-Gm-Gg: AY/fxX6NtyQyg7RUtdzGABbG0gGDwYr6CQkxmGGZsrInrr4YMa+5Ho+cfMlrV9798CQ
	yUxisDeuBIJoXQP23QOlMTyWuXELZz2Fk9mn+ZlTCBM4WUCpogiQmbdpSAmhWXPEcJ4I3ckd/Em
	NKXg0kAdaps+vuhT3Mao9Cm6EgR3VBYGQFAXn9zXNsWE5877rrBCXZLtSUsEyPmwPteCPB3O59P
	LTNHhR2l6CgtIiraO/kDrzt9veOfOyIJxf0Y+0Hi31rfCtqn5j6yqN5q/Y8LKmxc/nG3KUCHi3s
	AOo5HhyPqe/ZZx3IhJdlwc/x+9bFbOh5lQEZQO/5n09/fhs+zvY7pE92CYeO9209bM8WIjXpHR3
	x41lA71NzsMtKEDCO/RoN8b2s9LhVC6GlPjygJ1umpNxy5COBjDH9epzH/Q7C
X-Received: by 2002:a05:7300:dc10:b0:2ac:1b61:ae1 with SMTP id 5a478bee46e88-2b486f683bemr6989513eec.26.1768459386775;
        Wed, 14 Jan 2026 22:43:06 -0800 (PST)
X-Received: by 2002:a05:7300:dc10:b0:2ac:1b61:ae1 with SMTP id 5a478bee46e88-2b486f683bemr6989483eec.26.1768459386304;
        Wed, 14 Jan 2026 22:43:06 -0800 (PST)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1775fe27dsm18986471eec.29.2026.01.14.22.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 22:43:05 -0800 (PST)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 22:42:56 -0800
Subject: [PATCH v4 2/2] dt-bindings: remoteproc: qcom,sm8550-pas: Add
 Kaanapali CDSP
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-knp-remoteproc-v4-2-fcf0b04d01af@oss.qualcomm.com>
References: <20260114-knp-remoteproc-v4-0-fcf0b04d01af@oss.qualcomm.com>
In-Reply-To: <20260114-knp-remoteproc-v4-0-fcf0b04d01af@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768459382; l=1527;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=cuUwUuj4xccTZJ0uZTOAJPjw+SrCAbNU0A1nzSPt3rQ=;
 b=oSE10uGNIHg0R7f22M5hcNy+oPiqqcD8M/NjWiHhKXMF2y5SuNbtEZpXyAcJfrdIH7HcNKIDu
 m0F66Ey8IdwCz3tM//wn9/1pmECEuqegKUM9XeIAs1drfQJmz3+l75G
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: ehpTxwS0gZQ94YCX9GQExRW6zinmR17w
X-Proofpoint-ORIG-GUID: ehpTxwS0gZQ94YCX9GQExRW6zinmR17w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA0MiBTYWx0ZWRfXzG2ac0XTb188
 p3+PYq77x+1dkTOgqfjQ/1BJFBDmZGJMz7rp/tDd00UahTSAgQZALgklNkTO/78y0Tn/CPDVmij
 ydF1B4afPwUBwkh1DkrFdqvdCargB0jDmklcrciHpe1WqVCK9fyr/JsdK7K3M/PGD6d0+YJIm8G
 jDmKiuzvIFGKwoHs/eIE8iX95dhfyNjI8tMfiFgcViE+Ors2P37J/p/v8gvm2DI9apiK5zaIXRU
 ShYDcdnoagx1u94UcWdaQFgR2qdb4jErBd/J7RrBzicSvYptuCwBJKDuWq3LDMW4Qcfjffe05Vj
 eStyo6HWMwXyLKq0+O+kck0fQn1isQG4LQFTSMdvmt3wksv5DNm203HdkL4lsqkKoRHZroesGLU
 x/9OnNYqujszD6roVeBEPDP2zeNFdbower0w6PyM7g7oflptRfIZB2EQmtff6aT9FWHeR3Z7yIv
 8OMUe2tq/I9bGu/jjZQ==
X-Authority-Analysis: v=2.4 cv=fsHRpV4f c=1 sm=1 tr=0 ts=69688c7b cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=JO5o7z23AXsBd-kSPjkA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150042

Add remote processor PAS loader for Kaanapali CDSP processor, compatible
with earlier SM8550 with minor difference: one more sixth "shutdown-ack"
interrupt. It is not compatible with SM8650 because one memory region
"global_sync_mem" is not managed by kernel on Kaanapali so it is removed
in the remoteproc cdsp node.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index 31dffd02125a..1a216ea3b127 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -32,6 +32,10 @@ properties:
               - qcom,kaanapali-adsp-pas
               - qcom,sm8750-adsp-pas
           - const: qcom,sm8550-adsp-pas
+      - items:
+          - enum:
+              - qcom,kaanapali-cdsp-pas
+          - const: qcom,sm8550-cdsp-pas
       - items:
           - const: qcom,sm8750-cdsp-pas
           - const: qcom,sm8650-cdsp-pas
@@ -98,6 +102,7 @@ allOf:
           contains:
             enum:
               - qcom,kaanapali-adsp-pas
+              - qcom,kaanapali-cdsp-pas
               - qcom,sm8750-adsp-pas
     then:
       properties:

-- 
2.25.1

