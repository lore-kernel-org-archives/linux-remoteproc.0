Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5622E3C2BA8
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 11:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784633743; cv=none; b=nwlc/LN6aJqbdFgo/maE8O0v4OWSaHEEnwq+mslsLeDkDJOY9Hh4j+FLtIuHM2UgyYuSUpPUpcsRNI7f6oTrk5GK/J6Zmdkkf+vNF4GxBecrc3AcldnVU7nuoGS4Ed6sNxyhVZDGqtf2rGpp0MX+J2LZpRDaUTcN5RVcNl4a0hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784633743; c=relaxed/simple;
	bh=J0vkmyjvQytVQZbdP8GFkaf/aAWDA/WJY7SR36C4nK4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DxOcz3mH7oCUd0vJ2B6klnoSiHAlNgMKApvLx2JFMCSJnxM5+8sgEXL9fwKBuc5jFYmBrVmVO+42u+hT7G+m1BUOa4YLDxgZavA2dW8QPOyhN7/LVHTERjzlPLJPOXtSJM8ITZEBPq4HLbk6a6dBPo9Ld0DjB8mD+3aVqhBaMUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X0utBtlJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IosHhdKl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X0utBtlJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IosHhdKl"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LARPrV1229977
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 11:35:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fs95avQCYve8bAroM7JbAlksbIzVwMukOukoMBCyXlw=; b=X0utBtlJRpEHWvHX
	3kLE2+VU9tRv5AURHvth3mZzoAfGv0ChJbpJDuqWuLkNM+N74t6c9rK23wVU8Fbk
	NsmE2XMJjMxmlo7um7VvYW27pWRk4RtDnD4jn/N5T9WcM/UQSim/4J1rvBUOgL+4
	AdnOL+AH0ajepSN9c3GTljFomXNYOU/NoYIY2+XGHE1kZVlYVooMplhzGn5W4WgK
	i7Kh02w9h6xv92/p3aeEqytqVsBI77ox6z/rBz1m+w04C4+MLmyg6A/VJbCC+23Z
	0Npdi1utr4dXfvVnEbZIYn5XVzFVRhXmHAp6cczFVS6iKLMyfHqPjfqwhvTKermT
	mM4Gpw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj01aacv9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 11:35:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e9a2b95b5so1904623285a.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 04:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784633740; x=1785238540; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fs95avQCYve8bAroM7JbAlksbIzVwMukOukoMBCyXlw=;
        b=IosHhdKlfP8nKY+/nAs7vR+VmTMmwC3w6bT/yB278mlgF78k9OJuECj6spBzVhAKEs
         WxDSJhboUcMSij9/LlibtckGaLx03BFy6MENpvL/akw6bkpv+60LiNHIyqK4ma+Rokj4
         mieegdeUCC2U29oHcqGDqJq7YkmOgWqiHySfDR5iUIhdjfM7vKjzMVzAT0TiOthxQUsh
         m7/M8dlZ1h1vV2qXdumz4EihgEKshlKOqZjy6hyt9UQrvkwTDFPN4AWNnQN1Lxh5QCgJ
         czohV6avwMBhFTnvo7mLEl/LAAu6qIWDosGgDYRd5d0kkkwZr2dyr/MeA4x8/5cmA3gv
         eS+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784633740; x=1785238540;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fs95avQCYve8bAroM7JbAlksbIzVwMukOukoMBCyXlw=;
        b=GnfjJ3Psd6LqKpm5aE/OZvqdIu0Y3Z0pMrkDMr0m1ycY5/M5P7WchRt91a8KHt3ruP
         7NUki0f7khng/M4QHQI/CNqmYwoWXbC+GdBfb586wMhzRArFQGLY+G93qArREobm1N1r
         rICygFUHNRoAjjuimsHX/HBE5dGKVLU/Rn58PbgO6Gjl4AD2wwem/Mh9Kw8LXKd9C4UF
         W567TRbFndkunQLxcDct1g2IbOdn7z5MRxIi9f29KRuUjVNZdwn93Q/7yYb2qpQTvKda
         w3THAg9cbD0tYQhReOnY+dt5MPN66iFtr9fZoH0SCCgyKtwx/c3vWTkpOpwaUANbSzMI
         3eJQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr4ErqR9n/WrvkSq7kWBy5sWk80MkrGMVHZvWr0peMcFlXnw1SZu+VL9phSumVGH9tQkEUa07EreAOFJBOf0c1I@vger.kernel.org
X-Gm-Message-State: AOJu0YwIdXDfw4uSjgiXC5wBUIqONuzbJGVEJkRQTMIhtIwWwGkP6TnO
	RWuEp+rhINpH4CC5c89cttjFio51TxrNd1ZpHIDe4H0BnHZTxZd1nDfSnj/2BLze7NzLbw6FEHh
	LOsf0E9azgenWvuQhIcQNDn5J8NEAdW5iSvCEukHAfujWjoA09o/6XcDSIikRfCTnCxFRp9N0
X-Gm-Gg: AfdE7cn4Ux2eWRbTZP78pGc6mGaYLttfrUBM4Tb6TFNPHipY+jzTiHxFfv447kfh7+4
	hfGvZRWfQcJPNTXpSrvFOLJEgrUlFol8PRmiKpk+IGldVQHN93j8gj3OoIONX1nbhRgmN0Nqfe2
	tVblV2Ek4LTBfvj/mkKFXxHlC3xJ1kBCFQKm6QLiYeHlXqzVbkoC5gcl5ebQEU7QPz3DGWLULMH
	GDAFvZBNDkAsb3JWkSehhY32XtCyrAt/uxkTWsJnF/PIt2f6Vfm2unm1dbiHtyy6X4oRGjgaroD
	+sZeKgo90SqT6564M+ch7W5zX+UetFkNjkK4ieqTbW5v+VvanMN/piNn5uXXI6Q+tmrfpytzAZE
	UQU065waI
X-Received: by 2002:a05:622a:13c9:b0:51c:7b12:1213 with SMTP id d75a77b69052e-521403455d1mr166310941cf.81.1784633740171;
        Tue, 21 Jul 2026 04:35:40 -0700 (PDT)
X-Received: by 2002:a05:622a:13c9:b0:51c:7b12:1213 with SMTP id d75a77b69052e-521403455d1mr166310611cf.81.1784633739711;
        Tue, 21 Jul 2026 04:35:39 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653bfed7sm69798075e9.11.2026.07.21.04.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 04:35:38 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 14:35:07 +0300
Subject: [PATCH 1/2] dt-bindings: remoteproc: qcom,milos-pas: Move Eliza
 ADSP to SM8550 schema
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-dts-qcom-eliza-fix-adsp-binding-v1-1-3a0b03af2ec7@oss.qualcomm.com>
References: <20260721-dts-qcom-eliza-fix-adsp-binding-v1-0-3a0b03af2ec7@oss.qualcomm.com>
In-Reply-To: <20260721-dts-qcom-eliza-fix-adsp-binding-v1-0-3a0b03af2ec7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2595;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=J0vkmyjvQytVQZbdP8GFkaf/aAWDA/WJY7SR36C4nK4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqX1mE2f6furgrriqfIMorGrNU1yBGhfpKXzPFA
 wfLS00A2/SJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCal9ZhAAKCRAbX0TJAJUV
 VrBJEACfmqOTEerU5E+E+n6dG9vxIFKab9rWuaL/Ef9eotYErWJGpyZ7ajHzrX4+T+sJXyoxCeV
 GzGrNd09e3Njmwq6N7uLratFUP07/EjunbOoi6yPR6L3DiRXLsnEI5mWQuNQ8LbEsiFq/L3jZSz
 iy10wr406zgFEpMPfctT3cG/YQpjsETI3kDxpCWhLLk//Xk1NGi50QHMaD8Xjk4PYZvV2unX0Oo
 84mFONI402vNDLi5PJ64jEGf6Yc22ixYXEYXl0e2vMcT8YafeC78pJOeT9Pn5UpUj2toPE1cSq+
 PQA5vGqu7BgYEVZu5UhfHw5DCcN7nKUOk0yqCXBpw8TWdd6/ag29LNbw7Teep2bwh0/VkEtg8sz
 MUq6A0mVK7QhOq+Q2yBdpO94yMbj+l7AGrQcwTxgH68LC9ncCHv3P99VXoW6HmgwrZivWw+A/iF
 SPRBklxCRcbFMw1WN+7Sre4GCeBKWgHDRcw/qlwYOjYKdoFvDJwuYvEesDOQpI97NWqOTVtFwwh
 GcLP13EUYifpS2qQblHVe5EOxwnNPZRhKdss9XaPxrqzT1OIdngJXlWmzFVlvmWqz52R2ugQ2eH
 4Vq3/S7sE+a46GyEEZ23JzCPzglrueQpDeddMm7NsIWYMwZPIPOI2T7QgaRtcKrPB/b7Urta0l/
 A2EgKNwd+tC/Rgg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=BL6DalQG c=1 sm=1 tr=0 ts=6a5f598d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=_x-37rIlkLkDkq6pPmUA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEyMiBTYWx0ZWRfX4E+DzfEsvfqb
 VqZEtsTNACT0HYyNwiDS5OouegZaFEuS6nNfqiRcRh+66OdAJwMoIIBiO9/vtbElGtpVqPiH/Bo
 zRfld+utXcbMCGvcHgUv/HizSAVm64CkTZF2zNRzstiIfWwIaxNI4TP67atrv8x+pI/8aFrKjUb
 8ncJU+7iADMtGFIvSfUQTkGEOHGLa+db8KLJuPLT8v40YVP98i9QmIKHq+4evH8TM27ULj4Aia7
 WiqT1KJ+2yfZuzkIfsGCa59+nFBqG04Y3ss2BApPfGkoCqFPjIKaqaTCv8Fi6E06CAxYcQKYra3
 ABIFAd+Ga6lhrBDhhs87lNw3YlCPWHPSFDap8XJUTmedEct1LAMBxFBHNLd8DiWcDVGfLkzB/rx
 oFYCTeY9xi/bHtrnQffcp5TcaC5v1xQNRLrQizh3rE7cwUdOK4jUccMvT22KmmnsOhWC0ZD6RsX
 e/MMARB7RoHoVrx6ZJw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEyMiBTYWx0ZWRfX3olNyha/r+JD
 DcrxRdvfqMwgUXs83R3sXKbyCJkNApiFBoqdkVHVOd6G38o6pmkeiIld14fXUJEsvXJHW7PpdDa
 hncUFX5F/oHSZ9jSeFfxPcczn1XoasA=
X-Proofpoint-ORIG-GUID: UAeIIwhWofZ4vEqsalFOCVnhkCLoBD4v
X-Proofpoint-GUID: UAeIIwhWofZ4vEqsalFOCVnhkCLoBD4v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_01,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210122

The ADSP PAS found on Eliza SoC looks fully compatible with SM8750, which
can fallback to SM8550 except for the extra interrupt ("shutdown-ack").

So document its bindings in the SM8550 schema instead.

Fixes: 7cf2f07f949c ("dt-bindings: remoteproc: qcom,milos-pas: Document Eliza ADSP")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml  | 3 ---
 Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml | 3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)

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
index 2a4c527552e6..019db91be7fd 100644
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
@@ -232,6 +234,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,eliza-adsp-pas
               - qcom,sm8550-adsp-pas
               - qcom,sm8650-adsp-pas
               - qcom,x1e80100-adsp-pas

-- 
2.54.0

