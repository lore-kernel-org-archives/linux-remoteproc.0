Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE65471D1D
	for <linux-remoteproc@vger.kernel.org>; Wed,  5 Aug 2026 13:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785936118; cv=none; b=IoTPy0kbbXYhofdLL1SVNoCeosA0MDT5/EBUgiHwQ8U9jbNtNvpPVUgUFFlP3wUI6uZ1Ri12z1HOPwDvxHJDJi5zmTSIrCgn/xErc0GliPqY/ljhZQjaoNDhg6NdYCQrekk8KnnoN69A9Ky6G/p4htHjKOzmba+/MjIhLW8VfMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785936118; c=relaxed/simple;
	bh=5VkQUeFuFAEW4Nac9YvyZJuUHo6mCYwAU5lP4n9uRH0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MWVaG4CTj0eQOtghY6h63YeFVAy0QttoCheNUxGYXEiyibdvQpqc1DqIeInjEnU4amyRHixF+gc/cXz4ha1XaXQT559sCFclyhCdWl+vB+B4gfdXEP6Q9FMhyRBlScnMLc2UDgxAY9/CvtDi/f5qx/hTlgCOWHhuPQcPNZ+koPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hOsMKhOo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GZQ1oBFm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hOsMKhOo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GZQ1oBFm"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675Bv6892864919
	for <linux-remoteproc@vger.kernel.org>; Wed, 5 Aug 2026 13:21:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JHpdaR8EVYh
	E0jWhFMuv6br4nurOHEMzShpwgmiQl+k=; b=hOsMKhOo8cUuKv3jWYuG3D2uLuY
	59ylXALK/F1EE2hnVFGC/0NRMLIvXRo6keLMHZUAq9wqOccyieB+VhHgtrwMEOjx
	ABoegog4pnygYehhqMrucVeQAQFAsZYXqyQIWowNHH82EerR4F1qo5q1yrnmr+3C
	JM+ySSsdx52ib0E4C84WQdmDofnrcp+PC7prZ3BdZ3A6Gi9JC9IUyeXlTuj6OC+r
	IaW8uRSlOLIoQCM1fTRxM7PHf+tBQdcuMOurtX7nwAIxkhhwzqUzvsmkSutpvAeH
	X5Rz0IgsxeY+qA1WJt5gsU4p+pMMwOpy6BZEi9cOo84LhaW0FDhwGdspWSg==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv2r60uec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 05 Aug 2026 13:21:55 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-456bbfa4cb3so871039fac.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 05 Aug 2026 06:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785936115; x=1786540915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JHpdaR8EVYhE0jWhFMuv6br4nurOHEMzShpwgmiQl+k=;
        b=GZQ1oBFmjA2Nall323FaVVyyRoIuHsSo75n+iR490GabS9i1GQD2zPabdD9gL5Ykqp
         tMk6zA5NLlP0KXjBSpBDFYXvsnvy/Zma/f1QrOtFH/42afHeCD15KjDA1BiZf5F2sfdW
         jiJ4IJne8pJKZDnvr+fvM9nLb2VI4YJXaJ8IhLxaFdZCNfsVDIr5ZGbMtMyjYGVC9UmS
         L8UYmwO7O+HxM4GGdo7h5390AYbblg2Sxg8RbGUK6OZxLVi52FAgAqRqeZH98K9ymtQz
         yxXJrCwx5a7SdFneJiv/H1gYGLJW84zJuOqRUaq6di83CMRAxDOGNOXn6QA7N20RhWRp
         GKbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785936115; x=1786540915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JHpdaR8EVYhE0jWhFMuv6br4nurOHEMzShpwgmiQl+k=;
        b=U7kGXaTmDrSYBgv/03SvvKPUXGWmf0T1VfiJv/9LabkVbczcjalihsV32eCXeV4ayV
         5R1bXmZ8wIt+pH8l20hn0QWkV7VY3i1qWfYJm8b0oYc3K5yLTdny60IVH7NWcsIjbGj3
         uTuHIxJGo+Pob60jE7UYpkcbPeZJpRC5G84nLWWsJTxEQGVTufnK1BcG84LvgC0Y3YpM
         LVMfdV+EtfQd+ty708kpCOGPThWXt+y3xAqRYlHeNGSgzRF3bryD2Rw614Gdr7L15aUl
         LbD0wcEvqbFu+7+i/CVuvZbFPq2rMIf9zk0SdgK5tdIy4fRKo99zuPtZ+3SGAUsIzTj+
         AOLA==
X-Forwarded-Encrypted: i=1; AHgh+RrliQ0POyBS4AeW4s9IghIPSfT7mH7svoz3o8SDbXWWXqLmKR6DfBffVNKOZvT5w9+ALgf1UCMubyva9xVs27iL@vger.kernel.org
X-Gm-Message-State: AOJu0YyFisgDDtl8tFxATLjycPZmxDJtqKlhd0EtYYewMDFeC0Iye09I
	pLEmDNSXh2hBlBcGIqzMNGJgi4M01I1y7Gvu94ZSMz6rpeTr7iVeM64TpIRlFaK0r3TmKAe7529
	pzDxHAt4PAPUsKu/umtui9fMMHnPE+Lox2nY5YIpiWAwl/XfPHP0H1WVdq30v+z1ANtW6aaSV
X-Gm-Gg: AR+sD11gBpqHp1U+xsu7t954wc/Da9MkD1K3mnzcj24z7trtlVOVMA/OjxS4c5ZvrLN
	S9Kot8OvURAcROsFA29h2djyiKHdWp/HnvvUACuOkdXrb2T0x/AATMuyDToBiSVxdvQAa7zmzvs
	nezR+p8sFriD3+eEdcFt/FEQphe9VNaEuM2+qVGMgc0Ewmvns1HfTXil4JvR3JXRDgwJG+4xhpR
	ua43gY5pWVOdIdHDXrD8fSZukkv1YoWx1kTqd5CrFNB+E+SILm1BQDa7wD+inC6gWl33ZmVeAAz
	I4tK4JcyhgWOa6MS3FOP1o9IAXITTqmTpjXKnz4PV9HFZ7pl/+zMN1PFgf6ig4wW+0sTas9iT8V
	t+o0f4mP7+qyDJsZY1H40jb/8vEQ=
X-Received: by 2002:a05:6871:581e:b0:456:8f0d:4fb3 with SMTP id 586e51a60fabf-4599eda6410mr3507959fac.12.1785936114659;
        Wed, 05 Aug 2026 06:21:54 -0700 (PDT)
X-Received: by 2002:a05:6871:581e:b0:456:8f0d:4fb3 with SMTP id 586e51a60fabf-4599eda6410mr3507939fac.12.1785936114210;
        Wed, 05 Aug 2026 06:21:54 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4599e63d64asm2412596fac.13.2026.08.05.06.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 06:21:53 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 3/3] arm64: dts: qcom: sdx75: Use SM8650 MPSS as fallback compatible
Date: Wed,  5 Aug 2026 18:51:29 +0530
Message-ID: <20260805132129.2713174-4-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260805132129.2713174-1-mukesh.ojha@oss.qualcomm.com>
References: <20260805132129.2713174-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=WrIb99fv c=1 sm=1 tr=0 ts=6a7338f3 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=8cKaNl-6jJHcjB3htl4A:9 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-GUID: XhYSeIhX-jXxlVNxP1d54MGxautdoMF5
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDEwOCBTYWx0ZWRfX4zs0jWFbKxIP
 CcfQsfWSZKfyGfA29Nvs2QXL/pZufut+UM/L4dl3Qzrj8R2N582+gUF2Y58MpijRmZc0a4MJQHE
 a05+yUgDKucOrBwjhGjuhiKHdtWOdak=
X-Proofpoint-ORIG-GUID: XhYSeIhX-jXxlVNxP1d54MGxautdoMF5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDEwOCBTYWx0ZWRfX0QuODxs3t6Yf
 5UYDo5jHvgUx3LCF65zIQckWJFyVPtZ0AUEz4WkQD0jPX14X6sn0k0rC0eyFUM0LKiL6ZLXH1OK
 GsKuQpTXLiW9vAaibG2o+FidkL3yeJIotYZqVg44XBEJrP0gXIxb08rft8ECJ1L7aO6fyQx6Fii
 bT7GIWsKKgPuH0D/fDV+5KacNZWdW/ZGihWtMz48id7q2MGoFpwoDMFSUb7j3bS2ih3ipwaaZ5C
 sJ1RPmWfJUHco49WykF3xaQpEJ5xS6Hyl47g7vb6Wfs56pNPDW0I31Nq0MqEGe+lToCcchDOBul
 b3tX4fCHU6pYnRJvqh0K5tui/QFanU98cWsNyfVC2+FZ5/M1K22YhrRmfwhigHq1FC7UNvZ9InC
 l8nfa9FMz+/nckMaW+bdX4+8Oj/bLjs5rTA6hTVrcUrJxXgLhD8D+pFMaoGTubntwKiFxqTJk41
 nrZKskHJpE6NnM3L0xw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_04,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050108

Following the dt-bindings change that expresses the SDX75 MPSS PAS as
a SM8650 MPSS fallback, list the SM8650 compatible alongside the
SDX75 one so the node validates against the updated schema.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdx75.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdx75.dtsi b/arch/arm64/boot/dts/qcom/sdx75.dtsi
index 85cc9c6e6f83..dc9c4ed00d4b 100644
--- a/arch/arm64/boot/dts/qcom/sdx75.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdx75.dtsi
@@ -925,7 +925,8 @@ tcsr: syscon@1fc0000 {
 		};
 
 		remoteproc_mpss: remoteproc@4080000 {
-			compatible = "qcom,sdx75-mpss-pas";
+			compatible = "qcom,sdx75-mpss-pas",
+				     "qcom,sm8650-mpss-pas";
 			reg = <0 0x04080000 0 0x10000>;
 
 			interrupts-extended = <&intc GIC_SPI 250 IRQ_TYPE_EDGE_RISING>,
-- 
2.53.0

