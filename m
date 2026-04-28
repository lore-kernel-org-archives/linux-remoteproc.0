Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D201731F992
	for <linux-remoteproc@vger.kernel.org>; Tue, 28 Apr 2026 04:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777349981; cv=none; b=kb74ZuK4FDdXtF5vEkVy/7F6YD0hN2y16ZYZA/0N84fH3eENq+sJPHS3yhFm1jmxVIekAG7M6INKpOtw7J+uZtLUSQbLYpZJRqaIz5aXgH7ELDfIS9hKBvsCu/QRY0uMK/OGTXMqXTRjpCGqHAcHWdRdK4tGK9CWoDxBZesQGAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777349981; c=relaxed/simple;
	bh=riQbeUBW+0/5l1/7q1bVcF+wZeGx5wNUR4kDgr2fUNs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=REdq+v7pAFfvsaq8vjR+a6sGJ8iA+7LR4+pT5uXDfMIgPLIAhyJey3UT+5LepuHPfC7r+CrWRhsz1j9ZmesAB6y1DYKkoPWkzVlkMCve+DMcK6Tgh8sstXS+ofibURXBFvmGXhYScolIsK8qsN2qp564cpdpUv7rgp4RGVCYc80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y8Gynsod; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YcHXeJJe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y8Gynsod";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YcHXeJJe"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S3k8oq2111945
	for <linux-remoteproc@vger.kernel.org>; Tue, 28 Apr 2026 04:19:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wR+VaS6IglZ/UDxylzjaLuvxy22J5usBIoRkIB+htxM=; b=Y8GynsodSW9YK3Es
	sS5Xt+aRwhGxsh1fno9qy6vlXuvJLDMW39F3aakVQBtbKZ0XohiPjAyshyGWQ7tf
	iUYcnSsIhtjXCfHbWahDgMymHwmUkoPB+Y+HHQH22ifjZ1q89PlkVdEtvuDSThBp
	Yg0vnc64Qh5bFkhvRkhr+ePWQQLyDmK5900lp06BSv3jUVXSTtF2eiLfsQmSFHEh
	7LPmc3evmDkhGhvhkYu8in8WIxYwIgqtDkDlI7ITSo7kl9ZYIEQHX40u8OZxFF1D
	yQlll9GYIa2poV7KK+fbNHT5ZLPeptoOJe3AyhIHintx/1UZ1uNuVsR+z64Cu6Y8
	n6/TPg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtdmbhqn3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 28 Apr 2026 04:19:38 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35641c14663so12851026a91.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Apr 2026 21:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777349977; x=1777954777; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wR+VaS6IglZ/UDxylzjaLuvxy22J5usBIoRkIB+htxM=;
        b=YcHXeJJePz5+mwhrK7/Y8gAC9QOV6ovU0OAgdK9Wh/1cukgs5hdPm0CDsw/WZSU9UG
         yWuNqlfMKRg5VIGdM1K92xB+6gWaDbSbgDcdyEQ/ut+OPfNi0QU6SzjntJYG3Wyebrr3
         tbbfA2YY5cezuNwzEPHvWrSzADMFBrur6e+WXJa1RcJcBbjrvYFo0z+BsNdE9af/MVgr
         L0zdRsEZp96fq9wG1p9qoNwUUP9J7pgnyW3Afdtp5ySkQ87mGv9CKu6ovdi2pQo/jgTo
         6ReQ/do2fZRY9sG6sRueH8Wd2SyGPJkHXaJFwCg3N0jMOx8KHACGWLAQ+W1jmnDB7h5M
         OXVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777349977; x=1777954777;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wR+VaS6IglZ/UDxylzjaLuvxy22J5usBIoRkIB+htxM=;
        b=MQuddayfBunNdgCuupPw2CGNHs601ZLg0lKf1zStzD3kHbj695UGcL/hBviq6kEzir
         kVVDPLXe+MLPtBuBydOTfMxCaTlzDUNU1c0zjVshR+cuZmSieNboC7K8sQU0uB27VMBq
         +LF/9xHv6sOikhK7+dBepSJUFFUrKZyyrCAhMdh35wTgbv+UYqr3TV6u9z83MXAij6Yj
         WUV7w8QIKRD4raUF4QQH2UgFVVx2Szqhqu6WgjL3bcvLhFv+D+JGCzR7gBdz4FSRYVXB
         xHqySmst29HvFWBomVd4L31M5NjQXfPqzOJidciCwBGP+2TLl39JiqKa2+TrwGwoQbpj
         ogCw==
X-Forwarded-Encrypted: i=1; AFNElJ+oX59I9CNOJtJydLipMS6TBDdnnqLzvAtN+vS4l1FEeMxVml5hA/tw0JLCxjklklfXcGBwPoOTDF0YCSp6IJO4@vger.kernel.org
X-Gm-Message-State: AOJu0YxPA0J6gt6/w7pGEjLiQ7ZlC18jKBP7g8aBHmfa3IuQRhm0V4jP
	FAIaQ3pSAh6SBymrKQXKkNtNWWTdnIZXAFz6DxuOglCtMpnX2IU31Sau0ifOH1uVzGvZyMOkAVS
	lyLNrlQZNcRDCx8ryD30TSFnLMpzPQsoV6ak0KDEKrwBou23KZD7618xfj7dWXzrsAs40rSqO
X-Gm-Gg: AeBDieuHqVBB7XXpuAC2KPPKD29CdeWVN2Su4Eh+GlsFDosDLlE9eZy+seWbEjT+vUH
	xIMOe43Sg3xi5Gs4czYBNM5GzN/UCJmejWrEJeUgxWuPYgZCOoyWRjk+FCd8/dc1vxeF0P5pArq
	BuurlrFI444+lf68zmCIt4QddYRyxwd/xSeTb2pDA1luF9bSduFCCA42kg4LrbhXF445EOHJq0d
	q5+SrMZ6lJlb8POdF28J6MJhimDNPioaf/GsKyoWldbrngfiVApiIJkZByI8MSFKBjdYhQ9SeHy
	Hmd9nyOQUWZS4/nRWayNSMItPPC8FMZgBds+Y/Gv2V5NdIYnCBAsL1vfsuF+xVz5TjBszQJSp2Y
	esPnhVBGi7aLVZrsY9N5+UOlWK7C5NbB41hSXhiq4PEcJVf99eGbmWD+VyFF2uCS7UpcNIqOwPn
	yVuSNOHVoxrjZsfj6YE8Sq4lX4Dw==
X-Received: by 2002:a17:90b:2e88:b0:35e:5a24:3c43 with SMTP id 98e67ed59e1d1-36491fda27bmr1594297a91.8.1777349977264;
        Mon, 27 Apr 2026 21:19:37 -0700 (PDT)
X-Received: by 2002:a17:90b:2e88:b0:35e:5a24:3c43 with SMTP id 98e67ed59e1d1-36491fda27bmr1594268a91.8.1777349976628;
        Mon, 27 Apr 2026 21:19:36 -0700 (PDT)
Received: from [10.133.33.26] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3649003583bsm1276765a91.6.2026.04.27.21.19.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 21:19:36 -0700 (PDT)
Message-ID: <f0d5d665-e960-4d32-899f-f80b186da649@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 12:19:32 +0800
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
 <c6a9936b-9f44-4bea-93a1-17d145e64eec@oss.qualcomm.com>
 <ad36erdhcvnIvFMH@linaro.org>
 <e9720deb-d46c-4556-b69d-1dec00cc7892@oss.qualcomm.com>
 <aed_jyMEuWLlQRDv@linaro.org>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <aed_jyMEuWLlQRDv@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _hefMhDnSiY1aDte_Qz08jHdgH8NmQpO
X-Authority-Analysis: v=2.4 cv=PcrPQChd c=1 sm=1 tr=0 ts=69f0355a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=ptdDE-snkMbm8K7LsVEA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: _hefMhDnSiY1aDte_Qz08jHdgH8NmQpO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDAzNyBTYWx0ZWRfX/3h/0XVNmteS
 hePYuSbij5nxDV/hUzAeDeMbGXj0hWDcVDK9UJMeffQPB/cyeA2ix4k0SfiJ8wzollufDmgl1S7
 fFDB7hP75KTHmlorSHpd1+V7XrdgeQrSBY8r2IxC5ZrTEfdrA6K6j5Ud+VSics4nIlV9k18o5e8
 2y7W4NctvUwAafebzOMZK4fSszSp2GKlXEEJvaG+DyIzZRiADLKw028V8pXckIh1J45PAG6CU+4
 C7lYPnaY9cpSdQ1p9RbHbaKRlCHwsNdjQMYCsmarcQRY1vx2aNsMB29IM1k1nGtaeSiRSIGmZTO
 dZBerenKMC7AXghPdQWAY2vX3ulGNexxuVZcQNnR17t4iuNLpcdr/v+WgPJhKLA0Qc5HGwymP6k
 skHenJ5q8hWB3K+8Mq+OucEIfRAuFVlR/fB7XUelt/mIZdEz0nlh/zb4+hC1jtrK0o7O8slJunD
 z6oX41vXgID03Y5jTjQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280037



On 4/21/2026 9:45 PM, Stephan Gerhold wrote:
> On Thu, Apr 16, 2026 at 10:52:17AM +0800, Jingyi Wang wrote:
>> On 4/14/2026 4:27 PM, Stephan Gerhold wrote:
>>> On Tue, Apr 14, 2026 at 11:23:50AM +0800, Jingyi Wang wrote:
>>>> On 4/10/2026 10:15 PM, Stephan Gerhold wrote:
>>>>> On Thu, Apr 09, 2026 at 01:46:22AM -0700, Jingyi Wang wrote:
>>>>>> For rproc that doing attach, glink_subdev_start() is called only when
>>>>>> attach successfully. If rproc_report_crash() is called in the attach
>>>>>> function, rproc_boot_recovery()->rproc_stop()->glink_subdev_stop() could
>>>>>> be called and cause NULL pointer dereference:
>>>>>>
>>>>>>     Unable to handle kernel NULL pointer dereference at virtual address 0000000000000300
>>>>>>     Mem abort info:
>>>>>>     ...
>>>>>>     pc : qcom_glink_smem_unregister+0x14/0x48 [qcom_glink_smem]
>>>>>>     lr : glink_subdev_stop+0x1c/0x30 [qcom_common]
>>>>>>     ...
>>>>>>     Call trace:
>>>>>>      qcom_glink_smem_unregister+0x14/0x48 [qcom_glink_smem] (P)
>>>>>>      glink_subdev_stop+0x1c/0x30 [qcom_common]
>>>>>>      rproc_stop+0x58/0x17c
>>>>>>      rproc_trigger_recovery+0xb0/0x150
>>>>>>      rproc_crash_handler_work+0xa4/0xc4
>>>>>>      process_scheduled_works+0x18c/0x2d8
>>>>>>      worker_thread+0x144/0x280
>>>>>>      kthread+0x124/0x138
>>>>>>      ret_from_fork+0x10/0x20
>>>>>>     Code: a9be7bfd 910003fd a90153f3 aa0003f3 (b9430000)
>>>>>>     ---[ end trace 0000000000000000 ]---
>>>>>>
>>>>>> Add NULL pointer check in the glink_subdev_stop() to make sure
>>>>>> qcom_glink_smem_unregister() will not be called if glink_subdev_start()
>>>>>> is not called.
>>>>>>
>>>>>
>>>>> You mention the actual root problem here: Why is glink_subdev_stop()
>>>>> called if glink_subdev_start() wasn't called?
>>>>>
>>>>> The call to rproc_start_subdevices() in __rproc_attach() makes sure that
>>>>> all subdevices are in consistent state when exiting the function (either
>>>>> prepared+started or stopped+unprepared). Only if all subdevices were
>>>>> started successfully, the rproc->state is changed to RPROC_ATTACHED.
>>>>>
>>>>> In your case, attaching the rproc failed so the rproc->state should be
>>>>> still RPROC_DETACHED. All subdevices should be stopped+unprepared. We
>>>>> shouldn't stop/unprepare any subdevices again in this state, they all
>>>>> might crash like glink does here.
>>>>>
>>>>> We know that subdevices are already stopped+unprepared in RPROC_DETACHED
>>>>> state, so I think you just need to skip rproc_stop_subdevices() and
>>>>> rproc_unprepare_subdevices() inside rproc_stop() in this case, see diff
>>>>> below.
>>>>>
>>>>> @@ -1708,8 +1709,9 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
>>>>>     	if (!rproc->ops->stop)
>>>>>     		return -EINVAL;
>>>>> -	/* Stop any subdevices for the remote processor */
>>>>> -	rproc_stop_subdevices(rproc, crashed);
>>>>> +	/* Stop any subdevices for the remote processor if it was attached */
>>>>> +	if (rproc->state != RPROC_DETACHED)
>>>>> +		rproc_stop_subdevices(rproc, crashed);
>>>>>     	/* the installed resource table is no longer accessible */
>>>>>     	ret = rproc_reset_rsc_table_on_stop(rproc);
>>>>> @@ -1726,7 +1728,8 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
>>>>>     		return ret;
>>>>>     	}
>>>>> -	rproc_unprepare_subdevices(rproc);
>>>>> +	if (rproc->state != RPROC_DETACHED)
>>>>> +		rproc_unprepare_subdevices(rproc);
>>>>>     	rproc->state = RPROC_OFFLINE;
>>>>
>>>> In this case, rproc_crash_handler_work()->rproc_trigger_recovery()->
>>>> rproc_boot_recovery()->rproc_stop()->glink_subdev_stop() is called,
>>>> "rproc->state = RPROC_CRASHED" is set in the rproc_crash_handler_work
>>>> before rproc_boot_recovery is called, so checking RPROC_DETACHED can
>>>> not work for this case.
>>>>
>>>
>>> You're right, I forgot about that. I think we need a more generic
>>> solution for this though. rproc_stop_subdevices() should not be called
>>> without a prior call to rproc_start_subdevices().
>>>
>>> I think there are a couple of options for this:
>>>
>>>    - Add a bool "subdevs_started" to struct rproc and manage that
>>>      separately from the rproc->state.
>>>
>>>    - Track the rproc state before the crash separately (something like
>>>      rproc->state_before_crash) and check that in the stop path.
>>>
>>>    - Add a new state RPROC_CRASHED_DETACHED to make sure the states are
>>>      unique.
>>>
>>>    - ...
>>>
>>
>> Sure, I think a bool like subdevs_started will be better for maintain?
>>
>>> Does the same issue also exist in qcom_pas_stop() of "[PATCH v5 4/5]
>>> remoteproc: qcom: pas: Add late attach support for subsystems" [1]?
>>> There you check for pas->rproc->state != RPROC_ATTACHED, wouldn't this
>>> also fail for the RPROC_CRASHED case?
>>>
>>
>> I tested calling rproc_report_crash directly during qcom_pas_attach but
>> did not see issue, handover_issued is set only if attach is success
>> so "handover = qcom_q6v5_unprepare(&pas->q6v5);" will return false and
>> "qcom_pas_handover(&pas->q6v5);" will not be called.
>>
> 
> Hm, as you mention, if you call rproc_report_crash() during
> qcom_pas_attach() then handover_issued does not get set (so it's still
> set to false). But qcom_q6v5_unprepare() returns !q6v5->handover_issued
> (handover_issued negated), so !false -> true. So I think exactly the
> opposite will happen and qcom_pas_handover(&pas->q6v5); will get called?
> It should not be called in that case, because this will break the
> reference counting for the regulator/clock resources.
> 
> In addition, even the disable_irq(q6v5->handover_irq); inside
> qcom_q6v5_unprepare() is problematic. enable_irq()/disable_irq() are
> also reference-counted, so disable_irq() should not be called without a
> prior enable_irq() or you end up having the IRQ permanently disabled.
> See e.g. commit 110be46f5afe2 ("remoteproc: qcom: q6v5: Avoid disabling
> handover IRQ twice").
> 
> Thanks,
> Stephan

ACK, will handle this more carefully.

Thanks,
Jingyi

