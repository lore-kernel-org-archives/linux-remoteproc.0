Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB7B373BF1
	for <linux-remoteproc@vger.kernel.org>; Fri,  8 May 2026 07:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778224831; cv=none; b=swLuBIbc0hz4UMXYaglyCb77gybCXoU4rfWfwRtbTEi2KTmOOT+74+dFv2OYIi+gbS5kf8O1N+F9Gxj+0wMV+JDVHrhXKKGeONH5c+NXcXrZdcSVNzM7AiBm6KgQTandYm9l30CViH6APrIaMDhl33BHhdY2cAmEJ2KhnVpwQdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778224831; c=relaxed/simple;
	bh=giFS3KGnbIJ9nQav9BA4XHkA/to082fHVKY1grUTwlI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e2Q+Z0xpHf0eiWS9TURu9hSzJoDwwhu6l1IvmBYV/irw4r5ESgrVUVZcxGLGNneluAfrMO/m7elQizRriwKXz0SM7/SvbeQmrnwAarls/ilRnZPKCcOUsQIKzC66kYQwUddKQ6HWn4qaTZoZBcIJue0v+oD/xdPnD9RlQvWwpM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pb0jwep1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gug6Y9J6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pb0jwep1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gug6Y9J6"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6486jGGd257852
	for <linux-remoteproc@vger.kernel.org>; Fri, 8 May 2026 07:20:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GbZa+AmXSd6Sd/9B7JCmQ8e7SigY/d1LRiLpvpa3tO0=; b=pb0jwep1EoCR15Zh
	qRCMWPwOC8xBb2DQDzsIvNq9/+BMm8gsy5LPaG+vO+VqzDOsJQVEuqFNx+cmLte+
	4e/kacxoXt75bGVCMvauwsJ6fFbjrn1pqIxm0k0dhP2b9B6jFrTpnObEa8yF3x4O
	s1Z0QhVNqP3UnaP+JTpktEwgUSMD9nRU0tSiViPIGeBu573rrW1uf25GOxczVMiz
	GxUkdlJjp31Jye45LMr0HWHM4/1vXaEQdQm2Wz1gSE/fAr9jE5Yb4Ejcnfs1Y2qJ
	TD3xxYmRU3854UyGpWq+lx1hCGnIK9oDy8CrEQYbSNFwzByn+8tbI3mLk2HJClN6
	cjND2A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1aueg43n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 08 May 2026 07:20:26 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-836cfd84728so1036950b3a.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 08 May 2026 00:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778224826; x=1778829626; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GbZa+AmXSd6Sd/9B7JCmQ8e7SigY/d1LRiLpvpa3tO0=;
        b=Gug6Y9J6I5hTS7GrOMCT6KGaQVADHuAk6o0CXbNf90kA9b6ekk7qqI87ikWmEpTlVd
         FdhL5RK0RL86UqZtLbe3HT3o6s52OSA+aW8AKMWVgHafPVRbb0EhH1jdrH6wmW2Ze6nv
         JzopXZ3d1ZZjEh8hq6SKfo/bXBF+/10yQ5cfYVDs939ACnWD5/HxcCZNiKpfyT87iXR4
         f+WZ6KNRSqrwj55cds9+00JzCUxwzwigYdzA9NC/kKTmTAHhqTvaysuZKwJF4wjSkb51
         xi2b/YR0DQ8EKh1NzjXv0SXT5h9/voxjHvrYqr+8KW3JX1gIZ0IjOjAwxE+Bnom4wlYe
         wZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224826; x=1778829626;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GbZa+AmXSd6Sd/9B7JCmQ8e7SigY/d1LRiLpvpa3tO0=;
        b=hIYsAx14j6IUUI1ODs9diw5M669zj3p86lGBuqRmoUAUBE7wlmudEgk2CQBN2l1Xbq
         YqCYBhDZgRy8fHN9Cdx/oDTGMw4hKy35+Lk3UQ9U3FAxbqI4xm5A4w45UXpK973TDvum
         4Ng6cFeKvuU/cQ1GnWlJ28W9TVOe/7NMwEtJMfCRxBWCdg7htXdofNlbO24d9jCsZh4N
         uniNYxPjCGhEVK0M2kLca4vi0klUyoRI42ik0WipcI16nn0JI8/U9zBmnmnAAJyQKtHO
         rnFCbLsN6yYLXGKnH7yOucv3VQBdm8U132z4fjisRJ0OS4fllSKyLpbwbJJ4TJ7dCxq+
         LpKw==
X-Forwarded-Encrypted: i=1; AFNElJ9HHoQ32COPg+Iuo6RDe7D7yCR4q3eOrx9u5N9F5/uImc3Qz0QChU7YVPLykrKuhrOFqJtb00GMxJsiJzTL7rSe@vger.kernel.org
X-Gm-Message-State: AOJu0YwuKGAA7kxjU9sE5siEDt0ZsDaTnbNQXUQrDpt+GkOKJfA8BIDU
	4V5DB+y24jOqqG91Fjg+6YJTj5MN+5hdrm7Gfb47OoZV9cP1rx8jr7nuca+anXFpNh7Ud1xVdS4
	UMwIWdFQwIwVU1Z5KdH07RFwCciVvKHNFOfagbj/OmEStXrJ8tBLCflqj1H4pwJk/hiLo9nMR
X-Gm-Gg: AeBDieutYnF6OhvJmAbsJWg4p9TRd8IrsOQndozSmCAkXB195/2vBbA2Md6POt8KN3p
	OTLkARfmlCzZbbTX6w9K52eCzS2C0fiWkAjZZimx1YuikZIwQO9oieuxdeBTmcVkgHuIoJkDxyY
	YRD+/3db5mkAIu1zH/2PbXwZJWlkW2ttjww3yKTLeKGb+1WLJC1Rs8J+PCaszyxeahcH5wzoGoN
	7N1cOjn0fjtqeLYhsZuuyH+2bpBkzKI9bk6p6ZJZey62b15a/TDWYmnx0PGgmqAfc8IGq+vdCe9
	n5NUrwldmlW1gLgDtXsv46oRfUicaiE/BKlQmYCyIlBngr8vR2jAsqaQI5Vkdh9H971T8Q4Yn3e
	mdhcWRSo95X9OjXquqp1pQ+sOiDgQHDNIkLHEDTnBoxPL7fyuJoc=
X-Received: by 2002:a05:6a00:8c3:b0:82f:49b5:cfc3 with SMTP id d2e1a72fcca58-83bb7fb64b6mr5283661b3a.18.1778224825706;
        Fri, 08 May 2026 00:20:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:8c3:b0:82f:49b5:cfc3 with SMTP id d2e1a72fcca58-83bb7fb64b6mr5283635b3a.18.1778224825227;
        Fri, 08 May 2026 00:20:25 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839659498f1sm14566685b3a.17.2026.05.08.00.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:20:24 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Fri, 08 May 2026 12:49:47 +0530
Subject: [PATCH v2 1/4] dt-bindings: soc: qcom: smd-rpm: Add Shikra rpm-smd
 compatible
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-shikra_mailbox_and_rpm_changes-v2-1-ab76fd9e71de@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778224815; l=941;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=es5ERD8ECRizLcUcsRpPU+cL6+81oQXVvOctJZKt3TI=;
 b=PXCqMzm2pz/MN0WNzlq6U5QlGQH8dmERsSICWaI1BSRa2cqw0313Y/b1ug6Q4LccPg5v4L2eD
 xWQZ8MX9355A9t6VsjeKCEPXqTIa1W8xd4nupVmKQ/PHXwy6ZrAQIMs
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDA3MSBTYWx0ZWRfX6oh05/dLCZM0
 XLOWoxbfsh4yjnWjL22gDu8L5tjYge00YJ5fnbSQaQNqtUom/oQ1dKE19fygT5iR8sp+MrlEeCZ
 NYTDBSYV7YCamapWdCbatmJBQ+38pRksFpSN0efN0FFPrr0v7v6XW/HkDQLB/v8ZyPP/Ug8BFkZ
 ew14t/V4WRJL0D2jEUmuKjKftiEmMrVL+XZjf/VpKYpMRKtQoOqWEIJjm4hzfVWA69fpniz+RKw
 qEH5EiJckTc8EdkM9jWPf8HkRm59kmN+AnKNoMFEmfwksDtN6o9ngZ612nPcRDeipxQkNHV6CNz
 kfMeWHAdWyEfLYB3jHiiaWQFso1vv7obdUEPeQ/AH+mRMcwsFK+UZJiCvLqcCrdRiPZ1jHf0+bq
 b4X0WWCxlwYW0yX2eWinJii+l0hIVlv0Y2EQHA4mJEKEx8ari7XHJ3B17eontiHbFtZ04juwmAI
 bb+yPS/KVCMe2b2LIJA==
X-Proofpoint-GUID: N2av986MTsXg8F3yI9Z4iQuP4q3PvlVV
X-Proofpoint-ORIG-GUID: N2av986MTsXg8F3yI9Z4iQuP4q3PvlVV
X-Authority-Analysis: v=2.4 cv=fcydDUQF c=1 sm=1 tr=0 ts=69fd8eba cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=69wgM2fLTQVZxHge9JEA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080071

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

