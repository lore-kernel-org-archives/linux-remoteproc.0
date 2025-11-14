Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9433081D3
	for <linux-remoteproc@vger.kernel.org>; Fri, 14 Nov 2025 09:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763114004; cv=none; b=sbyIQDU11DkX3rSQ6flCgX14UNMY8wfMauOfierxdrnjtOxBohupSL7bu/82bY1/AnVY8Jn3yJJ2Rm4fNE5uAXQ2RwrbJw2pC05XhaOJNwrDAubrQ2teUNvQey9297Ob8rI7U4T+cBOOP8aG9jM8/sPOlTY4c55F+MhoCVooXmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763114004; c=relaxed/simple;
	bh=KfXunk/V+2Wilz0GUY3YVr3vzZr4fvOLG+oTzAvEqZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RbXUQw75bl1c/tL/TV/d7mhVidAkYV3JBk670uVFsVhg5qS1CHyTFhP9wwZSwaDbI2+zlvBqEMxCC9uZpLbL4hY2nB5ar83iLUnu71ImtbwAtBhGKrjp21SImFZ2wrcCM/OOh4eEcu8z+1gQ6SEMqAhl0VsIzR4nEffiqmI4xWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fmBPVI9x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PWL8e1rD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fmBPVI9x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PWL8e1rD"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE8Uc6h1617027
	for <linux-remoteproc@vger.kernel.org>; Fri, 14 Nov 2025 09:53:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MVbd9aoIO6IlLlvrAdA93MjVckq2AIvysPXrZEUPqfs=; b=fmBPVI9xDvyA14iI
	jTgPHBnl/PCkp3RQYqWN/BnhL5hO6BhIWEVujtekbSyKJNUX1/5qhM7/NWi7EY9k
	D30t++FQ6b8/EDEPyOvdkcoBHlJNicLTPVMSYXNXtRafrealEpFKlap3fbnFLu/+
	8aYr/7Zbva6PCgovvwGMn2+8nuv76CmXBOx8NFtRuUINGSnJ1RDi/vwcd/UFzry1
	CEvkx1qgfFecZoS6lFboRQ/bjVJnFDo5+ssGgrEFPTwPPLlp4VvOL+8PS9uG9HKa
	Ynti5Vt2VmwrW03iZF5JHj/rU4hHle0M7CJGBvn8klR6f3IO+o5XYAVhNetov8AA
	LXzYbQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9h1pja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 14 Nov 2025 09:53:21 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-297dabf9fd0so23674775ad.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 14 Nov 2025 01:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763114000; x=1763718800; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MVbd9aoIO6IlLlvrAdA93MjVckq2AIvysPXrZEUPqfs=;
        b=PWL8e1rD6xIJVf5opryRmUbnekHHdGTjlDP90vu2ntFlhY9IuWdF/G+De/jIe8D16m
         f1cdG2PjfOb1cgLCXHxw0qwLwvjNUauz6R/EKJfgY4n+Bi4rgqebXoi0ystJedujL9ig
         8jzysraZE96sIm1jKDpP7koDlCAiLVo+XmIuYOnTUD/6cUsYIXscYFO3m3Ruw6UpuqHM
         LccZ+CaUeIlggrAsI1a4jdrSyqp52srSkOy2c6V8A/Htu+zOI41zzTWXzq39sZpWVrqa
         C1Z6qPOq/PWH/CvV7EV8Qa0Kh+Cf673UXNuqeyNy37/1QCKd7r77TDR60n8yfS0HDnPk
         9Ytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763114000; x=1763718800;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MVbd9aoIO6IlLlvrAdA93MjVckq2AIvysPXrZEUPqfs=;
        b=ffo4aQZMpDqKgweXU+pnFvdDbbxtIRudsNHVbVpQF8u5jpNnwwHEZqKynSUpKW8iXc
         ZYT5RY5bkjaa5KXcvbOGCCGgeMWP+9bgvHYrlrjY5qosd/FZTPZCSwjXrHPiqUKHpN56
         OozLjMqYA9Mb0A5mTBbzcHZZm1/0JIoZYnvZMZDcX6i0urgTsQc2ZNmvmycJ2yEQ6Nw1
         jdkh+7Irdy/bIw2fWk9FC7j5IAlxKhOe8AoTIJIDVs1NxVmFSwtObeFOywIJ0x0M5/9G
         4gi1NgAEbY6+TvlJLfsmKYAzUup2yuqPdm6Ai5Aw7NuM1+kQgtwObpaV0pnyIblWrqSG
         aDig==
X-Gm-Message-State: AOJu0Yysc+X03Vd6hXyCTe5iuf8Ki8JFHgeW3uXd6OziLOb1DcaxTn2E
	MMBhQDYcMPZ+z68Gpd2GwiGL1lLea4PA0Zwl/UYYbwvXkbdQPc0+NGP8fQaC0Yp9egm0Ro9ZSm/
	WY6ZcNK3KGnuPftnV/0mWfVKhIMuljjFzHq2q/iPbXK20uxSFPMFecOv5huymfh+MiYV2tn2o
X-Gm-Gg: ASbGncuZTbXudFRE/ew6l9YVvXFxNY/RLx6slfNtS9AkSgkW6+YqtaemhAOqY32Gc1M
	rud1xnXi0ltrSz+SG8jugp7mlZ5hno4qb3RNk3rlem2+RBEsC04uf4b0YwrWozpevu35ecwodvO
	pE9Tox04aVgy2BrQ4zcVrcEYNBmwYkC4l1Erh0qQ3jZX8/LcwbkTSlRfeqqcx2JaYI6WFqIzICK
	aB/d1VpxK2c8jAiiARuyfWJROvABolTMOeOAdXh8w2XInayg4VSRuPbkUM4w7LHDlU0BsQq8ami
	GpdtMmCq7h/7g8qfma6jCJG4q3jJu8Gt5I756BeOX/TBnFu2mvbiDo0Z0hDmVF9akbtceKsFDVJ
	OAyJo+zcHrq5Q9P+rxePYRi6x/DbeMEEKJbg2FAMwEnGcsgtycnwiIJhIBdc2D2yHTWpnSk/gYX
	oBSziv
X-Received: by 2002:a17:903:40d1:b0:295:68dd:4ebf with SMTP id d9443c01a7336-2986a6d0bf1mr31115815ad.16.1763113999918;
        Fri, 14 Nov 2025 01:53:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEkqupIjh3AVLvFnwbTJck856h96S3xr/yWCA2vJ/9j9XVXbcvl2IYDqmaMeP6MS6vUKiymQA==
X-Received: by 2002:a17:903:40d1:b0:295:68dd:4ebf with SMTP id d9443c01a7336-2986a6d0bf1mr31115455ad.16.1763113999390;
        Fri, 14 Nov 2025 01:53:19 -0800 (PST)
Received: from [10.133.33.68] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2345d2sm50094285ad.11.2025.11.14.01.53.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 01:53:19 -0800 (PST)
Message-ID: <b754155b-a17b-4e8e-92b7-8ab37949dded@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 17:53:14 +0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] rpmsg: char: Remove put_device() in
 rpmsg_eptdev_add()
To: Dawei Li <dawei.li@linux.dev>, andersson@kernel.org,
        mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        set_pte_at@outlook.com, stable@vger.kernel.org,
        zhongqiu.han@oss.qualcomm.com
References: <20251113153909.3789-1-dawei.li@linux.dev>
 <20251113153909.3789-2-dawei.li@linux.dev>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20251113153909.3789-2-dawei.li@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Vm7SLGa4Q3b9woCUY9deAT5AeQhwHeq1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA3OCBTYWx0ZWRfX40VEcqaTtksh
 P7nveLNxqrJSYeNuDkuT+xbG/6NoBq8ircZjq7pKC42NX9slJiLTwNCqZlB1fpldwuyP4CuAVVH
 yANwXsV+/BSEH19cem2otPzkNuiZ3WLYr0mSMsQWe9bYU7AhJwq+cmbvZPlipdxHjZb96dbLf3q
 +R0i7t9ybaWwJmDoy3N5ryq9jy9rr/lEM71cOwcIsgiw7/dA5SguiOIu7UoJSNSsmaWYjmXpFM7
 XgJWdRjRnyY5+yeVXdPqz+zxeQWkfCJCeO8mOUS9kYay5qFEyYqR8cmid7ulh3Fc4/5aBo9KZ2J
 wxPk+OM+c8xHZofVe5uc3+q0lWfYH+NvGZX+q2VrGEXyj8+wSaWtv8UralF+T+YuU/W6RRZoszn
 3/fydtfY36NpLcta2s/4Sm2ttwShzQ==
X-Proofpoint-GUID: Vm7SLGa4Q3b9woCUY9deAT5AeQhwHeq1
X-Authority-Analysis: v=2.4 cv=V+1wEOni c=1 sm=1 tr=0 ts=6916fc11 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=l8NkEzq--Y_aFj96GU8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140078

On 11/13/2025 11:39 PM, Dawei Li wrote:
> put_device() is called on error path of rpmsg_eptdev_add() to cleanup
> resource attached to eptdev->dev, unfortunately it's bogus cause
> dev->release() is not set yet.
> 
> When a struct device instance is destroyed, driver core framework checks
> the possible release() callback from candidates below:
> - struct device::release()
> - dev->type->release()
> - dev->class->dev_release()
> 
> Rpmsg eptdev owns none of them so WARN() will complaint the absence of
> release():

Hi Dawei,


> 
> [  159.112182] ------------[ cut here ]------------
> [  159.112188] Device '(null)' does not have a release() function, it is broken and must be fixed. See Documentation/core-api/kobject.rst.
> [  159.112205] WARNING: CPU: 2 PID: 1975 at drivers/base/core.c:2567 device_release+0x7a/0x90
> 


Although my local checkpatch.pl didn’t complain about this log line
exceeding 75 characters, could we simplify it or just provide a summary
instead?


> Fixes: c0cdc19f84a4 ("rpmsg: Driver for user space endpoint interface")
> Cc: stable@vger.kernel.org
> Signed-off-by: Dawei Li <dawei.li@linux.dev>
> ---
>   drivers/rpmsg/rpmsg_char.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index 34b35ea74aab..1b8297b373f0 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -494,7 +494,6 @@ static int rpmsg_eptdev_add(struct rpmsg_eptdev *eptdev,
>   	if (cdev)
>   		ida_free(&rpmsg_minor_ida, MINOR(dev->devt));
>   free_eptdev:
> -	put_device(dev);


Yes, remove put_device can solve the warning issue, however it would
introduce one memleak issue of kobj->name.

https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git/tree/drivers/rpmsg/rpmsg_char.c#n381 


dev_set_name(dev, "rpmsg%d", ret); is already called, it depends on
put_device to free memory, right?


>   	kfree(eptdev);
>   
>   	return ret;


-- 
Thx and BRs,
Zhongqiu Han
