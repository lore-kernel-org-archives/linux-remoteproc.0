Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE723E8686
	for <linux-remoteproc@vger.kernel.org>; Fri, 17 Jul 2026 09:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784282337; cv=none; b=Kr5E4PM1EQDk1ri0zdQC9VzGTdmaUI5PwiYvjSu4PTJShsdoO/fwM8WRkPCNSR5cWwABiQ9m4DTIvvIj2+RZFUiQYlqnj10BU9Lt+3mhBQ0ZOEjnLugUjUZVbveDgOL8svQz+v7o/jMbVsa/9udl8GqN6RB31xP9PkPjT0/cxKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784282337; c=relaxed/simple;
	bh=hYUWA6hHRWFZeBTK+ngbbDcvAT3eVLKP8fJugqcLyGE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pDAfaDb9xFEV/wTHxXCbTg/O7nxkubuqXKGyKsczDZDKw87TRGdQrj5AWy+CZNv5Q6iN/Du9cfXNTlWn3w5djGZp+cZ8CIrotwZxk5fl8z3pA5SIPOHyMwOUrKt97nCnGWdxlb/SF/dLEW+Op8s+3N0Vvxf8kMo/TifKKxDH/lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NVL7fYTk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ePKyaChw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NVL7fYTk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ePKyaChw"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6chwH1093033
	for <linux-remoteproc@vger.kernel.org>; Fri, 17 Jul 2026 09:58:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZuKmCF6V5l3
	azfqav1X3iiiX2+TQLuQjPmRcthQvmI4=; b=NVL7fYTkXc6m4F12POIlR5xy2Eh
	U0uL1ozZPfnMiQDaxx+nn1+0XU1Am653iVkfUKyckjMZ9aLJtudaDwvTE4dlyHpU
	BXlBR6nE0ooOd9NmcQRIrwlZsK+39A8wEFIF4suqtqYK6zexZGsPRThKAB7wU8Fw
	A12Q3N1ZKdRGmymlQV7LjtkohkjmynzwCx2SL9IUOHhym6Ne+6XbmHuijkM1YSF2
	1QwPcjaCt3muY2O4Fb6PX7XqH+VkrdcHrT3enoLgfQ7i+mj1f5HznytqjBHAcEC7
	Oxtj4oDrEFJ0HQhdPJRwFOClcuca/4R9hGfoBWWXigHq+Wto9ijr1zGM5fA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffe0us327-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 17 Jul 2026 09:58:53 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-381ed6616f7so11658342a91.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 17 Jul 2026 02:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784282333; x=1784887133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZuKmCF6V5l3azfqav1X3iiiX2+TQLuQjPmRcthQvmI4=;
        b=ePKyaChwwzU0QeFUWjtUWfdqn5PjcIBDkHAaUHbwoEJezyvzEk3N30oMsWVT6hvpea
         zZRKgU2EpA+fRhbvNDyqUPsaXVR5S5BU4XMR6pdM90cffGM7E++THsMx0LVqgL5Elzas
         U8bDvlXf7bwmvOMFVc/02BTrKjGwMoUzsD5cpUYIdvST9P1ai6IJYvYjp+mLNGIqKMJs
         b0bweiE++L2Inl+teFll+Qp8g6PUHeozDDtmNHbx9DCVjNfnLBBFInz8LVFKYR8A8FgS
         G4OTpHPJTwo1cqfnTDrwuYzNX8RR/VB8dsBpHC+3P3XAy6bh7ZMXyjggdLLyELWEknBC
         Epdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784282333; x=1784887133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZuKmCF6V5l3azfqav1X3iiiX2+TQLuQjPmRcthQvmI4=;
        b=FZ524BrJAIKbcV71oc1VXTYGPSSuI3gmW6P1P9ggQyUnqmZIbJW6PMPLiOINbzmRJV
         h8Pt4tAymIoyzBVtIFDJSXLm51YPG0x8SskNdE8g22OiUXGURxP02lgr1ASJxOdqheFq
         OgTtF/QEZB53P/c/qLfCREYoita87VnfkdhVOHvegaij79u7+A1Sj7L2X4YjeYVEMfe2
         OeWdIL7FDuo1svkS6b+EfkaNDX8N3mk8Ao9IF/b65PzKYHO6jLqUWudqbvyEPYBhwNtX
         9eDN4ZwpFIk3aJGNpoG6CS4JH50yDyoJe5PkFXW9maVfP7thf6+WOr70TH35aM5/OY1n
         K0rQ==
X-Forwarded-Encrypted: i=1; AHgh+RrW0PfcOD4yOtz7QLYkALlY/xsoBmh61kxIJZCcwascaWRhbaC9HLerQM05N9e+jJ2M1gNZjd6/SLInPn6dWjKg@vger.kernel.org
X-Gm-Message-State: AOJu0YwiO29kcVy9yWNdgAEwyaqxr54dyDpxEDBwUuSBSh8dlPGKWI7Q
	hxcpcDJE3rjHaZ6fjXU5NqpAIXXMofNjt/oQ43WL1vvhEel2zSOHypXMohcsZzf25CjqUFq/0Hz
	NaeeA6bpRXxUR3UsVCUT0v/sRBzjfrq89OzwK0GEFpec++RiCS5OuWPlpUS5oS+YMgM0iixPb
X-Gm-Gg: AfdE7cluNtCjIhGr3i7/THxEnYWev45SssedkK+PFbDDrknbtv+uaH29xJ41LvDiFc5
	9+3VcnYz77ZgIaP1Y/ITl4qJgWN9JqYbughkzdWguijdQqs9xF29HpSiAlXq5BYXpFrXiQMsqKJ
	4DmQFSHd4jgeVjzfmqOOjjhSuNabF0Vfx1mL02z4BOgfUpeSaKIWKj/2RbcTOpuYYRhVfyTkiDl
	q9DGNnRMb3Y4tIA2G91NaOk2qXsSpwezMGXZctKnQTuawjekpj6HMitvH7Dza7Z0YKWMnClKFFu
	7MX/I478QIOHHj/1EA2gCEyI2ZlVa8eUbjREwa4H0SQH8uLUCbg2mjUYcU5qi/wnKePERnjleZd
	DrSqwZ9qmJOrsxkD34jNgE2KSsiVYRMDzjTPF
X-Received: by 2002:a17:90b:1844:b0:381:cef1:11b0 with SMTP id 98e67ed59e1d1-38e4b55af0emr1994048a91.33.1784282333021;
        Fri, 17 Jul 2026 02:58:53 -0700 (PDT)
X-Received: by 2002:a17:90b:1844:b0:381:cef1:11b0 with SMTP id 98e67ed59e1d1-38e4b55af0emr1994027a91.33.1784282332540;
        Fri, 17 Jul 2026 02:58:52 -0700 (PDT)
Received: from hu-mpratyus-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e39de7875sm2661071a91.2.2026.07.17.02.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 02:58:52 -0700 (PDT)
From: Pratyush Meduri <pratyush.meduri@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] arm64: dts: qcom: monaco: enable audio ML offload memory and SMMU mappings
Date: Fri, 17 Jul 2026 15:28:25 +0530
Message-Id: <20260717095825.3962666-4-pratyush.meduri@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260717095825.3962666-1-pratyush.meduri@oss.qualcomm.com>
References: <20260717095825.3962666-1-pratyush.meduri@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=deWwG3Xe c=1 sm=1 tr=0 ts=6a59fcde cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=qtuJx3-IUi5I1-Rgc4kA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA5OSBTYWx0ZWRfX2bXaNd+4+leM
 n83URTsAAddZqWKGahyp+qgeGcUI7ISqGPhucN7jCit7v4UNE7E1e6UEC7pGw+d3l+V1tPLU/Vc
 bN7V52MXgHNZx3jrjS4vbcI2smYvdJma9wkxR4i84yv3J8z3kYry1ixjAgwh3m4x1R9KNRLYAUg
 BJc3e74t8VfSblGfGi0vAGIpLHUPUV/fxb9ff0hF0eLN1+9CothazQSylcDkNE2Tf8We67X55GA
 pdJDHmq8askCgaWwJb0VIulNikW3RR5b27IA75q73ngDbQN1CTUd8BlIO5OD6RNTbl6ehqr6nn4
 Zqryd+GtqhvIOJNfXMAGlyYN/Vbo2+S8yjV20HLca2tjmp6e90wvMH/ItYSJeukKWm7YX1Cc7+O
 erFLINHSqNxczn28qPwunJiy+RkUXzk66MnbOjFsKs4Mtv3h+h7pe9f1tIHsx5Z5UNHfMG4d5dP
 RNGolHZnqDKlhsaATCg==
X-Proofpoint-ORIG-GUID: pzCs1RBP10sawBSTBsTxq0izqI-6Ak-g
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA5OSBTYWx0ZWRfX+ChX5t1OvKqh
 l02Ga8EjyspReSjoAkq5V2u+4AOzct9VvqCrTvjbC8YDBoFwibKaZDSkCg9Q3qL5FF14Nna8v36
 j0DV+tBe18Us+YoerNC8JMGLwOoufG0=
X-Proofpoint-GUID: pzCs1RBP10sawBSTBsTxq0izqI-6Ak-g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170099

The audio ML (machine-learning) offload use case requires a contiguous,
physically addressable buffer shared with the audio DSP/SPF, and issues
DMA transactions through additional SMMU stream IDs that are not
covered by the existing ADSP mapping.

Add a dedicated reusable shared-dma-pool CMA region (16 MiB, 4 MiB
aligned) and wire it to the q6apm DAIs node via memory-region. A
dedicated pool guarantees the alignment and contiguity the DSP expects
and isolates these allocations from the default CMA region.

Under the EL2 (Gunyah/hypervisor) configuration the SMMU is fully
enforcing, so the ML transactions are otherwise blocked and faulted:

 arm-smmu 15000000.iommu: Blocked unknown Stream ID 0x2060
 arm-smmu 15000000.iommu: Blocked unknown Stream ID 0x2062

Add the ML-related stream IDs (0x3060 mask 0x9, 0x3062 mask 0x1) to the
remoteproc_adsp iommus property in the EL2 overlay so these buffers are
translated by the SMMU instead of being rejected.

Signed-off-by: Pratyush Meduri <pratyush.meduri@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-el2.dtso | 4 +++-
 arch/arm64/boot/dts/qcom/monaco.dtsi     | 9 +++++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-el2.dtso b/arch/arm64/boot/dts/qcom/monaco-el2.dtso
index a7e3270f8609..97bb8287cec3 100644
--- a/arch/arm64/boot/dts/qcom/monaco-el2.dtso
+++ b/arch/arm64/boot/dts/qcom/monaco-el2.dtso
@@ -17,7 +17,9 @@ &iris {
 };
 
 &remoteproc_adsp {
-	iommus = <&apps_smmu 0x2000 0x0>;
+	iommus = <&apps_smmu 0x2000 0x0>,
+		<&apps_smmu 0x2060 0x9>,
+		<&apps_smmu 0x2062 0x1>;
 };
 
 &remoteproc_cdsp {
diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 64fc0d592282..d971c0ea1b30 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -729,6 +729,14 @@ reserved-memory {
 		#size-cells = <2>;
 		ranges;
 
+		audio_cma_mem: qcom,audio-ml {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
+			reusable;
+			alignment = <0x0 0x400000>;
+			size = <0x0 0x1000000>;
+		};
+
 		aop_image_mem: aop-image-region@90800000 {
 			reg = <0x0 0x90800000 0x0 0x60000>;
 			no-map;
@@ -2844,6 +2852,7 @@ q6apmbedai: bedais {
 						q6apmdai: dais {
 							compatible = "qcom,q6apm-dais";
 							iommus = <&apps_smmu 0x2001 0x0>;
+							memory-region = <&audio_cma_mem>;
 						};
 					};
 
-- 
2.34.1

