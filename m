Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801036;
	b=re4C26wOble87B0EX07/ceZYou4+ylmaaFhjwcrQ5+5SMZMGb0VRkmCoAR6kJQqk4PHx
	 R7HnfHTTsMpIe0isXwTkruRr97TCjMYnJ9N9i2oIJIeieuHW+eh0QP+euTxCobXYeAeuS
	 4l4m3mOKwOtFc771Wci4MiqjhnOjCkWTjujVZHdtvLN5OZNsK3cQlayHiiZjgqlSk4zXQ
	 +5LDchs2Im1bWq0nTn3GMbFHc4UmWkuZTiRypemjb+hDzodYY3+tp5CowbAYqzTGexM6K
	 7begUuYy+A0OLyn1huaJ6JCXDAvvbcyLfF9xZZ/A+h31XXEgxZo2J1ynXmHHzqS9HPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801036;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3MFmC+Yy3MFeMoS+Yjav3ofHUpRiM+CWnAzcmIMs5iM=;
	b=pyygcaLX6XDNNHCPUQmWtZksNEauK2jvb3hYuzRrxoHyMdMUrccOuB3Iy9ZnTQRztRmI
	 MKXvvav2zTx/vSDCQvZsTcJk4JRbJdtaje0mH5D0hI3qfzxiqbr2Kk/vLdE6IMe4a9K/C
	 M+IqDH4QQ+5YGcA5YvTSme7gihS64P+GtgoXkCVNaoQbvSbs0PE79i56xwJ+CP19zwIb0
	 k8yjb/4I+hDZfbeg/JulnaB6XlFXH+ykTpYV0L0wxjB/TeekJXYZ3uaGquBJeDlKfX8SX
	 KPvc+BllgK4/Gi2DO6NlvAYp6GCr1OXOOVfsq4hmlTDRkxoOdtFz3yk5LMhEGpDMsqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LXZTo5Km;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XTgjxl4z;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C799E606A32C
	for <linux-remoteproc@vger.kernel.org>; Wed,  4 Nov 2026 14:03:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C799E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LXZTo5Km;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XTgjxl4z
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BZxGO1667626
	for <linux-remoteproc@vger.kernel.org>; Wed, 4 Nov 2026 14:03:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3MFmC+Yy3MFeMoS+Yjav3ofHUpRiM+CWnAzcmIMs5iM=; b=LXZTo5Km0A0vFqq/
	6Y0PXUM0Hds2e/I3T65N3lXnTV4dtiiwmrFv53Q0UGQFgNTpetWIXSjLUNQDOF8A
	U24XwMAd5TktWstO1bXssbRUiD5P8EqL4zRpHJLeYnrgpxiHA5Vb8leJv9MxPDCK
	aO52Ogw66FVaX5Zyj2raKE1G4k9rKzm9AyWHJSx7qRZtq5zB0vbIxMEcVxOTKCiz
	X9mvA9T0F6W4Jsjo/p9T8NNzY2tfc0I8S1gLHmTgdgFaYzr1JnTUitx67Qx7fEVi
	BoqbLzPB294eYHUCZ+43cBruXROBIvjzOdV9wQm2iAdFI9jP7wh2QuHbMBz/tpoi
	7bYnjw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8nm4ap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 04 Nov 2026 14:03:55 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-359b81ad4e8so949310eec.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 04 Nov 2026 06:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793801034; x=1794405834; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3MFmC+Yy3MFeMoS+Yjav3ofHUpRiM+CWnAzcmIMs5iM=;
        b=XTgjxl4zEAdTMHED6e3/u+guzv7MyqQd3DHa3fThWi/kxKh/DEVKBgrebwJE81Wv/r
         9z422YHosgGQxbU5GZcgJkRs/y/N4UJOoksjebSQ2HIMYa7kNqtFTiDt7/F9lnecT7Ws
         wrPVpkqydj/K9Xz/jqwFqVkRFNGosxVGh1iGccyWlS+/nfBs3W2NyIYIDM2+cw8ZGaO5
         YEht0B7E+pzIrsKEvhurOYnz693FFUCheCr2+NriALq3Mubs2OoV3BBT65qW+5JZ9dgl
         RiW+37hJdDGzc2K2UJOJUjIz52gTpcpceBRd4u1tPgq5vWLfN0zXzO3774uM47jhUZUk
         t7+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793801034; x=1794405834;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3MFmC+Yy3MFeMoS+Yjav3ofHUpRiM+CWnAzcmIMs5iM=;
        b=AgqzjOT5bFkggETPbZRLpNeGTPnkYSVXPiKv3BCbH+NQFa6cZq6R2CJeRxxvoGBr/i
         1jwJW7G2ebRsQ3VRu/TRhqktYuOJ5UUEhoTt0a9gOoDwoPmMWekHBAwg9J4yzIXLMb3u
         wX8KVxgspNrYbz25AzdJZyQ9mqqf0BP/mNoac5MPZ/0xivSHUqtngGYnporQ02IMUP21
         I5iTV9x0moR6cGR4eeJscmatfdIzJOkigcumy9Ar0dyNfZ7Fe+0MZmy4SGsmGluWhuu8
         cTfYNrx+tUcpTh/gPd1PNhyq4QHJMoZ3eSUx5vPt8t8CzCy8lLuQg/sgXS4t4DXBdVH4
         3WSg==
X-Forwarded-Encrypted: i=1; AKwUvBwfdLX2R7hKPBSPzdRgnpojqXuw/6kvDrCzp23tuapzGmRDRNbf/Dtn0G3ucDAt9bLuKRv/BS6VxSNgK51HufSf@vger.kernel.org
X-Gm-Message-State: APuU4Z+eXEpLh6uku6iKDn8UaPGbiIkUNCggxGmpfWkgpfwZxhnIhbcK
	tOUYBXMzIdsJxeT4mkkTnf/mWR9+v7/vU3ZFd60daXcKzf497iXUenAGOf1ZEOWe8y64qJFTHjX
	s/vteLx0OBE8gUEi+VH8ami2pgigPE2Ni0atoznKAvQVg9QChIt8AnwagtbHjSyI07JybmYs+
X-Gm-Gg: AYBFou3vdQiwduBk5K6zgOqYvmtJP4K9FgL9L/uM9HgKG/bA84jRlIoSfPGAKEidq14
	UTKENywgGvxo0F9PlThyRHsxR+SzVMAR/9PXN55J/nckuAwDl4lG/XJzsTRAspOqVXNMPBAuG4V
	KSTyEEmZoIj2wZtSzQsB7VWys3bbAs/RpUlaTsmD5f3d04pyy6NZZkTNyY9IG4mtq3FvgIRozBl
	kYiAObDv622vVJPACnai6FeGRAsovWwf44M6USR9qjz5j+D9uYs3gFMQK2iTXlHls/6qaXqE8PM
	b5xNKrt/Enih4rNN3ttm5k+7K8XpILJ/q9XJ6dYeIVDlV0n6KWqwSYjgztvfCIf0SbuGbIK946Q
	3+bxTT8nSiGiZT+WkicmmNkd5JYS9fSuB+eseCPWS4+U4bI4ArRFQKw525bX7Fi2/
X-Received: by 2002:a05:7022:2522:b0:185:b157:f271 with SMTP id a92af1059eb24-1ac5d2c58cfmr31477063c88.23.1793801034278;
        Wed, 04 Nov 2026 06:03:54 -0800 (PST)
X-Received: by 2002:a05:7022:2522:b0:185:b157:f271 with SMTP id a92af1059eb24-1ac5d2c58cfmr31476972c88.23.1793801033221;
        Wed, 04 Nov 2026 06:03:53 -0800 (PST)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c4706bsm10195570c88.15.2026.11.04.06.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:03:52 -0800 (PST)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 19:33:31 +0530
Subject: [PATCH v4 2/3] dt-bindings: remoteproc: qcom,shikra-pas: Add
 iommus constraints
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-shikra-el2-v4-2-97e7019debff@oss.qualcomm.com>
References: <20261104-shikra-el2-v4-0-97e7019debff@oss.qualcomm.com>
In-Reply-To: <20261104-shikra-el2-v4-0-97e7019debff@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793801016; l=1307;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=tZFCvJe/8G5jFqrkaVvLL0DEwVk4n8owAXxd9ixY1mU=;
 b=aj7l4WZ/ua7uRIhw2ZClbEQ/r0H3bWDdM907xuipcHIouOyKlUFKqPDaWRHN2rw8XHqySaFry
 4lB6ADRbfqtC7te1ZkCTCyzGCXfZCcEeUh4qjMtnRIuzm7+0r/CSccT
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfX4EENPZL7eCMN
 07J2qIVbhNxq1rvY8J+3EKr5oszmCyHjMBCAQTxHRx/nQ9Od6mqZC1UMQOR+Ksy/bv5Upqgj0gb
 fPUvXASUNubhPjt8tCe1FIsLZZ/S8ovaCx3Fs+tIfLcePdwMiZh5nRZ85fVbA0UGm8MjuzGpeYf
 4Ob2ZReYgDLvSdaGMqAe7v5J2iN0Vz6s4wQPV7zGlkdKPcV2+iU6mErOF78QqNiTfFYoM8MKAuk
 XFSLSD0m7wB59XxB6VoxW3rvpt51AipQn2iSTJ0a/geyJzBUoXCVMpBotxKh2C2DvbsB6do2GsC
 jdVLS81AXVOlEnQCyqd8UCKwmXry90uwtq/7BESf1TnhoOcExULZ0ztVThoF+8ahmVWsTlHZEZx
 SSsUlBdy2N0ELEGcJULoeXInEPSx2cL5EnSbkeefEA4rYKHwug8x+wJUnky3yGqdhpRNYRvljMt
 4+tbqeQw7ZpNBAvstfg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfXwde5P1BZL96E
 RktCVfXOXs+6oUvkHo+1payZq2kUmGl7GdeUowC2pMEn4vXGa6jS128N/XkLH9+SxE79D54PwYO
 K+JGhw+j10gC8ZiODuuyYlndbN0kz4A=
X-Proofpoint-GUID: p30uLy6bY6bncErQyHmXqPaU4fXkyMMC
X-Proofpoint-ORIG-GUID: p30uLy6bY6bncErQyHmXqPaU4fXkyMMC
X-Authority-Analysis: v=2.4 cv=As17T+9P c=1 sm=1 tr=0 ts=6aeb3b4b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=bxtqQOLgvJ2GUwSKSRMA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040055

Add iommus constraints for Shikra PAS compatible:
- qcom,shikra-cdsp-pas: maxItems: 1
- qcom,shikra-lpaicp-pas: minItems: 3, maxItems: 3

CDSP uses single IOMMU stream, while LPAICP firmware uses three.
These are needed to describe the firmware streams when Linux boots
at EL2 without the hypervisor.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
index 34a2f15e9361..8c8a7616d478 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
@@ -112,6 +112,8 @@ allOf:
           maxItems: 1
         firmware-name:
           maxItems: 1
+        iommus:
+          maxItems: 1
         power-domains:
           items:
             - description: CX power domain
@@ -134,6 +136,9 @@ allOf:
           minItems: 2
         firmware-name:
           minItems: 2
+        iommus:
+          minItems: 3
+          maxItems: 3
         power-domains: false
         power-domain-names: false
 

-- 
2.34.1

