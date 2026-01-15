Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0D92DCC04
	for <linux-remoteproc@vger.kernel.org>; Thu, 15 Jan 2026 06:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768459397; cv=none; b=iKHe0inLszZoWNGZ7RMJ+wREE2TscOiEd9Jf3sfLTjcoR48LQWQES91RjYYT7qE6VjnUOCxFB4h3Ot0+3EwePH+WrttP8sTHiiBxJvQDiwPZRvpd4v2/EXF1fROU7ijKxm7AAMcTHNVDssxS6qL6xoKoueMlKoCgg9S+nlKHaf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768459397; c=relaxed/simple;
	bh=zY4nzOqgWJG5FPNxJMdBDEouCKDXTgLe3R1UeHOD92I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J//skktVJkAjtlg/SUoKoa3oBP+I8ZhqQk3oUvfJ4ZdmEAzpwTBm8hup2MJ1U8K/hLcSd0N6Nj3Egc8sF8dqs815M+nMfwNHoc+/QWrmF2/O8THBYh6bblvVRSInfR8R4MjVv1dBQeHzrZ+du0nuNTiS15JELznrWHrs5YYUVwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aYnC3pEq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=afqh+d3H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aYnC3pEq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="afqh+d3H"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6g7ns1991898
	for <linux-remoteproc@vger.kernel.org>; Thu, 15 Jan 2026 06:43:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dmhupPitsdTjkBnqD47avl5GqkBsMwhxxsdVOhlkGsg=; b=aYnC3pEq13NOl0D6
	CRyuaZQ/llGcUzK12fja7wcH9uY/bn8/KERAQ80JAbApXZp1rnMxDpCKXUrwvh3E
	brEFeJtBXwZbiqLIT0W1q3r0CuOREUY5ziX1gedebF7zGU9aJmnkmnGnXbErLyE+
	j0fe3zA3J5PBpkzPYL3KZeF8pQIV6VoVN1jcsPMVUgYMf4ksSsg4tf8K1tYiq1AZ
	53oMZyTUU01QHtWlVZHtr/J2kki8IYm6McIzqVhMeIlMo+6ZQhP28SPrqnCHw0Xl
	PigTixI3THhBWDMuOk2RnTX4Z26oNkgN20cbxWPtA6IT1utKW4ycsZL/Drc4LEA5
	4MNWRQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpbdbtw5h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 15 Jan 2026 06:43:07 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ae26a77b76so1248577eec.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 14 Jan 2026 22:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768459386; x=1769064186; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dmhupPitsdTjkBnqD47avl5GqkBsMwhxxsdVOhlkGsg=;
        b=afqh+d3H988p4JbXnvz7XiXgpKMyDDunQ/ijV5NBpk/tE4/H9jx17btwKqp5Z5dH2l
         VQGPqLKlBhz2L9GIaNyeeULEuf7EpiK0JF3F/cryifwHs2KsxeMJ8M88CwiVkQ1qBvNZ
         shCA/mUN7hSByrh10kJ5y0+lOmNBaCPD6XuziF+xC2F46ft5sRMPj9xADWJ40M8PE3Dj
         aJp+2nPakW8H3iwqz1rzRJQpMgIAi6p0KhR2xGk/cL3AWrPKnKAXL5zLWQNbr6jU4NBE
         FFywJpTFA8dItiVaD27Pz3zQ3GF6NhdYtoOq7ciG4J90ZMe7hnEIg9XXFGCKrvq1vDPD
         mo1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768459386; x=1769064186;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dmhupPitsdTjkBnqD47avl5GqkBsMwhxxsdVOhlkGsg=;
        b=AwxXCiFMt3EaVQivUnYL2JbB4DRzsw33zUWlVcWE2Pg4ylPxVNZBhZf7l42O2J7bHz
         04b54nFPAjncLkZHKeM7bbrd/keSpmVATW5MdWrL+/cjAIzu9BYsBPi6Lahhbp6jP6+M
         zaOJsNN3hpC6z/abkNcqIavqxxP7kof9pQCQ8tqKvnuKdzrTOFTC9y1H0Do2axfzsgUS
         p4j7yuSIZmtXEQ8OIXLSIErMUAdkA0KjarEpTmLBLIRrZXM6nyl0WVKCXQfWQf9cLjcZ
         uontR18+cLj7W4UFU/x36xNYfBuJiJ0nN9KfOVkHg9Ei1CdqpJ4sSnNj1gtyhR4adVoj
         fOog==
X-Forwarded-Encrypted: i=1; AJvYcCWTFfrt89xmo9MQjqe/bjBEihuLAxIBnDwF2Ql7MSGhVftsAPTNuUT60dqPti3GlTAmFVS7QpU4zdBuCdAdngiL@vger.kernel.org
X-Gm-Message-State: AOJu0YwRTPRrI49I6fFi0Vs82eWQADoFZ5CEfuYRoBoMWaioi2PaxWaJ
	MuEu0efkQvfB3aehVpGozVHk1+G98oYrxf0F1Fyb0asK++JvHptrm4dlKH0kCuwXBkGr3+9+N4T
	LYPXx0DSHLa68NX3prDwwKYJJE4TKzAPr903LH/1fvSpC9LG5Y2TbB3LtrIAZKBE16ktjHUfR
X-Gm-Gg: AY/fxX50NN0QTfhPeo7VgLM4Wg2df01ZLMr3vGKpCbd8xmjEjnlLPQJS1DOatiGKt77
	ThfAZSm9Mod5T1jnFh7McWNdouSnzcDhlYVURRlli0MAVtaA0LBrBc83DXs8yKiVq+aDD4nfmaX
	OLX2EAsJSLinnm+drSnDPAjsnaOXPzpwz+bpPfParKZnhRfzvB07evVsfFom45Fr6pul1yXmY3o
	znhTwmVIHZmVtLC5GW0znTs5V+5tzTesNRGcvT5Y9d/MyFqwJuSev8CADoKJ8lgNGyWUUhOki2+
	8bgQ6S1iX78iZtoCCACgLt909NFR+B2LrI6b6QOjZg6Oshasqx7+CsOHAvQEOVll9DF7qHneawD
	+9MYSWPB4+PhMqFSbPSeOGPas503HUPPK36/lo8YAk3svws4TW5DHT2mVMbHl
X-Received: by 2002:a05:7300:8191:b0:2ae:5e28:743a with SMTP id 5a478bee46e88-2b486cb19ffmr7343793eec.17.1768459386023;
        Wed, 14 Jan 2026 22:43:06 -0800 (PST)
X-Received: by 2002:a05:7300:8191:b0:2ae:5e28:743a with SMTP id 5a478bee46e88-2b486cb19ffmr7343760eec.17.1768459385506;
        Wed, 14 Jan 2026 22:43:05 -0800 (PST)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1775fe27dsm18986471eec.29.2026.01.14.22.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 22:43:05 -0800 (PST)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 22:42:55 -0800
Subject: [PATCH v4 1/2] dt-bindings: remoteproc: qcom,sm8550-pas: Add
 Kaanapali ADSP
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-knp-remoteproc-v4-1-fcf0b04d01af@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768459382; l=1365;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=zY4nzOqgWJG5FPNxJMdBDEouCKDXTgLe3R1UeHOD92I=;
 b=toivXADCe6mAOdKBR7sWknEUl5lsvBrdnAuU8d28JRYpOA788Vjiz0TwRqNb5G2TTVuSK4n9O
 /5hSV+9ILC5BiJL07KrGGrFT0akFBHpg3FnvyFkVQIIWmyyHbTpCHBi
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=NvncssdJ c=1 sm=1 tr=0 ts=69688c7b cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=7zWBZCs1gTFKjwm3VpwA:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: jleTUy3gXto39BsTBzNITAeR9JPGjlML
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA0MiBTYWx0ZWRfX7DCL6pvDsEJV
 sFcfOBlj2V7waQj17vD+0ssNg7sFF/5KMzdQt4M4fP2+UdtZvbAdc2G8JLrrW/9E//XfU6hvuth
 IeZu9q+PRdxtueTJdFE29uD27IEC5nQ7RSrQTjJri2z8VErq9NR8p3x7Aug2f7MRwYfJPPO0LDZ
 hirymX/muqO8R7cTBEBP5FecBTCX5KGsA9IK7C24aRClf7g/ee8TCtPrn2kIQFJa+mPXuXMq0c/
 oRrJqO4gzG/3qMLL8cMBtppOCy9BCCTPGfhf/pRUVnIq5mC//zAZhSXHqFzjljbO3+jO6fQlvaQ
 xn8U/vMWJIZ8fOyO9pA0BWWDIdFpYtLLo6Oi4Nvswsy2wJWsX6xgKAHvFihSisU6ibrCWisvW1y
 MG5YpdjhN6MFqaww2H9iZQ7BTCraNxjHrOTy1gvAZ45h/oDrsySMyS8yF3oZlirScvoFShdieFf
 w1jnY9R+y+W5IHCJgYQ==
X-Proofpoint-GUID: jleTUy3gXto39BsTBzNITAeR9JPGjlML
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150042

Document compatible for Qualcomm Kaanapali SoC ADSP PAS which looks fully
compatible with SM8750, which can fallback to SM8550 except for one more
interrupt ("shutdown-ack").

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index 2dd479cf4821..31dffd02125a 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -28,7 +28,9 @@ properties:
           - qcom,x1e80100-adsp-pas
           - qcom,x1e80100-cdsp-pas
       - items:
-          - const: qcom,sm8750-adsp-pas
+          - enum:
+              - qcom,kaanapali-adsp-pas
+              - qcom,sm8750-adsp-pas
           - const: qcom,sm8550-adsp-pas
       - items:
           - const: qcom,sm8750-cdsp-pas
@@ -95,6 +97,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,kaanapali-adsp-pas
               - qcom,sm8750-adsp-pas
     then:
       properties:

-- 
2.25.1

