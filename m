Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF71335966
	for <linux-remoteproc@vger.kernel.org>; Thu, 29 Jan 2026 00:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769645654; cv=none; b=kfMjgUyLXGvaUe8e20QWQoGm3klyTR3PlaNb0RvJRC6tGCfE95csgjYzhVXkarRL9QmU3dhcXsdEU1eNvkQMeNfTZXOfG+ToMzCIU1Wgfo9AROlhbCZvWlQ0hx2vpIxtFI3xelvR4I5xbYpojS+t7WUN5cT1mtiy3TjyuVeqLwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769645654; c=relaxed/simple;
	bh=ALJQccgwvxMyPy4jgq72eBHgDAc/So47UykbbYk912A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nAltLB8uxOC3n1Ch0DM9ymLBudczFhMIuhe7SgGfuuiIHL4JU+qur7Nka84W4EUWZCZClcYheqR8hBUfPf6cfBKaOQ3ctJ9B8fU2cSJbnvmsyFnrXtLNuI4BUUGM8AAvbnNnjnhyYzaAThBKLNiF82x5R1r1mbfpeUzUMKLVi+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YbP7kU0z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HIXVtPYC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YbP7kU0z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HIXVtPYC"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60SH2bHO800927
	for <linux-remoteproc@vger.kernel.org>; Thu, 29 Jan 2026 00:14:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OfaylnNGhIk
	IHTKate/d8zrf3cT86hekrNWW7NaHpDc=; b=YbP7kU0zuSe6B+DhpFRyASXT2sZ
	ujd0+OGIhF6hKV2c83JpFgRtRLrUoMbJYl+W68lG3nrAiA0NrA/h6EEy/TaKaWvU
	963TkcOdyfOWhYL+aeetAvpr8WVvzGBCaVmnaHhDA9hyV4NT7Z4rkK26mPjT482j
	MbARou1+lN9n3SF6lWiExp4+qPnvwqwqZW3z5JnBRGVRlIEJhy3ktr2KgftPeiDX
	HnFyCh51SvA5qYPTCgY9/3J95lYT5eDC+x7iEgtM3oNzAzw04YqDPAL0PM/EISmR
	x8F5mhPGKCwkgi4VgMnpWjNeqETAuoGwFz3kROUDAoHZcTd61+qSlcD7lGw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bypgrh8b7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 29 Jan 2026 00:14:12 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0bb1192cbso2849855ad.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 28 Jan 2026 16:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769645651; x=1770250451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OfaylnNGhIkIHTKate/d8zrf3cT86hekrNWW7NaHpDc=;
        b=HIXVtPYCo1KKEyMu7wC7t19sJjeyRiV5t6KrXtIB8G7Jm09BVWoRRKSwTy5gbaZu2i
         mJ0qUMH7/5umFmRgAbaNrTPU0RufTodWHKQOtMwtOjYs2kgmAEAXmMZXXSQUVAIxMkev
         lI5PzTonFczlCLpmjBLci1qeS8dOtP4rYY4AI7783cfknnD8h+9uSWfAko1IJu4Wf2kT
         XBwkoJdvuWcoBkvRSRgJDFyMwR3MQYnKzu+g+0I2AT5+8wnOm9P+RP3ZFD4uRfxCkfuR
         U+eDCWATquBMVcgu61oAzzOZzHBdCbqnYuqAJnU2Zf+vlt8Qf4XWkwTBi7KbZiLOL/56
         QHhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769645651; x=1770250451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OfaylnNGhIkIHTKate/d8zrf3cT86hekrNWW7NaHpDc=;
        b=AK0AarfWB16hRq/7bmuAhBdgKzpVrNtvu9erQZpdMhg/owJcgbIXF3mw8osajBA2ac
         27djtmsAWSVBiF6yT+39jt6/ala7i/bU9IUpLhisp22u7UOwoWQz8x8bD54N+wrI8HxL
         kBvH7eooIWqhTXmucLxEQcEWLQwowkBTyCwM/UYw6aAdQ5KYQFWTcmvaMYklPA1h/5Uv
         Me+tHPscTXB41aCEwE5AtUyclgJ7sNLDXm6darSYO2dE9BGLtVLDfRKKGyJeRRhSWdeu
         ZgoRDaN9sutY2+TCAdVlPflHSDBO6D15VYwWzWylnILuSQWvflA5wPLlgU66pQq1FOdX
         cVxg==
X-Forwarded-Encrypted: i=1; AJvYcCVDVVYu4bfaw/HNVLokHxHYrOwwUIJdXFitIT27SAru50vBPTMKRKxy67GHe+IM8IVNLpAwamYDZk3MsXaSlYxo@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/T5sJE6OjMPjk2UqxsA2JV7XIy8MyGHTXWEIzqdX2QH942djf
	274y7/JBm2J8L4M5HS54Vy4VKHY0q/x4COJ5er8zrPGNhXRmSDeMKpzgJURYtSdiaggM6Q+YtZb
	+rhFu5Q8dr+FM0Zsx+ghSE4wbSx9p46c4sKFqbjbd7M4GXbVIugQQ9SVlRKZbW/mqAa8LBv7f
X-Gm-Gg: AZuq6aJHfQOgLkbLbViXNeE5WyCCLzuAOC0qrI6LknJT4pavg+AeOFEY5TVa2qOike1
	idgr6fnI8MoInhujYatPgmeYncZGt6QmF+VFXGII+pB4XFn3bYeuR3DMTsrrVbz08mE+EznF1qk
	zdoSuU81wD877pWv3v8BtlrUslRxCN9w+hbeaz3nfU2iciVq7p/Mj6Dvk4onyCPheChujvyGP6b
	rXDbwuHxHATv6vTyu2eHLuQTAbV8vpDpT7J41Vc3na2GEfK8XmbUP8avhPiLpJipx5cKcKL9nQB
	UbKMBZgq8QN0THntifFui71zE8rnuNLHHXSsVxfDXyN7hI3oXdh+L1Hi7Z8kPQl7VT68vcRf5h6
	cWTQdfbiDYrde+gidI11JNC2iLEyUDBL5sBv66tcoX6gqnHM4Z5SvPu1rTMRc4l+CeD9qeOG9IQ
	mV1ts+p3/pSS2Jt7+ulRW7j/ta
X-Received: by 2002:a17:903:2291:b0:28e:a70f:e879 with SMTP id d9443c01a7336-2a870d49b23mr58323225ad.1.1769645651361;
        Wed, 28 Jan 2026 16:14:11 -0800 (PST)
X-Received: by 2002:a17:903:2291:b0:28e:a70f:e879 with SMTP id d9443c01a7336-2a870d49b23mr58323005ad.1.1769645650899;
        Wed, 28 Jan 2026 16:14:10 -0800 (PST)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c3b29sm32055845ad.54.2026.01.28.16.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 16:14:10 -0800 (PST)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: [PATCH V3 1/5] dt-bindings: remoteproc: qcom,sm8550-pas: Add Glymur ADSP
Date: Thu, 29 Jan 2026 05:43:54 +0530
Message-Id: <20260129001358.770053-2-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260129001358.770053-1-sibi.sankar@oss.qualcomm.com>
References: <20260129001358.770053-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=d7T4CBjE c=1 sm=1 tr=0 ts=697aa654 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=I8BSNejkaQ8d0caDSfYA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: oy1SqFGNfwrtDOhEi9pxwc8_AYjkvD1r
X-Proofpoint-ORIG-GUID: oy1SqFGNfwrtDOhEi9pxwc8_AYjkvD1r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDIwMCBTYWx0ZWRfX5HMHoux6sxC0
 j58cwOYv3XNgZId8U5zNjG4WnAxS1Q2MYD4TE+adJWbIpZbj5BI8V6u5L96LnuSeiEHz9E8GovJ
 1rQ5GSGUMTWIl07stpVWfMi/WMV2HSLNoUjej0Z7sSe1f6qta8+LAdefictOKvo+s1gl4srvvMP
 SJWz+46kwNrT83/bmpZREztnRxpOylpq7wnVZyLunhm/TdV8xEJkrl5A6KxYpjv+j7MQ+ZIo8IO
 hQPgo+W+XvFwbGbjv9832aXf+tkcgbwbxGIfbPen5HFr3s3FLR6kobPtBhtRLEb0b0TRaMxnk9X
 QqcJFg6wjpyiUUQQ5lvGSfuy3JBxd8nY6a6+KYx0btCGF59/dbpuM9bVRkhPDG8xQN0VjLDeDC3
 7moisInj39WsnBtl/A68+UKeYHS8VqDkuxbz9Cs4ahuHtk0+fT1EcYwAlFMvDKh54fmSaoPRl94
 xhsk0QZX2mxT5iriMhA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_06,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 adultscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601280200

Document compatible for Qualcomm Glymur ADSP PAS which is fully
compatible with Qualcomm Kaanapali ADSP PAS.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
---

Changes in v3:
- A few variants of the SoC are expected to run Linux at EL1 hence the
  iommus properties are left optional.
- Link to v2: https://lore.kernel.org/all/20251029-knp-remoteproc-v2-0-6c81993b52ea@oss.qualcomm.com/

 .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index b117c82b057b..fb6e0b4f54e8 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -29,6 +29,7 @@ properties:
           - qcom,x1e80100-cdsp-pas
       - items:
           - enum:
+              - qcom,glymur-adsp-pas
               - qcom,kaanapali-adsp-pas
               - qcom,sm8750-adsp-pas
           - const: qcom,sm8550-adsp-pas
@@ -101,6 +102,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,glymur-adsp-pas
               - qcom,kaanapali-adsp-pas
               - qcom,kaanapali-cdsp-pas
               - qcom,sm8750-adsp-pas
-- 
2.34.1

