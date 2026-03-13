Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44303C2D
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Mar 2026 01:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773365924; cv=none; b=iR8GjvX5UFjY6nkyb33ckESjBxa0YnhZF6zVFiGl/QNFX4rtaBoFTsRug2aWHZYxKkXkQEfKpnbkCviqooSV9fwPAWmJu9eJez9MlPuvVpy758HDPjZG30qHxNwAgsK4i5PtVvEeWvv6cd7kDhORoWeASU9vPKiNksqOqkr8+dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773365924; c=relaxed/simple;
	bh=GLob0u5xKuuLs0DGQuGN6+IFFGI/IP9n+ODAc1i9IQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sh8zPjJzmv2c3jeGJGuRl+i3XzdvvVI9CBqj9CHWFi5BwjE5zHgZ0LDjRonJlKJ8vNS/dnbuglWAsUv8Yg1eeSX9C9QW8SJJFMYdncmdOp1naFV4VPUfv/2ovqQW7Jgno3wIsIGFaqWAU/n9grlc137ANCSoILT3RS/rC2C4sRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gxGaIXB2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YiKRdOUV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gxGaIXB2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YiKRdOUV"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CHMDKf1922702
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Mar 2026 01:38:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rhgqpEm6QAvqoZ8IZ34kN0BV
	yk8S2ZnXkaehv1CjtBg=; b=gxGaIXB2Hm1Mhq52wg8eVm/kgVQZlWLd6/e9SxZJ
	JB2cUtjYX0bpN/46g+2GFSE8peRm/OY1q2kzrInVbHXH1byixb1clKWr5ZaEGllq
	tSMvWd6+M57FbVMI6fmVbWx8RDk3UHu3/9KeYTecIcSeT+Lg5vsawOJSi+4TJkvO
	v4xXj9QFaA6VkoxKttjx03HBLaL9BlY5yvqqhLweVREmJkOnb0lbSSJotjb6W4dp
	Xi5Kf8brKqT6mg+Af3ZRA3UBJ3yv/X28OpMkJH3ARG/84nRKM3RkGgy86F7ppf/D
	LUFRkuk9EkZxv+ms9x6gXFQbo7UO+Lfeq/CslvP4k8UKzQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4wv242-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Mar 2026 01:38:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd81be6f05so990874085a.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 Mar 2026 18:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773365921; x=1773970721; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rhgqpEm6QAvqoZ8IZ34kN0BVyk8S2ZnXkaehv1CjtBg=;
        b=YiKRdOUVmrGUbA+MxC+bmTWY1iWN5jdS+QfxPNTa/U0w0eDHkFbe3w2nlTGsh3lJ6X
         pTAT2dw49hAnI3oGjruy7kUJDB8QgvReMSfrDLVNcKgep7tff2cXpsZwOxt1vdj7dGSO
         3NP/Xyncn+/mwtcFdKR+L7C2uZhUyEKqX/6sUtotoiHb8h9OoQ+dY+d2QWeMhtLjQjSg
         w7DCl+FGSwnyYhSGcXplO6lt1/BbCR3F0IGcbPIaSNiqlOhXjPsbVgwCtDEfJ2QpgIbc
         UDPJlZS5cIH5/lkugpBPr0zeP+GmErapS/FRoD0BAknqJEHcelujptKuMpWJ8UMGHs0k
         BGaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773365921; x=1773970721;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rhgqpEm6QAvqoZ8IZ34kN0BVyk8S2ZnXkaehv1CjtBg=;
        b=LK/r+sjnx0zw7ZNl2zGNSsmZa5/UoBDEdJil+Vp1Oob12wvkdkfk/aI5UstkMp4a6u
         KQa41krosB0t3zt1tWj3LmTSDAyOuxWg3uU45Kzn9W0UhWTcs6GesF+mv4jGAq7aNhXH
         cWst8KrVy++IkrdW3EUoS8fSKmsBsTVP2N9g3AKH8yWjT+cPAkozs/182dA2VYBYMY1c
         2mK0qOb8vWXlwBOX3OJxc5UnbbfWPGV9x74+jZNMEH5d2iuIAS5S8eMfdd/sASpSScyZ
         wyrVglBOqQXytBBHuNKEz9UcXZ5V+lax3iowV99usg8W8qlRLD9Ykhqgk3/3LYp3EowJ
         UtyA==
X-Forwarded-Encrypted: i=1; AJvYcCWNAYLyl2x8pvxEUT953WA8gUPYoLd0Vj8lqXxCsUlSPplqzxZqBMe/Wyt67pahwNsP/fJiigF6zQIQ7oAzfGsP@vger.kernel.org
X-Gm-Message-State: AOJu0YxxLlch8HdyDI88NwLGAYCapUng4muJpyPA4P2OcnrZg1IfIX9j
	T6UvohwlVSKOFbMckptmrbkho3HVIX9UiysgCEs6qzLb+WFMHiLnRJlW/p/9nYCwBqj2AHLvKD7
	ELjcpqAwZmcIS/YQ8UxRowg3QyrJg96luRh8751UeZKxaitnG2K5zDln5VAZ4GxqxhzT5wsMG
X-Gm-Gg: ATEYQzyru2OMz/yL2OzkwWe8FDfgVqhBLqpBei0jn+nYqb73AApMiYECo7RsycyZ+o9
	KGbAmd3bCJZOBOWQ0nCUIZwid3WXqD5Wi/OcD062UFiShFP9cLTIO98RUBJYBtwvC1kjK4CsCfd
	my/kzqpreSNlyBVzw2NPgwry/8kYUXNcgEWCOSpuRLG1vEylHbIpSW6c/4+AJCzBMrlq2p5c5uy
	fyLP8JUZYX9DuZjohNGJddO/Tsot7wgB3ZCdbPVCT1/TRQZSY4LemAggyQgHEvHTWH+SbPoPx17
	Q708o1Nx2eHh8lQw4PiHhHAeA0aDhpOwJ7dg+Y4CqqutOE6k9HcxygasM9hAeYso94VuzgrlrRf
	PrJNTMH9wbF//Y7Q0kWYTiNVJ0k613/CU32wW7kgkN0sh4CcMPd9xOtFuRYJuw5dDUI69K2qUha
	uSBRqup4GoHPTcLQPZTSP6NVsaEXgbZsYVp2U=
X-Received: by 2002:a05:620a:40d3:b0:8cd:97a7:a343 with SMTP id af79cd13be357-8cdb5aa4d3bmr258276685a.36.1773365920954;
        Thu, 12 Mar 2026 18:38:40 -0700 (PDT)
X-Received: by 2002:a05:620a:40d3:b0:8cd:97a7:a343 with SMTP id af79cd13be357-8cdb5aa4d3bmr258275285a.36.1773365920508;
        Thu, 12 Mar 2026 18:38:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156034364sm1241907e87.40.2026.03.12.18.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 18:38:39 -0700 (PDT)
Date: Fri, 13 Mar 2026 03:38:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/7] dt-bindings: remoteproc: qcom: move interrupts
 and interrupt-names list out of pas-common
Message-ID: <i57ns2ythkhvizdceqks3zaojo73rrdbscjdat2fgeajwkuvyd@rqmvt5b4enyl>
References: <20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com>
 <20260310-knp-soccp-v4-2-0a91575e0e7e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310-knp-soccp-v4-2-0a91575e0e7e@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=GcoaXAXL c=1 sm=1 tr=0 ts=69b36aa2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=OrQAJtSTds5IMfG0T-4A:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: u4_aQU6wFMhZ2-heW8Vha0kgCKw7jxks
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDAxMiBTYWx0ZWRfXww/gDyOgfmJj
 jFfIC9xixx8ZgC6slJH+5D3XyL7VcdrOplsAZT7UGzaahWTuF7WOX+IH1+YmL2nl252TesQ0VjG
 mEazFKpLMtXMzSW/VmFUhFx9sr2XaIcyyMxvgHm2VWkofZsftJSxzkH42hcpOxeq4PWf7YKjDhO
 LYYYrj4tEs3Ufbauo6HO8zl854vmwAVt1D4DABUMkF0NCAcu6lw67jOmmtkKR3bHNTqiEqlbVjP
 YoyhqEGuEskWIlXt5O+9vPYLYvhC2Yw3eDVzr+bCMOC+cv5pvPcKMlPRSuC2tBHF5U+C1QZbSTs
 z+bmZ8ZiWwZLhe+tY7xe5quMRSjJIGpwZYCsxwHxgCNwdpgn8voyVW/uRp6dBG8BqPCdjarUQft
 znKukvRY4h0LO6kUVxUiwVzU77cx83HPHZ3+lJ5piKU2yq61adHOVchXnE3Ft86R5QVdCK4vsmh
 t1bKxuaaAYRBpChjDfQ==
X-Proofpoint-ORIG-GUID: u4_aQU6wFMhZ2-heW8Vha0kgCKw7jxks
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_03,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0 adultscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603130012

On Tue, Mar 10, 2026 at 03:03:18AM -0700, Jingyi Wang wrote:
> Move interrupts and interrupt-names list out of pas-common since they
> will be redefined differently for Kaanapali SoCCP.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/remoteproc/qcom,adsp.yaml    | 14 ++++++++++++--
>  .../bindings/remoteproc/qcom,milos-pas.yaml          | 18 ++++++++++++++----
>  .../bindings/remoteproc/qcom,pas-common.yaml         | 16 ++--------------
>  .../bindings/remoteproc/qcom,qcs404-pas.yaml         | 14 ++++++++++++--
>  .../bindings/remoteproc/qcom,sa8775p-pas.yaml        | 14 ++++++++++++--
>  .../bindings/remoteproc/qcom,sc7180-pas.yaml         | 20 ++++++++++++++++++++
>  .../bindings/remoteproc/qcom,sc8280xp-pas.yaml       | 20 ++++++++++++++++++++
>  .../bindings/remoteproc/qcom,sdx55-pas.yaml          | 16 ++++++++++++++--
>  .../bindings/remoteproc/qcom,sm6115-pas.yaml         | 20 ++++++++++++++++++++
>  .../bindings/remoteproc/qcom,sm6350-pas.yaml         | 20 ++++++++++++++++++++
>  .../bindings/remoteproc/qcom,sm6375-pas.yaml         | 20 ++++++++++++++++++++
>  .../bindings/remoteproc/qcom,sm8150-pas.yaml         | 20 ++++++++++++++++++++
>  .../bindings/remoteproc/qcom,sm8350-pas.yaml         | 20 ++++++++++++++++++++
>  .../bindings/remoteproc/qcom,sm8550-pas.yaml         | 20 ++++++++++++++++++++
>  14 files changed, 226 insertions(+), 26 deletions(-)
> 


> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
> index 66b455d0a8e3..cb0a61fc301d 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
> @@ -48,6 +48,26 @@ properties:
>      maxItems: 1
>      description: Firmware name for the Hexagon core
>  
> +  interrupts:
> +    minItems: 5

Initially I stumled upon this (and dropped a note in the other email
that I noticed a problem with the series). This minItems looked like the
underspecified property, buf after checking it seems that this schema is
written in a way that covers DSPs having both 5 and 6 interrupts.

So... most likely the schemas for DSPs might be reworked / optimized to
cover modems separately from the other DSPs, but it's a separate topic.
Let's settle on the SoCCP topic first.

> +    items:
> +      - description: Watchdog interrupt
> +      - description: Fatal interrupt
> +      - description: Ready interrupt
> +      - description: Handover interrupt
> +      - description: Stop acknowledge interrupt
> +      - description: Shutdown acknowledge interrupt
> +
> +  interrupt-names:
> +    minItems: 5
> +    items:
> +      - const: wdog
> +      - const: fatal
> +      - const: ready
> +      - const: handover
> +      - const: stop-ack
> +      - const: shutdown-ack
> +
>  required:
>    - compatible
>    - reg

-- 
With best wishes
Dmitry
