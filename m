Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1701399356
	for <linux-remoteproc@vger.kernel.org>; Thu, 19 Mar 2026 05:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773899097; cv=none; b=tVNYGuePfw56QdJ6zJJRfGl406GbAW0Ty/FCDrzkISYt+Ef3Cj1jwkLwRLbya0YNpgdmq+AOhxhA9w25ibL1vwcdcP+TuqJxPwLHlC/g6E3msrO4ByDNvGG5fR9mvu8wo/vt4t3KfqsmnM6oy8+bsTsgEA2vn2nj5Tz9qhTw8uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773899097; c=relaxed/simple;
	bh=NNB5xffDO5KucLPq3mYXRXkkzL7ZnpefOvtoDqD9dZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N9ukWmq7f8LXc2I9v5n5Nk3bPanUNhhQMST6ZpPhCbjRayP0GMOky94uvS7DMV0nklBp6IlvsocRdehRFG0QtOBpBgMwf72NuUUZCojm+otcQByV9FZfCkjFNOOnVwXIzeaGP9w7AOt5Bzdg2IRX5E6/e1OYFoAoKi1UQpJ4q3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iwyKWURb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i6JarO/N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iwyKWURb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i6JarO/N"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J5XaOQ1701872
	for <linux-remoteproc@vger.kernel.org>; Thu, 19 Mar 2026 05:44:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ampQRXpUK/R8dpg2C3wASpItLjwceLYCOODrGNFGjZw=; b=iwyKWURbyLNcQ8Oh
	RexAbUlCFF774kwQjATg0aXt6/ftyCCwMkxySXaOw//d0AlGft6wMuXsVolWhdTF
	VngVhthHCAfM8OoNig2SeCcjqzxIQVZkPYRj0MFEBVK/ivL1GHgFIUwPehjGQKnU
	oe5X/djf3PL/3ln8LfpEuT/I7c72wtckco8NR4zJgt5hVMDdxB+PymsgJyMKnO3W
	CN7VDkqJSAclcw4WejqMzSYoXuAvIcDos79cSxTmen9gHCsiy8gJL/b1jb9WpRjk
	gug8jOV8Ec3sM7/2st9VYt2rJE7XSOTcac44hI/xgaqoLNUnQZxDo1r6CtlbVcEN
	pL/A0g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyyhga6ry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 19 Mar 2026 05:44:55 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2aecfe69196so4286175ad.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 18 Mar 2026 22:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773899094; x=1774503894; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ampQRXpUK/R8dpg2C3wASpItLjwceLYCOODrGNFGjZw=;
        b=i6JarO/NL2ANNLNaQ4XrfaCGLQl3H67QVz14kl2kFP2KE2Gpb9ordCZzfa5SYjo+Z8
         PB8O/5LQqyL1zb5uku1bTD6zSvLFz8MGbLEtANK8I897OoKfBg0Aur4pY3FCHHPi3RNj
         mlE4/j8m4TAm4Kpra+Q2hzohr2yhoZxIdfmwyPyJEJ8qdLfmlrD50WWTp55jnADvi6Q0
         iZw/zRUCVZiB29bGQdwSETX1U7wDEazp3I7cM9eoApBVTSWDRCziFdQmxMlw3HgUPDss
         ABj/45W5+N53XACYoO+T4eKIbrjS98+sumuHpmKnh0RkdEV6rPsDMnWTOMRYT6T69aCx
         yNfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773899094; x=1774503894;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ampQRXpUK/R8dpg2C3wASpItLjwceLYCOODrGNFGjZw=;
        b=RAgrvRl+uVXL4GWfPPJ9iy1SUh4x98KFjUolcqKQh1m3YYW0bcLvjbFf5h61485OUH
         vNrYN45HRqI77FT23yYeot2/Q91IODCXuCjNQFgj6py1xPj2Q8IOxXggnP8jv7LEqJha
         vdKDz0AWVSReTJzI+FReAcqrr5rVo2Lqghf/MrYYTMO1v6FE7k9ug6kbQyjS8SHSrxze
         1juCdpQPxiGd9wvauJ5eoK5bXHGJxbWfxPJHDecFQ9ZL4Tau+xzmVP/5vRzCg8pHYgMv
         QSOXLdulB9QqDtkNKE+3aCt4UCvac4xV69u0s0hvHVXqBBiIK8WV+e9Shp9egSDZJWwi
         NQwg==
X-Forwarded-Encrypted: i=1; AJvYcCWIHEPJUr+eVAKFwTDzG5b/B3tsXHVCwifzZ7Bqz9XemTNe3B4dsdgYtrv33z86lYnqd0dtMFyLSm6AbHaL6kVI@vger.kernel.org
X-Gm-Message-State: AOJu0YzbG/sOe2u9ZKwc9D3mcjWBjG5VUJOIr7rpcPEU+tV3P7mrUcZh
	/sXq/rk+tLrRNA4Y0BkXvhzDE1ZjuUWFKudCLgmgsfeLkknFAoSmwsrQVO/+8xYEud+rHdLRNxW
	9FB+smH0AkM9IhWrh4AFV0F3C1OvIdVPzaQ5J6g1IoxcVAC0+vUYMymqn3ybVKy9Pqs0id/D4
X-Gm-Gg: ATEYQzxPG/kYevcj8G6rYcClRBjs4DoIfYcyCZCVp9lGe93CFoYD+xMD1knRH2uLXA0
	lK2Hgz+bwEuwcvrx1B+wJM6ZHGusKfQ497dKkwdM8hrJ+IpEnQYC9NmI1N/0ezVDB6Mn1xCGDyy
	6XCwcty+FUR6wJshnmBTylZ/f1eeQCYuO0JWu1A4Yu6pn9BaG6gAqOn7D5hA2UL8k6BxwmmI20x
	gOjFYyng1GBVtwaL8248LeF/FxnCBeUFQeMIoa+4tcRsZxHIvtUkEe6jy39lTixGIoe0pfXKCoK
	3D+xiAExeDdwy3vLZrbEXDO3FronSW2Z0FQFHxcmpvWvxiyAVfXPT/F5OyZ1MEWK0eh1jQzZHM2
	8yJd780zLiRvVDDYAEJTtrtMfiIO+wwktwjOvUi+Sqi76fiPTHn2aYQfVpMRHRrYS8k6dyzLbBf
	/htblfTLyUFLFHTinG
X-Received: by 2002:a05:6a21:3d84:b0:39b:9aae:fa01 with SMTP id adf61e73a8af0-39b9aaf5283mr4413788637.60.1773899094376;
        Wed, 18 Mar 2026 22:44:54 -0700 (PDT)
X-Received: by 2002:a05:6a21:3d84:b0:39b:9aae:fa01 with SMTP id adf61e73a8af0-39b9aaf5283mr4413769637.60.1773899093879;
        Wed, 18 Mar 2026 22:44:53 -0700 (PDT)
Received: from [10.133.33.168] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c741e543d25sm4068895a12.20.2026.03.18.22.44.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 22:44:53 -0700 (PDT)
Message-ID: <ef36a946-ba7d-4588-b94f-4287f3ea6105@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 13:44:48 +0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/7] remoteproc: core: set recovery_disabled when doing
 rproc_add()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com>
 <20260310-knp-soccp-v4-5-0a91575e0e7e@oss.qualcomm.com>
 <CAMRc=MedT32COu-B_TsrN+jCrHjde2v5gnA6WOUmMQ2dEBY6WQ@mail.gmail.com>
 <ce24a2sgg4b6wymoxwgl2ve6np2nxn2wuxfqxfpmvqqrpvgouf@xihd6ziqwu4m>
 <CAMRc=MfRxhXXdAEX+Gm-vJbQGJZ7QRL6RM2CbhcLiqicyvftdg@mail.gmail.com>
 <ymo3kf4bsaz5yh4uwpk6dapfuzujepru3szaa4ujge7vtv43ka@skc5xgejj6aw>
 <9bdc6b6d-ddf0-47af-b1ed-8d1e75bf30c2@oss.qualcomm.com>
 <c6qnvfiknlaofts2kdahbaweiufqitnuni6bhqoxznhxp5zdto@m4i5thd57wx7>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <c6qnvfiknlaofts2kdahbaweiufqitnuni6bhqoxznhxp5zdto@m4i5thd57wx7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA0MiBTYWx0ZWRfXyqgI9L/epV1x
 6fAZ14UuAu60985H3TLeK+cM2uFvbd9BD3qOIHk4Baz6WZIsYd/VfL0M/lUpmnjcqS8WxK5zZ74
 T2YxB9bCLG5AjAjURF9n6iv50mDGgtdBR1jYc5IN/jbs8gVoheW13mH3MVqHXoNbxoIpBORhDI2
 O2TZqjGEfIrEvaEpMe3JgCbij7TNQVF/GZa8fKXsp3kK4G7V9PCSChRw3k5i2usrER36SNstkPX
 hs1C9ZsjxFWTJFO8ll/EX6LyUecqQ1Yem5UfqU/eYo88LdboyW3lKBjToy61SXwVMwonJ7CPHyG
 B/kEsz5D4ATtgnhRAHgXzvxWphVf3jDvDvV/wiSiIBCIz21FLrXAdwjTZg8ImDDtROVvP6Ytqhy
 98E69VnRLy02NGMS8k+5jDaY4vATK5oNJQLA2M22/VTcif2qWv1Z9m0gM1U/vYnpJjzLdZQHobx
 u/PbmgyJp9V0ISqcC8g==
X-Proofpoint-ORIG-GUID: 7gUrszLoMXMi_XYQzmlQL4DZ13AsZZ44
X-Authority-Analysis: v=2.4 cv=IbSKmGqa c=1 sm=1 tr=0 ts=69bb8d57 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=rNVI97BeOdma3RHj8UYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 7gUrszLoMXMi_XYQzmlQL4DZ13AsZZ44
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 clxscore=1015 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190042



On 3/19/2026 1:23 PM, Dmitry Baryshkov wrote:
> On Thu, Mar 19, 2026 at 12:36:15PM +0800, Jingyi Wang wrote:
>>
>>
>> On 3/13/2026 10:37 AM, Dmitry Baryshkov wrote:
>>> On Wed, Mar 11, 2026 at 01:39:50AM -0700, Bartosz Golaszewski wrote:
>>>> On Wed, 11 Mar 2026 03:11:42 +0100, Dmitry Baryshkov
>>>> <dmitry.baryshkov@oss.qualcomm.com> said:
>>>>> On Tue, Mar 10, 2026 at 06:50:30AM -0700, Bartosz Golaszewski wrote:
>>>>>>
>>>>>> Ideally things like this would be passed to the rproc core in some kind of a
>>>>>> config structure and only set when registration succeeds. This looks to me
>>>>>> like papering over the real issue and I think it's still racy as there's no
>>>>>> true synchronization.
>>>>>>
>>>>>> Wouldn't it be better to take rproc->lock for the entire duration of
>>>>>> rproc_add()? It's already initialized in rproc_alloc().
>>>>>
>>>>> It would still be racy as rproc_trigger_recovery() is called outside of
>>>>> the lock. Instead the error cleanup path (and BTW, rproc_del() path too)
>>>>> must explicitly call cancel_work_sync() on the crash_handler work (and
>>>>> any other work items that can be scheduled).
>>>>>
>>>>
>>>> This looks weird TBH. For example: rproc_crash_handler_work() takes the lock,
>>>> but releases it right before calling inspecting rproc->recovery_disabled and
>>>> calling rproc_trigger_recovery(). It looks wrong, I think it should keep the
>>>> lock and rptoc_trigger_recovery() should enforce it being taken before the
>>>> call.
>>>
>>> Yes. Nevertheless the driver should cancel the work too.
>>>
>>
>> Hi Dmitry & Bartosz,
>>
>> rproc_crash_handler_work() may call rproc_trigger_recovery() and
>> rproc_add() may call rproc_boot(), both the function have already
>> hold the lock. And the lock cannot protect resources like glink_subdev
>> in the patch.
>>
>> And there is a possible case for cancel_work, rproc_add tear down call
>> cancel work and wait for the work finished, the reboot run successfully,
>> and the tear down continued and the resources all released, including sysfs
>> and glink_subdev.
>>
>> Indeed recovery_disabled is kind of hacky.
>> The root cause for this issue is that for remoteproc with RPROC_OFFLINE
>> state, the rproc_start will be called asynchronously, but for the remoteproc
>> with RPROC_DETACHED, the attach function is called directly, the failure
>> in this path will cause the rproc_add() fail and the resource release.
>> I think the current patch can be dropped, we are thinking about make rproc_attach
>> called asynchronously to avoid this race.
> 
> Isn't this patch necessary for SoCCP bringup? If not, why did you
> include it into the series?
> 
yes, will squash to soccp patch in next versoin.

Thanks,
Jingyi

