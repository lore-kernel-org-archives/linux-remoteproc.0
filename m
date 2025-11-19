Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180A232D0ED
	for <linux-remoteproc@vger.kernel.org>; Wed, 19 Nov 2025 12:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763555211; cv=none; b=K0l0KL3vTFpsmDxTvLhCxKPFoEmK1+IKB+r4xBrgLrq7Amgq2AxrWYc5HPQ/u1ZxS301RyP2OHqzfXz9HNCBWbayFBf0iIwMfXQFuGsb6mCOXCqPUiB6ESu3xx22/PCv13ckNnI2C+pRElCiVe1kdWQeVaoBQ7Z/OzBSC7Qy5jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763555211; c=relaxed/simple;
	bh=weyG2dlKGtRAbyN5stHnrbj9m8vbQ8JyrDmvu8QXKM0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FbDoLQZMSU9RCC9YlGnSCIljQOiGG8U5pWvWCK5Liapzr+Dk0ADMjVbxWmn1LaOJBCmPNt6wq1EqbS4RHjrwDhj36hTWdLtw5//Tbn/iw2TfuRNlBjCZj271xj6Nb4oWGR+4MS4RsxdN4JM3nuxoYjOj1TySkQcwnJMgsglHf6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Av7dxAXE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fcemuczl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Av7dxAXE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fcemuczl"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJB0rbA3165141
	for <linux-remoteproc@vger.kernel.org>; Wed, 19 Nov 2025 12:26:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0XVIySftn+0nM+C1qYMYzdILE0aVCik77KzHWEurOrY=; b=Av7dxAXE3RYqIae4
	SQYxumGwjI+riokFYNZVFkHz6APwUtyyyJ0APoucaQbn2swAjSBX2+krozmpjrxn
	mLVDFKEPs1pgfF4oQ9LwbIH2hlmq5p9KfPuvp0Uj96YZB/uqBROt6CGt/Dfgu5cO
	K9T4CTnP1XAHbcZug5BndKkSmHi+QHsXo77Kw5aVev6Slrg3Bwad4TzNBbTcUaS4
	E82bkpzUDgXgsHq0nPoXkcfolksDPiWSbNCeevFZkmmCtA1SKMFx2N/aH4TD5t/t
	bBriASaw1vdRe2NNAvcdXKlmra1ggTbRiIC9Sr/LEUNaG55coEB2D0xTgXQCyjwJ
	z7FNow==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agvqgu4r2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 19 Nov 2025 12:26:48 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29557f43d56so83070965ad.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 19 Nov 2025 04:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763555208; x=1764160008; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0XVIySftn+0nM+C1qYMYzdILE0aVCik77KzHWEurOrY=;
        b=FcemuczlzaYjsN5IiyvGIMdKLZJ0aoS6DhjomD96eOoNoSoUr+1eFsnITC/HnZHsl1
         q7SNQAGuAxlxD2Bxp82xKrzVjuD8ERtl0VrYWkvc3zetv31Eh3NIC1GVvrWBHR1DcgpJ
         4YL3os1Yfbiy9dwrb5O6l/ng30jbBdj3/IrFj5N8O+lXhZECXh64eu6Anu6b9t9t8pFh
         w62PGjWN6NMoBAR/GUIDKgNNecrme5XoRuOjTWn5BKI7S+mKQxcUAjg0SvXoZQUTS0rx
         kNr3pxwOaMMKAgpfQkHFTgfXxtXM2xaqd9LLm8vD64Gqy4lKl/5GE9oiB+B+bGdNmqYA
         +bgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763555208; x=1764160008;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0XVIySftn+0nM+C1qYMYzdILE0aVCik77KzHWEurOrY=;
        b=JLGnWn8ZHZNjv5yBFoaVP0TEc1U+cSBHtxOmgYlkA/EWarngin9ytvJa0ErVYGqch5
         hhj6sjfo/V8tAxfCvQ3+BaOWT4hCBhulBpIIXkOjZk/7UR1gb64f7f1ZHb7MggQOSAUl
         r6Ye3vXtWe7nUedZc+9DLjAnMseT4X4EmcV+xgY2d6J1zbcYbnRJRza2h0QzzufCLNvI
         3m2xY5VsU+m2LoQE+miwhtdY12ijrokYs3mMNsNr7FFMsatL82B+KuwfbjJyAXR82BYI
         3EBqPE0+LVc8ZPHzUOawX+YTy2eC17+Lpn/QLbuS6DVgJSxXRqMuD+hFRjutOrCoR+mV
         LLyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWH56Yub3gf0+tVO032rYIDZlRyloa3BhhDVpElBROoXzcdbjt/X9Wr5Qdb5w8P6C6KUSbKY3kEGEI1vKjmJUk7@vger.kernel.org
X-Gm-Message-State: AOJu0YxzOrB5yjkRd2S5RDucNoTPguPRCDw8XW+47SRPy8yNSkRYWcJE
	eVB0hQhywFbqub1TePImFDpHJHNmrzoA0J66hsGOg0Gxbfwet+ZIqKOpsoVEEq5WzAtf4+4r6yv
	00B7hQwM7SiAgWPH7+7wUZWTaf0Gg4UeiawqlUkh7SaQm4Wz3uuWDp+DfkcJ03z0++LLp2TXA
X-Gm-Gg: ASbGncu8fbBI39E1BBtB0UOwKmLa5jDFrGcu5a2Q44i9ydwpdxe0hwkCMBJqmzgVIfX
	svuZ5THMFvS16bWdg0O9zNjFwzo9OG7Syqk1RlekjHb6+wURfjX3dIGLwJgzy6nldEi7EaSjFol
	A9TRQrX1xegHm/HYSvDzZJ7NPWN+lDPtcKuVt7ReQJAEXpGXi8OB/SHJ0gfLaec6wegdrXOshvi
	N02pPLLeAmqbWy1SMzxgNpX2CyHXOtE8xmm9ta2Of/APnvF29gHCILeLRPl3nWgIT5qxjTFIatr
	cmrVHuWaAC890mHYIOivGwdbfqbTqrsB4mZ3zXQAuG5l10OV5suAtdYkzdD0REChIdPr00nH6eV
	cbvppFK+Ob0yClrvFG+PVZWlVLCfobRmeNZiFKbALch2Pa+K2hJLq7LzeYT9jyFcYQ1Vir1fmIY
	awgIoTrw==
X-Received: by 2002:a17:903:1a2e:b0:295:f508:9d32 with SMTP id d9443c01a7336-2986a733373mr257392675ad.37.1763555208256;
        Wed, 19 Nov 2025 04:26:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE3LZqo4LlXAuwvaG8Yy0AtlAycmQh4yQTvkn2BySJDCneZdFBHWMjiBp/5a/eWYpgEtzvHrg==
X-Received: by 2002:a17:903:1a2e:b0:295:f508:9d32 with SMTP id d9443c01a7336-2986a733373mr257392345ad.37.1763555207715;
        Wed, 19 Nov 2025 04:26:47 -0800 (PST)
Received: from [10.133.33.195] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c249806sm204490545ad.44.2025.11.19.04.26.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 04:26:47 -0800 (PST)
Message-ID: <9494f76b-0cd1-42be-9f11-2a5b82e76e6d@oss.qualcomm.com>
Date: Wed, 19 Nov 2025 20:26:42 +0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] rpmsg: char: Fix WARN() in error path of
 rpmsg_eptdev_add()
To: Dawei Li <dawei.li@linux.dev>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        set_pte_at@outlook.com, zhongqiu.han@oss.qualcomm.com
References: <20251118154107.3100-1-dawei.li@linux.dev>
 <20251118154107.3100-2-dawei.li@linux.dev>
 <38308885-af2e-4b61-9653-00bfca8ca0e9@oss.qualcomm.com>
 <20251119105612.GA4907@wendao-VirtualBox>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20251119105612.GA4907@wendao-VirtualBox>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8gmviSl7I9VPZP-s4rWoSFSKqDSDE1ZW
X-Proofpoint-GUID: 8gmviSl7I9VPZP-s4rWoSFSKqDSDE1ZW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDA5OSBTYWx0ZWRfXxyFeuOBbKINQ
 nb/7Dnlwm6XuUtDJk40helWxAqaUijHcUWlKVayly2sMQZCCJ3ncC1fja16QHy6u88e+UQiWIYb
 1UeMkKQG3LXX1zZqcUXEvHPQRSX9p5oSyfJoU1rjSHw5kmETw1YFh771pq5qGmStXeniovr0xEs
 xruw2Rp4py7WUMMUhu/fqezMrZTQsSPwPORO9mlpdj14Q2xCmhqhTFsByYWV+oMjqI+0Wu/vvvI
 lIVBncsTyE2Nax2q9rIcxOj/b9KJAqpEcKcMFvcfz4/mtxx6g56jeHqEZ0G1s/BxRDUoZVla3r3
 r+LC1JGTww5r2KVdLs+BXNCyvg8AHg6Rdqn8PT/wUXz/p418uF2zr5lPkIPoLQNTD6rQITo1b0W
 YlsVymk3Ext4VobUoIt+tV6FksGYxA==
X-Authority-Analysis: v=2.4 cv=LMJrgZW9 c=1 sm=1 tr=0 ts=691db789 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=lmGg8attZ2iu3pFIaBsA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_03,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 suspectscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190099

On 11/19/2025 6:56 PM, Dawei Li wrote:
> On Wed, Nov 19, 2025 at 12:07:02PM +0800, Zhongqiu Han wrote:
>> On 11/18/2025 11:41 PM, Dawei Li wrote:
>>> put_device() is called on error path of rpmsg_eptdev_add() to cleanup
>>> resource attached to eptdev->dev, unfortunately it's bogus cause
>>> dev->release() is not set yet.
>>>
>>> When a struct device instance is destroyed, driver core framework checks
>>> the possible release() callback from candidates below:
>>> - struct device::release()
>>> - dev->type->release()
>>> - dev->class->dev_release()
>>>
>>> Rpmsg eptdev owns none of them so WARN() will complain the absence of
>>> release().
>>>
>>> Fix it by:
>>> - Pre-assign dev->release() before potential error path.
>>> - Check before ida_free() in dev->release().
>>>
>>> By fixing error path of rpmsg_eptdev_add() and fixing potential memory
>>> leak in rpmsg_anonymous_eptdev_create(), this work paves the way of rework
>>> of rpmsg_eptdev_add() and its callers.
>>>
>>> Fixes: c0cdc19f84a4 ("rpmsg: Driver for user space endpoint interface")
>>> Signed-off-by: Dawei Li <dawei.li@linux.dev>
>>> ---
>>>    drivers/rpmsg/rpmsg_char.c | 26 +++++++++++++-------------
>>>    1 file changed, 13 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
>>> index 34b35ea74aab..373b627581e8 100644
>>> --- a/drivers/rpmsg/rpmsg_char.c
>>> +++ b/drivers/rpmsg/rpmsg_char.c
>>> @@ -408,8 +408,13 @@ static void rpmsg_eptdev_release_device(struct device *dev)
>>>    {
>>>    	struct rpmsg_eptdev *eptdev = dev_to_eptdev(dev);
>>> -	ida_free(&rpmsg_ept_ida, dev->id);
>>> -	if (eptdev->dev.devt)
>>> +	/*
>>> +	 * release() can be invoked from error path of rpmsg_eptdev_add(),
>>> +	 * WARN() will be fired if ida_free() is feed with invalid ID.
>>> +	 */
>>> +	if (likely(ida_exists(&rpmsg_ept_ida, dev->id)))
>>> +		ida_free(&rpmsg_ept_ida, dev->id);
>>> +	if (eptdev->dev.devt && likely(ida_exists(&rpmsg_minor_ida, MINOR(eptdev->dev.devt))))
>>>    		ida_free(&rpmsg_minor_ida, MINOR(eptdev->dev.devt));
>>>    	kfree(eptdev);
>>>    }
>>> @@ -458,6 +463,8 @@ static int rpmsg_eptdev_add(struct rpmsg_eptdev *eptdev,
>>>    	struct device *dev = &eptdev->dev;
>>>    	int ret;
>>> +	dev->release = rpmsg_eptdev_release_device;
>>> +
>>>    	eptdev->chinfo = chinfo;
>>>    	if (cdev) {
>>> @@ -471,7 +478,7 @@ static int rpmsg_eptdev_add(struct rpmsg_eptdev *eptdev,
>>>    	/* Anonymous inode device still need device name for dev_err() and friends */
>>>    	ret = ida_alloc(&rpmsg_ept_ida, GFP_KERNEL);
>>>    	if (ret < 0)
>>> -		goto free_minor_ida;
>>> +		goto free_eptdev;
>>>    	dev->id = ret;
>>>    	dev_set_name(dev, "rpmsg%d", ret);
>>> @@ -480,22 +487,13 @@ static int rpmsg_eptdev_add(struct rpmsg_eptdev *eptdev,
>>>    	if (cdev) {
>>>    		ret = cdev_device_add(&eptdev->cdev, &eptdev->dev);
>>>    		if (ret)
>>> -			goto free_ept_ida;
>>> +			goto free_eptdev;
>>>    	}
>>> -	/* We can now rely on the release function for cleanup */
>>> -	dev->release = rpmsg_eptdev_release_device;
>>> -
>>>    	return ret;
>>> -free_ept_ida:
>>> -	ida_free(&rpmsg_ept_ida, dev->id);
>>> -free_minor_ida:
>>> -	if (cdev)
>>> -		ida_free(&rpmsg_minor_ida, MINOR(dev->devt));
>>>    free_eptdev:
>>>    	put_device(dev);
>>> -	kfree(eptdev);
>>
>>
>> Hi Dawei,
>>
>> Thanks for your new version~
>>
>> Patch 1/3 will introduce a use-after-free of eptdev in func
>> rpmsg_anonymous_eptdev_create(),
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git/tree/drivers/rpmsg/rpmsg_char.c?h=for-next#n548
>>
>> even though this issue will be resolved in 2/3. However, 1/3, as an
>> independent commit, should not introduce a new bug.
> 
> FWIW, it's not new bug introduced by this commit, it's introduced by
> 2410558f5f11, which is supposed to be fixed in patch[2/3].

Hi Dawei,
I checked commit 2410558f5f11 and see that the issue existed before this
patch. Thanks for clarifying,


> 
> And new reorganize of series is trying to address the comments from
> Mathieu[1], If I understand it correctly.
> 
> Bjorn, Mathieu,
> What's your inputs on this? I will respin v5 if you find it necessary.
> 
> Diff between v5 from v4:
> patch[1/3]: Remove dev_err(&eptdev->dev) from rpmsg_anonymous_eptdev_create();
> 
> patch[2/3]: Bring back dev_err(&eptdev->dev) to rpmsg_anonymous_eptdev_create();
> 
> [1] https://lore.kernel.org/all/aRd8mDzQWXtEFnmt@p14s/
> 
>>
>>
>>>    	return ret;
>>>    }
>>> @@ -561,6 +559,8 @@ int rpmsg_anonymous_eptdev_create(struct rpmsg_device *rpdev, struct device *par
>>>    	if (!ret)
>>>    		*pfd = fd;
>>> +	else
>>> +		put_device(&eptdev->dev);
>>>    	return ret;
>>>    }
>>
>>
>> -- 
>> Thx and BRs,
>> Zhongqiu Han
> 
> Thanks,
> 
> 	Dawei


-- 
Thx and BRs,
Zhongqiu Han
