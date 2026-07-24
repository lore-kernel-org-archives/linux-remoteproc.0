Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1C3419302
	for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jul 2026 12:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784895566; cv=none; b=Lt+RzTcvN8RPlUrmeAfkXwl+B1lFOXDyAQqNfC2+7hIP+6UNAwNm9HF77mvawTmDxjiOdfMSsCKh4NDllq9G/HW5dVRNMCHJ6djxUtSOcNYnB6mfh6OJxqgC61Y9KqPunWdadMZCw2N1lIIAhG/06uo2wPur9mNJtwVo3k3Iys0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784895566; c=relaxed/simple;
	bh=hdOPs4e+5gEq2NTHhTotVnUSWG0HZXdm18O6hz1wWQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dGUn+ZZ20kwMEa5/BGaQGcu45OaBSy9ZDym5mbvwr+qYAGWV8hS+hwDFX0TOhixdckt5R4+1lXGCPme+SD10dx7hWz8yyMTVb6bEYQa6LEm+f+Dl7sD6cBvvE2MKBIrhDbi6b/7FT8WfdW4hmYx9T6iOL+XjG/6okAV0+6WO5UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BQpqW4t3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F1z2VO1R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BQpqW4t3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F1z2VO1R"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OADX7l2478968
	for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jul 2026 12:19:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=B7KdEphz0j0cMMYZkSRPqY7M
	aSr6YFxDvjx2kGx481A=; b=BQpqW4t3MZKyXVmNVh3f9UNpfhOk3BHnv4rkYaSt
	LLLx3QkU3+k8tmRV8c6+q3zphB1Ol91xhq6BnBujJLkxzEbWQRkiZEI7f4+NJdS4
	2u0hPSrhIXFapAJhYqc123gCk6eLa3Z/SufOX4IBEijzgr5KEaChuzJJOd2dSXjx
	CxQ5rlPwJ9FOn6Pwvtxt1/PcPi30f42D/ieaTwOJafg5ZemJh0Kjn4CN5bSPRzYl
	pWyHn9tE8tGJ4ony9R42mkaG/3kZyBVXk/dnoYXY24ndBuPrtuD47YDrIlsmxIQ8
	YvvydMmKd7QZiGfrwybgTATZApU7015XTkmmcMe9Nh2ImA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm2cx9d16-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jul 2026 12:19:23 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc5faecf01so7900745ad.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jul 2026 05:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784895563; x=1785500363; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B7KdEphz0j0cMMYZkSRPqY7MaSr6YFxDvjx2kGx481A=;
        b=F1z2VO1RJn4tmMEvE3qBzYgmayL98VfQRn3aEYKEp1ZDxjNpGThwfENcqahd7J2A0q
         jOQYhUkOxToCz/hWPeo9oD36u4LrY3Xp+KVfsKb47eTDUtPLZLsgzaG5jQL/nbWERseI
         IYjFsNjSQAQ3perk2DAO0EzbuoHTxY0k1Vl4xIeLxweCu7EEm+LjYbfXZKx96ySZ8TwE
         ThZNiMrNxXYnz5uJ2sn5CHm++TPAlZ49nADStX77048dLBhc452KPEm+NVT32iZUaJav
         ZOSgj2DJZZoXLXRokSAh+kNdg8/Ibj8hvma7/EiHlaKETRIsWVhKGgrEzN/t8OiWTEKP
         aiEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784895563; x=1785500363;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B7KdEphz0j0cMMYZkSRPqY7MaSr6YFxDvjx2kGx481A=;
        b=spEfJ6+hnDWxa9e3+GaddKxNsUnP+KK0nOFmVaLVnm2PPKVeiICMqcVrDKAIDB8UxA
         sncJ2BkTz1edQUaFGZvenijJZ+teC0mG6+lXYgLwCr8nL2HhSNJSLwyQLireV1TjEhyN
         sOx646A4TZYtYvnu8Jniw1XIrKSlHEzTnH6Ydv/c25rCdoj6TV2mCqoTv8EplWiAeucL
         Gppk88yAbe6D/MQvKPE7aIW43kHpArlfnj7NN9oYTO0vl+FJUM5AyZ33gZqDvtMGtmm4
         mpT73oqESzEXcwt5ef26R7E3/5qCbENIymwPmvvmHu4eECeWgQHMX0JAc70BdA93H2hL
         fF0g==
X-Forwarded-Encrypted: i=1; AHgh+Ro8XG6HFh0w3iC8PmGo8NuHENfUOPW04kpgXFEGISDunwwY2e7VaRA283SOr0agNLDiSV2F/LXAlpIVwhUnL6sU@vger.kernel.org
X-Gm-Message-State: AOJu0Yx64zsyPHG+r2+oIzeP7MMkjI+VXNAslO5fbgNnzuZXM4IO2yc6
	jIEJy08wTC0yufJOfZu0S/Bmfsyo+kf7BNuMF2cSiF5irCrSTf0oJzhREMcNLVzQVyCEOjRYRA1
	M7sQSY/mbwEThd1vuQnPncNdoBDyQEyBfqWZmfQ6uY8i8E1eQmQMTmV/fIoRlpNs5VfI5h4OfGz
	YI+iLvQKY=
X-Gm-Gg: AR+sD13p5LuJd3xwV+Co8P8tq1M7f6M6yAUUY+e/SZHqjRtb/PGKDoJYpUunNotoGj9
	BkmOukL/mxP1eTpxuxQ/QJeJgjHRbKJRvCL31KaBFqifQeCkAkdN3O9/C20SBfuzgz1tZWTwuhT
	T4nKFAqRNtFe6u0/qk9OGJNw6r/pNK8N14HrJLcszXO1wTeVgtHknRclx3JSS83MNT0xo+LNP7F
	3PunodxHfGIR36MlWze3OF9G/F23nEOb0o5t32VOM9rYLR5LenzNbuwOBxz288xHrPJo9Ej+SXt
	39NAKwG9UyCoQn4B5IOXgG+u57WIza80zANY4cwvekPYvufyz8EEMaXYhTewOevf6pAaRMbcruG
	/ktzA4pfyYoYOEBSzzrc2RroYsTOogwphiroN67+JGJs=
X-Received: by 2002:a17:90b:586c:b0:38e:7446:d2b8 with SMTP id 98e67ed59e1d1-38ec6890685mr7895011a91.41.1784895563176;
        Fri, 24 Jul 2026 05:19:23 -0700 (PDT)
X-Received: by 2002:a17:90b:586c:b0:38e:7446:d2b8 with SMTP id 98e67ed59e1d1-38ec6890685mr7894978a91.41.1784895562731;
        Fri, 24 Jul 2026 05:19:22 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d13014d27sm26626295c88.4.2026.07.24.05.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 05:19:22 -0700 (PDT)
Date: Fri, 24 Jul 2026 20:19:16 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: remoteproc: qcom,nord-pas: Document
 Nord PAS
Message-ID: <amNYRMIkmf2hfYXV@QCOM-aGQu4IUr3Y>
References: <20260724103848.233804-1-shengchao.guo@oss.qualcomm.com>
 <20260724103848.233804-3-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724103848.233804-3-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: hYXZ2E9K0HQD-JA1iSHdzDNtyp0vcTQR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDExMSBTYWx0ZWRfX9W6SFtZQ/eFz
 w5Wo+9vZsv78qylTDhv4BMe7qybb+/y7gQnf68sl48hhIJX+o4OuyFMX0OrRfmiKLStDsAhCDuQ
 GgbapxOTEVQIUboa1nzLee3Jdt6Pv4AYxx9Wly4cD/TLnW1S5UMDMUMMRDI5CZtIO5UpRY6oQln
 y/Ta+9bAf/8U/Wh61Q7FEyDf7X3mKYWRVKYikf5iWge9rH1x8kwshFor/F5rsu36eZQImZ/jj/7
 ho88FLqeL50BUtvg9Zio/1q4m3hOjhIyA0deuBkiWUPGya9kvxzb7ZauA+GUnhWGYHOVutrIXHP
 RI1+Cl1ZPU6KWja8yX+h88WQ5nL2yJvEherWca2Y9GABhi4/+w/owNSVNrYNz17V6MU+2m27i00
 yqkw9/heXR8k4r/MG4Rbc66LBHvwCy8m+69xjC+APcofXiRa6ODUaPOCkzktnSTUWXL6WSvDY8E
 BEtft8iGtX7o1CEAqWA==
X-Authority-Analysis: v=2.4 cv=X51i7mTe c=1 sm=1 tr=0 ts=6a63584b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=PhCFR9l94pDFD3z7aeYA:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: hYXZ2E9K0HQD-JA1iSHdzDNtyp0vcTQR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDExMSBTYWx0ZWRfXwlnSQQ49fNWL
 0wjxNB9VJV2xFBnFxvIKyFFyaduBUcNQEdIvMrjcSWJ/rTBT6PgDerAP0MCNCLeDLWamr0aCHWq
 sRd6wNy4ID9E7eaekT2n836en/I6yhU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240111

On Fri, Jul 24, 2026 at 06:38:47PM +0800, Shawn Guo wrote:
> Add a dedicated binding for the Qualcomm Nord SoC PAS devices: ADSP
> and CDSPs. Nord ADSP uses CX and MX power domains while the CDSPs
> add an NSP domain on top of that.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  .../bindings/remoteproc/qcom,nord-pas.yaml    | 167 ++++++++++++++++++
>  1 file changed, 167 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml
> new file mode 100644
> index 000000000000..c1d60ca6c63c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml
> @@ -0,0 +1,167 @@
> +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/remoteproc/qcom,nord-pas.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Nord SoC Peripheral Authentication Service
> +
> +maintainers:
> +  - Shawn Guo <shengchao.guo@oss.qualcomm.com>
> +
> +description:
> +  Qualcomm Nord SoC Peripheral Authentication Service loads and boots firmware
> +  on the Qualcomm DSP Hexagon cores.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,nord-adsp-pas
> +      - qcom,nord-cdsp0-pas
> +      - qcom,nord-cdsp1-pas
> +      - qcom,nord-cdsp2-pas
> +      - qcom,nord-cdsp3-pas
> +
> +  power-domains:
> +    minItems: 2
> +    items:
> +      - description: CX power domain
> +      - description: MX power domain
> +      - description: NSP power domain
> +
> +  power-domain-names:
> +    minItems: 2
> +    items:
> +      - const: cx
> +      - const: mx
> +      - const: nsp
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: XO clock
> +
> +  clock-names:
> +    items:
> +      - const: xo
> +
> +  qcom,qmp:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Reference to the AOSS side-channel message RAM.
> +
> +  smd-edge: false
> +
> +  firmware-name:
> +    items:
> +      - description: Firmware name of the Hexagon core
> +      - description: Firmware name of the Hexagon Devicetree
> +
> +  memory-region:
> +    items:
> +      - description: Memory region for main Firmware authentication
> +      - description: Memory region for Devicetree Firmware authentication
> +
> +  interrupts:
> +    items:
> +      - description: Watchdog interrupt
> +      - description: Fatal interrupt
> +      - description: Ready interrupt
> +      - description: Handover interrupt
> +      - description: Stop acknowledge interrupt
> +      - description: Shutdown acknowledge interrupt
> +
> +  interrupt-names:
> +    items:
> +      - const: wdog
> +      - const: fatal
> +      - const: ready
> +      - const: handover
> +      - const: stop-ack
> +      - const: shutdown-ack
> +
> +  qcom,smem-states:
> +    maxItems: 1
> +    description: States used by the AP to signal the Hexagon core
> +
> +  qcom,smem-state-names:
> +    maxItems: 1
> +    description: The names of the state bits used for SMP2P output
> +
> +required:
> +  - compatible
> +  - reg
> +  - memory-region
> +
> +allOf:
> +  - $ref: /schemas/remoteproc/qcom,pas-common.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - qcom,nord-adsp-pas
> +    then:
> +      properties:
> +        power-domains:
> +          maxItems: 2
> +        power-domain-names:
> +          maxItems: 2

Sashiko had a valid comment on this.  Since the global power-domains
property defines minItems: 2, this will allow CDSP variants to incorrectly
pass schema validation if they omit the NSP power domain.

I will fix it.

Shawn

> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/mailbox/qcom-ipcc.h>
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +    #define IPCC_MPROC_ADSP0
> +
> +    remoteproc@4c00000 {
> +        compatible = "qcom,nord-adsp-pas";
> +        reg = <0x04c00000 0x10000>;
> +
> +        clocks = <&rpmhcc RPMH_CXO_CLK>;
> +        clock-names = "xo";
> +
> +        interrupts-extended = <&intc GIC_SPI 159 IRQ_TYPE_EDGE_RISING>,
> +                              <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
> +                              <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
> +                              <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
> +                              <&smp2p_adsp_in 3 IRQ_TYPE_EDGE_RISING>,
> +                              <&smp2p_adsp_in 7 IRQ_TYPE_EDGE_RISING>;
> +        interrupt-names = "wdog",
> +                          "fatal",
> +                          "ready",
> +                          "handover",
> +                          "stop-ack",
> +                          "shutdown-ack";
> +
> +        memory-region = <&hpass_dsp0_mem>, <&hpass_dsp0_dtb_mem>;
> +
> +        firmware-name = "qcom/nord/adsp.mbn",
> +                        "qcom/nord/adsp_dtb.mbn";
> +
> +        power-domains = <&rpmhpd RPMHPD_CX>,
> +                        <&rpmhpd RPMHPD_MX>;
> +        power-domain-names = "cx",
> +                             "mx";
> +
> +        qcom,qmp = <&aoss_qmp>;
> +        qcom,smem-states = <&smp2p_adsp_out 0>;
> +        qcom,smem-state-names = "stop";
> +
> +        glink-edge {
> +            interrupts-extended = <&ipcc IPCC_MPROC_ADSP0
> +                                         IPCC_MPROC_SIGNAL_GLINK_QMP
> +                                         IRQ_TYPE_EDGE_RISING>;
> +            mboxes = <&ipcc IPCC_MPROC_ADSP0 IPCC_MPROC_SIGNAL_GLINK_QMP>;
> +
> +            label = "adsp";
> +            qcom,remote-pid = <2>;
> +
> +            /* ... */
> +        };
> +    };
> -- 
> 2.43.0
> 
