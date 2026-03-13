Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D0B3914E7
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Mar 2026 12:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773403731; cv=none; b=sGw1UmR0YOdUH22rGJoAho3XBMUOpeNDL/sBQA2tcXc5+KprrWpuSGQeLRk/aTjiAgtOtXBPuOPaOFWE3J+JyaTWbbR7rzop9WeSiZFjwuWmGImlQHZfBS16RDxLBUZyimQue7Ru0dPOZdHmrnbUwvtL4f0WWXBBkNj2Lwm7VMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773403731; c=relaxed/simple;
	bh=RxCkCzWzRKgloai2lEz648vC7PbTJ2nKZf3T4gJuv4o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DuS8fbxUuIKLd4Q/5VUySOyEFbv1tE0yAK7l2xV4FFGgQpko9hWpUTbWPvIwVINZkifDw/TDb9H7KjoNg4GQ1zNAcprp/1/S+8pmWCnLX1upYjheKBtNefxxWrY0VHAH8K7Obnw/TySjRiIMbLA1ALQrF5pXP19VBCd+IZYasuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RZTuO7kW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XkavTjLp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RZTuO7kW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XkavTjLp"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D7JKKq237560
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Mar 2026 12:08:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ppInlw+PpBT
	aE16b9MZfivnywOUUI3oPkZlM/KnSAN0=; b=RZTuO7kWH3LiHb8Q7BQ4dnKdIyM
	GfGwzPi6+c/Rt2hfcU0RqfFn1V+nh/dlnC98O0FV/Ejc2OE8rUdouff51jqRzU/0
	KD8kzpJrgPeswp7jy4/wuUW7n8wdvO9zmELO5aFYAPN8X4tyIS4bv9briinNRK7S
	PZoXHUBM3B0hvjCTu3MwnJmL+giWZOf68PdFgk5lhKzNnRQqaRbvbQZniddbqXm6
	EXazBDK7lfQwJqK8zFvFT9SlX4HWaK5jAtIHVsy/3xltTm2p5Eo9qWp+qP3DJE8b
	yn4Y0r0Qbmi8zGxqtZsWA2Y2W8sYymV0Yr7H9fnZuZSH4PFphhv4h4mKSCg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cve3d8ynt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Mar 2026 12:08:50 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-354bc535546so2006499a91.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 13 Mar 2026 05:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773403729; x=1774008529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ppInlw+PpBTaE16b9MZfivnywOUUI3oPkZlM/KnSAN0=;
        b=XkavTjLpXZGEL3FP+ttG4VQ/TNCWEOpecmQK/WgNlgNimTLHsLSQjR+UUNYHSlAavm
         RAwXjDoCR7QFvzNTG5/IFrOJgGOFMR4NTehC/h6iBVylrqgRct3ObtTlnFCha82u+MFr
         2kia7ODalJ8Rxf4cq/TJbVCfgNAftmuAlgbU2mvuaxk+dW+oYEBlBzV3VhjR42JDSTHL
         7I1nSkiG84S57dfwU2YSUXffgQh+ccwq6iY+5WbCWn1Lr31BMYmAAvteQTgd7LVDmpoX
         i0IBL1EZIUZw/J6oNMHgybFf/RkjaNbeirD3Tf6g1A1hgEbBfs9cwcTTfe7pjGFa0Fqs
         +UQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773403729; x=1774008529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ppInlw+PpBTaE16b9MZfivnywOUUI3oPkZlM/KnSAN0=;
        b=HLewrLGS5ruaHDrxIlQA5GWdmvc6W/+PRpc3ItTaBnrlyAyy6Gt57xgcxmm1zvjlc/
         y0Acnm3L/8HCbF5cEkXPwZjtal3hjqOdMaA+XOXqEKYfYagBtUT52eTo53TGucAtKoFw
         mTEaUd/I5RzzaZoLjezX+NZJ+nO2haf/32SJOPaKKh4OpBO2+fRWsrsxKzL5eZxXSBfI
         3FxrPrr1TbM6GfiuFEngOIq+Z2xyWb9PkLki4ArUcIRU0DX0GVciPI4niIPjc2Iv+ldo
         4lN5DDK/SWZjo+rgiWCY4I6rH1f4OCdpSiWegBsbK2qRea8SQzgaFTRxjEo3cPJl29ag
         0s7g==
X-Forwarded-Encrypted: i=1; AJvYcCVktEtOOxxJvB2h+IlsIokvVRmlBBJy66cWpspQ6ZCcxa/f9vaQrs6a359s2kKgmfLdNtulG+9EPtAwKjNXL6rF@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/BE5I3Bp2hqpBecljbO5OyAxEK5G0Rr1JdGvK2lsN6ysiSjPq
	8wDj7KMo9PkYILDewZZNqnChmT20MlpIkfoT3N2HWc4swNtJiTeIvic6XKrlAkS/lhbzTFWVNF5
	fR62eGlHtbvRJHetrjVqZ8fNhl0cabkGN5ecBWnd2qNFKdQNMhKBlnmVic13ypgG1ZYw9C+yV
X-Gm-Gg: ATEYQzxFGM8TRty/26i2G3268JBCO7LSvNGqkbReuo1kl+fnvSH3z0soFPr0tp96T/T
	tcDtRaY7HocO2cS2s2TfuVAdd18NPOpHHCzOMHtft5WbO4Smaw9nzsWy3j00blQ50w7JYnqjSYs
	PLYS4r2SVDKKIqJt3rp49CW/7md6yLONvhxCKAcLej9UKgAtXwB8Qh5RkmV+v0HlTTHu5f+xlUk
	+L5T/aVU8uyaQgBKtHyBfqsGsIsZWOfaj4WIcFqtdINw+xrq8WGD+8IdDaKAcGG7Ol4W2RI2Zgd
	AAbdjCQAbWdbXdVTaMqc0/+Y86heCEAnFBPf59raLpQNjAjkgBLYRBXHz2yXDG9EY1YrrdzYY+u
	+mFEwWBXfC1vZ9waEckThR1ElEwh1xTIAwERV/mR4Q4q2dO6bi9tHQjphrR3Wf1VBa2t4zqR3+o
	WjDczJ8nn7vV59V9LrvciFny1b0IpGyVLzTu4Y
X-Received: by 2002:a17:90b:1c08:b0:359:8c01:66f with SMTP id 98e67ed59e1d1-35a2205880bmr2758118a91.28.1773403729306;
        Fri, 13 Mar 2026 05:08:49 -0700 (PDT)
X-Received: by 2002:a17:90b:1c08:b0:359:8c01:66f with SMTP id 98e67ed59e1d1-35a2205880bmr2758095a91.28.1773403728845;
        Fri, 13 Mar 2026 05:08:48 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a02e18f0asm8421945a91.1.2026.03.13.05.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 05:08:48 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        mani@kernel.org
Subject: [PATCH V5 2/5] dt-bindings: remoteproc: qcom,sm8550-pas: Add Glymur CDSP
Date: Fri, 13 Mar 2026 17:38:11 +0530
Message-Id: <20260313120814.1312410-3-sibi.sankar@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 7cA_58R5W79-kDJls9FVnsnsMz7OfILH
X-Authority-Analysis: v=2.4 cv=FLwWBuos c=1 sm=1 tr=0 ts=69b3fe52 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=BVTLK7zpd-CcKl8eL14A:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA5NiBTYWx0ZWRfXxHD7H6nkWs4K
 /ziDBBqer9mtpYPyxGvw/B4MtsjbzDQ1+r8zHkc3RMOko/DPms2E3jpIbqF1WgMVhTgfC4ZVqbc
 XcKXhtYjY9lIzVmTfRqLCnTPdSqFawHAna10p7lR/Z2L9w+83xrNDs4hSuaQYNDVJQf9RW8KLgX
 iTqrdVngOiDYGAlqdU0CXblDFL9wCMJpkdquFXtX5SLDyehAmPNbMqfDjDxPtMuKz6A78krbEOK
 50WqcDu8Qr2AU4br35CPMTUuqy09mx97ZDscXewlEab/mIQmImZ2tS88pDPVbG2Lj61z1NeRUeL
 cos0D/P+eCbYUelq1+6Vif1fN5q0Er/c8oWGEK/RHER7gke6OtD0Gg6R8ulJc/+ZIRtgEXcKDZz
 PWUSDrxqpelzmFN3gnuWGF1b2nZXna29lwWvZxX+5mYYT0JVnit42zcMTCOdrWA7APMwcg3igNU
 eWxoK7e74nO1BvjTZqQ==
X-Proofpoint-GUID: 7cA_58R5W79-kDJls9FVnsnsMz7OfILH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130096

Document compatible for Qualcomm Glymur CDSP PAS which is compatible
with SM8550 SoC except for the one additional interrupt ("shutdown-ack").
Similar to the Qualcomm Kaanapali SoC, "global_sync_mem" is not managed
by the kernel so it remains unlisted.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index fb6e0b4f54e8..6a29d239ef41 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -35,6 +35,7 @@ properties:
           - const: qcom,sm8550-adsp-pas
       - items:
           - enum:
+              - qcom,glymur-cdsp-pas
               - qcom,kaanapali-cdsp-pas
           - const: qcom,sm8550-cdsp-pas
       - items:
@@ -103,6 +104,7 @@ allOf:
           contains:
             enum:
               - qcom,glymur-adsp-pas
+              - qcom,glymur-cdsp-pas
               - qcom,kaanapali-adsp-pas
               - qcom,kaanapali-cdsp-pas
               - qcom,sm8750-adsp-pas
-- 
2.34.1

