Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D843A784F
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 Apr 2026 09:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777542326; cv=none; b=uSLRXZxHxQuaGbUxjxosSex4VhUgKfVJaaCLwmcmc2ETEvKbavE3TFcO2oET8c6ZAbcFM8gY2unru1oQmRjh1q9lm+GO5B6ZaPFS66UUZ8mGfWVwvux+OKswAHtCtWU6D72NvTXJkaTwum9LqqON69VkTyeTHjiTbiaYNUAiHa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777542326; c=relaxed/simple;
	bh=giFS3KGnbIJ9nQav9BA4XHkA/to082fHVKY1grUTwlI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lUvTNHDu9jJXWk0qEH/UojEsbGGGz3jjjIpzJPPYXJW9GRcjdG1va7LoYou9uwPQrckJMLtNHHdZQfhUTSkRdrXYGlDpbnGqGWs1MUOfxjuhMxL1x+0p8ESqaorG8KdWcVD51U7/2dRebmNYdHQZ/gLLv+Pit+6x64W/QFBKASM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lKg9TL6b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RZcTxwma; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lKg9TL6b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RZcTxwma"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63U7FZXx3885255
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 Apr 2026 09:45:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GbZa+AmXSd6Sd/9B7JCmQ8e7SigY/d1LRiLpvpa3tO0=; b=lKg9TL6bRFRKEG+3
	9PJhD9DyBCV2srr0WZq9zNm7ZEXtyZA4yATmyTVCwHT1pkOvbp5DzvR7/X0lQiFK
	a6oCSseUWZTvTgWZPD7qtNLqg++UmC8PzBZru+tHzyUMp6AvQZzirKuQ9GluGC+7
	+uYZuHUTabquu2x2L4dA7ObEBErCpP6yHMFhy9ERpYNQ30N5xaEbCwwOgs3dnuu6
	DAWh3eaLDS9MUbS/rECLHIj4FdrNxZGNHVURp199YSSUhcR4xL0pQTGPidu6JW2k
	ijM3Flgag8N1V541WO3Y6spYIu5S/lyePJew12jJ4uMLe+h7to8tl+q4feyqC5yl
	sfgxzg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dutmaj3e1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 Apr 2026 09:45:23 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f74bcfb86so1009655b3a.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 30 Apr 2026 02:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777542323; x=1778147123; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GbZa+AmXSd6Sd/9B7JCmQ8e7SigY/d1LRiLpvpa3tO0=;
        b=RZcTxwmaDSyIduSFjrwXDKIDv2Koykamun0ch4B0Y+PUrmPNIGEudhjYxtu2sliS/H
         mW32z24gEU25BXKAc9SvztjkfWXT0C5zK/MzZiIbknGnYs7KQPjlW9s1xaP0lDP4dnAm
         lqh1eItQSdjB0QFhllQT4dtAMATuQitzc29SIIZ9uwjL24lUV8Txu6gSekBtBCOoEaQk
         KBeqPkQwpwKzVhzPmrjMg7ya6E70RAYI04TI6/E8p8uKEW3Id2O4Nr3xPCmevleFDfUU
         o/U9s2d4BkVIB/wS3wSBRoT2tk1cP5vOlerPOoomaUH7ow2cN1ZelqhF67GLS/J0djGm
         onJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777542323; x=1778147123;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GbZa+AmXSd6Sd/9B7JCmQ8e7SigY/d1LRiLpvpa3tO0=;
        b=rGq0orOwBqtn6qMSHYp7ZopHQJv2V8hhg3WVivjOjm9clQXrTP3BM73Bq3Y9OI0dvM
         NXBiliXBS5ZbxFPyI/h0CrC3STVKJP4txxipbUrpTL7fasQbWZ8SqU3ydFuHwDv3zxU2
         duNHWmK9VyEtMoGevbu2OzMWMXYUMobZFZbfJsVn3M3a3ztMYih2hda0BtyeSl2Cp/IW
         L0tyim/ymy1iO+Q/+5nadJS4mBPV4CCsbhbhRDLeHogBQ/fm/MhHsNf9s+kSHq+GaOKS
         xCqyxtQ3sFvCKMCMDYlipOKubcpn1nPheEcUbEwZLadeLiNqNq9XOOUG+iw/mop6W0u+
         dRPw==
X-Forwarded-Encrypted: i=1; AFNElJ92QYbSr7b6xgdLDA3Um1N8Hc/Xt6TyPO+pzn624VLZG5MWw9LW0iFIb+Gr8BBrQVTBoQ6j2I9Xfqk46lz2Nm66@vger.kernel.org
X-Gm-Message-State: AOJu0YyviYZn9OjFyPqjdnSwUEHcj82jzOGOqjIMpZ4/BkpN6E5hVFN1
	DI9x0PC3fvB4TBg9ggklfW51ALeh32qC/RaPiBmhilLYqCBBCaXfyri7s7AtTxPzF+iB8tM2ARw
	TiwmmtS8CckiiV5evsbHL/dtxAOj27V9r2XdIXxkVXYdiXn+hCoQbgDpX1r+UVH1aoWgYh6KW
X-Gm-Gg: AeBDieucgvFqZ3yo1VOvp3B1H0K6T0Mv4Nw8pqNHPJ8zj+C6ogCXB/abYpZTwEki+3l
	8DrPjvIS5m8xMzP6KNj5p83lRBusa8pr1pjcUHmdGf0ZQ+4May0qqgSeRSg3aI9I3ksV5I1jOx2
	95o+WluY3boANOJo8vzLtQaIk/uKoOTJiRkUJ9kl5A8mxpG7GRkWw48687vfkDhhbWdN9HAcMoJ
	BmyTPEeDJlQqFlP6+wg7S+5PhhyURJ6M3PaPv2ATFXXq+JJDmdHJ0uIaTOaTjKy7gpcPJT3Q4oa
	GWvVUJCLVL835Sg18jEFTFFi9ENxzjBb4ppJEzcBaKvXhy0xex0BXPVfa33sOQ+5hwAY4sCzLAC
	9YCwL+B4cRJPI2MnlRiGC1xkFZgF83PW9qaOSpJyTtZxOnwWZcLakSh/yBnKAXQ==
X-Received: by 2002:a05:6a00:4c9a:b0:82f:6e39:d90f with SMTP id d2e1a72fcca58-834fdbff498mr2657151b3a.39.1777542322901;
        Thu, 30 Apr 2026 02:45:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c9a:b0:82f:6e39:d90f with SMTP id d2e1a72fcca58-834fdbff498mr2657098b3a.39.1777542322412;
        Thu, 30 Apr 2026 02:45:22 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7eb691sm4718937b3a.48.2026.04.30.02.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 02:45:22 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 15:14:56 +0530
Subject: [PATCH 1/4] dt-bindings: soc: qcom: smd-rpm: Add Shikra rpm-smd
 compatible
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-shikra_mailbox_and_rpm_changes-v1-1-61ad7c57ef27@oss.qualcomm.com>
References: <20260430-shikra_mailbox_and_rpm_changes-v1-0-61ad7c57ef27@oss.qualcomm.com>
In-Reply-To: <20260430-shikra_mailbox_and_rpm_changes-v1-0-61ad7c57ef27@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777542312; l=941;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=es5ERD8ECRizLcUcsRpPU+cL6+81oQXVvOctJZKt3TI=;
 b=e/hvXR8qA8fACPrF0gQrVbkL0akHmedcGq3djfT2QwJruwyoT7R+t2fQs1m5zvtqKEomV+Yxp
 roVpjQ5FD6XAs2UXsIAnCxyC5Tb5vSbleG4Swp4OD84EmUFQFoK/eaR
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-ORIG-GUID: 1_M_-3gBRzxF6WDMR4BjHuIiA2__li_e
X-Proofpoint-GUID: 1_M_-3gBRzxF6WDMR4BjHuIiA2__li_e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDA5NSBTYWx0ZWRfX88fGKdmTVm72
 4jvP8VlZ4+pzJeMhOHz8GJC1KRni7rfog3BaImfyh1hOvt5VYJLsC74oLSdfUJe4W71EkAds6xv
 6AIKaxd5aUupbMH5nHuJ9TyAOcfkWrZOY8iirSESpLzOTl30v37gIs7uowmkPX7FEQqWw734GQW
 NegIaYz1Pxq8XLJNazungIY5+cTJvDYMm0blTI0bP7zhggUKEskLhRzYPxJCMtc1hgE5kygTqY5
 9+95vLZGjxciNfI2jyH6giCnl8iJf+62KeFIKRXkTvFX77Zs8hpjvn84NS9UxTZU8ab9A6wGATm
 VqTJfwV7Ipz4nwxfEovXhU6pWBN9fA42wF5nXo+AFBC572InmmEP46oQtvQ0v3wj6XD0u74gp2C
 OrIIHmbDLHNSJa/kuxppRwGoUbCa6ggnjFFdM51UUooj9+YdHcG+vDNzHHGeQPsMGQBoMEXk5U6
 6UNsPV1Au0INId9EgWQ==
X-Authority-Analysis: v=2.4 cv=Fpo1OWrq c=1 sm=1 tr=0 ts=69f324b3 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=69wgM2fLTQVZxHge9JEA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_02,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300095

From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

Add compatible for the Qualcomm Shikra rpm-smd device.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
index 270bcd079f8861d6bf9f3058e188895af33370e1..bd1d32898461c48ebbdee8d6c48046a08e39cb0d 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
@@ -57,6 +57,7 @@ properties:
               - qcom,rpm-qcm2290
               - qcom,rpm-qcs404
               - qcom,rpm-sdm660
+              - qcom,rpm-shikra
               - qcom,rpm-sm6115
               - qcom,rpm-sm6125
               - qcom,rpm-sm6375

-- 
2.34.1

