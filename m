Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9B83644C5
	for <linux-remoteproc@vger.kernel.org>; Mon,  9 Mar 2026 08:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773043269; cv=none; b=HnXF6u14BNeV/ruG1KAAFL8+nbWAANU7ZXnkNwDVZX0aVNO8J2zeoT6J0GRr/OCC1SzMZx0awro5ePAEZxsYPfs5hHRzfHb0q6HoVSA0hEQHMrQbz9zY86bDhNyzFrIYjnABwe9/mKBAuHAe7vBKbgpHNXa0Ku4ilRpBOkpdmCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773043269; c=relaxed/simple;
	bh=E9eJa2G/NHbwHL0+5aMxz06o3Kw/+hG967uBmsXtmkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QqK242J/dcIisZp9nTczp+vNnbIt6rQHSk+RG/5PRvXUChi/w2oLVDUQer3yd5e8G3GuLnTGEnMU+546AAMd93GGp6+Z2T2EltCk12AqwCm4j3FTm3kQnUdvVMUit6hf0G8YJLsIgWyyGOkqZm55kQa45qEHcMkRDKpQqWNrHcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fBqM2agY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DfPZD0/Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fBqM2agY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DfPZD0/Z"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6297JoTY1733749
	for <linux-remoteproc@vger.kernel.org>; Mon, 9 Mar 2026 08:01:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VBEckW3xv13OohSMW4r0y6KB
	wFyjlc1mZ8nZQwd5Ao0=; b=fBqM2agYzt+n4d3X1D7B5eavas0pkwvoEYXEBgBx
	PhY0fDezmxs/vQ5cXjllglrAifQVRxJ6pK0HC4xsWnoHamqTvCyNrRWCatpIJMGN
	/m71aqNhgh83HPv9CQZyy77jEKjGuRGVaVU0qvFugWXS9OFz92feZY0xu4cyf0MJ
	6x8WA68ENoipfcYB8MpC3tMdLskCZ3HpLX88fOARF+Nsas4tzyNEhENu1x9PZShj
	uwmIhk6bYzexLECrE6BrSChso8w4R+29BWhltyJ7A6BhwxfwcP2chShhGJuz9YIP
	LvuMQM/LGlo7XwC8AzaUdtTXkoqRl2wRPiUezROh/71cHQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crda9c9n9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 09 Mar 2026 08:01:07 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-358f058973fso11163456a91.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 09 Mar 2026 01:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773043266; x=1773648066; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VBEckW3xv13OohSMW4r0y6KBwFyjlc1mZ8nZQwd5Ao0=;
        b=DfPZD0/ZnWKOlWJR8qJUYs/m9abJa3BU+CaX6SypJEehbawumoLBiCxaOtvhLK76La
         hLZI9fLxMqm8yqnIJMLMTr1L8lU++88VabrcI2aUxnIAJyFVaQIm/FUwIVnXZTuzseqM
         l4RIdA9LGBLUskves4kuzjhTREl5pwBsVHGPbRq0oOC3qoTG5mIpnVfvmzMkuHI8R5hh
         gtOL6F9vRz1r2suzypMXR3h/xcTIPotVZv0t92W2hA1Yu4WIhgsmkBEM3DEIKrsZrDPw
         iFgNj5AxdufxikkBUBQFsFRfGtguFjW7P1gzFAO0JhuEX06pjf8gVyc8dw4zlzalym0b
         5+9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773043266; x=1773648066;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VBEckW3xv13OohSMW4r0y6KBwFyjlc1mZ8nZQwd5Ao0=;
        b=DbD1krOHh/p9lvP25jB8DD1GeBsQYCPiOGa1RgXrACZeIaChp54+HzOG7tsVFCxRGE
         IVdi5kl5cPpF+yysq4a55L5xMre2RhYlGMdRfFmshFWVezHV89kP8J/SsTPkMJaBwVC5
         oW86yNKkTA4kGts9HoncmSAZCnc64tool2vInCtyy/rbclo25XQEvMJWduCQhkgGOSJn
         NZZSomWZ+P3lekx14Jkmtr9cbnwOWNhS3jXbLwO6tC+rHql2iRWxJDSTNuWKAasBEaFl
         RcZgMi340QM+vV1LWi89Z9WXmMgieCke/iFRB6ZvMdaSJjG4Zi33XrvE3Gx7cgOKYFVq
         g0Ag==
X-Forwarded-Encrypted: i=1; AJvYcCWTo/4UaPagNWlEfh0PpjqEOhBwBlugi5wP3DT7AU6cpL53d4/Rzr/KCSMP4dsNEW4hAzL5nzYQ/8gFffEnEJrc@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl+ZvwbP7JGwRd4+frNGOgW4RvMnCJvYLnJZ3gtgaMkTTc502F
	N0pbSim+JeTUF9QDX+C58gBH84kNumb178XWuX4MKBh7r73MUTreIpPNbWAtX5EDyEmUlH0XwCL
	wtiQrmqmSgki27IeD9TNTbabGdYRHrP8qRiR5SAfQE1du+3LMBqM+xCCilUox6o6r6HxgsdMh
X-Gm-Gg: ATEYQzwTkX4AQXQKRb0l+mB9E61jYZRXdPZtKwKK7LR+TrdoVL0SZsteQ0UMRcMaXku
	kBSkyfwJsx0DSnrTAkQdtGTjkSiQ7woBTHjnAfI8ux/2bbZjh/CGQ9/HjRoyzkF5gS+KiY+jxna
	LJqIjZkWmn+2AJWHcKFf7z6YPFp3TgIwwB3NctzGmylI4i8N+qt3m4YT5DJg3XFax9k7ce/HSg8
	1AGhwtdsOhV9v10BOoNIvDb3BVq92041TJiumc2cF7+VJJst7eVkZ5bNP2jdih6WLPsMtasnz+r
	AeqhgOoAfsWs6t9DB6XgappxyG7kvhgs9HMJXiiFgDMjbh6+G1OV6MxpwJdRE4Dkna0ogoRlCGg
	lZD999F1QVQyN+yDyHYN+ZKaox6PmpLKSsoM8+spATknvBFs0
X-Received: by 2002:a17:90b:3e45:b0:354:9b3f:710b with SMTP id 98e67ed59e1d1-359be32bc30mr8869537a91.19.1773043266114;
        Mon, 09 Mar 2026 01:01:06 -0700 (PDT)
X-Received: by 2002:a17:90b:3e45:b0:354:9b3f:710b with SMTP id 98e67ed59e1d1-359be32bc30mr8869490a91.19.1773043265451;
        Mon, 09 Mar 2026 01:01:05 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359bca24e8csm5146555a91.5.2026.03.09.01.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 01:01:05 -0700 (PDT)
Date: Mon, 9 Mar 2026 13:30:49 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
        elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        jjohnson@kernel.org, mathieu.poirier@linaro.org,
        trilokkumar.soni@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
        jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH 01/14] arm64: dts: qcom: kodiak: Add EL2 overlay
Message-ID: <20260309080049.si3vzro4z6qn7ewz@hu-mojha-hyd.qualcomm.com>
References: <20260306105027.290375-1-sumit.garg@kernel.org>
 <20260306105027.290375-2-sumit.garg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306105027.290375-2-sumit.garg@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA3MyBTYWx0ZWRfX5a862s6ZRXqF
 nbSiyYmlAdlKHphlh4hChoqbyPzRhoQ5xiyv4+CJaWzBgpouDu72qsoDKa9u00OcyLOCnjr9Wfy
 9AeGsdX4RvJnZRqiuhpzJudJmDleUdqa4clZTiWw/xAL7bv14JACx71o7DqHrj2T+75dxMWbUTQ
 n+kq/t9yb6qgeC0QrgBFR9rnhb7gFGMGUKb0I1bzlvRczkH+BtRmXvbRVlnl99jQkMKmYVx7dKv
 pe2Ko9c51Eqmn3YbYq6c89SxyckWw+KLSjFOcoem2mdO5rheBGh1eptEPVJzWkFqGNeXxi0+idP
 6Kq628FsDBCy/tyaKvJ5x/kQOyf5QWbTv97Yu+jgJ+jt4Y1JoO54IXn1g86c3cjsPyt/MJ3F77W
 KJeiyAiPST8JuCJsQ36dGmwn2l1VQSGzLc+ZmuHuzYrD19Bpp7LFwT9TguMHHU7ONqEURayQAN1
 eUaLDr4W2cogqMOJjXA==
X-Proofpoint-ORIG-GUID: y0sr7rQb0Pi7V3opElfY1lBnA7w6FGlD
X-Authority-Analysis: v=2.4 cv=QZtrf8bv c=1 sm=1 tr=0 ts=69ae7e43 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=nF3oTVP-35wgLgZXltcA:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: y0sr7rQb0Pi7V3opElfY1lBnA7w6FGlD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_02,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090073

On Fri, Mar 06, 2026 at 04:20:14PM +0530, Sumit Garg wrote:
> From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> All the existing variants Kodiak boards are using Gunyah hypervisor
> which means that, so far, Linux-based OS could only boot in EL1 on those
> devices.  However, it is possible for us to boot Linux at EL2 on these
> devices [1].
> 
> When running under Gunyah, the remote processor firmware IOMMU
> streams are controlled by Gunyah. However, without Gunyah, the IOMMU is
> managed by the consumer of this DeviceTree. Therefore, describe the
> firmware streams for each remote processor.
> 
> Add a EL2-specific DT overlay and apply it to Kodiak IOT variant
> devices to create -el2.dtb for each of them alongside "normal" dtb.
> 
> [1]
> https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-4/boot-developer-touchpoints.html#uefi
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> [SG: watchdog fixup]
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

Thanks for posting, I was about to add kodiak to the already existing
list monaco, talos here
https://lore.kernel.org/lkml/20260127-talos-el2-overlay-v2-0-b6a2266532c4@oss.qualcomm.com/

but did you really miss linux-kernel@vger.kernel.org or is it
intentional ?

-Mukesh

> ---
>  arch/arm64/boot/dts/qcom/Makefile        |  2 ++
>  arch/arm64/boot/dts/qcom/kodiak-el2.dtso | 35 ++++++++++++++++++++++++
>  2 files changed, 37 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/kodiak-el2.dtso
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index f80b5d9cf1e8..09a7f943190e 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -139,6 +139,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs615-ride.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-radxa-dragon-q6a.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
> +qcs6490-rb3gen2-el2-dtbs := qcs6490-rb3gen2.dtb kodiak-el2.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-el2.dtb
>  
>  qcs6490-rb3gen2-vision-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-vision-mezzanine.dtbo
>  qcs6490-rb3gen2-industrial-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-industrial-mezzanine.dtbo
> diff --git a/arch/arm64/boot/dts/qcom/kodiak-el2.dtso b/arch/arm64/boot/dts/qcom/kodiak-el2.dtso
> new file mode 100644
> index 000000000000..0b3a69a0d765
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/kodiak-el2.dtso
> @@ -0,0 +1,35 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + *
> + * Kodiak specific modifications required to boot in EL2.
> + */
> +
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&gpu_zap_shader {
> +	status = "disabled";
> +};
> +
> +&remoteproc_adsp {
> +	iommus = <&apps_smmu 0x1800 0x0>;
> +};
> +
> +&remoteproc_cdsp {
> +	iommus = <&apps_smmu 0x11a0 0x0400>;
> +};
> +
> +&remoteproc_wpss {
> +	iommus = <&apps_smmu 0x1c03 0x1>,
> +		 <&apps_smmu 0x1c83 0x1>;
> +};
> +
> +&venus {
> +	status = "disabled";
> +};
> +
> +&watchdog {
> +	status = "okay";
> +};
> -- 
> 2.51.0
> 

-- 
-Mukesh Ojha
