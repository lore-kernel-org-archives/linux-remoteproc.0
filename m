Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CFD47DF91
	for <linux-remoteproc@vger.kernel.org>; Fri,  9 Oct 2026 07:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791531353; cv=none; b=Nbbm18NNGcdZBjgeje4IZhsG9sj/vxOiKlU+1N71ygRkkEi3m3NX/H/u7zSGu+DeDCO3baVHFvsNTt7PpZ18F8HXyz5zT0/GGC56r/Qrs+431VCpdXffhkV2+NeXQ51kIi9u5zOK++qZlv+ukmi65u6xYkCfsQn2nJVSknitORQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791531353; c=relaxed/simple;
	bh=Pvv537cteRJa8ONribBapnslw73PT1p0fjousE548mI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OAl9JKixszcC8cZGb4mfbSaPyAR91dnHnDs43R52udtuiF5Ufvp4Ks3WLOPAZ59oVLmOo1hFoRN/IBUQ6Czo3EETwdnD6RDuXRUGGfsG0PZEEbI979dWWQqaHuxoXADXvgzbG96jClWKMutQV1p+JtP92pUtyKjN1Hdn3dQPgUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ern8Sl93; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qd50RT6A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ern8Sl93";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qd50RT6A"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HLMR3768939
	for <linux-remoteproc@vger.kernel.org>; Fri, 9 Oct 2026 07:35:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IdA7gug4AyZz/jTkGClkMFslbjtbp0lg2QkRabJ9cuI=; b=ern8Sl93TSHXvs07
	o+mVK6R2yHtcmwrxoRR5boRB+XaaPj1CaapFpBQBzWcA9sQvDXAIl7PhbmXUGFWb
	eQKXlfBF03raT5mkzD/WED5TOBb5lS5mKwrdUYmyETHw22kPD1TJTY5edJEkPJ1H
	kP8SIN/NIX+l/D2uarAz5ltdWuadZlO80AibJKRXswKRCdiXq6r1FTsIT8SKYHrN
	6PteTXq7mF1/8DjL9vJ32jwtQqfM2mG7hhQ9S7lUM+CCSI+AEmdyRud38eEXXb4m
	1mEVzrrXT5+mgVYJeGZ9Bum2ABgDqJefGIhaNBweGVt0mkOZ4MG+7DNiVplWuwJV
	QhmXOQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxu2fg2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 09 Oct 2026 07:35:50 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33713e5e6daso7419368eec.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 09 Oct 2026 00:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791531350; x=1792136150; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IdA7gug4AyZz/jTkGClkMFslbjtbp0lg2QkRabJ9cuI=;
        b=Qd50RT6AK/oXf/E1YGF1p0piav5XVY0m0mx6jW9eRbopIyzOLHcYa3b/2BVDZ02gMe
         hNXyxvNJ30rGOmkGMPwI92pWIuaCHoj475J9RNQ82GjVs9yBZhjv7dLL3DSNWuQLydxy
         KhpepIOsXb2RYVTNxP/zBwfICpmgZxYWzmWo4n+zG8Vp8uJta524El4f2cy1+57zBOWr
         FuaNJyBjE4s04jZQHMRgnyTm8tGWOx9syFIuL/weVq6euorM87LAv4UJcQ3Z0k/qhS6g
         xlm1R4JXDOk+I5ZtECWQnUPlLxXTKh4MVKiohrgzhyxQE5VmGQ73ZvHzXJpSfhQxTlPW
         murg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791531350; x=1792136150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IdA7gug4AyZz/jTkGClkMFslbjtbp0lg2QkRabJ9cuI=;
        b=rdhGbsewsQW+wabGO8IvputoXOjVfhLHk2Gx8Wvtezk/Gvw/XXyrWwGkwW69+6fziP
         +JnUqs6Lbe2hd3vC4n+SItMHy1Aj72qxRvczGDTTqhO5+3AIkilgtjI80djQ/Yg3Z2qn
         xHOZrAfdlh5C12hy9VrNa09CRGScOg48lBdHQXDbl6MFn6zV+CVuWBiRbNaKnojTK3u+
         Y9fcLsd/HkdMiAsC1FeWbyTcCc+W2ShDQWM76Sazs548yW27WgCrDVSF+aCCIC/D5Yzk
         Ep2qEGSYth/u8u/vNglcj2GziX3NQCvIUPWrgw+GuETwHKmlSw5H0hdeJd9VA970SeB4
         qkkw==
X-Forwarded-Encrypted: i=1; AKwUvBwVRW2NK8RZc4VIefxSzhPi5tO4OhYfRJ+eozlfrZ0iHj/EMlxFJ5Yczc/CAkh1RY53KTg5b12B5qyp2I4SIq7A@vger.kernel.org
X-Gm-Message-State: AFq9FYLUtohauv0sRslsZpV2aBmuVTDzoaqOFzgXN2kXvXcbkqctzFhl
	+LEIaOaU9xU+thJbQZfrAHCCF7gwJDa2GbBImMjzJndobTa8D0VPLdFlSBFcuHKRorhp1uCc/BG
	hT/xqSrVscPgeAQu7zhQMUX3rYLqI60GeZnbBKF5aPkcYtsjVteirabQ/dXRGgfU3BOr2xE25
X-Gm-Gg: AYBFou276Av+Cn5LuB5a1J59M75pvufMkUC3IOUIG2PgxlUSF3RImfjEAqwE2kXInNG
	le2QojY2g2+1XX0gRPrv1DZsqGPb27D1EELl/DRKaY+O1iTk/+26FXQOh9WViayTuxuvuhe0MAa
	1x7hqFqd63k3qDMaRSxMmFCzbdtwgPYNHi47ga+HWUOA1PMmnwCfzImhKb2U0lt5O3w6HKvjhbz
	367T31p5PXmUEusEa2TbnjXrR6MxfDw8FC6FhbcAj2NzXir2DMyfm2xLfhJ2Gm5YpvejGuZIgN3
	c2IUggTZmyKZ5+hvKTlhV+Ybwvp/tGtDtbZ0+lOrCEPBaTkZs8IDq/g5BN7hAcd4zWATptXaAk7
	KFUzm7J4pQc4pG2njUxooZFlvzmIpvpCoo+BY
X-Received: by 2002:a05:7300:cc98:b0:353:5871:25a3 with SMTP id 5a478bee46e88-3537e0ce10amr1735485eec.22.1791531349493;
        Fri, 09 Oct 2026 00:35:49 -0700 (PDT)
X-Received: by 2002:a05:7300:cc98:b0:353:5871:25a3 with SMTP id 5a478bee46e88-3537e0ce10amr1735450eec.22.1791531348885;
        Fri, 09 Oct 2026 00:35:48 -0700 (PDT)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca7133asm5658974eec.14.2026.10.09.00.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 00:35:48 -0700 (PDT)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 13:05:39 +0530
Subject: [PATCH 1/2] dt-bindings: remoteproc: qcom,kaanapali-soccp-pas: Add
 Nord SoCCP
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-soccp_driver_dtbinding-v1-1-40862f7fc58b@oss.qualcomm.com>
References: <20261009-soccp_driver_dtbinding-v1-0-40862f7fc58b@oss.qualcomm.com>
In-Reply-To: <20261009-soccp_driver_dtbinding-v1-0-40862f7fc58b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        shengchao.guo@oss.qualcomm.com,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAzMCBTYWx0ZWRfXyKkhgTYXiLiA
 ukAUtiaMJ9MsrbnJ8YH01yNUIySk6wQ5bTcIlf3yncCaQM8FHOHG8rtP7nNvO82gE/7O2difCtm
 Q0k0x3aq+iUGUziY3UQW2feeXwwYU1SeGaZHD+cbz4fK6uzu3gmd5gGTQdVDGxDoiSP2V3PFIII
 RiFNv7x335yDFjfMdVP3c/A/cHcc579ZCVaftHLLiVgCkcJVL9XoTKJjg9dPfLdU+evYY2vtbX7
 EOB82DjQEn4TGBnVUv3/znC09oGQALkfn4AzaMBtzeruM97PHyMVoQxpROQXm7s9KQPmBJbN3hd
 3cZ3Mamx/EoX+8gXzm42AqVEaQf7LEliSq8uN99wOnA6sQt/ABUbPN6vTbCsDRNj3978taTCp73
 Vn2baNp89I4NysDFQwIyzSawJagO3TZfrFTos414rmJfwK77AZjeKo/sLwTLfPBp8I5eop58/AB
 WvKGw+JwzzoYvx1Gl3A==
X-Authority-Analysis: v=2.4 cv=QbjzLcbv c=1 sm=1 tr=0 ts=6ac89956 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=CHE7YESx92GpoR9PaLAA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: QAFU_CtJaxerY1U9lVIfaE0j_FkA0r81
X-Proofpoint-ORIG-GUID: QAFU_CtJaxerY1U9lVIfaE0j_FkA0r81
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAzMCBTYWx0ZWRfX2DCK7/KNCsvm
 Fyt9Wq78/sDRmnZZztUUJBRHh5dX0zYPJntSEtBFCmausJDlC+uxYNvp/03qp3lAvib9B4pbCLO
 JGs/JyDQEebSUfJtVWG0LVLBSwGxd/g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1011
 bulkscore=0 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090030

The SoCCP (SoC Control Processor) on Nord handles hardware fencing for
display and other use cases. It shares interrupts, SMP2P states, power
domains, and clock with Kaanapali SoCCP, except that it ships firmware
without a separate devicetree image, so it cannot use the Kaanapali
compatible as fallback.

Add qcom,nord-soccp-pas as a standalone compatible with a single
firmware-name/memory-region pair, while existing SoCs keep requiring two.

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
 .../remoteproc/qcom,kaanapali-soccp-pas.yaml         | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
index e6c78d621d17..c1911124e073 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
@@ -26,6 +26,7 @@ properties:
       - enum:
           - qcom,glymur-soccp-pas
           - qcom,kaanapali-soccp-pas
+          - qcom,nord-soccp-pas
 
   reg:
     maxItems: 1
@@ -49,11 +50,13 @@ properties:
       - const: mx
 
   firmware-name:
+    minItems: 1
     items:
       - description: Firmware name of the SoC Control Processor
       - description: Firmware name of the SoCCP Devicetree
 
   memory-region:
+    minItems: 1
     items:
       - description: Memory region for main Firmware authentication
       - description: Memory region for Devicetree Firmware authentication
@@ -93,6 +96,23 @@ required:
 
 allOf:
   - $ref: /schemas/remoteproc/qcom,pas-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,nord-soccp-pas
+    then:
+      properties:
+        firmware-name:
+          maxItems: 1
+        memory-region:
+          maxItems: 1
+    else:
+      properties:
+        firmware-name:
+          minItems: 2
+        memory-region:
+          minItems: 2
 
 unevaluatedProperties: false
 

-- 
2.43.0

