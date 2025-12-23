Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F56322C78
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Dec 2025 09:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766481266; cv=none; b=lZ45SU8/u9BaRy85lCas1xy5b1vKcdd2THp3v+6VKEAYnk90/cYvci3iIcaMQNCKAVrZj655lQNOFflku7+VIzMvnM7BQUKNcWCxzrKOSuFw39oO/YuxTmLmrBIUppWkpj+gyhDzn2n9N7qZCzpaQOuqrbxcTIXaVxagPJzrH8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766481266; c=relaxed/simple;
	bh=xT3Z0RX9zoOKMq7jFVYf2pwqfhxYhtw1nSQ1v0B4npw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AEgFctq4poFUXYvKeLEmAegMmvNYZ/USVOBkGCP3iF6+P81s4hpxdbJjCauIYbG9ER1f1tWXj3JAiUIYEfUtl8NFykvnB+kp1HHa893ybA45zAtc+4EQOV1bM0KacHenLYx4ANDknvKIts8DcfXactnuwGc5eYK4MyudIQMAmiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dlXIYoPk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=At+W7hfy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dlXIYoPk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="At+W7hfy"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN78UPP4044542
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Dec 2025 09:14:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	15z0GkALFdQCnt2s+WGZIOpr1bmUM7lJKI9p/mPcc4k=; b=dlXIYoPkhhT+EGR6
	WlMl/tNraeEl77YpioIb0GhqzzNHLHsWF2YhCaND0HI9K2zCBDtmHwhrLOZJBS4w
	8+8TMUuwAW7xvUIZWU4nYrvufwssU9e1NLfPdzQYlEJ9/wt4awLxR1HEGPnbO/Oe
	DxWzwBpZwWS+TYy1yVMw8UqwYvMoz1BRfUIPCbAdx80josI9owiX3D1NSSSBgfw/
	0Km9ppRNF+muHc/zpO2o5D5oQrfINNin+tZnI1bLhIxXCT0JtxGjCi1Wy+InbTMY
	6v9rDW9ZMF4khuKpuugl58hUVaS8mWr7Bey3A57hj5KoZbKLFICVB3ESaz1zTBYS
	2Ysh3A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7cuha0cj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Dec 2025 09:14:20 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-bc2a04abc5aso4315097a12.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Dec 2025 01:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766481260; x=1767086060; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=15z0GkALFdQCnt2s+WGZIOpr1bmUM7lJKI9p/mPcc4k=;
        b=At+W7hfyrhowSH0XwdKMDp/2kToGa9SKi5TAtjTl4Z4T1iWVfYsBMUN0g2lwUnrOnI
         RXOcQyOGIP4TNywng+pNr57QKKYugLFJvUC1tkIer2Ev1Fsmh5f3yh5xXbIcFpyWJWJS
         RvRh2T4xJGyiPTTb87cmOFcTKjfe/iOsE5u+W/T3IBwCR1U+j3ZIqB4dCfIBcH8M5M9A
         VDeqD3rEp11h/YNxtKIkMhLNC1hzNsgPVPsNneS/SeCmEyF9IMfFfnnRViHTfVzlGKiZ
         S04XVl0XcWLTAX+z9YM4elDJr6E+HNkf89qMNMtP0KQU+Yn2cGFqOAikRYmvqoOa8N50
         w1lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766481260; x=1767086060;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=15z0GkALFdQCnt2s+WGZIOpr1bmUM7lJKI9p/mPcc4k=;
        b=sujhxmizM/yQnSd+CnLycN5K88OQeg4G1m/TIU3b1lzL6KIZQZ1pvnx1uJ6hiWTXsh
         tVGvlADLLyv1h2GlnDdJUnZZZuYBm2AnrtrbBQyaQY3uQvZsIgOq6f6lb3g3QgPj6JDm
         g1WDNDkpLf2h5W/RbIbvwokMp2iq1KNYWTYWUUV5cqudDuMR3CDRvxFuiU/+Q851P1xD
         PEWqGxOwv3iRZo3o08MjoytqALKbDAq8Da/4vTmN1ckYmRPT974WK7Dp/rvrkbkfmagM
         bK5zeLJaWADKduI0vN5dMvFIt0zeoEyLLRxQP+6aEIpD82IUhqyx8cO0XY6onYahWSGO
         CplA==
X-Forwarded-Encrypted: i=1; AJvYcCVOb3bntjlobEOrVLQKemdIio7jrSjffHGJmNfz+LG0+yFJi8BAIu9+g3+192x9qEGouNZg/6ONR7v94geZCJKD@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw6sT2qYn3o3OQ0/qrntpkC7OYejRWVPN5rJI3YEzeYM3/zt83
	VS5sOrP1jyzzdSeId5gK/0tBrYVr2Yif3NQoUg86w/jcY/OrpsVy63qmy7vReLdWGRGSAkoKWa0
	VpeQ0l4uoZE9hCmBrFH2/OXRBxtAtUiecVVwMVI+B8RTVo/wA5qGrZq0RcUgtafb8SUTn9do9
X-Gm-Gg: AY/fxX5v+7CRwIMH2MiIS/1iyfhlExHLRM8GuKkdRgWRRasM/Jln78Ryi+4QhhDAtK3
	1cW5f1JSnM8OFHjMZSpMtNzhODcbwRhW6nufgoZjNkiRGZl6k1Ctwhe0+AYtAVa9AZHRxuP3opM
	u65sQRpIg+FZgtSadRLoJhp/nqOu79ce1roh4PqZK5uUpjYRtamAxDA8uuhqA0zrW7JzNbrBsi6
	JJs4BGocNd6yNfIJ9Xn6TARjZRVc2u0CoP5d0JImxiN7W31i0wMujzidpuiiqFRnw2Y8sjs0Tm7
	pth6LIeKdd8IbzKhFYfEqqztMzDAinEG1+ogBZdjM7Q6bU6+R4ysG1AgvT8fjvb82M57YjFNMdN
	EFqe+QqwNge54RIj55OjpQyXcXAGwuChv6NBK3iLUPGsESKmF/rPDmsuKBhzs
X-Received: by 2002:a05:7022:4425:b0:11d:f0d3:c5da with SMTP id a92af1059eb24-121722faaf3mr15338505c88.43.1766481259469;
        Tue, 23 Dec 2025 01:14:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH9fkd9hZsopvGc2lfvXvSoLBlIoGjtpZpf68WoLQpF6SXYPlFmWv6sFE6X3j2JF2BJQsJESg==
X-Received: by 2002:a05:7022:4425:b0:11d:f0d3:c5da with SMTP id a92af1059eb24-121722faaf3mr15338486c88.43.1766481258920;
        Tue, 23 Dec 2025 01:14:18 -0800 (PST)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217254cd77sm56931833c88.14.2025.12.23.01.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 01:14:18 -0800 (PST)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 01:13:47 -0800
Subject: [PATCH v3 1/5] dt-bindings: remoteproc: qcom,sm8550-pas: Add
 Kaanapali ADSP
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-knp-remoteproc-v3-1-5b09885c55a5@oss.qualcomm.com>
References: <20251223-knp-remoteproc-v3-0-5b09885c55a5@oss.qualcomm.com>
In-Reply-To: <20251223-knp-remoteproc-v3-0-5b09885c55a5@oss.qualcomm.com>
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
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766481257; l=1292;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=xT3Z0RX9zoOKMq7jFVYf2pwqfhxYhtw1nSQ1v0B4npw=;
 b=es02FZMS4tTBwODpq5fH3Ay/WKnYn0r2xil6rHTrDlUYq5FIP7A1UMfSWmeszR0Ssmuzkb4la
 29CTURKcFHQACAdeLe9c9FGGPNGsgqpIY9js82ujlYkXFnQFmIS7gLK
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: bjAAx4RlMG9xNoh0YXOoLFHcZd-qjmbe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA3NCBTYWx0ZWRfXwCmOSkBdaNPv
 DTcdMTVbclYmdKbPMykNAnWxA3bJaeUtduaFZZua25h7IPKdGXeR5eNvzlt5pUccpJAAXGlsXEC
 42uXGTg1SgwySuxhP9aDGjz+cUMNGADyEpZS4gAIe/HorxDuVwSdxxV4XzwPWbR15b9U9Bpri9/
 bZCyuLQylhRp3J8ic+DTG66+NwJRLioJ3gl2+Nw4mk2Vx9GUu8yBnxfijtxwluR8FV76m9c/hUR
 eAWb6nTRqfirByqCguhH4+/MeboxHxErKPDmamKQdZGPvlAKlgo8SBxon/sQJcCltroCPPmWvyS
 eboYZjHgSoSlUWMPoFUsCns8YdbzSC/NVOb3wk9iT3fstttWKZrJOsxViG3UaTwGI9qtIeB2T5g
 n2pq5gsdz9JxZ2SC5VfhlRSTj78t/IKHpneRxQP0Yz+UjI1gdqAPqpCppkvKbeY7UPyRNkwzN28
 YRonU/j85GHcKjVudaQ==
X-Proofpoint-GUID: bjAAx4RlMG9xNoh0YXOoLFHcZd-qjmbe
X-Authority-Analysis: v=2.4 cv=NZDrFmD4 c=1 sm=1 tr=0 ts=694a5d6c cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=7zWBZCs1gTFKjwm3VpwA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230074

Document compatible for Qualcomm Kaanapali SoC ADSP PAS which looks fully
compatible with SM8750, which can fallback to SM8550 except for one more
interrupt ("shutdown-ack").

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

