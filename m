Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E2042BC2E
	for <linux-remoteproc@vger.kernel.org>; Mon,  3 Aug 2026 18:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785780037; cv=none; b=k5f6GZ/oafyhoZAwj7LD77ovgU4afwTrsWLl+B/54ooIcH9sAaWKIba9UsHVpBRaV6XXVhp8iJj72rCePBXUfH98z6u30wapbeq7a+qS9VwYP7ZJ3Y2TXRUD/hOAy+Kj69rGFBe6L6SLyhMmmKUNRT58es5lAVqs7OlwwZ9x6w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785780037; c=relaxed/simple;
	bh=DxSW/8GnFm4yrosXHGRVaMQHICkgBFn3VW4smphVQ6w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qrDkMIZXk608joap+X5yP47mb08g7jsCXiv4yaZTeE9tHsMJjLBGQMH0WdaASheQcc6DMEjVYUsuHZ75U3n7PHxrbkIXAhzCEeXiwOZLL+EkLKnq3WijKjEhL/F6JuS7kvJ5SwPjAmjqHFMO0ShwFcvDbaH91nnfvxYhkt9A/XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SzMntt3N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CeFzrF2+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SzMntt3N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CeFzrF2+"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673GvtmV973783
	for <linux-remoteproc@vger.kernel.org>; Mon, 3 Aug 2026 18:00:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PHR2Da+AcfS
	4OCF2UBK87l5KcCcCg3n5x+MrrM+4nPw=; b=SzMntt3NljmyFHiL1Ww76Bn+Rwc
	4Akcl2/pJuUGI4pkHTHeq5XdYJHTbGakX5gi1SrDARpuGaI6AeOSp/+BuvoY65wU
	ex1FI2ACtecyoZZ5/GMHJm/8qXW1NIdtidHLqTDDeMOmRv4oUTukWpYjgy71v117
	t3lSZRM0bsXtjcXqV3e04QwjSXsvOLLT5e6EnV17IpBRGuGIutenGdqbghiC9Hy+
	VGob9nhzZuURrXZYZT/Q0Ve4onUYVxP2IeSHjSrPDgHRc9jrUot13IIxKtSE340Y
	7X2v9tlNUMGExyFf1EHtNQ6Y3JLq8m5Rxi3fo4fhQGnjz26rjURJzyW6f2w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnhb3154-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 03 Aug 2026 18:00:35 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84857446424so7011500b3a.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 03 Aug 2026 11:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785780034; x=1786384834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PHR2Da+AcfS4OCF2UBK87l5KcCcCg3n5x+MrrM+4nPw=;
        b=CeFzrF2+Z26gbd+FGIVCDT6iMpEQu84kQ1P/tRRM1JmFjrmaKCI6PNUzr1hEQOulhU
         ywJixNZlVIfCB7uB8erTTIRwftLnqAGsJf1CN2nr/UkQPBnm955AK2nMNTt9+1xWi8wV
         hH6b2jHwLb86B/7cE8b8iSKwl96mBQXLnzs4g7+XA/RrNV00ORAqYkIec5exfGdKYVgT
         iGwpttiIYnUs9WD8IiXXVfPj48lGwisRR9y/EQIFKIGvvdZTN6FN4YcWw48HGBXJye4g
         ENADoR6NBzMYLvTHNeYfUFgp1VdAi70vd8bAus35sZz7N858HRLYgU8a7DUVFK2PEf7X
         6lvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785780034; x=1786384834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PHR2Da+AcfS4OCF2UBK87l5KcCcCg3n5x+MrrM+4nPw=;
        b=gNdrfYuUvkm6IWHuTKg/a1TyRiBPD0yqDg7ZQsNoualp8VoFV8ITeO9BMrGjTjEZSa
         s2WlWuCw5WN9YC9WSZga5hDh/34QPjOp2F13N5Ao2hk1itAFI2L+CFe4S0E60tp3gMBB
         FomUqyF4quRsbyo14JQXPeERluvqSHyl73+QJ5JbLWajriRQuSXI0kAC+bjRj1hogP3G
         LQp92aOri+qNWZ6kg20ZxSNN6Mff/R8NmC3zXMwR7Gusb15ttumFVulc280eV4TolHAB
         8IxMOv1uXDAhMtLJqWyXuq8Sqmf1QY/LHf5uybamOstpbWxhkVDtCpHXHBvZunOw7wCn
         SLAg==
X-Forwarded-Encrypted: i=1; AHgh+Rp52v1GZeHtV7Ds0qXXhZU/vUd1o7FqdMa8/Y0Pj8ZjG5f9nxx0akkhriil53chCcCMKZJHGqhKA+Z8HTTPvF3g@vger.kernel.org
X-Gm-Message-State: AOJu0YywcljxATaoKSdfBWSMoz2jeh/vXkUMZmsZ59o3eYl+G1zggcqB
	IcBlWP4AB3Km4ojxzcubFVagjVAIM49y0fLqKXguQkVrxU3Ska765zlTqDnzWf7XcQGql4BtXsL
	B35uK77xa60tJzK2pBu8I+ENSF+57o0w7oU9w7OFkkua0d55mhuYUxJKGN6YkgcLJlSSgdoxP
X-Gm-Gg: AR+sD12d0U25DVeE8SW8v5ghtUvBqLgOo6RH4HuJmSbPUJO6aCj7Ax71XlW+tQPAi23
	kd1Y3sGmz6mFFY1F80jWuBSJ+cXP9GzoF5sGtUpncQQiEZKn/iD/CSb2bzEvVxEGgLosT/bW28z
	asUW9op9mGwmLcTgiVkbzoCKvYAVLpzWUZeKUXiikyxzfn4l+vQljJwTQCwOE9oulUDS18fwCSj
	o6xkq/OTPUldMQ/fG5LLLOlUprWpLnAWUlpCDrjLgS34EHTkc4grt1Wf24CwiK2bhZkFqrPGzN3
	Bal4kLSXHN4o151l+aPHpGmjQHMz9SvvxKqdkMhIAnPAsm68Ik/GpA22X8ZoEBtO4xlVYCGdAMA
	GtIKSBIGCugv+UID4yHnTSHLnJMI=
X-Received: by 2002:a05:6a20:160e:b0:3c3:e411:418a with SMTP id adf61e73a8af0-3c92a9098a2mr11382251637.70.1785780034489;
        Mon, 03 Aug 2026 11:00:34 -0700 (PDT)
X-Received: by 2002:a05:6a20:160e:b0:3c3:e411:418a with SMTP id adf61e73a8af0-3c92a9098a2mr11382192637.70.1785780033937;
        Mon, 03 Aug 2026 11:00:33 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe39ebb9bbsm3920533a12.32.2026.08.03.11.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 11:00:33 -0700 (PDT)
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
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 2/2] arm64: dts: qcom: sdx75: Use SM8650 MPSS as fallback compatible
Date: Mon,  3 Aug 2026 23:30:21 +0530
Message-ID: <20260803180021.20368-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260803180021.20368-1-mukesh.ojha@oss.qualcomm.com>
References: <20260803180021.20368-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 4TAGQHyUBqoEfrZzlEQAp11vgJlKI5dP
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDE2MCBTYWx0ZWRfX8kQQyqyKcbBO
 r14+jvNiu1MnCHE2OtsN/myHFzz8ZhCnZDbhuMhdcw/nSXwD8ya84UOwpDrWctGZkQPjhvKqGqO
 tCd+NE2QiQsrevoASLH9mgaeZmMJoTY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDE2MCBTYWx0ZWRfX+oZPLVQ+oK3C
 DWKO1p3EcMUc6SftgoxrBWP8Qr15Vzm1WXQ8N8M+jqdrrZAV6iIeYbsSBtxFppvnoR/tlFiikk8
 aB5h4NPj4ERgXqrxkQVC6d7Hd7WfO6wikAuFwKCSwA/Stg7cko3uikxuSbvD95loscjfrA+/tRL
 rYLwtsvMPLY8X1QJUHQmEdFvaQgvBbn4oe/wY8KNKPfVpuiBXh1U+BqjVkUpsYoCIZHNKuO959e
 U2fJIwE8Yr/UAEd/FXp3qaM/QwLRmo9MLvnTquUUTWwRb8Aguz+y/gu+F5gs/SZ7rtHvJyhOefh
 EcgvNXeKcsK7eY9CCmuzLAPurFOqOYR6cCr6QQ/1wSRaB16Grxy2r/N28MHSwNyNc3hbbr5n8n1
 J4mAO708wSTPhAqqMZ+uq3NSkoSLX5SIDflXBlT9Xd/1oWDjh/CRD9iihJHvPhtnwYjNcqNiPO1
 ZlP8y6E1+Kr4NAQ/vIQ==
X-Proofpoint-GUID: 4TAGQHyUBqoEfrZzlEQAp11vgJlKI5dP
X-Authority-Analysis: v=2.4 cv=bKEm5v+Z c=1 sm=1 tr=0 ts=6a70d743 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=8cKaNl-6jJHcjB3htl4A:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_04,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030160

Following the dt-bindings change that expresses the SDX75 MPSS PAS as
a SM8650 MPSS fallback, list the SM8650 compatible alongside the
SDX75 one so the node validates against the updated schema.

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

