Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323FC1F2B88
	for <linux-remoteproc@vger.kernel.org>; Thu, 11 Dec 2025 06:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765434060; cv=none; b=OdTpgdHk6oOawzT+5Oazc03nLe9v67CTSYGcl9hR8+boNHIoKqcm6XeL7/evZdfW6ExdA9xBVlZiDQoFWsQlayhXPQTArnnyaishZMubeHKQXM8oUOtCe6oceJBoNWpR+FjTcmQleGBEvEoW0K68137sgnsBOPAGImH7d8EN74Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765434060; c=relaxed/simple;
	bh=mdWvByNAhC0SjDpLoND+534giav7RCsuMpNHmtWgixo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qkL9vV7dFmcc4f4tpJPX8bku573ETMzLa4D4wNpdeTXq3SO2fs8qDCsbaANU51KMJuRcAYELo9ubuhtla5o2hLgflIR4CiwH6Ln5E4GkxsCJKjh5JjFW4Qzog9X+MhBsUkR5i+cUIcuaMNS2UpBM6nX9mmJ0PMMMzrFeLE5P9aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DNueAxJB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gG5R/Rsh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DNueAxJB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gG5R/Rsh"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BALP2c9097636
	for <linux-remoteproc@vger.kernel.org>; Thu, 11 Dec 2025 06:20:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TLW8nRjZcblQM+p+/5/nc7lgZe6nsGTj+I19/7BCO5M=; b=DNueAxJBjjaXcSGM
	JO+03Bj20iK1DEm77+O1eRsdpUsm9+BR+6mB6ygFdj0DzLv1LQbqCGBf2lqYXWHs
	bLlY33N5PZdwIChhSLngOPpnTmIxs5d1pWxhIOZM0Wk/JaKLFFhApRg2Bx78XPPC
	WYJT3xCfVQHyjlU5SajnahfStUyznFQ5BNegpHVoUeRpDLAG4VWs8n8mp0KggyK3
	73d5VNxRHZNATCFTm68xvQB3ovJMXwY2VxyDh3Upgpt38TE+XhglEmx3JyboHkxA
	qhKoMN35MKdilEqIp9FBVG+2dqfdJkDc1Um6Vo98ljeK2gu+LG93nikiR0oBmjq+
	NYkYGA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ayes1hjf7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 11 Dec 2025 06:20:57 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-349aadb8ab9so1245661a91.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 10 Dec 2025 22:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765434056; x=1766038856; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TLW8nRjZcblQM+p+/5/nc7lgZe6nsGTj+I19/7BCO5M=;
        b=gG5R/RshiPHabw74RPw4U/7rUl3E+tewMadkY2NNhQ/HA6WR0uROvJDuauwD+Wijkz
         BlyQwdf8NPXJ65LrPeyB7P5XuWeIlx+CqHW7j7hD2V7tS/rktp6nXdzPJ12cUxelGyof
         57Ho3DxY72T2ANS7cLYQmH7HQAj1OUonlX0WYtiU6aU2GdeZWETPkLarx4QGv3HgJQXf
         xQzQMgqVnMAtmMXfA8XmbwNBkZf9dPvH6d9MnKsHkiYkJxTFeJqxW0/Bo5HtjSoQGF+G
         Hq7Ca1g7yYMtO9XTF4LmQ9u9wSX+ndGyPNIDUVgQ0LdIt4PE4QHYfKgllqVSpRUgxG+0
         6isQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765434056; x=1766038856;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TLW8nRjZcblQM+p+/5/nc7lgZe6nsGTj+I19/7BCO5M=;
        b=StZk68kW2WUiD//qnaAUnJP24Q8Ez3QZE2gzjgXexRKdXvss8FCwQ3A6ha+VyZpZPz
         iotpXuRLG1H9dm5xvRxchktPrl1vcux/6f43JTb8rsqJ2Oxtri4rGpDPLNVp60EnNsaF
         5UFtgpwO8yUIhOuo0S9NmA1JLjdDabWJkSs+8BOStPWzlFj9nJ4BQPX5kypNJqiYbvJs
         2eRZLLGmF5bhteNlqxpt2MCAXD6k6JqiYOn6zCZzQAHhDmTHdUIo35oBYgbLjDemApLA
         EpNK0RynjuZFVTRPVxeRDm1QAj7iky+GtGoEeZ1FJ6JVGcmcSRBxbDOMYHJ0Di972bOD
         nlqg==
X-Forwarded-Encrypted: i=1; AJvYcCUHXp98344ULixeRfkqGFTvDIT6LbYfcrJB48lUTrh3b2V4orrZtYt9HHDZkCXOiW2P7xGJ2BTtC/jsBncGJ5+h@vger.kernel.org
X-Gm-Message-State: AOJu0YzCd9xcK0sqcXpoaTigmYfD18RNRJgI1JtsaoscLlw3BrhAu/QT
	GePJZ8vKSqSBe192w1OvCjiEx8sE9eb6IkFRZZyaXlDW8BmWkbL8t0SZ5HE3SsmOgQCWv80o8lT
	oozUHTZA7FW05VgDUc4e2S2Q306sW5pvuE45mLj4X+/bDUT79vJbLGmOxkobW+lBDkjrgIXYpio
	2PGKt4isw=
X-Gm-Gg: AY/fxX6BsAgru2uedJSPqsvW2wn5KtF6Jek9WvrPxJF++0EF8xk1FQTgc8tLy59sMD8
	5kHuw4FOEAwgV/cAWMDTSVVWdgBN+FaEtYu6l3bv8X28HPQ9pw977Ybiy5Wuh5EflbOkSKdy0Et
	hyUcDhs8aw45F9lFHf35GGPP3fSuub4KfYPT/L8DKuy+SzEFOxvQD/HUzLc6VNDngoZuK7Vgq7a
	IK2Sydr6XBT74cu1zETzYR+6KaugPQe/lB2PYYmXFtlcl0zU7a4PXjaO1HrRvQZhAgMdtRJZpW+
	drrtrPALnAjLNjgfogGBT3ZTPeo8gqE1DxCXJpcHpV8ImKMz5ALYCOJhU6H4Y/gFBEjMZEMRmL9
	i7ojURCUMEVuCGUxuUh8oTJi+vbZIM91LuxBE0g==
X-Received: by 2002:a17:90b:3808:b0:33e:2d0f:479b with SMTP id 98e67ed59e1d1-34a72808e70mr5353604a91.6.1765434056159;
        Wed, 10 Dec 2025 22:20:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6+rtMSx1jj4c1CLS4mg+VkC/MYsYdnUQDFMI59fT7NRENzX5kAbQlIUO3MPVG5cnDe3Y+Bw==
X-Received: by 2002:a17:90b:3808:b0:33e:2d0f:479b with SMTP id 98e67ed59e1d1-34a72808e70mr5353568a91.6.1765434055674;
        Wed, 10 Dec 2025 22:20:55 -0800 (PST)
Received: from [10.239.133.66] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a926b1a88sm342683a91.2.2025.12.10.22.20.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Dec 2025 22:20:55 -0800 (PST)
Message-ID: <12888de0-1475-46a7-a594-bf7166227eee@oss.qualcomm.com>
Date: Thu, 11 Dec 2025 14:20:48 +0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: imx_rproc: Use strstarts for "rsc-table"
 check
To: Shenwei Wang <shenwei.wang@nxp.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Shawn Guo
 <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-remoteproc@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-imx@nxp.com,
        zhongqiu.han@oss.qualcomm.com
References: <20251208233302.684139-1-shenwei.wang@nxp.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20251208233302.684139-1-shenwei.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: T0YwJr3CdkBFY41-DOcmX8a9MmEDyQZy
X-Authority-Analysis: v=2.4 cv=KqBAGGWN c=1 sm=1 tr=0 ts=693a62c9 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8
 a=2dfgorC2ZuphLwAT5hIA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: T0YwJr3CdkBFY41-DOcmX8a9MmEDyQZy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA0NCBTYWx0ZWRfXyaX7IAjQ+U9D
 jmw/vI4Vbz0XELiVCUoAcHEZQzHTA2rbSvaktcRYDgFcYkOpRmJ7bomMaI7YUanCXlyyvlyaZ9Z
 zfw+HFHTf186K3W5S3V6q/g7a97lPyXTpncSsRQmBQgqVZDxEbEf6cYNKQImxrJ9DBYnjBAnHq/
 pP+HiEjh9JkCmw6u+dF7/TBwCpVtb6TBWmNJ6bs57IHbYa0he6n1aimDTbWXX3WefX8LU6WO6E4
 jx6PxzjsOluNPJU0c2XL62LZCb5r6yyzSEXYYwvg221OlwF9oftwdth27pva3T5nQoK/VdjR3qx
 JF2xo64uRa6+A4/qH6j6Gg0NmAqDzkkxj3lusSmRj82PVBFI5woK7QjHGVJ/SMxEZjLXilMzqNb
 TWPahz/n8Cv63g0P1eFbKuYkjlwIlg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110044

On 12/9/2025 7:33 AM, Shenwei Wang wrote:
> The resource name may include an address suffix, for example:
> rsc-table@1fff8000.
> 
> To handle such cases, use strstarts() instead of strcmp() when checking
> for "rsc-table".
> 
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>

Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>

> ---
>   drivers/remoteproc/imx_rproc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 3be8790c14a2..33f21ab24c92 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -694,7 +694,7 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
>   		}
>   		priv->mem[b].sys_addr = res.start;
>   		priv->mem[b].size = resource_size(&res);
> -		if (!strcmp(res.name, "rsc-table"))
> +		if (strstarts(res.name, "rsc-table"))
>   			priv->rsc_table = priv->mem[b].cpu_addr;
>   		b++;
>   	}


-- 
Thx and BRs,
Zhongqiu Han
