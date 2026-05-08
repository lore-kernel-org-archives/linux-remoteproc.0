Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E954337D12E
	for <linux-remoteproc@vger.kernel.org>; Fri,  8 May 2026 07:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778224841; cv=none; b=NZ4DDBP2QEoWHkf/h/iLfoWkDsbJHA9LlIYb/fwz9gVpIBQ6HE5YLRQq2YHbertw5sj0TPQb8vOeQZ5nIO+xYZeLCiHKM2diypNXVv17td9zCHcLq/ZO1eMIWU1C+BGyK5VJr8FTdP5QlJc7CCn+96EMW7+yv2t5y0d8IMw7NoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778224841; c=relaxed/simple;
	bh=FdSJT6D2xuJXBvgDlnbYS33t9DDGMH2c6pzndhSzc9o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m6G+g+QYUEMjE1HeSQmA+ygDhqZpCohPuMaOxmFoOiet82li3qcjNc50g0r7sjcIMEM+VtDi+54JZ2z6QUjJqliOGe9+WiLK21oUQ1aQUYKmtgXxyb23DcxY2iA0++XaCpJbjoluYXz3is3ieRLJJV27ioywIVmlmhgAiKokJ1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h9g3breq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JD9pRm5d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h9g3breq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JD9pRm5d"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64872m5o1062270
	for <linux-remoteproc@vger.kernel.org>; Fri, 8 May 2026 07:20:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hbge0dEv99gSEczZnlBtmLnL5tJ6c+VFnX/wLkDiWLI=; b=h9g3breqdgyMvDYD
	89yCZdvkjgDm0WOvxDhSAZx/BwFnJu3UfAAXCfvz0Dy+iz+4VY6lvep4DY6Dh4RX
	gK6AP25PKq0S1wk8cXKtAVxxmNGbxIJ6IZfHTlew3pE1btNSFH0IRjx19CkVVS7b
	DaDDwAOSgWKbbiWoW2WRFmYsH8Dr00SFECIbdwFNV62H1P3lftC8a3Qjn9EiWS12
	iNQ0iast461vYPwsa+BmgYUR4AiQCCl7gqiXCPCDzXBdqGwkKRhKCiTYkD5xW6vC
	CwavLjfmLDsJZMPCKJaaVI2yqCucEcM6vCol8S1nvEk87jfmOsVAqIB4DcgyX1rb
	xVOOCw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1b3fg1ym-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 08 May 2026 07:20:36 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-83cecc22d5fso440798b3a.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 08 May 2026 00:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778224835; x=1778829635; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hbge0dEv99gSEczZnlBtmLnL5tJ6c+VFnX/wLkDiWLI=;
        b=JD9pRm5dWIUY4comHByYNGJtELrML5oPVcRmSBOAaW7Z/16+LmxaBaVUQ8VRn9ypSy
         GQtLsnNXgzHwbXkrR+QIsAxx10t9ur8WQ7L4XUKmWiN3pyfZpPiYGr/ty7yAH3Rfx18b
         RLBriHjB+OpFQuPwa6M4NQfHZ9rl9LDbwDensFcAKxCd4lP1jIzrOLK9LFMlBAT9pmtb
         MKUy2VYt33cbAjV5s2v+qAaAxXvJvYXybMgIFCCPdelu6sJVmaOqTOze1ZdZ3jO/iN0B
         rXbiFmAf9hyGAJN9Egcns+NgIypIeQKkxcnH7E0D8Y0rLLSLg7yAD9HxsjTHDKOg92St
         CVTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224835; x=1778829635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Hbge0dEv99gSEczZnlBtmLnL5tJ6c+VFnX/wLkDiWLI=;
        b=SKtsWL9qXxnehDN00fSU0dVGOkRqrMcKd5KKfwSryQu/Ex30HNrPcsfQne6agStgU1
         RysdR+B/HPc3PfwaF3LyBZDU6qRHLRz2Upay5MlqnRmUv+WhBoV/4VvI0cwZ3Fs45Tpn
         diyRb5+c4GT7g4WllZVuke2O+gmaYwJ2CVloA8jEuSkxYv0MLXr3UMaOGH9vjERncNzg
         S8ydsi5dqhnomgfFTFWpyIyyBlKlbj0T1Y/OPCklWUMj/Ww+jWdONpqzNp1M8ehyI8ki
         l/UlB76oT++dDNtW7H3QEAJvSsWril3gil81vwVnC27LMOUrYLRBbHWM9VrgDBb8plD1
         WJGQ==
X-Forwarded-Encrypted: i=1; AFNElJ95Ll0nVEw3U237D/eQ6M9k91mtBdpWiknS5A6OVW37y7AsYBoceE0W4o19gsvlK09ruOnzDj5oUCTyGgTnS44H@vger.kernel.org
X-Gm-Message-State: AOJu0YwTF5loNrLu7GUQro/IyIOoq7XeO6cOK19TE8+6Tnuv9RQguciU
	MdbHiTJkd68SXRW9ncDNw9SX0th36hQPKufpaaCnHAvD4VhOJKa/rjlt8ZNgWrh1oZgHQdMM2T0
	me07IhkOohhHdC/jZpPAPxCRqrRoB9Mg2CCewkEazgaEjFfdWJHhEMX5BRawNvUhqAW/+69oS
X-Gm-Gg: AeBDietBzYRK0iE0a9XTIDvIKtlAPmhuM5NnfDby1ioG14DEvTdth0nlwM0NSH6cXms
	nJH1RssbxY2hGbYzaDrAA4Zq8N5WK3ERc0kCAf1n7H1Pnsl6tZMLec/J3Spz+XZ0foJHI0BeSKH
	vcUK9yxyiTjgR1W2M8vYK3F7JU8t0puLjyf5QJ5E5IBE8rKGmEYStyGz+N129LtC0LW5Emr+zcS
	woRc8/8NXVNEzRGDGwwuJ49C9p2Tz9hiL1V26DnS9e1lmvPtxCIUJtql3hhnwxnLT3acZI/Su0t
	7yl+9YyA/5xzY661qizCORXGWC0wJ+aKmjplYBYWhbfet9pijFZB6F5/ZDHTwTBiglBfJL7UVGz
	tBT4k3RCnlA2DPP2ILJmk0B/opx2C/yDjNNoVVIqT5K4uK5UOsds=
X-Received: by 2002:a05:6a00:2e90:b0:831:7f71:c810 with SMTP id d2e1a72fcca58-83a5d96fa9dmr11411088b3a.35.1778224835327;
        Fri, 08 May 2026 00:20:35 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e90:b0:831:7f71:c810 with SMTP id d2e1a72fcca58-83a5d96fa9dmr11411046b3a.35.1778224834813;
        Fri, 08 May 2026 00:20:34 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839659498f1sm14566685b3a.17.2026.05.08.00.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:20:34 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Fri, 08 May 2026 12:49:49 +0530
Subject: [PATCH v2 3/4] dt-bindings: mailbox: qcom: Add Shikra APCS
 compatible
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-shikra_mailbox_and_rpm_changes-v2-3-ab76fd9e71de@oss.qualcomm.com>
References: <20260508-shikra_mailbox_and_rpm_changes-v2-0-ab76fd9e71de@oss.qualcomm.com>
In-Reply-To: <20260508-shikra_mailbox_and_rpm_changes-v2-0-ab76fd9e71de@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778224815; l=1036;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=c8/SeVqVj0VIwMhz140zaO2lQ7IVuDyupHPGVMe/Wdk=;
 b=9cIywRriSkRDjLfTl4HF+wpZStxUSzoK9Lb1znw2nB3gvP8qJccxQ/FlWTszaOtreZIwWNge8
 pTk/HfQANSCBDZ3KtzxXI5StyRwMC32GmSD/R7uVC2xl1dRBItU67h2
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-GUID: HifgdwDKhT61GABvw3IZOLN2ZANWknhF
X-Authority-Analysis: v=2.4 cv=YMOvDxGx c=1 sm=1 tr=0 ts=69fd8ec4 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=QZub9Z3z2oi6Mc85LyMA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: HifgdwDKhT61GABvw3IZOLN2ZANWknhF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDA3MiBTYWx0ZWRfX2AU0mugQpvRj
 Oik/hm6d2ENLFvUZ0w2qx1qkLHmbwjVioUCQj610xy/Ghf2xVDIGCJVUCGnCuoKzvBxkm7Fwj9g
 BWHcAnhxhoiOucSE7nD4waJ/dwUtkQeLFfJlLUjpU/fAezYIyjXPyOOTVL8WqeXof6WpXTlU6Nw
 mCX05ZXMYf+2EbI7Yg6HzJN5L/uCUPmImhZ2A11i2HItTpxyQ6RTib/dLZvgp1/VLKrQqryqaV8
 KcBhW5u8wwCITbx1xhTo2R6VFt25mJRfLOX8A0SZJQOs1FcqGKJ+/EoUNDDIb3kukxY5NXp6c24
 ezMFp6pD0JKSr4uIz18e69nb8IXC7tLJdw6YwW4XnugX1P66uqq3YhC2FKEOiQ8/viT9N4TZYqq
 0vDJsNFdt2hXt9He9mpvGSDR66lGRiQvfG07Pvh+rC/eTWOdrGxpmaZK1Au94sGJzw2pitWYd6O
 L7zdqq4qaqZyFl7duEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0 phishscore=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080072

From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

Add compatible for the Qualcomm Shikra APCS block.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index f40dc9048327298c6e78d4327bbd5f530a013604..1b4ef0688ca79f92f579d9bf5ab2cfb2bf879392 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -49,6 +49,7 @@ properties:
               - qcom,qcs615-apss-shared
               - qcom,sc7180-apss-shared
               - qcom,sc8180x-apss-shared
+              - qcom,shikra-apss-shared
               - qcom,sm7150-apss-shared
               - qcom,sm8150-apss-shared
           - const: qcom,sdm845-apss-shared

-- 
2.34.1

