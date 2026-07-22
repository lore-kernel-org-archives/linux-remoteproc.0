Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609123932D3
	for <linux-remoteproc@vger.kernel.org>; Wed, 22 Jul 2026 09:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784713273; cv=none; b=WCvS33/en4Nvt16TeoM8IjOV2iUlr/k5rFBQkcVZmeHsXCFFQMG7ec24msV2z0wxJcL4BgPF2PdBKDhTKeEnCDpZ19cDkiY0rdLYuoegTkm5ERL8+YOFJhOLXoBtrWR1IT88WTJL0eMUA4a8YqQA00izBc4Px59Z+DqQ21iRXs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784713273; c=relaxed/simple;
	bh=QA1IjG4i9z5wUYIBMFycEGxMndMsPTU7XOkS4qoWXQw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r50J68bVXTnG0SynS4CF3VrtbOEJCR2lOVJVx2WpbK5rEvBDTP5u1Hwiuvw2Heor0lKuo197NNbIyzmzMkIZDlLBkWH3/jsmNipz/zaQY32R3G0wnR2s5AnVNOKkCsXpeSSA/SBSIjwSi3F11XqEuWJkekL9kznM/O4LSi9xkS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OkQuccYH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ux6YDzIn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OkQuccYH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ux6YDzIn"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8xImh4018323
	for <linux-remoteproc@vger.kernel.org>; Wed, 22 Jul 2026 09:41:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LIEKwmkTTbvpHfTJTkab4AeucOKBmQq9t/yo9/tqzT4=; b=OkQuccYHpQLBnWnt
	Onbps4wIfNtdCEsst2jxPLPXQOg+dCrP/ORX4cja3YdWPWq503OJdmoo6PKM/h/b
	06VV3dzPfuo7sMNpbJo23YK4rHjfuTpYzC5wUEedNhFzGVBufinMVeSelANRtnjU
	rpuTD3Svbyr1Ped2Nb4lLw19yLC2dy3tEoSDNWHGNP5eG4w8rDyf1MijrETnRB9D
	kMY1q+qffRpGCMFrTp7yu++44vVkzsbVzxCDhjuKCvYnHbcYeqKpGIem0vMjgs5Z
	ZLQA0jqPIov5VTyuBLg5AOgComZTrhNmIyGWUAJd19sDeaslNeME1NtBUKOEKPso
	aETpJw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6fudc3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 22 Jul 2026 09:41:10 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5174a236220so228220061cf.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 22 Jul 2026 02:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784713269; x=1785318069; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LIEKwmkTTbvpHfTJTkab4AeucOKBmQq9t/yo9/tqzT4=;
        b=Ux6YDzIn6UToHQ0ugZIJnbpjR/7Vr0IJGI3PezEctPj+WZqATVThcPsApxcvfEJ7pa
         Thy8By2hXgM0TtAGGJlMH1Tsdi11mkO3EoRmdAFLEhSb2yvC8n7tN6bz4t/ie6PS+xkM
         NoZJEB/XFZJ/PVBqZWlFLIfF0aZIC+IZ1qL0FjOPotC5D1NnicRYLY6R9+JbEFHDf26C
         aH8uf+a9jmmHx9zXq6AUjiHIwuzJdIAVgZTsCDytlgEZu4FfiXsWNDIGvxcWSeH8ytTc
         iXwa0GkJTZO2u0RshROG3vvwQ1tOBtzS5uzWiTZoX6xosFeOyfmzmKWc/AON7j9051AV
         +ozQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784713269; x=1785318069;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LIEKwmkTTbvpHfTJTkab4AeucOKBmQq9t/yo9/tqzT4=;
        b=X7Ufut3XCyPVntimX6VrE2Oj5XsUygHXB2E8o+qWv5cAYqZ1jVzGpMsa4RiGJ4XAvy
         FqeurSEyzNq4m+lslD7o0m86nIM0DMzrqPfw42oe+4ROQ8zMPnEKyFGSUI2mb0dKbS8c
         57sPA9Xoxt4b165GCxXogo55/1PSw9VAGl9Zoj4rUPJtHS+DyD0rRaI9LfG7DvB6MEeP
         SsCIzh86tWiNzzhszt5NLeSjWqI/5YVNxjUu4aTJPhlzlxwJY4Rb43sTbyTyrvBy1eqF
         17XA+QO8/c2e8wCT228tomyuiZDkSovmPsClHmdhb0Mq7g2yTw2RTKVE3Oza6e6ftH1b
         MCrQ==
X-Forwarded-Encrypted: i=1; AHgh+RrvUuy15Zi/S5otEVxQUXl/jDYcsUCrVSm7bQ7h8JmgPxFZ3DoZYc3UV+Ngyf8Hqe29MBa8M9YjswPNzpJ3cT+X@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ0BgTTvGVO2coD2H/iqHKYyOAQiIv9qCjo7bKTZRbEZehOaJg
	MWkFmjSToFCuSUKwUffTY6xFm2+kXLSnf9cu9P7nbnFV78CiJBL6kvmcsYZnQbh7wsbBCURZGaM
	XZb8grEpRO6jqvTsrXf0YfgqcZ2HkIvi7YLE3DuJlO2ovfIQ4lGz0qob19SWZSORYCcv7Deuu
X-Gm-Gg: AR+sD1002sKARy3wtdiFbNsIZrMGqzUicnVD1qfnPWtm/hVJ1Vi/lw3e/M66ceu2gZX
	UsZEu9UMnMuXU9CcZQ9sfnqJeBuvC/q8sZtl9rhh7z9fXEwIBNTALgoRUgE0VjhyvoZo94SCepC
	HwR1qT7m042NcS0w+4/z+DHMBCuA5LKhHMUtam2+9txbMAWgfC+aHj+ZIqAhlGe9ih5V2SckwH9
	d4yHJwRBkLLion7Ym2RIyvCXw79YKrKwjgTmjFxxjB5YQja8LivB+e5iK1QaAR5sJCtGgNU69gb
	1WnJ6tdwmF1PPekXO6qXs1gsyloGHyAk6foJXdORo/+bTLjVMDhj9yaT+gsHASU/GhkpjAUBG5l
	g4uBiq62h
X-Received: by 2002:a05:622a:1188:b0:527:8770:8fd6 with SMTP id d75a77b69052e-527877090f3mr39081151cf.35.1784713269103;
        Wed, 22 Jul 2026 02:41:09 -0700 (PDT)
X-Received: by 2002:a05:622a:1188:b0:527:8770:8fd6 with SMTP id d75a77b69052e-527877090f3mr39080851cf.35.1784713268471;
        Wed, 22 Jul 2026 02:41:08 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c6287csm4816398f8f.25.2026.07.22.02.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 02:41:07 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 12:40:52 +0300
Subject: [PATCH v2 1/2] dt-bindings: remoteproc: qcom,milos-pas: Move Eliza
 ADSP to SM8550 schema
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-dts-qcom-eliza-fix-adsp-binding-v2-1-e1e98ae15533@oss.qualcomm.com>
References: <20260722-dts-qcom-eliza-fix-adsp-binding-v2-0-e1e98ae15533@oss.qualcomm.com>
In-Reply-To: <20260722-dts-qcom-eliza-fix-adsp-binding-v2-0-e1e98ae15533@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2345;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=QA1IjG4i9z5wUYIBMFycEGxMndMsPTU7XOkS4qoWXQw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqYJAt26yfVUMoknzF6GN3xioTHh7lI/JNXpugB
 W7YoJXuFlCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCamCQLQAKCRAbX0TJAJUV
 VsUpEACMJkXxeuwXshJW1vG2c9vlYtvPA+kaO4xLSc5ix8xBdecakJp2VDDq5DXUWmmGkefQJZ7
 IZxjhSdqyI9HnL3rEYZzZQwSoVYrocWGurbKnXXW4GzjolJ7RC6J1bfiSJJxK44Ydjd/QZ7Gced
 BHVjSn3rjfkHuTetPhwCM0yiF/OKZHPb+bplUwXrekuYTKDIAh1yc1QtOfM+99CGCzze5ZeCjoo
 8ETxZvUDnPKJgJMvkXGIyfT5FcWb1JZJw75WX8E8RJDFOhqGhY9KTO5l1R/37pVeDJQlnVQdgM6
 SK9SqXCSQ0wHIikV5JnmjG158Gs8CxyuiDb6X1oncQ6F8IcdJy1YKJ/pMDefCqjYefyppoZ1a+r
 KWducQj0voU6kt/YkLUMQXzLtO27jpyYOX/eVF/3qJtLLEnmhiZe3CoST8KxdChs1+0qC/F5hJn
 PIXj2GeUVJlXtm7M1uFrbCwn/7GnekP+Zj/iN+PsJUnZF0LQNR6IQOPhUuT6AJw4SRxi7kySzMP
 Vbn+AGqeg1XSdaC+Rwnsgk15eyA0vaF+o5jAyTSaj8JOOkm3yVOYiHIwVa4V3uds0BfY4gBF7Ti
 usPtgFuNve+bTZ1obc8qQc/+/+H6IQtzn7QHt7U+DNIfyHPXDz0oWMb4C8hhSF2/zVk+CYv6JgL
 0anDuEw+CNulEnw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: aSJj6KL6Sx9_PWYfkze4xGJEdNzKq1ob
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA5MCBTYWx0ZWRfXyNyxSc/OYc3y
 RNZ+AeKHHsEYJ0pWs24sJy8YGWe+np/X43Ie4FYK5glrie9R0m8vu+gkXKa7GRWDZr1D+52ULMh
 X0odkwaTWWQHA2+AOVHGzsNN8r2FaFgfwmWJhuXrsLQMoesHwMqqLpL2B8AiPVsNXbkb0GoRT5Q
 ekOGl0DmbEGThICCN/PLiFgdBFu95Zm7OLOVmVwFCrxYXGZsFmrI8JbyCm6KM0Srfq7KszXH9o4
 9p8RwFb3SvyyN17V4I/UFquMQiv3Yg+VfvvGGTIJlTkMuIzeG6nYv15YLqqDvVJApNBxPWIJLsc
 53Y7VzGew1V9QTeqhD24EUXq0bosjP+wHi834uw3eTshxdCMN051/ThAtHcUV9fW5TCP4SSxo2w
 PVSmJ6v9JP1aIsMKiuBun9ZJtcXkZJYtZd2pCmq/uhuBeenUJYMkShVSRnzoOL+ciqaeAe65mkt
 MT1Vhfjo9ZQtJ2AkF1A==
X-Authority-Analysis: v=2.4 cv=e/o2j6p/ c=1 sm=1 tr=0 ts=6a609036 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=HvCdlwfJMTvvdMU6lXsA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: aSJj6KL6Sx9_PWYfkze4xGJEdNzKq1ob
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA5MCBTYWx0ZWRfX+xbmxH3itTKY
 sjP8BANhceGYOikW99UpVvZ5P/74s4ro37Hl621SQmQSxbBJGIQqkAOzcIhfO8hd8gTbQg2X1B4
 HjGehwVl7TYONiIEH3sh4mkCCRPpPig=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220090

The ADSP PAS found on Eliza SoC looks fully compatible with SM8750, which
can fallback to SM8550 except for the extra interrupt ("shutdown-ack").

So document its bindings in the SM8550 schema instead.

Fixes: 7cf2f07f949c ("dt-bindings: remoteproc: qcom,milos-pas: Document Eliza ADSP")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml  | 3 ---
 Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml | 2 ++
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml
index 99d7337e58ec..b24e6f6eaf37 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml
@@ -16,7 +16,6 @@ description:
 properties:
   compatible:
     enum:
-      - qcom,eliza-adsp-pas
       - qcom,milos-adsp-pas
       - qcom,milos-cdsp-pas
       - qcom,milos-mpss-pas
@@ -88,7 +87,6 @@ allOf:
       properties:
         compatible:
           enum:
-            - qcom,eliza-adsp-pas
             - qcom,milos-adsp-pas
             - qcom,milos-cdsp-pas
     then:
@@ -109,7 +107,6 @@ allOf:
         compatible:
           contains:
             enum:
-              - qcom,eliza-adsp-pas
               - qcom,milos-adsp-pas
     then:
       properties:
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index 2a4c527552e6..e6d81a38fd1c 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -29,6 +29,7 @@ properties:
           - qcom,x1e80100-cdsp-pas
       - items:
           - enum:
+              - qcom,eliza-adsp-pas
               - qcom,glymur-adsp-pas
               - qcom,hawi-adsp-pas
               - qcom,kaanapali-adsp-pas
@@ -134,6 +135,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,eliza-adsp-pas
               - qcom,glymur-adsp-pas
               - qcom,glymur-cdsp-pas
               - qcom,hawi-adsp-pas

-- 
2.54.0

