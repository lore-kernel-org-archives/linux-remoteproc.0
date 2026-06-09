Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197CE3F8ECC
	for <linux-remoteproc@vger.kernel.org>; Tue,  9 Jun 2026 10:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781002084; cv=none; b=Nbz3jmLHo+Py3ZYuUZzB3kv+dznh7Zw9LA/s2z5fxh0Iote1WIADtKytrrLvTLQ+MKGC49+g/teq1SS7tMWIPriGOyyeaF7zdxop2X+nnKigA31UkfvJ3NTqkXoGLumyo0kUCRSI703oOakIqt8J5cX8gwVpf5Bgb7ad18Bnr2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781002084; c=relaxed/simple;
	bh=/fmIzCVQFlRc9hqGthcJ8jz++uNYfhPm1KVVgsySGU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pOjxHzOInIu/wDKbTN++l9R0SgJJT9LbyXfWy0EZCFRfuUxyVWmXdRylHtaZvhNJBtFCtZfNABtlZpGkpWFkZsGtn5J8i8OK/NZMAzNE8So06BBl+/NtFV5Mzs9jB5fli78qVCHbq0c9el39Xona9DzuF01osIB/LWoiGO8Hoe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eKbtvGn6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F2jdDNEF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eKbtvGn6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F2jdDNEF"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6599vIxo1907433
	for <linux-remoteproc@vger.kernel.org>; Tue, 9 Jun 2026 10:48:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UuGTO67RmC+ivHQmIuRBVduc
	tswyL1nN6TdGwGzdo4M=; b=eKbtvGn6qNyrvxqiCmTZMXlJ+rFa7CuUFK0NL4os
	78YNrHKvvop++uK7mOW3XHHZpMa/QMvAgHccTGcbXACwFieFvq9bVgxEYcoVe9tb
	V9TCroc3Z30CN+o255C5/iGmPvFK96F7GbMydqxRTqwISA2+XMCPHM2GZ+8auQjc
	KqM8ngDELKAm453BtdgGmpQFfb38EMJkuXf+QfkQ2Ae9FefmkwghFwIJzmUesyM2
	yiTWI7GVfFE2QUHwCLvlcw/PcWT1/b618aeSlmTwPH/PlvsZ2n1CYILKLKyQJy0a
	69hHna6jnxsMDJ+iFbs8hOpxSq++Pdqid1EfOxjyqFoNQg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3jrbgn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 09 Jun 2026 10:48:02 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-963b4e8cf8cso7381162241.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 09 Jun 2026 03:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781002081; x=1781606881; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UuGTO67RmC+ivHQmIuRBVductswyL1nN6TdGwGzdo4M=;
        b=F2jdDNEFOwz+c0lelpAlFXXoaL/yMReJ+gnKYw0IgO9sIH0MJY3kY4yQi1/qsLvfQK
         bkJljo4xKAJP4eBjU/5FQyxyvPtQ9DS/lWZsZdCvUcWVff3Wo3hTt4/uw+rTmsTEgsLE
         8+uI768vXUDj0IID64IeMq/vCp6BSWVisAiG51N347oN0iEzIXgtg+B7BqgDKi1WD3D9
         P1CgOxHyXQVrMAYaSJyDnfpHVP4xzHjMQU/On065vHj4kmgL2mEcsBnGH3lCm9sApSs4
         UJWs5ezkCo1Mj/i/uuexA/8tC25PEqF6T9U76iYP9oaGq0aCt3NmkoH+n4OIVLH0gcku
         397Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781002081; x=1781606881;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UuGTO67RmC+ivHQmIuRBVductswyL1nN6TdGwGzdo4M=;
        b=qsrR4Stjtcx/XMvxPqqviOaQqiBM2hgHw64/xx0D4ywloX9ip2u2zt3uGo1wZIlwbD
         pxQx1jKmxhcv5S+8wKP5agBTJEEi1YphWsyYbAiOuDNR6yZ49Nj56LmQbIC2wy0tgL2l
         KS5hLkrcwtYO0yY1+5JbhfG1DCGOJw8tWVRA2NgRXqKXZ4jFGF42q+AHUYshi+6kqVps
         6nCBTQSV52qBkqsvOrE8kL1ekUAhHJ0ykx0tpvpBHHhho6zhwRdCO9ploF97flpscl/P
         01VgXXPaQH1/UMQYCofQkTDMN6ywWFyfE6lt1xcQ0+Whs1Q+gLwPvcAG8bKxJV2iHdKK
         BgFg==
X-Forwarded-Encrypted: i=1; AFNElJ9GG7dL7vZ4ylC/xQDVvQsF06NV5B4GmZ02agOBUiZCC2tGtTAOlIKR+zyGDuHwl/3kpJ0AF7mASBrRWeL+Lx1m@vger.kernel.org
X-Gm-Message-State: AOJu0YzSLmgZL+f1BUSKqPCzMErXb//UhEz/mjTZeQUNKYqEcOqHIW83
	jX4PR2AAun/sfMU2XWnDucWBf7RBPUY6LnvAhwx+7j4QufZIfeH4Yp3JU/UJfS1SCTuA3rKhjdu
	It1nZVOmzgRjIjlqXwTbhcDgguVLVPnRDHeQIEJCZ5HOY+l8EUqaoMo+daJi6G8zYorI5Wg8q
X-Gm-Gg: Acq92OG/KqSEEyeriFW1OXcn9RWkvnN+/lSh+C5sug3U6rCJ+eZmhTvIwyQmEheTLug
	Xpqg/3s8CZh+TvzCCcyvNdcsrGpa/1rHCw2OJw/YywcQDMQTR6rWmAJQfJ+ypdG77IHm5JGl4ty
	lXBZzjC9qbGJ69I2G2g6Vr5cdIn8M/fdKUyxQzDEp3nXOS8QX8FUj248URqv0gCjjJlCEvuyTgS
	yh95MNiGyGd4PrEzg0Ll5ZGpGVTIqDpdBupFLyBDteczNTN+PyUPqoxsEuzOc1UEsB9UgLqbW1k
	1qG1BDAUp/36/MPRt/2mlhdrQfi2IZKV/nQLK9QIi/dSeDxLglFmxzV18IT2/X5Dw3hvfKC3wVu
	2XYbdJiIiC/4F57rMZEVgB2OT6rYYUxabuLvY1zB3o1XHk9YQ+pILbZthWuVGBPNCDOH4FyvQix
	YSqXhZ7fV3NJp8fDEtbIySyztBaOkJBmMyNeEvdI9PYCPvHg==
X-Received: by 2002:a67:eb47:0:b0:6cc:8a90:9f88 with SMTP id ada2fe7eead31-70037cb32b6mr5316815137.16.1781002081425;
        Tue, 09 Jun 2026 03:48:01 -0700 (PDT)
X-Received: by 2002:a67:eb47:0:b0:6cc:8a90:9f88 with SMTP id ada2fe7eead31-70037cb32b6mr5316797137.16.1781002080993;
        Tue, 09 Jun 2026 03:48:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b99c11csm4466142e87.78.2026.06.09.03.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 03:47:59 -0700 (PDT)
Date: Tue, 9 Jun 2026 13:47:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: remoteproc: qcom,pas: add thermal
 mitigation properties
Message-ID: <ujf53zya6hes3hkddhsmgu4wyabodnyg3zdwarxmcsoy6p5h3c@ild34ppiyvre>
References: <20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com>
 <20260609-qmi-tmd-v3-1-291a2ff4c634@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609-qmi-tmd-v3-1-291a2ff4c634@oss.qualcomm.com>
X-Proofpoint-GUID: mrIQ-w2o2iJTicUIbmIBYATd1CcFBa6z
X-Authority-Analysis: v=2.4 cv=aa9RWxot c=1 sm=1 tr=0 ts=6a27ef62 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=3uhaW4yOT-U-B5mjbOMA:9 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEwMSBTYWx0ZWRfX1TmFWOvErU+I
 fvZSc+bnuNG5AOhNZXTTFpv0GT2gQF0wBmLk7qpi18k4A/P1HuxUZ2H8BEFMTr2huHZB7LlTyP0
 6Rh6EQ2qilbzxU5UufvbcRq6RnEPsykFPx4ie6MoXD2PyHFinLQiaOhCDBpf/el7STtXgkW3nSU
 0/VzzKkqIZgXjsW804TdS0zzi2fpIPyPUHSA0irHyWpmMRhcuuz8ESMaMshECoLvxG07EIYHM25
 gsyOe1onkrB0MUyqPk7ht5HmmqWGWrvJuLajyIURD00y6xngQ5sMNHzEZNN/zq5QiQaUdhxl6o8
 9LTZ6iyPe930KnD7l99rD0/HViUPCokWHcHXSNnGCNwWCrqVOlOWM9z6xQ268LfRFINCnEh5uaK
 JKLXVj50I1MIRpu/SYAnoFX3TQkJ7kshJImaUI/gru8D2txRsqPQodym3nsdw5svKK+iM5Eb3bg
 RvQeTvcpukB868C4+Tw==
X-Proofpoint-ORIG-GUID: mrIQ-w2o2iJTicUIbmIBYATd1CcFBa6z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090101

On Tue, Jun 09, 2026 at 03:52:56PM +0530, Gaurav Kohli wrote:
> Document Qualcomm PAS remoteproc thermal mitigation properties used for
> QMI-based throttling.
> 
> Add:
> - #cooling-cells (2 or 3)
> - tmd-names (thermal mitigation device names)

Describe _why_ you are performing these changes. For example. why do we
need to handle two different cases for the #cooling-cells?

> 
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/remoteproc/qcom,pas-common.yaml    | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
> index 4607b459131b..0d07a0750762 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
> @@ -79,6 +79,20 @@ properties:
>        channels and devices related to the ADSP.
>      unevaluatedProperties: false
>  
> +  '#cooling-cells':
> +    description:
> +      Number of cooling cells; 2 for min/max cooling state and 3 when
> +      selecting a thermal mitigation device index.
> +    enum: [2, 3]
> +
> +  tmd-names:
> +    $ref: /schemas/types.yaml#/definitions/string-array
> +    description:
> +      Names of the thermal mitigation devices available in remote processor
> +      subsystem.
> +    minItems: 1
> +    maxItems: 5

Missing example with these properties.

> +
>    glink-edge:
>      $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
>      description:
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
