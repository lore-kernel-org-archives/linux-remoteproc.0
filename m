Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449B9352F9D
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Mar 2026 12:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773403737; cv=none; b=C1AqZ7HintP3cJF+Ieshdf9Muf+g1vVA5NAzBm3fBt2W3g1r2fAKbhekwPSCn95JUu8NsvS7sYgJZ6A+xjctX6wtJvaHLQRuEjyqJPof9We+cIQrxWG2pWkwKt1WFMPZjjFPVwZ4o51TKxMBqfYjLlOm/9jGbvLITFCQda7w/z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773403737; c=relaxed/simple;
	bh=+eMOLBXE7wjoxeetGQX1D3VW19q27MSb42IYcApWQvk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YFrYDtoN7+HvUUdj3mLae6I/sAQ5Zk4UdN4gWOwFhouifTqaihETIJ2PsvdVKZ9r/8zz7EkMm5SAgJSsnpaF+UZRC+MvIhPAzmnnjtq8/bra+ob61CoDXceHF+0v5JKCZEHW9XGmztK81IDkci6WNaN/2E3/ZUHKnYfQuaTFZn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KQc0ea7+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FoOh4gHC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KQc0ea7+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FoOh4gHC"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DAmpjN2390203
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Mar 2026 12:08:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vzyNvMFuHZ7
	AMRTGu9dBLqXG9QjRaM8aJeviwp6Cqpg=; b=KQc0ea7+xFkNCvTc1sqhiDGgInW
	El+EDA3XwW7aKi8IDIBlCEb0F8ax/k8rNtZqEYtYoc9n68+pGe3k1WoLGLO0xxxf
	HF4T1j83NT3SgJj8fRJQnBW+d+LdkI6VeOX35CoUFdDizFbU42AFxJotisG8ftPU
	DaNnoxmEJ0ZJt0i899isg3MNL+QeY7RKgA/TniPHZK8CDDVC3QWXLANjrA9Z6xBY
	VKIb7ZIv04/oZ3JHyMbhyGBADYkJbLxo0F7DKNtEZBHk3Ob+Enp2LTAjotxJjL+B
	8whwR9Fytmox4wgvsseJjRBFRPo+NOLlCGSTktqFfMuQ+2Uo7C0V5x0isAA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvh5m86ww-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Mar 2026 12:08:55 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3598c05c806so2241399a91.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 13 Mar 2026 05:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773403734; x=1774008534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vzyNvMFuHZ7AMRTGu9dBLqXG9QjRaM8aJeviwp6Cqpg=;
        b=FoOh4gHC+zs07SvYVez/t9B5qGPbf5L+8D6A9KHWwUFdxGBiseUyCOwxDgYw/JjpU+
         IDdE0LCeheMGaZW8jk9skNThAGAH3IUBencESwTUUIR6cdHmWNCb/44FrTapRNnuh2n6
         5Ti8KmffAOKms3v7WAmFg3KxiS08+mbWg3Ex92ZANlpCNs/1Un4mDV+9jcyMG7hQCy4d
         BVZ1vOtd4pyVD9GPq1hLQB0XPiLlRoaG7ptcCNDHK3AcQNR8Ze9hkY/hGZnW8nlMrO+K
         e7JBkVofL63/Gk3/galnS3ya8Hq4uHQX2Lp/2BDAbnUX/P15S2n0xe3+O+Qx1XEHcqsM
         xSsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773403734; x=1774008534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vzyNvMFuHZ7AMRTGu9dBLqXG9QjRaM8aJeviwp6Cqpg=;
        b=LY3OS5OXGku4xcx8ugrKnWIWCdsfyhniTSKtRdTE6fqxqZY1jnLX5TA4l7JyJBevds
         YFw+0cy4brSR6dWbVPqL26z6VBj7T3T5UbE7k8at+f2sxoTB6JaQuFlS8aST3F6W48FJ
         c4Mjo6o18pIUEELQ2lRqpjpeidrZQrDpgbafJe0tki3GSWfZ/0ohMx6su7CVZ4rWaAa8
         xhtJ3SDyrEDy3qICC5P4yuHPulAvni53TClDRw+t3To2Y/jZim8ugjAX7j8fQbIGhgce
         vUhqtxUQibopuKcVsvjOoQTwF5mfaAVSHhV8OI7bF4SI8odkt+/dt7gs95IeOMsqwBNq
         LoMg==
X-Forwarded-Encrypted: i=1; AJvYcCVdm4hYl2x7pSjwIlNtOh8k0fjcNUAfQ4T2rErAb0sImpm92kHg+CbMrVxn1irN2CQCDbBtQisJ6Z0l92Ij86FW@vger.kernel.org
X-Gm-Message-State: AOJu0YwA/fzhJAJ8RwHj/2FG4ezhy3tsi2RQ5UT3IteXYf5drn5uS4EB
	qNnK1lPfxbLRCH9bxNrrxOE82fz9bYaquQppJrzVPYV3OleCCsiDqO97JJgJJM3VXKOi4IdK3pv
	zejiROEQ7q/h0M2rTS1pamepzvEgSnDLdoOOxXmX73IYPN0i8dCqXYdTh0DtowLZ6N7kYc0GG/c
	rlr4K1
X-Gm-Gg: ATEYQzzqgF0IJ4bGFYbpHl8MyyF1xg53jHjiHQTU50KEwKC2ni1OAOb7Sbna9reVikf
	ASwvfD/VRnanS2A7PKDT7nNF7tY8ZS8SbD+0F7lG/BRYlkPmyKEcf35+bg9xFNi/k1C1sKt2zeE
	dki3xB6rzFu3tagGw9Vjgn+bP460iq0BPSoxG3lqkiC6dd2e25trL2h/HWT2XHSYuIwOvwy+AXD
	Ki8+y+vYhE/DTNEYLAz5lVLBBmZIqZ/j1O2ZjxyLp6zX2rS4ktj9Yj8ghE2nfCclTR9PXM3zA9q
	VVtZkbo0SqXHI/TH28B6Lig9wB0kYAGH9XpLpiRmGnVlg5MAShHf71TRZ8/2+e7xaJk0euZ6P7o
	8wGEbzrhUEUGCVXT5/cg5wJSRaKd4dPjn4izw2b/T+5AdeWOTGBd6WHf9FRaZPNgbezHPHNEF+H
	b3DCoHofXtXYJUYRiaHmFmbK3StIxOJiL2j8GR
X-Received: by 2002:a17:90b:2683:b0:359:8d2e:6f79 with SMTP id 98e67ed59e1d1-35a21f6874bmr2855192a91.14.1773403734117;
        Fri, 13 Mar 2026 05:08:54 -0700 (PDT)
X-Received: by 2002:a17:90b:2683:b0:359:8d2e:6f79 with SMTP id 98e67ed59e1d1-35a21f6874bmr2855173a91.14.1773403733623;
        Fri, 13 Mar 2026 05:08:53 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a02e18f0asm8421945a91.1.2026.03.13.05.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 05:08:53 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        mani@kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH V5 3/5] dt-bindings: misc: qcom,fastrpc: Add compatible for Glymur
Date: Fri, 13 Mar 2026 17:38:12 +0530
Message-Id: <20260313120814.1312410-4-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260313120814.1312410-1-sibi.sankar@oss.qualcomm.com>
References: <20260313120814.1312410-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: UN6DHf5YRdA0AS_0Fj8RKkf4ZOM9JODG
X-Proofpoint-GUID: UN6DHf5YRdA0AS_0Fj8RKkf4ZOM9JODG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA5NiBTYWx0ZWRfX9ZK+kvpdC/il
 uVUVgyvZN+VIwsovy85DtMVPUddr7Z9mNs3Alhq7tokfgbTV4sCWGqUCimjonsF5NsWNdb/VKGg
 dHavXilF9GqpP76myIJqDYW1Z+rmQMpDxH3LvS8fwK8/M+stZoQPJ1UgsIH4al6/3j9x4ftK7g8
 9VOz1BkgpCFacGL8DT3hzCFxqikzy+shJBIuRaX3CfCjPyF7CscuRc8GZ9XnAhjAMDozXeiMSXO
 U5OUm9wPzyyaGqhSCMa9Rgm3tjoLyWRUl5a1fVmqtAemuMpS7o1tBS7ZOGA1SZ0wt6gTSzbOqtM
 unTSdXYJWPwGKyzlPZKYzsiveZeGFR5MoLfA8PX5mNeJeOG71fzlymvjzT5LytdW4k139rlznHc
 1Fn0IfX/Ck0s2RalDuqWHhuy+4zXYDQRV/8QpF/KO654StiMxTsmXUkPoNZ7yxIVqEa6o6863QT
 2d/scj/g3DT1wQczmBA==
X-Authority-Analysis: v=2.4 cv=S6TUAYsP c=1 sm=1 tr=0 ts=69b3fe57 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=z2LoTb0XuyLmHK_nd1IA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130096

Document compatible for Qualcomm Glymur fastrpc which is fully compatible
with Qualcomm Kaanapali fastrpc.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/misc/qcom,fastrpc.yaml        | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
index d8e47db677cc..ca830dd06de2 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
@@ -18,9 +18,14 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - qcom,kaanapali-fastrpc
-      - qcom,fastrpc
+    oneOf:
+      - enum:
+          - qcom,kaanapali-fastrpc
+          - qcom,fastrpc
+      - items:
+          - enum:
+              - qcom,glymur-fastrpc
+          - const: qcom,kaanapali-fastrpc
 
   label:
     enum:
-- 
2.34.1

