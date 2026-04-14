Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617C3334C2B
	for <linux-remoteproc@vger.kernel.org>; Tue, 14 Apr 2026 03:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776137040; cv=none; b=Sx4YBgi0qKEFEh6E+O7odKiz8Zxl9uNgmXYV38UdVJbWDePPofT73ffkDM+Ldt3jzkbwQXWoUJZnaH2jzD5q+QArGP8CKXV73h6fvRhNfw9pAwDYMmDAXu1G1kl2f252fNoc3lZO8R7VjS1SNMn8HQerqzyfrtETcm/1fxtFU68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776137040; c=relaxed/simple;
	bh=e+fdpsXXxqmh5T4lJEbG0vYDdBdc8dvNKOqB0Z6MDVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NmNhApt4JADYOIt+EEG3fO4hF6juvpABMPYFjMFAqPo/Bm6uim4zVBoO91EgYs49/ulu76tIAKV12fGkd9aYgYC6Ui4KNva/ooIPV65f4MSONRuyAo8FQPL7XPZHhMcgREuhCwuQ1lc5DOXlccVYDHg+jlnETaAYlFkNVcFQ/bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JTl2+scl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JqKxplu9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JTl2+scl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JqKxplu9"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DLChCF3505410
	for <linux-remoteproc@vger.kernel.org>; Tue, 14 Apr 2026 03:23:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o3R1wD2JeVV+ofiHbbAjdqUCiIXfouDrd59/7E1MjlA=; b=JTl2+sclBBXlfuol
	B5wp6P+mXivyeOPE4L5lUwfXGDFzfiByOy97Fb49mWjfcJXGQB0Hxlco5yDsPzvE
	CavE8jEHU04bR9UVfVK/dZiKfjQshn1E5BDIJF2dTuDTFZTy7gg2l/BvWomcyCJz
	IkIZPKPx2KzfFbPmeeVNE5OtxKGrN85xp8FaBfHftwpbTYokfvnqonypRDCGAK5a
	QIg57sFyonk4+7xN6D8npuEQBppy4+oixdF+cIP/lzfOAmGKquCd11rq//YyBs/L
	APHEuFMgwKgDJYDzHygkTJAo9OduvSH0TxeyFSsdAGnFNZlk7/6ezGDfW7LuHvpF
	wDjXhQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh870gtjp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 14 Apr 2026 03:23:56 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-358e95e81aeso11101667a91.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 13 Apr 2026 20:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776137036; x=1776741836; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o3R1wD2JeVV+ofiHbbAjdqUCiIXfouDrd59/7E1MjlA=;
        b=JqKxplu9FTOcbI4uhjzCL3C4z0SEY+QdPzj1yNNsVGgojytrCRyUDFIirxHtin6FU7
         awN6xHYvglxt7NbuhbIKo4Hiu4RCfNZdaO7A9+oLRU+COtvjW4coTZHQfsjy4bG2GaZh
         jiQp0S28AmJG44HquCkSAi4YvJJpcKBONrUBdsUxrXwxA9Q+16FQtUIHyBA6Vph8o4rc
         Xukgmw/6JT6gj+JvpWPx29tZDy9S+DsYm64I+NuhQsigpijBgWi4pTZufvYDiJZUwGFG
         Z/wmf9YEPMUef+33bGai44xx5K6o7lQZWzJjC2y4vWTLS1JJXkM7MFfsMdjJOHhENJD8
         Aouw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776137036; x=1776741836;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o3R1wD2JeVV+ofiHbbAjdqUCiIXfouDrd59/7E1MjlA=;
        b=MsAPQh2yRvgDAtSj2xo0AOYjf+qLjWlXmjuekY+QaXuOnSS/GEvAhk0n8oliZv5a7K
         TXSmm/XAS/fhXdA1iYgtu0wjduIFifAwfl9YvYCLzBCYlQ3vAQDZsgI9Ng2ELEk8ql3I
         A0vOdVtufcGEkNI/9PXuMxv5Kfp12Z3xDDUhqSqdaMshOWxMmKwsxO8UemtyBFYsKMWV
         Z2i9kEn8ShgEGDn3s5ONbor/UUFwG9TlWxCEvzUaZWW+qYjq+ebVkVZYv+AXsjpZzle3
         u7yRsuVTRdx7JcQTQa5WK5VGZGMYGZq/tcjUm0Bi3EezIgefPFX5CBMHVX/8RtWAXfFR
         cCHg==
X-Forwarded-Encrypted: i=1; AFNElJ+PYvJIXhniKKqYDXJ0r1qlnaDq/KfI+lbRn7T0FzsYaRRHQH8m60pdnTrywv6hTKhgiXVcl2Xo5WbVc98iK75u@vger.kernel.org
X-Gm-Message-State: AOJu0YyCL9OfiEy9TMBKMQ6l3l9e57krnquOth5dGDQn8p9YRK16BYa3
	ZOSvUGVVxp2dcjKpkW8Yo6o7yJdOvwa7GbUl2j8cv8dldEP9iPr3zWTrEdLAbsay2DMCpZUtBu5
	MyTjo5WymEoOhcGw5eyfO4GZVuhlJSZTvbg44gcJ7Tr8BjRCKT6TInEY9zwRaOfYfhZckBKMg
X-Gm-Gg: AeBDieuNbTWC34i6BpzqyjI6rb0C2BT1CA81BT3+WLfogvvkVNlgxUOfdDchg2Q+v/7
	dOwuXNJKjykM0D395OhSuxU1bmS9lxON400wNEik3etTx6swQQFhgEwKMGZ1Xzed/nppe/S12pc
	tZ0FMwsczgOl6W0ffbtT2ambozVnl/UYamcspGbBoTNMIVkXuSrkul/alEa3EjRTQ0cedPaoC1Z
	ffEAlsmivgqec3nO1GXwiGXBjAwkWBs6ccUwNFBWzAl7ofXuQ3WC4+Z8wuYXQlXgn8Z52jw/8Cl
	M64pCW2/u81T3RPnN3aup5DMopKoWMcw+NimnDGg1/apRhygmbzdzZhUfKCfAkgLRbUysJe4Avv
	KOQ9NYMmA3QscmCqEKklkgsOqOQQUtQqgmvfpiWhZZEuaaJrEM9CM9GXMiAJdovP+keNB6tAAhe
	dHHGoLL4tRQqWjjzA=
X-Received: by 2002:a05:6a20:9155:b0:39f:5671:921 with SMTP id adf61e73a8af0-39fe3c9126bmr17960670637.3.1776137035679;
        Mon, 13 Apr 2026 20:23:55 -0700 (PDT)
X-Received: by 2002:a05:6a20:9155:b0:39f:5671:921 with SMTP id adf61e73a8af0-39fe3c9126bmr17960628637.3.1776137035223;
        Mon, 13 Apr 2026 20:23:55 -0700 (PDT)
Received: from [10.133.33.94] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c79218fc462sm12018562a12.8.2026.04.13.20.23.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 20:23:54 -0700 (PDT)
Message-ID: <c6a9936b-9f44-4bea-93a1-17d145e64eec@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 11:23:50 +0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] remoteproc: qcom: Check glink->edge in
 glink_subdev_stop()
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260409-rproc-attach-issue-v1-0-088a1c348e7a@oss.qualcomm.com>
 <20260409-rproc-attach-issue-v1-2-088a1c348e7a@oss.qualcomm.com>
 <adkF7EY1KVRNO01o@linaro.org>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <adkF7EY1KVRNO01o@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDAzMCBTYWx0ZWRfXzZYShtN1EZbT
 MKMjTbcCoX3yywQO0a693yWrL1zc7MjbZMUSM4atyHGyHVlIA4KW3e99LhzhyLWbMA8H+w/L68j
 2crGdV5T5AFZ6AowcGimhNocPPRnf4sT1jguto/WrTd1HtjbQY+S+bkW6/ku6tbmqUG5rjlCzuc
 aCQEASKUqYvj9m5oSh0dR4kP/YAzDaBhGeEIq2xTvNfdSqgeysuUvCCaIEWMJBXlVGkOXDh5Rvs
 99KlRd7XSFpek9RH4yZ8Vqnc92r06d4X8WNEfG0pnTJvrrwnkFeWVMKz1ahBZfGDZQF6v3oneX1
 Jt6z9XL2C/BYFrkIybBkgRrOBL85SAqWz0Hfrz7gCZzyXGAm8R5mtzFBxorwtPNhduBVgcmuUV6
 5Rq5J8YSZzFb+9uc6QEMZ94OdejYDVe4pQZK+z+CPqpl3ed4SKcPa1VGl/+rSyuiycItnpGg+DD
 iEvsX3WJzvkyVPaxuMQ==
X-Proofpoint-ORIG-GUID: TEQIaeRKEPijXPWYr7GU8d02M4HRxA0B
X-Proofpoint-GUID: TEQIaeRKEPijXPWYr7GU8d02M4HRxA0B
X-Authority-Analysis: v=2.4 cv=btZ8wkai c=1 sm=1 tr=0 ts=69ddb34c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=6NDAGjaxIoc3lUqdot4A:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140030



On 4/10/2026 10:15 PM, Stephan Gerhold wrote:
> On Thu, Apr 09, 2026 at 01:46:22AM -0700, Jingyi Wang wrote:
>> For rproc that doing attach, glink_subdev_start() is called only when
>> attach successfully. If rproc_report_crash() is called in the attach
>> function, rproc_boot_recovery()->rproc_stop()->glink_subdev_stop() could
>> be called and cause NULL pointer dereference:
>>
>>   Unable to handle kernel NULL pointer dereference at virtual address 0000000000000300
>>   Mem abort info:
>>   ...
>>   pc : qcom_glink_smem_unregister+0x14/0x48 [qcom_glink_smem]
>>   lr : glink_subdev_stop+0x1c/0x30 [qcom_common]
>>   ...
>>   Call trace:
>>    qcom_glink_smem_unregister+0x14/0x48 [qcom_glink_smem] (P)
>>    glink_subdev_stop+0x1c/0x30 [qcom_common]
>>    rproc_stop+0x58/0x17c
>>    rproc_trigger_recovery+0xb0/0x150
>>    rproc_crash_handler_work+0xa4/0xc4
>>    process_scheduled_works+0x18c/0x2d8
>>    worker_thread+0x144/0x280
>>    kthread+0x124/0x138
>>    ret_from_fork+0x10/0x20
>>   Code: a9be7bfd 910003fd a90153f3 aa0003f3 (b9430000)
>>   ---[ end trace 0000000000000000 ]---
>>
>> Add NULL pointer check in the glink_subdev_stop() to make sure
>> qcom_glink_smem_unregister() will not be called if glink_subdev_start()
>> is not called.
>>
> 
> You mention the actual root problem here: Why is glink_subdev_stop()
> called if glink_subdev_start() wasn't called?
> 
> The call to rproc_start_subdevices() in __rproc_attach() makes sure that
> all subdevices are in consistent state when exiting the function (either
> prepared+started or stopped+unprepared). Only if all subdevices were
> started successfully, the rproc->state is changed to RPROC_ATTACHED.
> 
> In your case, attaching the rproc failed so the rproc->state should be
> still RPROC_DETACHED. All subdevices should be stopped+unprepared. We
> shouldn't stop/unprepare any subdevices again in this state, they all
> might crash like glink does here.
> 
> We know that subdevices are already stopped+unprepared in RPROC_DETACHED
> state, so I think you just need to skip rproc_stop_subdevices() and
> rproc_unprepare_subdevices() inside rproc_stop() in this case, see diff
> below.
> 
> Thanks,
> Stephan
> 
> @@ -1708,8 +1709,9 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
>   	if (!rproc->ops->stop)
>   		return -EINVAL;
>   
> -	/* Stop any subdevices for the remote processor */
> -	rproc_stop_subdevices(rproc, crashed);
> +	/* Stop any subdevices for the remote processor if it was attached */
> +	if (rproc->state != RPROC_DETACHED)
> +		rproc_stop_subdevices(rproc, crashed);
>   
>   	/* the installed resource table is no longer accessible */
>   	ret = rproc_reset_rsc_table_on_stop(rproc);
> @@ -1726,7 +1728,8 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
>   		return ret;
>   	}
>   
> -	rproc_unprepare_subdevices(rproc);
> +	if (rproc->state != RPROC_DETACHED)
> +		rproc_unprepare_subdevices(rproc);
>   
>   	rproc->state = RPROC_OFFLINE;
>   

Hi Stephen,

In this case, rproc_crash_handler_work()->rproc_trigger_recovery()->
rproc_boot_recovery()->rproc_stop()->glink_subdev_stop() is called,
"rproc->state = RPROC_CRASHED" is set in the rproc_crash_handler_work
before rproc_boot_recovery is called, so checking RPROC_DETACHED can
not work for this case.

Thanks,
Jingyi


