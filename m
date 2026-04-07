Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D45270540
	for <linux-remoteproc@vger.kernel.org>; Tue,  7 Apr 2026 02:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775529637; cv=none; b=nyo/4N99//wMnAmMVi/MHgThr1a7Em7jhBgN+klBXqFnPz2+vmUaBVoXz80RKmV5Uj8/Y8vwdkwt8QbH9svzuhOtHy7TJB1NuGx2xjse7UcJhJu3c77ISzYYFH4A5dZcKjKXqjaCC+sQ7760ekdWQBam+n6qvYHhzn+lJ54mtVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775529637; c=relaxed/simple;
	bh=6nLuycy9ugL1PICvbpZ1+CdVUuin2IvkNY5gP/mgO6o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LizG75cd59ARaRH7v7VLT42cMgZvBO69jKeJWf7asaBSkVRsTAnqeYWYsu5SHz+3yf8qiqFue/qQPZHzAw/nMMweULvZiV4nqPcMi3GORSE8184ptiHr4vCBNQjMv0jnwC1143EZlP/qp5jtkOW3lJ6+p8c+pwxHjBt0F3TZbhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FraAhuGX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jYzLRmso; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FraAhuGX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jYzLRmso"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LQ0sm1403541
	for <linux-remoteproc@vger.kernel.org>; Tue, 7 Apr 2026 02:40:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0sxWiIfGcKWwZ0QvbsOJvsjsTrks99xzrJstDrIFAZE=; b=FraAhuGX0h8bJK8U
	yUTiV3UkjuVeGdijZgCFCpNHqsrgUdIZ9DZXUCw0sIVutMmaqi9sVwF1HamNbAnd
	pUiT2tpimvrn8RfNrWoM/BopFnioo2eMbsdGmELbUjtlf1cgy/KwSNmhf1lBNmWi
	imuCCz6mWPZyRBzJMoTTkT6JxB85oObSDgzGQELITTwEys9rbuyo72U3IuEg25Zh
	mD9yii3HTEcdDBKjzi78cE4hkbe5JoTPHv57QYiXMqj9MVhV/RBLsfhBhKm+TPKj
	vSVaSOnvfSYYPpBnXl2axfb5GeVwP+Hr/dx4Mmi7p9NsBz77u8KSye6u3r+L407g
	BR6+Cw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr88nud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 07 Apr 2026 02:40:34 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b24305cb3cso55591725ad.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 06 Apr 2026 19:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775529634; x=1776134434; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0sxWiIfGcKWwZ0QvbsOJvsjsTrks99xzrJstDrIFAZE=;
        b=jYzLRmso2yS5khJXVM4yyPXsidoVAX1z1sZ18wbskxjffkIfO28zIo9fRpEdiWOT1p
         p1et3CSOITQcDhXZpWGsrrAbJDLM6BAE02dZZG+9pqVySax1uSF+N/QaRvAtRQqwzLVY
         L1gr9w7E3Nkobc/5e7ri3z+w9tIQJFVBOkWCZWCglGtNR0c5gItYgLuSEzJ6QDXIuuE4
         Bc3Ev59B3UHi1ZfLhmdeQz9Q5HvCZqM/mP/cAFoEFhTVT1F4XscA0i1lcVdzgFxAi0r/
         KPRV3T7ewj5fLwVxUMu86jaqtemnaUgPild/I2KiNmNR4ffWwp89afVQ42GieUlFiRCm
         k2eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775529634; x=1776134434;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0sxWiIfGcKWwZ0QvbsOJvsjsTrks99xzrJstDrIFAZE=;
        b=qsFPFcj5wHa+TWrcnZvgNtTsnn5gtdZXMuDMuMaMnIUGUORvGGZbPWk5Q4oVIOfF+N
         PfhgWx9WTpFJK5/crHAq0Fj4sX5bBQlaOazQvR68GTfoL8B8X3e3VKHebu1sQulSNZf8
         zpULTg/WVOrQLP6Y6aLX+ysOIhRzihKYY14ZZCHkWhb85udbdr/R7fsFGpYeKTVnPcpH
         H6bWqPBIrOj0SV/PcehxR2BNs+PgXkC9A+++Za7wkZs5OQpQ4RXjvmm1dyYyxNo0NKWf
         Nkk5w3LYMflQBtd3STLCcII6U8bya7bqKFkmfHNgxgCDKpZyLEhtcmYDcnmungXROvWq
         C6Tw==
X-Forwarded-Encrypted: i=1; AJvYcCWSnfNTWJvQTzIZKqSJNQ9Adqk0DKx/7ZR4k+ZaOeEuoWnRbyppYycDah1L1VYape42BMClwF2aAqNmZHYzoWXa@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf0mLbX5nzTEXnC9J5cs4LGai67lqpEeG7A6InXbrTXzqQs7LO
	EMvVUowBeusvRlyc0afA2fTBlGtRbmN7hrDBVO0r3RJ0QU34+EnlIuQUPjgKx44haOVPZpYjLqf
	HCu8qMMFyLugcgOel3MJQMjjQhPVvYUikmlK80VESWrlQZm1HsGCr5Ka2dDQQ3QVUJqeOPxJs
X-Gm-Gg: AeBDievlGyivuJuGtswo71IqjSdvrqeJTVek9PNL4H2W0bGu145mj6z46vvNB3PinYU
	v837eTvXLAp4uSoi4puEHRi/jUWQPk1oWtIbAIg+oSR6R4f4SNMEpMNjMg/GGjcxJeFiF3F9OyV
	RyIh1nNXj8qZJ3ID121P8lJGqedkaj40XzAchJpH2fsq0gUWn6y2NeJZUTGsFNq8DB/LKFAkwjq
	tblhRmV8Br3c4arxvE4VkRpcey+yufGfNS+CxJX1zCcA0JdkRc6gtQO15bO40/eiPQcX+j8RI+S
	L77fOtnkYvpCu8gerwi+QzWT79yJcpUmZKAX9MwJl8PdjIMqgGL2F+HecMVX91tLN4D/0ykjwXy
	YlONhnXCXD1Um+rU6LPP+/LlILGnzhItoVLeMqkGjIN8H2zwE1gj/C5ipJJylyoC+Mn0/qImqw9
	dw6Ucw1JO246Oycnk+
X-Received: by 2002:a05:6a20:9389:b0:39b:e9e1:699f with SMTP id adf61e73a8af0-39f2eda70ebmr15601199637.12.1775529633686;
        Mon, 06 Apr 2026 19:40:33 -0700 (PDT)
X-Received: by 2002:a05:6a20:9389:b0:39b:e9e1:699f with SMTP id adf61e73a8af0-39f2eda70ebmr15601152637.12.1775529633148;
        Mon, 06 Apr 2026 19:40:33 -0700 (PDT)
Received: from [10.133.33.209] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c65935cbsm13954195a12.26.2026.04.06.19.40.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 19:40:32 -0700 (PDT)
Message-ID: <9b1bd10e-5ddf-4f35-be6a-cde4f157fd40@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 10:40:26 +0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/7] remoteproc: core: set recovery_disabled when doing
 rproc_add()
To: Bjorn Andersson <andersson@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
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
 <ef36a946-ba7d-4588-b94f-4287f3ea6105@oss.qualcomm.com>
 <adPLDWz6_QmBa8w1@baldur>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <adPLDWz6_QmBa8w1@baldur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: NA71CVKVdPJtYXrFRI9TN_K5mCso4i-C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDAyNCBTYWx0ZWRfX/wZmRLNcf9Iu
 gg6GoFhKp3l2C0rf3r0XhttzUkI+KTs/GQh+fJk70P9ujj2pxMqr+CZOT164gL6nmRqL6iikH3/
 Jv8h7Wfzb1RCCDjW/4XPb47r9OGdmL3F319u8MSrhwThmMHIo1ktv1gv3AZyp9t6jrW2jr/oL+8
 K2X67QnB9c/QuF3iUC+xZMnGspS02oe41SxFMdLEds/Y3/6+sZQgqJ4Y2gzJFgVuRNmAqG04dwE
 r9RjkEjmJ/jVDDLx3jvik6uZhnREi0s0cC5kFaCl8WRafOvhYXauumq06V9adSjpwHlgMatshCu
 +LqE8cHwpNGKBrIKUo5NW0/knYxL7TWLpe5qMzdL/m8ekTxkKd1SJKVgujeWBJ1ZNC3KNTRDlZ7
 6Sj6pa4/8uD2ByIuS6GPSdDot+pe8rtzCXf7H3fvC5cvgYDRyN0K4QEjsf5Xyd/8o5plxEOCeQa
 3sFkQLvCYIZcfxHP7Ew==
X-Proofpoint-GUID: NA71CVKVdPJtYXrFRI9TN_K5mCso4i-C
X-Authority-Analysis: v=2.4 cv=A/hc+aWG c=1 sm=1 tr=0 ts=69d46ea2 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=jyXJO2DQ50KPEQLR6RgA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_01,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070024



On 4/6/2026 11:04 PM, Bjorn Andersson wrote:
> On Thu, Mar 19, 2026 at 01:44:48PM +0800, Jingyi Wang wrote:
>>
>>
>> On 3/19/2026 1:23 PM, Dmitry Baryshkov wrote:
>>> On Thu, Mar 19, 2026 at 12:36:15PM +0800, Jingyi Wang wrote:
>>>>
>>>>
>>>> On 3/13/2026 10:37 AM, Dmitry Baryshkov wrote:
>>>>> On Wed, Mar 11, 2026 at 01:39:50AM -0700, Bartosz Golaszewski wrote:
>>>>>> On Wed, 11 Mar 2026 03:11:42 +0100, Dmitry Baryshkov
>>>>>> <dmitry.baryshkov@oss.qualcomm.com> said:
>>>>>>> On Tue, Mar 10, 2026 at 06:50:30AM -0700, Bartosz Golaszewski wrote:
>>>>>>>>
>>>>>>>> Ideally things like this would be passed to the rproc core in some kind of a
>>>>>>>> config structure and only set when registration succeeds. This looks to me
>>>>>>>> like papering over the real issue and I think it's still racy as there's no
>>>>>>>> true synchronization.
>>>>>>>>
>>>>>>>> Wouldn't it be better to take rproc->lock for the entire duration of
>>>>>>>> rproc_add()? It's already initialized in rproc_alloc().
>>>>>>>
>>>>>>> It would still be racy as rproc_trigger_recovery() is called outside of
>>>>>>> the lock. Instead the error cleanup path (and BTW, rproc_del() path too)
>>>>>>> must explicitly call cancel_work_sync() on the crash_handler work (and
>>>>>>> any other work items that can be scheduled).
>>>>>>>
>>>>>>
>>>>>> This looks weird TBH. For example: rproc_crash_handler_work() takes the lock,
>>>>>> but releases it right before calling inspecting rproc->recovery_disabled and
>>>>>> calling rproc_trigger_recovery(). It looks wrong, I think it should keep the
>>>>>> lock and rptoc_trigger_recovery() should enforce it being taken before the
>>>>>> call.
>>>>>
>>>>> Yes. Nevertheless the driver should cancel the work too.
>>>>>
>>>>
>>>> Hi Dmitry & Bartosz,
>>>>
>>>> rproc_crash_handler_work() may call rproc_trigger_recovery() and
>>>> rproc_add() may call rproc_boot(), both the function have already
>>>> hold the lock. And the lock cannot protect resources like glink_subdev
>>>> in the patch.
>>>>
>>>> And there is a possible case for cancel_work, rproc_add tear down call
>>>> cancel work and wait for the work finished, the reboot run successfully,
>>>> and the tear down continued and the resources all released, including sysfs
>>>> and glink_subdev.
>>>>
>>>> Indeed recovery_disabled is kind of hacky.
>>>> The root cause for this issue is that for remoteproc with RPROC_OFFLINE
>>>> state, the rproc_start will be called asynchronously, but for the remoteproc
>>>> with RPROC_DETACHED, the attach function is called directly, the failure
>>>> in this path will cause the rproc_add() fail and the resource release.
>>>> I think the current patch can be dropped, we are thinking about make rproc_attach
>>>> called asynchronously to avoid this race.
>>>
>>> Isn't this patch necessary for SoCCP bringup? If not, why did you
>>> include it into the series?
>>>
>> yes, will squash to soccp patch in next versoin.
> 
> I'm sorry, but that doesn't make sense to me.
> 
> The SoCCP patch adds support for attaching SoCCP. This change tries to
> address a generic problem shared across all remoteproc drivers (that
> does attach?).
> 
> I think you should interpret Dmitry's comment as "why is this part of
> this series, please fix this problem in a separate series".
> 
> Regards,
> Bjorn

Sorry I might misunderstand this comment, this patch only address problem for
remoteproc that does attach, I will send a separate series to make rproc_attach
called asynchronously

Thanks,
Jingyi


