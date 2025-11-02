Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D05C212FB3
	for <linux-remoteproc@vger.kernel.org>; Sun,  2 Nov 2025 08:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762073662; cv=none; b=oag6vOQ2HcOTZ79s2IudjmXQHGOs3lmqV0Icr4SIOYdkAveSgedYuh7Roy7u4tat4PMAzluhmkb1UW98PiU9wY5ojPi4f2lMTXi37reFvpKb/s6QwrYq0BZP2ksSlpnXvIRiEiqTL7LB6tzHf87hehZNnrPwmYk2g/xYOFBj+D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762073662; c=relaxed/simple;
	bh=VrNlJEdA6rL2TZX1jR3KmoWIGVLhADuUudrCvlc+GWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pfvG9RrCXGKo1CmHDiTlaiXauhc7dOBrcR98QNJ+soaPi0Vt9z+ITz7r1UcED37bHEVXIHdCQ0ee1fqnVKqrpadGfvYOTGpqhSym0o2cntOJD7roe6yLZ5ocB9hzSOxvXHXmKf5JGGhcoD3kw0rUBhb5tYVLraCu/801ryiNM8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kGE/DL6+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JV/ad32a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kGE/DL6+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JV/ad32a"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A25U2OD3633525
	for <linux-remoteproc@vger.kernel.org>; Sun, 2 Nov 2025 08:54:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L2+v1vemn1Hxq/ITjyHmZWjTEsWZxpFs6I6d2XkunfU=; b=kGE/DL6+wje6WKpp
	sQCv5/lGwP7px7M8d4iYUq32aNQ8l5P7+dL4GLXJiIoAQdyjbD7F809ha4aXs8HF
	VT1hkept1mbEM8DaMXcmsRKOM16k+jDP2pNDYO7WhX7vV8QAOTYEaKFJ4BdygXM6
	99OanfE1X8UVDbocnPwaG+ZNuDwxouysPNE6dpmczF1p3DmoDfxHmGvGUt7ioCDU
	s+lIphY8ccxL/oAb711zbtGRfQcYRuXydqemdUqxUUbSyiWcU8TTgbRzSVP0LpxO
	zu8SzBQzbJjuzshR26b8splglojY4cb+LooI/+pMXigaWfVlQmiOZP0oKuptTLnd
	x2K4OA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a57jn23dc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Sun, 02 Nov 2025 08:54:19 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-79e43c51e6fso2443870b3a.1
        for <linux-remoteproc@vger.kernel.org>; Sun, 02 Nov 2025 01:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762073658; x=1762678458; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L2+v1vemn1Hxq/ITjyHmZWjTEsWZxpFs6I6d2XkunfU=;
        b=JV/ad32adYpU1CciJM0ti8Yx5NHjTYdBBpLI1OGCLPFVfJOoVVWjfYATV68w51vIBf
         tJLtT8yOBahCWbMiTkiPowTosm0EbdRKEbDidJW9ZGAH0w27ZatjpjrfmGUHdy6t1tnP
         tL5EjumlsuE0HGcYvH+wXB27Itde4q0f2AL7+8c2H0DXQ7oNJeJytDoA5YiX5n3H8FVH
         8kV6gz/YDrEPxXFGvXXhAyeaJRcEIG8lPEjUsu1wNr4a1ZDeWvrlpNua9hJHQfxFe9xS
         pLDU3hRHtCsDwVFZnYnqdLsw0ul6rRjTOod5h/mzxwLcHdUEQNQBE7Lgcn7qQWMcKe0s
         X2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762073658; x=1762678458;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L2+v1vemn1Hxq/ITjyHmZWjTEsWZxpFs6I6d2XkunfU=;
        b=iVPKjBVI16XpEsqG4/Yneyj8V/WT/cp1hL7bQpjvUI4iJmIOS6vwjxITLRWFxwYy5f
         /GD/OyeiIa75e7kuFBzWC0smk9sdKhXhENaFgX9KNnEyPNJj6WkaNzE6mIP1vQsuuufJ
         SsDv7ifbSkvUO/i+G4tpGUIr+Xeq9qTqKxS05PyNVl1cK1nxYu3q/oamfqyibmGDuLjw
         NYlh0nxU/SwnQIU2167PYP4a3Mmb8lQZL9emPEEfBMSjfrgYcVG/yosM9cs0Cfg3W8cI
         jkpMR0xMEdY1QaXP8Drf88if4m4+n3OjrB/gf/4on8dNKEVCBtYpMK88EVpY7/jVXkLC
         JHSA==
X-Gm-Message-State: AOJu0YyzZrY4GQNKx+OinpKzXZIQs786xhJcR4PNzbRCOhTitGOOAb2e
	8mcz5uQAf2XsSXNiMEA0dEgcWJIWRiCkF5jzOWu49U5oXI2nOfCBSq7tutE9eQlGrWyKwSQLdCO
	v5UPa1nyAaw8d6QpXgpD5x1Cv7LdrB7Qnty66kFYqO17pyoL8Uf2crp0zASm4wgTowj6d7+KR
X-Gm-Gg: ASbGncuvvaEJrDkeFJNxIqVdlROJrTV1mJpq9yBvHdqI4X5mXGCeIfH4osR1QnnFukD
	xYJgPIb03/JmHbbIMpl81HBipazsmQv//mWWgmblLX6AWQiCppEk2vI/hXwN6qsNdQpguvtYZgu
	Q+uxmYxt3b/XLZ8TULRU28/OcDB7770zv62L0FVE+vHZVxebQr46YCRemZ2C9s9mI3gONX3Hc3k
	YqvOsgmr4v/ZLpjx5+4DhgnnKkXnBPUpta+P8WoPrSiBgJKa2AhFt5seCjnSfa8OGF4nWZ7zxUQ
	9OjSQSfDbrT6RW/OmUd9eEHcOy/FiUXM4k6DaP1PP445KqFew77uharQlEL392YA+3SeT2w2xlq
	YmDqSam3AF045mC0VRYjC/LIEl3R/PPCg1//phQkQT0OOLsL95GyUZYPtdO1oFato71IWRA==
X-Received: by 2002:a05:6a20:3948:b0:343:8069:7568 with SMTP id adf61e73a8af0-348bca42eacmr11549747637.27.1762073658141;
        Sun, 02 Nov 2025 01:54:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcZHpOHrhBxtjI//Pk7j/FPcy3ZEApsrl6eYmcz/8uYFMlhk1bTXELb1q3SmhnvkBjFri9VA==
X-Received: by 2002:a05:6a20:3948:b0:343:8069:7568 with SMTP id adf61e73a8af0-348bca42eacmr11549726637.27.1762073657547;
        Sun, 02 Nov 2025 01:54:17 -0700 (PDT)
Received: from [10.133.33.69] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b93b8c8eb03sm6870727a12.15.2025.11.02.01.54.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Nov 2025 01:54:17 -0700 (PDT)
Message-ID: <e3e2f821-4585-4eb3-8e5c-af4d6ab29234@oss.qualcomm.com>
Date: Sun, 2 Nov 2025 16:54:13 +0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] remoteproc: core: full attach detach during recovery
To: Tanmay Shah <tanmay.shah@amd.com>, andersson@kernel.org,
        mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        zhongqiu.han@oss.qualcomm.com
References: <20251028045730.1622685-1-tanmay.shah@amd.com>
 <20251028045730.1622685-3-tanmay.shah@amd.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20251028045730.1622685-3-tanmay.shah@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=StidKfO0 c=1 sm=1 tr=0 ts=69071c3b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=zd2uoN0lAAAA:8 a=n-E3Dk61l7d4xf_k7bcA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: QcRCxeqwHRODJc-FZij5qBcNh4kf-d21
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAyMDA4MiBTYWx0ZWRfX/kXmEII1XOB0
 hLUjsqLxkny9foYdKjMqUrNYRsDdg+y3oZya/GEIMmkujgTDahUYyijUZDBdsa+v/+1pdGww0o9
 Jka+gNp0zipKpYjExV4sw4s+jzxyLi+GIobnJ3POzQocAxul0awhvfJKBEzle0uOT/yv1Hb+G2J
 mWEA0aG9/Jx226/3dOGv+ZRVKqqBe9bm1kqGxNB8X5BG26R+heSX5g4Tx1fA58WB1diJv5qAV5C
 ghP2Q4gYKguYapdNfqmcCjclGxJmcxoegtEfGI8YFVmsedOUzbWY6+373mUZeh0QyaVNow2hkWY
 rnQEa94GuCjYuQjnmW7v5rWuDBS2x7NuoAfNMfleC4Midw2Agb/K/8JTQ4fiV/10JAE86YiJM4f
 6QqP9nMKtqNFYDxH36eQ1Emw6KotSg==
X-Proofpoint-ORIG-GUID: QcRCxeqwHRODJc-FZij5qBcNh4kf-d21
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-02_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 malwarescore=0 impostorscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511020082

On 10/28/2025 12:57 PM, Tanmay Shah wrote:
> Current attach on recovery mechanism loads the clean resource table
> during recovery, but doesn't re-allocate the resources. RPMsg
> communication will fail after recovery due to this. Fix this
> incorrect behavior by doing the full detach and attach of remote
> processor during the recovery. This will load the clean resource table
> and re-allocate all the resources, which will set up correct vring
> information in the resource table.
> 
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
>   drivers/remoteproc/remoteproc_core.c | 22 +++++++++++++---------
>   1 file changed, 13 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index aada2780b343..f5b078fe056a 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1777,11 +1777,11 @@ static int rproc_attach_recovery(struct rproc *rproc)
>   {
>   	int ret;
>   
> -	ret = __rproc_detach(rproc);
> +	ret = rproc_detach(rproc);
>   	if (ret)
>   		return ret;
>   
> -	return __rproc_attach(rproc);
> +	return rproc_attach(rproc);
>   }
>   
>   static int rproc_boot_recovery(struct rproc *rproc)
> @@ -1829,6 +1829,9 @@ int rproc_trigger_recovery(struct rproc *rproc)
>   	struct device *dev = &rproc->dev;
>   	int ret;
>   
> +	if (rproc_has_feature(rproc, RPROC_FEAT_ATTACH_ON_RECOVERY))
> +		return rproc_attach_recovery(rproc);
> +
>   	ret = mutex_lock_interruptible(&rproc->lock);

Hi Tanmay,

I have a concern about this patch, specifically regarding the locking
behavior and potential race conditions introduced by the early return in
rproc_trigger_recovery(), by calling rproc_attach_recovery() directly
and bypassing the original mutex_lock_interruptible() in
rproc_trigger_recovery(), the recovery flow now executes rproc_attach()
without holding rproc->lock.

This could potentially lead to race conditions if other threads are
accessing or modifying shared resources concurrently.For example, one
possible scenario is:


state_store/rproc_trigger_auto_boot
-->rproc_boot
    -->ret = mutex_lock_interruptible(&rproc->lock);    <--(4)
    -->if (rproc->state == RPROC_DETACHED) {
        -->ret = rproc_attach(rproc);                   <--(5)
       }
    -->mutex_unlock(&rproc->lock);
	

rproc_trigger_recovery
-->rproc_attach_recovery
    -->rproc_detach
       -->ret = mutex_lock_interruptible(&rproc->lock); <--(1)
       -->ret = __rproc_detach(rproc);
       -->rproc->state = RPROC_DETACHED;                <--(2)
       -->mutex_unlock(&rproc->lock);                   <--(3)
   -->return rproc_attach(rproc);                       <--(6)

As shown in stack (5) and (6), two threads may simultaneously
execute the rproc_attach() function, which could lead to a race
condition.

Please feel free to correct me, thanks~


>   	if (ret)
>   		return ret;
> @@ -1839,10 +1842,7 @@ int rproc_trigger_recovery(struct rproc *rproc)
>   
>   	dev_err(dev, "recovering %s\n", rproc->name);
>   
> -	if (rproc_has_feature(rproc, RPROC_FEAT_ATTACH_ON_RECOVERY))
> -		ret = rproc_attach_recovery(rproc);
> -	else
> -		ret = rproc_boot_recovery(rproc);
> +	ret = rproc_boot_recovery(rproc);
>   
>   unlock_mutex:
>   	mutex_unlock(&rproc->lock);
> @@ -1860,6 +1860,7 @@ static void rproc_crash_handler_work(struct work_struct *work)
>   {
>   	struct rproc *rproc = container_of(work, struct rproc, crash_handler);
>   	struct device *dev = &rproc->dev;
> +	int ret;
>   
>   	dev_dbg(dev, "enter %s\n", __func__);
>   
> @@ -1883,8 +1884,11 @@ static void rproc_crash_handler_work(struct work_struct *work)
>   
>   	mutex_unlock(&rproc->lock);
>   
> -	if (!rproc->recovery_disabled)
> -		rproc_trigger_recovery(rproc);
> +	if (!rproc->recovery_disabled) {
> +		ret = rproc_trigger_recovery(rproc);
> +		if (ret)
> +			dev_warn(dev, "rproc recovery failed, err %d\n", ret);
> +	}
>   
>   out:
>   	pm_relax(rproc->dev.parent);
> @@ -2057,7 +2061,7 @@ int rproc_detach(struct rproc *rproc)
>   		return ret;
>   	}
>   
> -	if (rproc->state != RPROC_ATTACHED) {
> +	if (rproc->state != RPROC_ATTACHED && rproc->state != RPROC_CRASHED) {
>   		ret = -EINVAL;
>   		goto out;
>   	}


-- 
Thx and BRs,
Zhongqiu Han
