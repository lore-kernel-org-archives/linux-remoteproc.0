Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60DA334B1AC
	for <linux-remoteproc@vger.kernel.org>; Thu, 19 Mar 2026 04:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773894986; cv=none; b=fKl1ZedSgoLH2+yiwxTEoNbsnhy0/tG8zqEjbdgOVWMv0fxD7WLBlTcpBxY+CKNXA8Gq0SmW334bkcEyknQ7NG1EA5Du87yqfGihYINrzYAc6x6epDquLQOZGU7dsbAX+Q6ApFF93a9OUOHW4Knb22OVFMJYdASqUCfYBAeXNho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773894986; c=relaxed/simple;
	bh=3cvQrCwXJOWrGoiE6LKWnIc8rg0AExKcczPTqdkd/dM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MJ0PwhwWp7J0a9LMmilYiS0dFSG2OuN4mGr1I2D3EzYUaDBzz74bZkDsrwbZDtQ6XniyxOJH697IDDZRvd5bUIFWcF3NtOdBFweyrqxpzNL6xDe0Xbu6lrRB8cHGs+SURdRkHdfZ3XXlisOdOLcHyUwqxGbjwwPPSO//CU6RKo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IKgxTF7F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WoWbZpQ+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IKgxTF7F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WoWbZpQ+"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J0XEAI913538
	for <linux-remoteproc@vger.kernel.org>; Thu, 19 Mar 2026 04:36:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mt7cpSYKm2/GL7spGWdPXjx+QWPZ+qBKA32f8+lpf7g=; b=IKgxTF7FZyYI6X7u
	rMqD494aRMfmPb8juLUL0weIKMuKQ0M/QU0ROso37FwrheQCvq6FuJfk4VtbITlC
	OZoZSr161VuU+5tgs+IAq8X0ytshMKARj7mcUSWJrO0qYMdfQODdg5pRQ3GmKFjZ
	+Ecsrc2/lIYD6hZ6A2ylBEFhzs2EauwZb/E24FRYl2/J/obemAOWPG9lMhZ/pzBc
	U++Hk3gwqJgoFDoInwi7/2DmTLocDlXu2t6YKU5CsZn5D0FWraDrCNPAZKeQd9QQ
	l7sMWWVSmADYoeFF21SuGVzE/7X7r1N0oqX807SDWmpp48In34R7VOSSOxc/ikj6
	1HtL7A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytxyu35x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 19 Mar 2026 04:36:24 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b04db6c138so7602955ad.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 18 Mar 2026 21:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773894984; x=1774499784; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mt7cpSYKm2/GL7spGWdPXjx+QWPZ+qBKA32f8+lpf7g=;
        b=WoWbZpQ+JmHud9ZiGoQv5liHV2ka0ZWua0avUO0x8eUDkhYjzFwdie8zeC96lhCWyc
         PGwaMDQNxHXdmXhFD3HltazI77k5JqBTBqlMeihs4ndDsR14eSZt+of1UjuyT5udH0/8
         MCMXFcG8SMg27lepLU+eqjLTC3oVvQHZLDIB65t40AYmEegwSBjTNIXmm/v+694dZ6DQ
         o7hk9yDCbuAhWBEZeqrxumWOmHjly10TZb4Gyc5zHsjspCgKrzlu0PnoupSMhREk86JA
         Bv5xn6VNYFVqhT0G98fPUKkms4tNVVndtv+KMSJ7kysyv77i6pqfMvhb4nV3vVBWqidL
         FwAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773894984; x=1774499784;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mt7cpSYKm2/GL7spGWdPXjx+QWPZ+qBKA32f8+lpf7g=;
        b=sOt+rHMZap8BfN+Gx3BWcDUJ1UvLD/qyPOQVx2WWANZxPMRreKuaKXOSEgJIa3cZhN
         r54fj7qcQkH40dn+MHhCtgFo7oE9lL/HvUeuY91LpCbRji0J9T1J+tki8IQ1yDlI7wq6
         2sWJcwYo32ZQiTyMx2qcF3AS3H57+USMjncmcJ3zfqcKjeZLJwahK+hngwzxOOpNYVtH
         R9e1NjpR6EgzLtlv4wLRBagpNn9wbhDwymxl/Hp/K8JVnihLv+IqJpCWy5Ci8Dyx1TVm
         YWytB/p129r+yo3PVzW6P7f0uJWd2UvzEDRKtc+a+bs15TqdYNmM7ya18v1iU3u0W9rU
         kYYA==
X-Forwarded-Encrypted: i=1; AJvYcCVJs5HzqtT6Ur2hxaXkVHSG6evQnaL6apE6MFgmeWWCk9/SFvHZu0sg8cct7je01KtNkOlb5f/BLncw7FuhbRm+@vger.kernel.org
X-Gm-Message-State: AOJu0YxXuH1zhEVimkfB1xScT2epHawLYF1k7Lmlpe7WZ3/037B9hVQj
	UB8SCasi2NOVK8GYDOXbhh6CMYibyPDLV7RSNF1jmoH1EIFL5Z2NjZideTIw3ccC4Ov3d4yfmlY
	zgD0IQ570g9i7t/8RUKOCRgmfEUP7qPE2Fsc720jgKeSEh+nVV0Al85ChFkdUfZbOaK+b4OJV
X-Gm-Gg: ATEYQzyw89k7U7iZ0uU9iyhnURUiGwVFpXPgdVNTFc5Zknj2JquP6k2JyJK8+BAjwV0
	kcivGZagyj0xaRu0CYGbYu2j7UlVP5mjcJiyhCOxRc73N7A+OIgIkuc6gbLu0qzXVOj4yKJqmoK
	gEEPsHSYy6MqVHAKAj4IUaFUPCmg6n7UjwOxi4DHznR6JZiYm1Y3PhWDNtMBwDDGwemp3ogWV0f
	7BQaN2bP6uq+7e+sIKwRL+hiQsNTrC7gRY7cJImBckSaUp6rOngaEZEEmnOXLpt8DNKSSiQDjD/
	MbJc7rPDHbsq/FHP/Sutnpt0s47r0aWLCjJ1eXJdnveUOkF5TJpIdx6Bjo94nlX6eDOZqsA+Iol
	Uaudu26GiA0kS2VjsG+7qSf67gNyeAT6Y0Z6wwSK9/YTYfhD/SX0xXnOSQcUXi/gc7W+ScTf9hV
	nT8gcKPEz6J7zjli5U
X-Received: by 2002:a17:902:d54b:b0:2ae:c7dc:95a4 with SMTP id d9443c01a7336-2b06e34e487mr59339935ad.20.1773894983820;
        Wed, 18 Mar 2026 21:36:23 -0700 (PDT)
X-Received: by 2002:a17:902:d54b:b0:2ae:c7dc:95a4 with SMTP id d9443c01a7336-2b06e34e487mr59339645ad.20.1773894983347;
        Wed, 18 Mar 2026 21:36:23 -0700 (PDT)
Received: from [10.133.33.168] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e4199d4sm46413095ad.9.2026.03.18.21.36.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 21:36:22 -0700 (PDT)
Message-ID: <9bdc6b6d-ddf0-47af-b1ed-8d1e75bf30c2@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 12:36:15 +0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/7] remoteproc: core: set recovery_disabled when doing
 rproc_add()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
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
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <ymo3kf4bsaz5yh4uwpk6dapfuzujepru3szaa4ujge7vtv43ka@skc5xgejj6aw>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RD6qsJWlFcKLRySMgNy514NC2IAg6hiJ
X-Authority-Analysis: v=2.4 cv=FKAWBuos c=1 sm=1 tr=0 ts=69bb7d48 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=UbLAXycr_9YQHWOW9u0A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDAzMyBTYWx0ZWRfX17AbG1/BVJru
 8laEutA7G2+8TD2pY6MFGgWbkuehY4krrybta8zV5RDXIwP5w6rFHVGLw6b7l+1cKb3QeZqdpbc
 SyQkJFFDL2D1kBkzKqTwAUMXcX2YSox5PCFp67edWQFaQi9c2NBxNIMXTf9yAU8t6Wz+0br2Za9
 E0JqX+rip6oGrcnBOEQO9+nh+PZj7q+dMie8EZg5jgGE+7k3uup8akBTIqNfpo0n1YtZ83RUOSj
 wHJOf3s3hIK/A3X3gSgk86HjJVzTAieqWal3g7o8/XXmYwUWLv9CV7nEB/Dnw5+ss04VmSUMsiE
 oIbj736aRft1Jqw19nSX2zlDzH6fA5rC/hBaLnIHf7F2C4l7DoSzAaIwWyOPZ9HiHcpB0krxtIp
 6r4GDGbNFsaD3Sw+x42K2hCXfIBztV47OapqCwRFbqO8SiQeQyYkIViCkzS+eur7hpVUlmk6UEl
 YVICklv5qgut8Vvw+9A==
X-Proofpoint-ORIG-GUID: RD6qsJWlFcKLRySMgNy514NC2IAg6hiJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_02,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190033



On 3/13/2026 10:37 AM, Dmitry Baryshkov wrote:
> On Wed, Mar 11, 2026 at 01:39:50AM -0700, Bartosz Golaszewski wrote:
>> On Wed, 11 Mar 2026 03:11:42 +0100, Dmitry Baryshkov
>> <dmitry.baryshkov@oss.qualcomm.com> said:
>>> On Tue, Mar 10, 2026 at 06:50:30AM -0700, Bartosz Golaszewski wrote:
>>>>
>>>> Ideally things like this would be passed to the rproc core in some kind of a
>>>> config structure and only set when registration succeeds. This looks to me
>>>> like papering over the real issue and I think it's still racy as there's no
>>>> true synchronization.
>>>>
>>>> Wouldn't it be better to take rproc->lock for the entire duration of
>>>> rproc_add()? It's already initialized in rproc_alloc().
>>>
>>> It would still be racy as rproc_trigger_recovery() is called outside of
>>> the lock. Instead the error cleanup path (and BTW, rproc_del() path too)
>>> must explicitly call cancel_work_sync() on the crash_handler work (and
>>> any other work items that can be scheduled).
>>>
>>
>> This looks weird TBH. For example: rproc_crash_handler_work() takes the lock,
>> but releases it right before calling inspecting rproc->recovery_disabled and
>> calling rproc_trigger_recovery(). It looks wrong, I think it should keep the
>> lock and rptoc_trigger_recovery() should enforce it being taken before the
>> call.
> 
> Yes. Nevertheless the driver should cancel the work too.
> 

Hi Dmitry & Bartosz,

rproc_crash_handler_work() may call rproc_trigger_recovery() and
rproc_add() may call rproc_boot(), both the function have already
hold the lock. And the lock cannot protect resources like glink_subdev
in the patch.

And there is a possible case for cancel_work, rproc_add tear down call
cancel work and wait for the work finished, the reboot run successfully,
and the tear down continued and the resources all released, including sysfs
and glink_subdev.

Indeed recovery_disabled is kind of hacky.
The root cause for this issue is that for remoteproc with RPROC_OFFLINE
state, the rproc_start will be called asynchronously, but for the remoteproc
with RPROC_DETACHED, the attach function is called directly, the failure
in this path will cause the rproc_add() fail and the resource release.
I think the current patch can be dropped, we are thinking about make rproc_attach
called asynchronously to avoid this race.

Thanks,
Jingyi





