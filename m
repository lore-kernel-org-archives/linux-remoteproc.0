Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8C62D949A
	for <linux-remoteproc@vger.kernel.org>; Wed, 19 Nov 2025 04:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763525233; cv=none; b=bvGFAYkxc7+Vo91RsjVSx8MXpO9094n2LBRuIFv2eeh+QwifH/+7bCJCHKMq+n21X/zvQte8GCU/KGlteFHRzuNjoZhowihBvsUdivQd3QVvN1q/YxfRqhCLrB61LRMtdBA7i6ZXl30SMyQxuKjTkUW0321ynPGbf3OcNeguui0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763525233; c=relaxed/simple;
	bh=rU38eKlcL/5UEYk2NS47XN9BNdxIq6d+BoWNaIkjavI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GV+uPnxYrtX3LFP3poBw1H1RLTX3fJrRCm5P5mQDK4smdnFmmgKdgapr0uQIiS2h1E6XLsTWMnx6cP5XCAxUL69ybklGohI01TCsUMpFNz+cAc4c2haFr2kJJcvxTqZndwoPZNRkRTYf/Of0FyTyRUJn3MhjqUXsEIQ/RiETnWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OjA4LID5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UZAOFu0D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OjA4LID5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UZAOFu0D"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ3Os7F2664727
	for <linux-remoteproc@vger.kernel.org>; Wed, 19 Nov 2025 04:07:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fS+dGMCJRCHWZtUwrU0gp2ztWLVeW3DxbPgmO/wQHI4=; b=OjA4LID5uscpYRfo
	BuLyuQsx6TZpgTtPh5uIKrWWelICBJlEGOBgwyfXFCq0M28s0dyoCyg8MXeimjoV
	p6kjAAyBY09LtT0Vi9Q3PBRH7JKosqDsatoR73+LrsVmy0WgqZLpXzRpU1GfMi5Y
	cMz0U9OfcNlWVEB6I52056vXo+3yD7iYagQaNkBCe4dd2nskXilIGq797eZb/lak
	aBKLeYs28rUPEAA0tV+98pNF8pp5Vw5A6dzpWAAfapQBenqREGe2JJK+nZMwSuYu
	K2sFkJhYdUAjVfWLgJ6yyQ22iHWlZ89Koe0KgMC9wJNRS0c4+lYjWsMhJ/bqIiuH
	p/E5xA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agpjkauu2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 19 Nov 2025 04:07:09 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-343daf0f38aso7126771a91.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 18 Nov 2025 20:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763525228; x=1764130028; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fS+dGMCJRCHWZtUwrU0gp2ztWLVeW3DxbPgmO/wQHI4=;
        b=UZAOFu0D78Zp8Tr7hGnW/STh0Z3f+ichFaBn4nSE25GQ7HIbJY3ZyIbW+VITNJFHqb
         W7767eRHyb7XIuuQCS2SPvwVoNDUu445lHDbOGJTh1qEa423mwmBgrFabUwf5+e+kSs8
         2DeWMGIZsAUbwK6feCdGAtTiPgSTpKPzP5Owa5/FM2obgbl2xhOXJcPQrnTgofbkr7Su
         aZHJcMUHdyOR/XfHI+AhvUph5V4yiY4CCpIZs4Pljx6LGM83YXctnauqhUaAY3TFWgtA
         Aj0r1+wgPgt86Ss318JOx2rJawvfUfOzysBwE+7XCryH829RnU0JMTXyfBUJTRsZmG+Z
         kcVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763525228; x=1764130028;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fS+dGMCJRCHWZtUwrU0gp2ztWLVeW3DxbPgmO/wQHI4=;
        b=dWWCO0QRiyW2eV5qtXmEaT9bIZ4IMcrvVixQH8Tbi59zprwZl94mpIcjJAULgCrjVH
         r4RdSl/qpAwFJwYWh454xNTZLXDP+LI3/ovLaV7nbz4uPuAlGgQvWexEPpRi+1flPcE4
         bCNx0xlewhz2LjWpQsTD/QFrComolDL2dnz8HxpMJoDU2IDnJCHdf6kbTZI1M2EzwoP/
         BUxkUbyfClhhva6hVnUczYhM1GoBKozl2OA6mwRM+dvyh1dPGyg50wk174EltOXrrloC
         iFS1bq3TeV5cakkmf1Kx9KAHPj+631RAl/I2QWXGYsagv7DouEBQGUjA7TXDesDkTntj
         OSdg==
X-Gm-Message-State: AOJu0Yz7Tm42RaUFf+f0fXiaDUW5TOvzwec+qKtoNXfMmZvHmRD3eMep
	fwe/hzD9cVuZmZsIFTYU8DIjhIF+dr6VHWBBnEgROqQexxuqd+cq7nBM5AL/uSuJeRcut0TP7VZ
	MVq8k+BUKdL6ufK7eGwOfmxbL6XMcfSJUlPFpg+zxFNQXld2T9JJNrlHYwcLiSwi0zkiEs4VA
X-Gm-Gg: ASbGncvrtGcouT3D6t0y1hy+jYT5qlHSZoAzwxwDu8lPywZEiBfBvTjcZDgNeRsHaAv
	7Fl7Hgg30YWYqrv5ln1aYwCupQC4zqoFili7YJGXXCt0l36Ls9j5p4knTmBzsN5uzADEUy6swOG
	WchvKlFm0Lei3lrfQviNGXQEpB4zyzRcAXqKtjP7LC0GADIxbEs2zyDysKq6ws2QjWGaXPs8dmz
	ftozlRnCdxAGJPlQpIrJU3AWJNTFQClzC8OPqhOZpLuXWgX+kEjL+VybxWJdmvRdPIlOwYy8Xr+
	zKBmvjt+IXTC9BPtyD1pHF5ERh/4+qEcTBxxNabs9E8QmkBGx6FvDfMEhQ/ggJF6mZwmJ/9a+mM
	l1qXRn39mUynvRk+dX3e3lW5DyYI9Yz9cjcC43HX1iFWiubFKL+yJ5W126Csjp7Mk+HaC2l6pS/
	YuE8FNiQ==
X-Received: by 2002:a17:90b:2e46:b0:340:66f9:381 with SMTP id 98e67ed59e1d1-343f9eb37ddmr19076483a91.10.1763525228020;
        Tue, 18 Nov 2025 20:07:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHETq0FoatOPgD7ViESbnk3ztP2OtHyWXSHvfgh9KYljoPwsVKGXEaYPb5xtSXJRHIf16xPIQ==
X-Received: by 2002:a17:90b:2e46:b0:340:66f9:381 with SMTP id 98e67ed59e1d1-343f9eb37ddmr19076452a91.10.1763525227470;
        Tue, 18 Nov 2025 20:07:07 -0800 (PST)
Received: from [10.133.33.174] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-345b04f3b8dsm1589964a91.12.2025.11.18.20.07.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 20:07:07 -0800 (PST)
Message-ID: <38308885-af2e-4b61-9653-00bfca8ca0e9@oss.qualcomm.com>
Date: Wed, 19 Nov 2025 12:07:02 +0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] rpmsg: char: Fix WARN() in error path of
 rpmsg_eptdev_add()
To: Dawei Li <dawei.li@linux.dev>, andersson@kernel.org,
        mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        set_pte_at@outlook.com, zhongqiu.han@oss.qualcomm.com
References: <20251118154107.3100-1-dawei.li@linux.dev>
 <20251118154107.3100-2-dawei.li@linux.dev>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20251118154107.3100-2-dawei.li@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LOGwqE1sb47lh2dekKMcABdSpWwwaV5R
X-Proofpoint-GUID: LOGwqE1sb47lh2dekKMcABdSpWwwaV5R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDAyOCBTYWx0ZWRfXyMoSUru+vZyx
 dftfgJn0C+qx8gIcvX38/UeHBJZzNsQ2o8355AKFz2iHGEEDYkiJDGU+QUbgVJOFsrMIjbR8peW
 E2wz/i1AdInaZ83p9zNFNvcbYnMn2LAgYgDWHlun6Lz4ZzJzLdlcnb5ZmhTmu9PpR3jkUIJ7p3a
 ASMOHg1x/A246PSWE3NrSP98WmGAdnY4RiY3XNgpxO57R/VceB+qsVdiCKSOMQ09AEcdYA7Odc3
 zpghwTwnApqj4kluybD5gVhxPwda+Oh3xEneNfFvrLpXgJYUuVI2gX83UZEQrBLNjtb2kXzAUUX
 We9XJelTHgGivYuWU+636xeszTyCI/rWSV2HRsNmq/hbd0aTR4rcmeR07S3fq4Yo0Ze9JM+dTYf
 MLne3S+sJqovtWBagcUfz2COtpPw5w==
X-Authority-Analysis: v=2.4 cv=N/Yk1m9B c=1 sm=1 tr=0 ts=691d426d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=WJ6qqwoD0WRQ6_SRdRYA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190028

On 11/18/2025 11:41 PM, Dawei Li wrote:
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
> Rpmsg eptdev owns none of them so WARN() will complain the absence of
> release().
> 
> Fix it by:
> - Pre-assign dev->release() before potential error path.
> - Check before ida_free() in dev->release().
> 
> By fixing error path of rpmsg_eptdev_add() and fixing potential memory
> leak in rpmsg_anonymous_eptdev_create(), this work paves the way of rework
> of rpmsg_eptdev_add() and its callers.
> 
> Fixes: c0cdc19f84a4 ("rpmsg: Driver for user space endpoint interface")
> Signed-off-by: Dawei Li <dawei.li@linux.dev>
> ---
>   drivers/rpmsg/rpmsg_char.c | 26 +++++++++++++-------------
>   1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index 34b35ea74aab..373b627581e8 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -408,8 +408,13 @@ static void rpmsg_eptdev_release_device(struct device *dev)
>   {
>   	struct rpmsg_eptdev *eptdev = dev_to_eptdev(dev);
>   
> -	ida_free(&rpmsg_ept_ida, dev->id);
> -	if (eptdev->dev.devt)
> +	/*
> +	 * release() can be invoked from error path of rpmsg_eptdev_add(),
> +	 * WARN() will be fired if ida_free() is feed with invalid ID.
> +	 */
> +	if (likely(ida_exists(&rpmsg_ept_ida, dev->id)))
> +		ida_free(&rpmsg_ept_ida, dev->id);
> +	if (eptdev->dev.devt && likely(ida_exists(&rpmsg_minor_ida, MINOR(eptdev->dev.devt))))
>   		ida_free(&rpmsg_minor_ida, MINOR(eptdev->dev.devt));
>   	kfree(eptdev);
>   }
> @@ -458,6 +463,8 @@ static int rpmsg_eptdev_add(struct rpmsg_eptdev *eptdev,
>   	struct device *dev = &eptdev->dev;
>   	int ret;
>   
> +	dev->release = rpmsg_eptdev_release_device;
> +
>   	eptdev->chinfo = chinfo;
>   
>   	if (cdev) {
> @@ -471,7 +478,7 @@ static int rpmsg_eptdev_add(struct rpmsg_eptdev *eptdev,
>   	/* Anonymous inode device still need device name for dev_err() and friends */
>   	ret = ida_alloc(&rpmsg_ept_ida, GFP_KERNEL);
>   	if (ret < 0)
> -		goto free_minor_ida;
> +		goto free_eptdev;
>   	dev->id = ret;
>   	dev_set_name(dev, "rpmsg%d", ret);
>   
> @@ -480,22 +487,13 @@ static int rpmsg_eptdev_add(struct rpmsg_eptdev *eptdev,
>   	if (cdev) {
>   		ret = cdev_device_add(&eptdev->cdev, &eptdev->dev);
>   		if (ret)
> -			goto free_ept_ida;
> +			goto free_eptdev;
>   	}
>   
> -	/* We can now rely on the release function for cleanup */
> -	dev->release = rpmsg_eptdev_release_device;
> -
>   	return ret;
>   
> -free_ept_ida:
> -	ida_free(&rpmsg_ept_ida, dev->id);
> -free_minor_ida:
> -	if (cdev)
> -		ida_free(&rpmsg_minor_ida, MINOR(dev->devt));
>   free_eptdev:
>   	put_device(dev);
> -	kfree(eptdev);


Hi Dawei,

Thanks for your new version~

Patch 1/3 will introduce a use-after-free of eptdev in func
rpmsg_anonymous_eptdev_create(),

https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git/tree/drivers/rpmsg/rpmsg_char.c?h=for-next#n548

even though this issue will be resolved in 2/3. However, 1/3, as an
independent commit, should not introduce a new bug.


>   
>   	return ret;
>   }
> @@ -561,6 +559,8 @@ int rpmsg_anonymous_eptdev_create(struct rpmsg_device *rpdev, struct device *par
>   
>   	if (!ret)
>   		*pfd = fd;
> +	else
> +		put_device(&eptdev->dev);
>   
>   	return ret;
>   }


-- 
Thx and BRs,
Zhongqiu Han
