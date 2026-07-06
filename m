Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE8D3AEF57
	for <linux-remoteproc@vger.kernel.org>; Mon,  6 Jul 2026 04:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783313760; cv=none; b=OF+F2U0cpp2rkJ9o8cjxnqmIfxyTaU62zcs9/I3Uud8ujnty8oQEsNPzktCpUwn436C3voNH1SnKcwW/sS1Ge+TzdW18TNO/reVYFQEFHJVSuMo91m3NnwgEN3+mhjgFnHPLo06yjTOTg2Co6VW9s7LET5QjEhZJ695r+fBx43c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783313760; c=relaxed/simple;
	bh=YmgsfoXmP3wicea3p38VOglMuty4QAN7Ko28KEOX1Hc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AoEyRWl3rrL2Jt8ApxbIE71BtFW3i7NFNvOgErUJ21Rzh6eXqQwa1igojY/PfwfMc/Oc8rtBqoOMO8TgHlF+ZCXAtJFp/MaoHkie7R3gFDIYD+RtfR66CO/oaaUTLap+ya816GFDS0fhD5/Rv8RDjpChDyyLgMAXpIuIGhdpdvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BtuYZphI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z3Jr5zap; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BtuYZphI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z3Jr5zap"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641V7w3438152
	for <linux-remoteproc@vger.kernel.org>; Mon, 6 Jul 2026 04:55:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JvLKKEyLLlv8tWw8qJtzyelBHieDthun419uycWn1Dc=; b=BtuYZphIK7UnAPPa
	qYGHPuM+VD3C6WvezTLdqIjiYVGHLzNLv6RSapQqEJ2excDEyUkD/0AEcWQjp5ej
	4HI3bMiV8UCRYHw/YXMP72BUtTB2CANb5/xl2wJKaV5lc87Ax6wEFDsEhbUsTXur
	RNx2Hm91I1sPL4Fp17l4JFxQuB37ZPnouzzUHhLqbWpMJkm6xOuGNEQuSB8vkr4v
	iHs+mInjL3lcrCXDe3aaUW3MnfspbyT4APEA3ecMXRsbeK03HAVvm7fbyNR3ckpu
	4lDTqZIfECL8APV6bvyHqU87nPrqklBdw7zS2B0zT/os5ltI50S9QbhC5yDZwUWY
	z7D7UA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6tj8mc87-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 06 Jul 2026 04:55:57 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-381250979d5so2292812a91.0
        for <linux-remoteproc@vger.kernel.org>; Sun, 05 Jul 2026 21:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783313756; x=1783918556; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JvLKKEyLLlv8tWw8qJtzyelBHieDthun419uycWn1Dc=;
        b=Z3Jr5zap9lUWE5NcKmoo9cq4VyYd8OfMJGVQ6b4AKiCEBOMaj87jG60tHh+PoJe8zn
         Nx8ZhE9BKLjIcVtnjd3NzKx5w1mutKKi3zTqyOYyg8ICK2g1jmoefVbycgr3tmk9H52N
         kXxEAYauB1ur/Gpn1QujPW4nmKf8HSlqLi2eYH0Gypm76IOueG94Oj57ecdMJqSBmwjO
         qx3Kf+rydvZdq4PIXZqotXQc7paiAki1F1wUbnFuaUEYZS5b6RS5letdZKyVFgu5RA9Y
         FV8jSmCzURwxVusAJCv4/HNWsKhhgQjNktQG3QrTiH0PV1JuPBsAg8/ZazyRiFkh9NoQ
         dAYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783313756; x=1783918556;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JvLKKEyLLlv8tWw8qJtzyelBHieDthun419uycWn1Dc=;
        b=YCOndbDP2kH0DdOhO5xBU93CA324u6rtpqV/Oiv98n7jIUIzyiMq80HU8UryyKaPHs
         InlZuBi+6RcIWFSe+NjeI9jRCbWiMqkIewBZJ52eNi9AXsES+DYYk1JkDfSIywBdieYz
         MbAf8UrFAfUg3MD3A3JiVBWXe1nRrW6HlEaTlKuNvCCcswZfDVgrWlBjqmoGtx86bqwy
         PLvW5JQaQHrOaBW84NLWcOk/vU/MI24Z2JcIHrluUBwVPNkeobUBCoNbRh4JwnM59Rfw
         5qphd2QRLbSiYcbapOnkbXH/uqe1ra++InRujWInQNmgGgU5VDk3cu5U/Gg+yEIApxPL
         fvGA==
X-Forwarded-Encrypted: i=1; AHgh+RrWy5ki2Rtbj+5VAAQ2WHCGhVXUlyYC+KYAdRdk+mXxiOPonHK0W1Ig/FAfZXbJ9YSUefVFm7GVhX2g1+AzTg14@vger.kernel.org
X-Gm-Message-State: AOJu0YwYVhDf9QGnfwbqzt4NNQwFA2cBpxF4Cr5kNNM53ZsYUJSyhBGN
	2db67hzOdmPMlq8T7s/EamdFfbilCzIuLewujwMdBw8hv45Qk/uxVUzlDPeQv5pZK12N+d9q58Q
	179FfASYxqs/UAO9Rozk7DIxAODJsO/Q3eqJ9TjUb1isXeBKfAHo3OJ3SV2RYmaonro9QS3w+
X-Gm-Gg: AfdE7ck8XF1D2zeTuadlOezmRc9BrwI1M8LCr1mSEAxp/NwusIB0L02h+AeCKdh4gG0
	Kd8wKqmGhOGuyrtVQmZzKcH0Wd/FuJFsrXDxnltOEBnttt47QYcfZqvxkaBVIqlnuzR4RKNkV68
	lvyBJPvMQsY6J6uPHYoBN6w5UZ/30MdFMtYLRkgGUyxndCCXrFuT0H4XohCPP06Nhhwli+IwKS+
	4pAkKwpluY7y8jJN6alF2HJqQ5VOgrfDHQzbCpzCNF0IONXCk1vALxj4aMyEawFTjerRprUlRIM
	wKLdNI2uvrPduRk91rLhxSiYJaLjPXhMnn7mpKcr9mavmQRl4l6O3Qwr4bnxt/8dGfDKjsricYj
	gRU/iHCq94uhLBwF0iTdbv8nSr1EXuy3jYZAjfQz/
X-Received: by 2002:a17:90b:35cf:b0:381:9b7b:35e5 with SMTP id 98e67ed59e1d1-382800d1a6emr8328721a91.4.1783313756492;
        Sun, 05 Jul 2026 21:55:56 -0700 (PDT)
X-Received: by 2002:a17:90b:35cf:b0:381:9b7b:35e5 with SMTP id 98e67ed59e1d1-382800d1a6emr8328696a91.4.1783313755987;
        Sun, 05 Jul 2026 21:55:55 -0700 (PDT)
Received: from [10.204.78.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3114fe08b1bsm12946548eec.26.2026.07.05.21.55.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 21:55:55 -0700 (PDT)
Message-ID: <95e8281c-91e9-4444-8b83-ea87243122c9@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:25:47 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 40/42] misc: fastrpc: Use
 devm_of_reserved_mem_device_init()
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-mmc@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        sound-open-firmware@alsa-project.org,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
 <20260705194019.2565498-8-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20260705194019.2565498-8-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA0NSBTYWx0ZWRfX/4TitC2/tmD7
 Zq2gu4LzQr8+SYBW47f7vaRXz+EO70XWTHhXU8gcFN6gbBsql0I8O0kBBUOu8Zn3dsP1w9hoqG9
 JVicIc6wq0KAbWQ1k0fg45w66A3udm/LuPcSpZIyDLWgh7OZ9CtKRhdgan+O2U/sAMwODWqmhSg
 C02SL1L+54kqBkLEA5pXgBoKKjf1t4ZVnREm7+Q7TAD+nXYzaYQ+PY445CYY7jOTtZ57SmNNMN4
 QXntx4ZAnDGX0y2fMTBUUOoSJucwbSc5OJHxN7QhySMjC+CmWra2Sb78jiOzuz8Az3Ch931Bizf
 vDax0YvaseKrRxkz9MN/JA4wMZwfAJUjyta4FdBvJUd38ZdbSfJz8v1yxOKiIglz6ARBzl2AOaU
 vISg9La4fL+bw+HJ/59J61nyhoUPO766raYO/i/ozOrMkgnyxE12l1KSP5ggLxAra826GGMlClG
 Xz+BEY2sF433NYVf1iw==
X-Proofpoint-ORIG-GUID: wH_Ie2ozrddOAWxauvVHgmBSUhqhpDiQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA0NSBTYWx0ZWRfX9hhLC8FoVhZi
 HcyF5Xw0sfpsJ5ADzECRdpB5r0P7LQfycMAO6mpztetB3yKpOrCZMDXJEoGgO6cmFXtFY3N4MFl
 VaY1cbElQWqJPoIpUebyGp0+fFS5LRQ=
X-Proofpoint-GUID: wH_Ie2ozrddOAWxauvVHgmBSUhqhpDiQ
X-Authority-Analysis: v=2.4 cv=H6TrBeYi c=1 sm=1 tr=0 ts=6a4b355d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ee02QKOXNWxg8IJ2rEsA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1011 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060045

On 06-07-2026 01:10, Mukesh Ojha wrote:
> Use the devres-managed devm_of_reserved_mem_device_init() to ensure
> the reserved memory region is released on device removal, fixing a
> missing of_reserved_mem_device_release() in fastrpc_rpmsg_remove().
nit: I see this change is also fixing fastrpc_rpmsg_probe() early
failure leaks as well as -EPROBE_DEFER retry paths which could be added
to the commit message.

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index d86e79134c68..c4e05b0db527 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -2396,7 +2396,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  		return -EINVAL;
>  	}
>  
> -	if (of_reserved_mem_device_init_by_idx(rdev, rdev->of_node, 0))
> +	if (devm_of_reserved_mem_device_init(rdev))
>  		dev_info(rdev, "no reserved DMA memory for FASTRPC\n");
>  
>  	vmcount = of_property_read_variable_u32_array(rdev->of_node,

