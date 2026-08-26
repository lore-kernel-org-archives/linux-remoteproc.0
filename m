Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9036137CD29
	for <linux-remoteproc@vger.kernel.org>; Wed, 26 Aug 2026 13:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787749482; cv=none; b=FQ2QGxLTDn10OzGIFpU10VATOS5gYV2ArRnI5Hahz1A7RHGrxq7NvOjnPqtspbUD6AQPhZzTRyc9Sck3DDjv1Jx6tU9VTHPzjAZngRLv3pGPK/by3GluWDxydcjzXMoGGkxUD2f9HsKOCvF4dTsbzqIQexAxsbBYubSup05IweY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787749482; c=relaxed/simple;
	bh=B/QVNW8c9Yt+HEi6DqXYIndWDMwJZmax5BegMSf9VVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gyfeDkeOapS8p37X9c6WxLoRO5F4gnTOEd8VdAiKy2/sr/eDqK5vdJZ5o90xvH1NSXbeb+5zEP0hiG/EZKOE9yU2PB2RDTXse3mZQnqq6of9+ZDwWLozkW1XCG+cI0EzOA0GaMcfT+Jy3I3KAl+BAmJEoVVp2mminY4pbfMox78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F5+EhYIC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PRjuWaCw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F5+EhYIC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PRjuWaCw"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QCC2FD768357
	for <linux-remoteproc@vger.kernel.org>; Wed, 26 Aug 2026 13:04:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0C0iLaZ2vQND+BywaHWsCvdfSggpZz0Wz6j9aE4SHDE=; b=F5+EhYICABiU+9Ff
	NQX58fKSxGoQO+rAIB0Mjg/415Dqh4JVJ1XzCvYQ8HFCQNngp0vjZr0vkFmaE1bg
	HAq5yB4EbLfpI/8mXzPzvnTrSsFlrKXqs2kLqg5bSCvfjSJqcqerltVEVT3J/8l9
	M108TQ4JLyIQLG6h8Jj0nMhQUYZEEmE3SqIu8i7YSFynnqryuil5mn7f6xOniS/r
	X3fcRpCM15tVMbKhz+xJIemEuARlP1qvGIFg2Roam2VPX75ImfB7wc3Xk/3jRnOe
	MM2cx+52Z0uBR1hH3g6iRMWg3YYeTr3r5+vSw/TKk3afLe6P+80HQbXkR/5mkNEf
	0+n6Vg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9x2n0mtu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 26 Aug 2026 13:04:39 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-977c5e92ec6so11505241.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 26 Aug 2026 06:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787749479; x=1788354279; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0C0iLaZ2vQND+BywaHWsCvdfSggpZz0Wz6j9aE4SHDE=;
        b=PRjuWaCw699Z+MT5Q1C2FgYghUl4tVdkBkpGwyR78A58SEy3ObwY6GXThjZc4u5/jS
         yLMXCRGekex7eSOl530G49+uNeH0jWp6OxSSV57WOAmXlb42aVaYgsy0A4PjFLrlFv/1
         pufPhsGj04rC9ZYqQwQKfHbkCZLSg7QhQ9lEYvD/Fn8UUhGlVxemKDPtEQanuImnTu8/
         1GzKH18k3F5IieE1Mr2QfIfquiV7REz28z6i6nJQdAiRQUU3A4irg0g2+t3clvoEZrNy
         xfMaKPb1vgIBnaTqwdhpO9fnDDQrWWVovEyThLmrohfeRyRIsSXtBH4UWH45LH0L5phG
         uGzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787749479; x=1788354279;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0C0iLaZ2vQND+BywaHWsCvdfSggpZz0Wz6j9aE4SHDE=;
        b=VNzpFzXUik2fCisgOLk02hWvJcqRpUlGJFV0qRlVUlH07WJ28hVYHAwABYvrBk0bLY
         WbPf8yLsHbNbwG7ziD3ywKTtEVGS4UZ/N/xNaKdxLoR6dzvNwFNSxbXiSzb8qgy2IKNZ
         jESbJGOxFQitXBbG9vrdNBLznrhGZ8pnLkDRaJ5jyrgqk3/N3wXX8RW0xV3jGt9hD+Rz
         rTSIu8jSI7d9CH6LMrIMz4xUjjsOh9RCvEAVbSfTngJiAsG9xARNJWvOIv7A3TS3qe4N
         ATAKCP58/0KTkakyNfA4wLa2+gTu3jY8QJFJxtn/xsA/Cpdt3Zo5UxnrloSpnlDMOhS5
         2v1w==
X-Forwarded-Encrypted: i=1; AHgh+Rqa+2RPgAISv2LaOkTwSvoahG/dFOCTi2aKEUV+PiPaa5NsmnrWvbOfd/SGtYIQae83sZVKF5mJ0SjJuk3j1I8T@vger.kernel.org
X-Gm-Message-State: AFuF++mjfpcVmGrquu3/jE/ajtBoKviU38Qjc7H065Upq70NgLkwQAQy
	H0SFjb5NwtDBpFH0tu9BI/DiCyG7f9Odsk/DQMzczNUmUWGIAWOc5hn5HzzmfYEWzQWEkw6j+3i
	FfJFmpHNP27pJkQejKvjvDPVobg7V66D5c3l+KxWvGtHnS2FckJzuRlEakXQdaWQ3GOZZCfdL
X-Gm-Gg: AR+sD11YYFekWgQh5lsHtN8y7i23zV6VyW2YJp6DJKi1mPYoudQB7z6kOjjZ3GNluD1
	1SzvAfN9zQGyvCC0bNJE2Ua92ThN2Co0GYgr5AOXqlZu5Tk/3yLhNHMAjVSbwC+Ots5uSoJ2RzG
	0HL6jAxVG6G85bwxTfEKTfUZA1U9zooGUc8VM7BilwRH7sUpdb03UM2c/mlNpJncFC6u/LiRio/
	xKrF05PMmUe0b+t4jlLbd4K6xU2/IFf7s+7WqX9GUVpD3ERl80CDTyWfq/FKf+VtjL5DUL7hiHd
	aCTtP+kGB0F//attqcCF8+0gIueZbIWCUGzJF3rODpouRn2OoPZJNYmzc4PIhZdxjfU+TkKt5zN
	RBfHRGhyfnbPDx7PI7yM1p0mL
X-Received: by 2002:a05:6122:2c2e:b0:5c1:24b6:a1e0 with SMTP id 71dfb90a1353d-5c66c6e06b4mr47948e0c.3.1787749478878;
        Wed, 26 Aug 2026 06:04:38 -0700 (PDT)
X-Received: by 2002:a05:6122:2c2e:b0:5c1:24b6:a1e0 with SMTP id 71dfb90a1353d-5c66c6e06b4mr47844e0c.3.1787749477474;
        Wed, 26 Aug 2026 06:04:37 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a5d671csm450856166b.3.2026.08.26.06.04.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 06:04:36 -0700 (PDT)
Message-ID: <6b2f4411-9c38-4b82-b605-6b9a047ab973@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 15:04:33 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] pmdomain: qcom: rpmhpd: Add NMXC power domain for
 Nord
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>, Ulf Hansson
 <ulfh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260826102746.633076-1-shengchao.guo@oss.qualcomm.com>
 <20260826102746.633076-3-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260826102746.633076-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: yovBtMHtZGA6VSXSpadPUD6svtP1_4Pi
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDEwOCBTYWx0ZWRfX727F+iS2IPYh
 YkOPug8FDMEdnqzNtaE7fRdEl5ci6CNMdQ3yOGKst3MIYAf4pzsV4/UiaZf28w/bEuKKlwUZlpf
 6Y5cO3dRyAXuULmI+pmoagMnz7nOLwI=
X-Proofpoint-GUID: yovBtMHtZGA6VSXSpadPUD6svtP1_4Pi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDEwOCBTYWx0ZWRfXxXHuk3E5f/h9
 uDyhPMlQx7lNeaIRX1/PW174acP0nnR96gyP7+LrPUPBeJopfaKmDr0tFeBc7k7WVe+k3xuUjuu
 iI5CBiDH+d/Ydb7jeO2TA1cDFwlU05Hgsl2JoLB4OOftj2uFBzkmvTMLFYl5v8MZ4DmsRcMS+WP
 qj2pp65+dSRxJCOHFdNjclSHeuMpV8NlvU12Dftew7TqSudHIpl5wMqsXEL9gA4OWLIsjzXYg48
 HT8ArvEvFrxan9CiYc6tpshwaytO0fz4r32wDs9lmmcXJJSBtOpRIsum6qvlpea1670f799MKVg
 /tVbX9Obqi3+W+9UXIixuOsLDXlyAfFzY6QtZeoES09TOdgtzhV3eFPpubUNGXfzNFZqcMVPbPY
 6c1BRxxcxRWMgQ5P+2asp4McGQOa6Vti1UIGdTHyNEXIZAxyDEFbhdItAJqZ0u5eR2si+1LAHM1
 WnpSpMyCtxzgHI28kBg==
X-Authority-Analysis: v=2.4 cv=PPQ/P/qC c=1 sm=1 tr=0 ts=6a8ee467 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=oFIQYVkMYUJ5M4t5nqgA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260108

On 8/26/26 12:27 PM, Shawn Guo wrote:
> From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
> 
> Add the nmxc.lvl RPMh resource and register it in the Nord power domain
> table. Nord supplies the NSP memory rail from this dedicated resource
> rather than from the shared MX rail, so consumers need it exposed as its
> own power domain.
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  drivers/pmdomain/qcom/rpmhpd.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
> index 96e4bd2f5a14..717c44d1c39a 100644
> --- a/drivers/pmdomain/qcom/rpmhpd.c
> +++ b/drivers/pmdomain/qcom/rpmhpd.c
> @@ -198,6 +198,11 @@ static struct rpmhpd mxc_ao = {
>  	.res_name = "mxc.lvl",
>  };
>  
> +static struct rpmhpd nmxc = {
> +	.pd = { .name = "nmxc", },
> +	.res_name = "nmxc.lvl",

The commandDB sources suggest this shouls be nspmxc.lvl instead..

Can you dump /sys/kernel/debug/cmd-db?

Konrad
