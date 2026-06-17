Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59893E3DAF
	for <linux-remoteproc@vger.kernel.org>; Wed, 17 Jun 2026 09:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781689046; cv=none; b=fzgL7kX9vRYKJXC9O3PNK0Ugbk+xNrRxSowOeBGYQqr8CbyoelpdRl9WUy2H9JKMRoLvK/IhmjHkT3ppcowc9yjQ/naXd19IxeWBXR/YPJHIhhAV88A8uc2IwcFNHJgAqqORHWQ5TTndg8823a0J+i/hMl8QuLCa9e64k+BUQhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781689046; c=relaxed/simple;
	bh=IB6dX8SYiaGhkj6r/5uY4W+ONZ0hIflMNwbNBhpmTwY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nasMM1xboBqAdLP6EDWbJIcuNBaqzXlgwQwtE1/K2jmD4qCsfuEyQReSZGPI4hxom8Mtf4LotXqy0jslVe3873Eg6s0rm6xMT7IS1XFSsqNpDx+pg8MmaDKBt7EAI6YY6sKt9doLLNc4NbF5RRaKPVfZhWe61OsyjMayCEv17LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pZtnU48U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=adKl+VKW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pZtnU48U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="adKl+VKW"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8V7qd2291377
	for <linux-remoteproc@vger.kernel.org>; Wed, 17 Jun 2026 09:37:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j5wLSZZ3MeJeiXqoiAePOrkWdu1M+tiBUI6AGF+g4no=; b=pZtnU48UluGG0aXu
	Zv1QYMVllQc7n7CQcjHEd0UlHltbd1l/BgFxwVnVGianLooUp9Ffta6ERwluQqeD
	k3gI526XqyU2j/Yfuwk3Kl6T/TugGSziYFBwvS5K8Eqd7IlR8feW6Tt5CPO9HzI7
	3UJeavRnoJAlyPoplF1nbdV1kKjOmpkvsuONQxNNee324GZkUEggImFPzZsw09jo
	bdhDw2xKL0rkpLGWETHrZYoCbk1oWqeleh+YU8NMaX/VY38/QAi3YQTrcl0+Q5Cr
	avH7UtgMJdVX9bI585ZQr6QbNUr80uC8/jn3I0S45BpLb+GSd5L+672qgmCgEOB0
	oEKoJQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueevjh1p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 17 Jun 2026 09:37:13 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c6bf305403so6218155ad.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Jun 2026 02:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781689033; x=1782293833; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j5wLSZZ3MeJeiXqoiAePOrkWdu1M+tiBUI6AGF+g4no=;
        b=adKl+VKWc3TvKvbSnG3Bt2X4TSgOwHnlg+W56Z75c8fsJQuDNL/+u7FmA6oMteNQaY
         N/xq21MJGxIS7GG1KJYLToN0dl6BPlEtu+CeDg6xY0YA6ftJhyPHiiHYLNwZ0BO+rig8
         sM47he/Ry7Xlass5RlHFptaq6XEszbiuayYVzpNxutfD6tCyM2qS7NNfJiv0ts/h3SKx
         f2Hhj8YtBfSYzcC5K2y11wPYsjohE086A3mrlM0MTobFDahRyRI/F+xn6HrIf2HCCsmZ
         hLNMTNop4RNHvRR59AfagZzHCn/zflXcG3sQNjqaQ48BXEboTdt7pFjZZ/VONmrC33Kr
         8vbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781689033; x=1782293833;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j5wLSZZ3MeJeiXqoiAePOrkWdu1M+tiBUI6AGF+g4no=;
        b=QsMrtW1GJm+0C7nEvT0XgYJAo5plqN+xeD3Q8BbRPq72DJs4gWtlcKNv5nI8iEWrK2
         vxGvZJnz9z1LpUsUE+fn554rdvcpB+So4Pxq1aroSGxGSwhulUETyamPqrrgc4ChszkQ
         lcsXRNUWlunXva70jDw7YtJj3ml5ZP9Y7ZRpFzzND9PJkQndfkYG5o217H6brcvwNknR
         UUUZ5hjDFTj8i2iOw2iWG4E8BngQfLB8K01mWzmaose/bzIuh1rIbPbJHFq2ith/nZkh
         GGwizCkJsUK5XDYgd9uQx1wHRtyMc+jEHKt9UUU4k/1dV9iREq0IeCJVQPPZupdWyFdM
         pHlA==
X-Forwarded-Encrypted: i=1; AFNElJ/bPcWVZ2wgV5kWbGDrH5sNq9HSySgdH0qEIJ+RacuGwfagbTFp/zpT2AUCUejTI45NTqj0Yo8tHHr1WX/V46KN@vger.kernel.org
X-Gm-Message-State: AOJu0YxyOm/akPZsQDuk1qorNVA0Hs9gp47IWnRpygBvDCc2Qob7IjXA
	BjUTRs8DWt4GdSQCnOEydc6Rfrhy3i4M11JvRAUNVe5fxqcbmSiuLHQTS621Wd9b60QqazrK69F
	QkUzOtbI5DKH3tO9nwaBLc2LBxQ9NJk4wpxL7G0iJ6tGMm+64VpsUg3Prhq57076WyA9J5lTnjU
	yG7LvyLa8=
X-Gm-Gg: AfdE7ckr5XfTbzDWq5NtKhMcEK7ow2xCBVSlriAkTviRIDdNWdpuOdyYTjXKa6v5gym
	3GOdc5dHwX7XW5WVZYPUZ6o84XgpHc5LU7XcnfMsq+jvI+gsEKdH+2yIZ4ScXaUPE3XNgNsxOjf
	kjiIdSy1gOcu/ZBNa6BFWmZYuDBCUTLDWTY8W1pinFSWWQNi/JyehRAnNXU5Qmwyjzq7f6rHav0
	lEiziN72SgM4JaFMIZecJC5tHwJmVZONyQlZwQvCXXCHupi8CEpVo/Or58+7xh9Ii8VoHfX4bGU
	mZfJMrzrIJ11rGnORdZyiAlsUubqNGtNYwKyixMmUS8KzkfqoGrig+nmaM60MB4aIL8Fzn0Tzql
	NCDS09QqZG3LMulsfdevtQZwnt0gli4mv8+kC4Y5Zu8OgRPPAzRuwW2MDf9kTA4Mw4NPWmI1p9l
	99wXOhFg==
X-Received: by 2002:a17:903:2b03:b0:2c6:afa8:c181 with SMTP id d9443c01a7336-2c6bc0b11a9mr31050245ad.1.1781689032562;
        Wed, 17 Jun 2026 02:37:12 -0700 (PDT)
X-Received: by 2002:a17:903:2b03:b0:2c6:afa8:c181 with SMTP id d9443c01a7336-2c6bc0b11a9mr31049875ad.1.1781689031977;
        Wed, 17 Jun 2026 02:37:11 -0700 (PDT)
Received: from [10.133.33.123] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4327ac7fbsm168941325ad.42.2026.06.17.02.37.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 02:37:11 -0700 (PDT)
Message-ID: <b8adacd3-a8ab-4f54-b169-bf6b919e6fa9@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 17:37:06 +0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/6] remoteproc: qcom: pas: Add late attach support for
 subsystems
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, shengchao.guo@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
References: <20260519-knp-soccp-v6-0-cf5d0e194b5f@oss.qualcomm.com>
 <20260519-knp-soccp-v6-5-cf5d0e194b5f@oss.qualcomm.com>
 <ahBG6jKYdSAboWjs@linaro.org>
 <6df4c351-7287-4fb9-8af8-83b5deabfa07@oss.qualcomm.com>
 <aip7feoTn0ncwzL7@linaro.org>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <aip7feoTn0ncwzL7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA4OSBTYWx0ZWRfXzIJZfAQPta/s
 BVrjmE3YBimEeWaJo3K9OjkHT5YyDNd1RcTOTLtWZyikyjqe7+8vj2ukHSFotOn9Z6VMk8nkaqx
 9xhu23dlREicWuz8m/TvHZX1zjD03PE0Cm3Gc3w+icd042jcbeUzkZ7SP5B/veX3o4iNPQnUzBh
 w1XK+xKaN7KOluG0YvftuUgPKvuBeBvuzIKa+9AhEnqCcbk9fZK0pBH664LxJtG62vuCKsAR6ij
 vC4bGAJIaeqEEsMojnIt8b5GZ7OFN5ut3zeUQJgokvj+lIPN8yaxBH+be+mbopd0zJZCBdDZDoo
 FAKrQC1sflFJfjEDfGvvV+DRaGIDXCbRnnX+tlANHCFaEv0A/gYsI6XI9f3ySyZNYeVTNDK6Y2S
 IlV81JMdndTkUR2SizG3Lbq2mxLjzOHJeDHt+HFQQFZv7+agqJQ/cidcb62WEeT+Q85p6ZTCc/M
 A9ussZ0uTkSJjb4Pjxw==
X-Authority-Analysis: v=2.4 cv=LM1WhpW9 c=1 sm=1 tr=0 ts=6a326ac9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bdzlAc8VpKKGP06_0pAA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: t6LixrGN_8UmlCIxNHhq6JAhUSZmZ4GM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA4OSBTYWx0ZWRfX11430b0kXWQp
 rEqLJQitXwN0scD2XiAN8sEBQhX8zQhM1sVYr+1TwTZeJXMXIsk0/GclgWxZl6GFauwVKIBfG/u
 N/tTnjXaxlsv4OA1JlOzuXOKFCGHd3M=
X-Proofpoint-ORIG-GUID: t6LixrGN_8UmlCIxNHhq6JAhUSZmZ4GM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170089



On 6/11/2026 5:10 PM, Stephan Gerhold wrote:
> On Thu, Jun 11, 2026 at 11:10:25AM +0800, Aiqun(Maria) Yu wrote:
>> On 5/22/2026 8:07 PM, Stephan Gerhold wrote:
>>> On Tue, May 19, 2026 at 12:24:23AM -0700, Jingyi Wang wrote:
>>>> Subsystems can be brought out of reset by entities such as bootloaders.
>>>> As the irq enablement could be later than subsystem bring up, the state
>>>> of subsystem should be checked by reading SMP2P bits.
>>>>
>>>> A new qcom_pas_attach() function is introduced. if a crash state is
>>>> detected for the subsystem, rproc_report_crash() is called. If the ready
>>>> state is detected, it will be marked as "attached", otherwise it could
>>>> be the early boot feature is not supported by other entities. In this
>>>> case, the state will be marked as RPROC_OFFLINE so that the PAS driver
>>>> can load the firmware and start the remoteproc.
>>>>
>>>> Co-developed-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
>>>> Signed-off-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
>>>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>>>
>>> Unfortunately, removing the ping-pong functionality that was present in
>>> previous patch versions makes the whole mechanism a lot more fragile.
>>> I'm not entirely sure if this has changed in SMP2P v2 or more recent
>>> firmware versions, but in my experience the SMP2P "ready" bit does not
>>> tell you if the remoteproc is actually running. The problem is that the
>>> "ready" bit is asserted by the remoteproc when the firmware is ready,
>>> but it is not cleared when you shutdown or forcibly stop the remoteproc.
>>>
>>> If this is still the case, you can easily reproduce that with the
>>> following test:
>>>
>>>   1. Start the system as usual and let it attach the remoteproc
>>>   2. Manually stop the remoteproc in sysfs (echo stop > state)
>>>   3. modprobe -r qcom_q6v5_pas
>>>   4. modprobe qcom_q6v5_pas
>>>   5. If the "ready" bit is still set, the driver will try attaching the
>>>      remoteproc, but it's actually not running. No recovery will happen.
>>>
>>> In this situation, it is very difficult to detect the correct remoteproc
>>> state without relying on an additional query mechanism like the
>>> ping-pong feature.
>>
>> This a valid use case and concern. We had a discussion with Bjorn, and
>> want to take this scenario into consideration of the separate robustness
>> improvement series[1].
>> Stephan could you agree to have the basic function in this series can be
>> go in firstly.
>>
>> [1]
>> https://lore.kernel.org/all/20260519-rproc-attach-issue-v2-0-caa1eaf75081@oss.qualcomm.com/
>>
>>>
>>> You can make it a bit more reliable if you also check the status of the
>>> "stop-ack" bit. This would tell you if the remoteproc was cleanly
>>> stopped with the SMP2P "stop" mechanism. However, that will typically
>>> still not fix the case above since nowadays remoteprocs are typically
>>> stopped via the QMI qcom_sysmon and the "stop-ack" is not set in that
>>> case. I believe this might set the separate "shutdown-ack" bit though
>>> that is described for some SoCs, I never finished testing that.
>>>
>>> And even if you check both "stop-ack" and "shutdown-ack", that doesn't
>>> tell you if the remoteproc was forcibly killed using
>>> qcom_scm_pas_shutdown() without gracefully stopping it first. The ideal
>>> solution would be querying the PAS API to tell us if the remoteproc is
>>> actively running, but the last time I checked I was unfortunately not
>>> able to find a documented call that would tell us that.
>>
>> It is a state currently kernel don't know whether the remoteproc is
>> offline or crashed when ready==1 && error==0 && ping-pong==0 scenario.
>> If it is re-modprob, the software don't have any data and only the
>> firmware can tell us whether if it is active or not per my understanding.
>>
>> Maybe let's have this scenario and solution discussion in the other
>> series I mentioned before.
>>
> 
> If you add a new feature upstream, you must make sure that it is
> reasonably robust and reliable. The other series is about generic
> limitations in the remoteproc subsystem, so I don't think you should
> move QC-specific parts over there as well (personally, I would have
> probably kept all of it in one series to make it easier to understand,
> but that's subjective).
> 
> With the current firmware design, it's hard - probably impossible - to
> make the status detection perfectably reliable. I would therefore choose
> some reasonable compromise to start with. Given that Shawn (and actually
> me as well) would like to have attach working without firmware support
> for the ping-pong functionality, I think it would be reasonable to start
> with the basic detection scheme discussed above, i.e.
> 
>    ready==1 && handover==1 && fatal==0 && stop-ack==0 && shutdown-ack==0
> 

Hi Stephan,

We did local test, checking stop-ack==0 && shutdown-ack==0 should be able to
cover graceful shutdown cases.

Would it be redundant to additionally check the handover state here? In our
observations, the ready and handover bits are usually set together. Meanwhile,
handover irq is not a necessary condition for pas start.

Thanks,
Jingyi


> The ping-pong functionality could be added later for platforms that
> support it. It would be good to have the interrupts already defined in
> the device tree, so you can tweak the driver without making DT changes
> later.
> 
> Thanks,
> Stephan

