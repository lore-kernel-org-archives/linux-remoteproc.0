Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6013840B6E2
	for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jun 2026 12:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782823292; cv=none; b=KJY6NAGTXHHTm+tM4mFeRXFpVtBfUJ4oNOMTHibI3q4xpDYU3Mhq7+ErUQ68FOJQc3eNZCpgoFQl4DatzxQ81gIb2YUU88MzPeq+Uw3w/IOwugZiILdncZSmg+L54BeV9bzTGRyWxh+D6x2kWO98MRLvQ9WglmcFXwQPvA0jaUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782823292; c=relaxed/simple;
	bh=jQD23j2vf2XXCyCGAPYr1v149ZU5HdPGAyLFjjrpeEU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bCO7W/Mp0Gajna0F2rtBesFuWFb12RXbPpoo1SBw7u2gKscI1lD9zV0YCQGwW8vAMpZPP02V7T9q5iAk7KVdGB0u4qhv8xqvfAc50PY/oca78x8uU7pttCYJiGl9LEwynxlWqaRQVZNZKZ0ev7qB5LDZf+ildpx5s9ApIe9Avxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PZsvIHOw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D3Wa7LOv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PZsvIHOw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D3Wa7LOv"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mvwT1604618
	for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jun 2026 12:41:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	81yQnZbApfVfIiH8t8XJoiy0NXKJCRUaF/krfaGmans=; b=PZsvIHOwGcpw1Si8
	mjM5tSeCEW73QMW3pin7A9aNwjptzuikOdaZziRc9EWb+Lwj8nI/lcJb7cE6za6h
	cLx9tEcWyKYljPLsaJkqt1rhRwJpacz3La/f77wc05T8v2A9GTcBWr9dJtX341vN
	bUqEp5fLEOESTWBWc8CY8zeqUKgJqBiaG9dsmhBfd0CJHqYaEq/2IrW/rwR53imk
	STlC6MpL8J2CK4lIgUtWLqlG8+r4dS8XU1CHJMlU1ZY7OU5Cvf5uHI9dn6uDylJI
	C/7DwbOC/0Viob79NGAGUiYF4EqwK0c1g1SpktXNREopXQ82rQFYORYlJIwhpBe2
	jS7SEA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f462fj84r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jun 2026 12:41:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e5a63e1f2so23645285a.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jun 2026 05:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782823287; x=1783428087; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=81yQnZbApfVfIiH8t8XJoiy0NXKJCRUaF/krfaGmans=;
        b=D3Wa7LOvjmBkJYavabaQ8mgETBvsgtzdjDsT8a0wu3B1DVlxP6GsCBP86KZexY2F5E
         SxZ7n5cm65Yo3im82xyheP0ZErTuL3Bgh7kp9VHOY6hGWsccqju433wAbVqqFaWqGT0O
         f53oYiW9dPLcEoKjLBHePv5icI79W9fvAr2Ym20jl+4T0NDWIPCntfG8owBgfkrnSb+S
         6XAX+OL4H6V4fOKAhTTZXtLgF9t6gJEkFeTOHxL6hdC+M1bnU8SiilHRb/hhoSBdWt5f
         KdMsB1cV0HKvwYpyNdBsIy+PTD+SObCmxTPmI6T74QPdRSqG06bH9wEOUz6Gpo0SK2Kz
         JO5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782823287; x=1783428087;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=81yQnZbApfVfIiH8t8XJoiy0NXKJCRUaF/krfaGmans=;
        b=k+ZqR6g5pkm/32Qu/Jc5Yp8X7/Gp/k5D5Qgk364Zp4oZfpU/rLvhV/frMl/vN7Xyiq
         IpFXPAiz239P3pqw2OyX4+t0CzSJ27inyM6lf7XlRKExitb1uMTJCezPiingT0/F7FXL
         BBigQ+nUCZDtdVv2JS6SFD1SWsH05gqMiShy2OHmI2BTO/PxNxuRz+0E93aCwh8reIT2
         Cgiv+hd4lodf0ibaDFU2S95JKLuDiywzTT++YCJve27iuqYKZJtkKnpmIPiNSD8HMDes
         7EvogKhekGDi1xGhla8xGDViQyiuaHk3dwFZdXbZtwz4lxJvKnpbhETyLBzY1hyM0wku
         zrlA==
X-Forwarded-Encrypted: i=1; AFNElJ+IKUNd2yO+nV6gQQfKShiMRCqpuluvrrXRez44oWB1qMmQ65A/+9E6xHZktg7RUnO3OmuMS99uqORyTjqkIY+S@vger.kernel.org
X-Gm-Message-State: AOJu0YwBdqV60gkvhNHhnY52PRH7VR4sRVIMEsGXvj4NwXjVCxPDjP2b
	RVadK1kt8LLA+e92nbLFD+L/hmcp2X+fjaS6ZyGit98FIqPm37H95u+0lNk+R4J0qjc9Zmw1WoI
	GQ8IJXLcMgDs125znXDdY8K1nqaPeNswc5tgFi30PtgVPLwzJ1GabgD64Im5sFn8C5uxJqV94
X-Gm-Gg: AfdE7ckiPMKW699DoUiGHQMeMXbVmBUW8bNTfGerEZLfyjNZ/fWipeJY/ct1iUE/N9t
	D3mk+526rDaSkWbclpHAs01MijT7VSRFBRAAze2h8mVyabjnfHQO7vWR0v1I3nH9foOeW7irv/o
	ONHQc5kQWLjunM3Y5r5ExBZehLcvOqDyItv91RhvlSQe4dn5dAw2jJvBS3XF8CtH/2ceWGjw49H
	cUoWxPMspyrsJBA0MhnhQjqIJRWqY2d+/MscwRtREIO5iO3mm4qHHYaj3NsnN9mMO6+dSxde2wi
	312Pp7vwiDN7n/EDNcnMEj3p2mBKrhhhhNEi4CFhYio201QR6k9bUFZy7rc0aiwyAiFnh6AQmI9
	WsCG4XrlBB83wvtED7GrBua78NgXw/34GtaU=
X-Received: by 2002:a05:620a:8813:b0:915:4ca0:1210 with SMTP id af79cd13be357-92e62689c4amr349002985a.3.1782823287438;
        Tue, 30 Jun 2026 05:41:27 -0700 (PDT)
X-Received: by 2002:a05:620a:8813:b0:915:4ca0:1210 with SMTP id af79cd13be357-92e62689c4amr348998285a.3.1782823286896;
        Tue, 30 Jun 2026 05:41:26 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288d18735sm121211466b.6.2026.06.30.05.41.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 05:41:25 -0700 (PDT)
Message-ID: <ba22eda5-bc7b-4ac3-92e8-c14c4dc13483@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 14:41:19 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 09/14] media: qcom: Switch to generic PAS TZ APIs
To: Sumit Garg <sumit.garg@kernel.org>, andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-media@vger.kernel.org,
        netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org, elder@kernel.org,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, jjohnson@kernel.org,
        mathieu.poirier@linaro.org, trilokkumar.soni@oss.qualcomm.com,
        mukesh.ojha@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
        jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260626133440.692849-1-sumit.garg@kernel.org>
 <20260626133440.692849-10-sumit.garg@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260626133440.692849-10-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDExNiBTYWx0ZWRfXxPomWM1bGdeP
 3/Y1wOyUVpM67AOKnEs8bEdbAoZxxlTAekcoAZCeWgbq+sw8Ag0/1RD/lFvMmL5DsDQDv4iozLy
 lXgTjA8GtwAKTSt7BnLNGkDe9dW79EQz+/INJlmnTkQINKdQvwVjCymYAwZaf4yx4v7zWVMpoKZ
 ubTdIV0x2cqM335szOYn7g8/7acJPkoeU+GPfNHwpBNuupJLnJOrxdBjyJ/7z8r18GWPUrMhRrD
 kLYw7GuNcxNlGAVDMchPvMiMkvd04T0ycMOjLatWre/kD8hWtfkwSHNrk1LI+to6elr8A6uO144
 JjCgEQLRR90N95wlhrDsZLbDBznmicRFATN6FuZJz/PaBdJ/VjmK4TG+vQXczxy1NXqd0nhulH6
 IeURmDmE0wWUgR+lDsKhSonrLVeOEMidCDnWU0s8Mr7Me8gpSGFjtZB4UuyhPn1oKu5AFgHRYZQ
 Ysxtju5VCGpwSOTpL+w==
X-Proofpoint-ORIG-GUID: v3UTCc_6KBg_7ibF3krY0DHuUdGkYIbL
X-Authority-Analysis: v=2.4 cv=JqbBas4C c=1 sm=1 tr=0 ts=6a43b978 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=GN6ll2GKXf5L_uNS5a4A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: v3UTCc_6KBg_7ibF3krY0DHuUdGkYIbL
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDExNiBTYWx0ZWRfX1aYzJCuJXtUj
 vjjXK7j6OhhEmIESoeHYdNkwgh1qYafs/IeoV619BvsDvWGXN26jJDzifgFTb9sn3JL//U27jap
 0uTrtWJp19yUBx/4LiX4SPNR0UZe//0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300116

On 6/26/26 3:34 PM, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Switch qcom media client drivers over to generic PAS TZ APIs. Generic PAS
> TZ service allows to support multiple TZ implementation backends like QTEE
> based SCM PAS service, OP-TEE based PAS service and any further future TZ
> backend service.
> 
> Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> # Lemans
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---

[...]

>  config VIDEO_QCOM_IRIS
> -        tristate "Qualcomm iris V4L2 decoder driver"
> -        depends on VIDEO_DEV
> -        depends on ARCH_QCOM || COMPILE_TEST
> -        select V4L2_MEM2MEM_DEV
> -        select QCOM_MDT_LOADER
> -        select QCOM_SCM
> -        select QCOM_UBWC_CONFIG
> -        select VIDEOBUF2_DMA_CONTIG
> -        help
> -          This is a V4L2 driver for Qualcomm iris video accelerator
> -          hardware. It accelerates decoding operations on various
> -          Qualcomm SoCs.
> -          To compile this driver as a module choose m here.
> +	tristate "Qualcomm iris V4L2 decoder driver"
> +	depends on VIDEO_DEV
> +	depends on ARCH_QCOM || COMPILE_TEST
> +	select V4L2_MEM2MEM_DEV
> +	select QCOM_MDT_LOADER
> +	select QCOM_SCM
> +	select QCOM_PAS

Hidden NOP addition

otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

