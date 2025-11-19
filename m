Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7172E7623
	for <linux-remoteproc@vger.kernel.org>; Wed, 19 Nov 2025 13:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763557394; cv=none; b=DO9KpIpYz9JG3Rf/+9PqJXXiX4Fjl3beSbiIlAMdQhcigksFOt+8dFMttslQ7R4BqJUTKqvp1/ISI08FG5k3WGE2fu4GXTjmpQI7qUOadGbGsCM+P2h3/mXEbRHpdzgNGIoJXcQDemJdLvl23Y7fZSrFA/oKXsXTcw28psynSpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763557394; c=relaxed/simple;
	bh=vC7WVKFhkbJ2iPCdX1HlC2w1Z1zo0BQMAeWPVA0PF1E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dxLv5qDwJyRQhEIN061YtWsndRBbMVAuf3XLzOR0poM0DzBrUkGJOg+La5BrTcRoi8EwiPo1y9QFyAn3AwE1H5OraXRSELGYTWq5j1kyT06T6ytfKlRDZ/5QjOdxnqqffg9wao/I2aHG6hPe0msIe2v1AhYhy2PIqhMms+7qLGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V7w5l1Mp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SptNo4IA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V7w5l1Mp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SptNo4IA"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJCgGOk1030386
	for <linux-remoteproc@vger.kernel.org>; Wed, 19 Nov 2025 13:03:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KCGZXRP6ACwvYMP0dVoY4as3QHZQmjyoSHFgc+hk9tc=; b=V7w5l1MpKyhTV//C
	1xyTo9ODGKFFoY7x+PEeTeogV1Hqc2z0ioeLjFZI1k6GCMpzXdVGhLwnDppQca71
	27fXYzqDPC3bhVmKJorRVoQBmu7uNAJ7qT5yWmxTroU7HIJ20hZHXo1CxyAglQuH
	Mgyk7Q2yigbcsaRJKhIRpwTEPlxJYZ3hei7tvDoaanXrjU9KZs1/K9jpawDA95fu
	TSKUWfUK6zcPYqj+sQm9wyk1wLdeOlycPL56zF1TegZUHfPd0NlwwQIUJBFbexQ4
	ik5C7YPO5VEKKQqfH3cYlBqy4X1DKks4kUeZCLH8Z8SnZNvQFGc4Mqbc/mC/jTVs
	KmnZ/w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ah7ansd32-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 19 Nov 2025 13:03:11 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-295fbc7d4abso88585135ad.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 19 Nov 2025 05:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763557390; x=1764162190; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KCGZXRP6ACwvYMP0dVoY4as3QHZQmjyoSHFgc+hk9tc=;
        b=SptNo4IAgjgHULIg5Ht603KdYwscK9BriaXqyLEty12VqpAv1thad3HQRyYSgIp5m5
         BYAoLXttTzWjhYxzQ6Ewhvu9KaEdb5yeg3FBUp89/NZgYAohfqSDHmdsn2BfgCde8CrA
         gIWkDpZINXarJLw3aa4I2Fgsk8c4KhXi1ipfQI59xgJsupTjASQUEDqUT171g3CGdbBf
         t1CVOmxowB54I7Uulz6GwAox3UeWtP8kwG3SZNXWRatspH3b/IiNe454CHRlmbUu7/8E
         J9SuYDnM2Em5gPAC0N1X+UZKGLK7159ixp/fhfFu7jDIDW3RpCHgakufj6pPbIJLLrbm
         qQaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763557390; x=1764162190;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KCGZXRP6ACwvYMP0dVoY4as3QHZQmjyoSHFgc+hk9tc=;
        b=wapYf8YWMDbNu6U/9zn3HrnyoLviCmLsOhT8zYhytw84S+MAsEH60UbP9Iki6tptQt
         7V6xZDkmS7BCOKziHBqOO9hs94dYsFyHqmfNgex3WDSslwSSX9Au8SsV89zAd6PJYzub
         Uw0RDXNNFAikVMyfuqJxVd3QN6PzQFf48Tu1r2OyASfnvXVeoct4kxRjQau3UGuBoQnQ
         jalNvCfaFTPp+omxoutxCJACMitFJeUwpwSahiynrzg/FCr59mn4o0wNQyk4xmzz0UaA
         biLN/Z2QA9euiNYBtPaEW9e8UqMzdrnl41eXsbhhyA2yT5nfjW3eC7bf64Ldasm1kUN5
         9Wqg==
X-Gm-Message-State: AOJu0Ywr6g56HcVyCWNYgiK3yFNhPZgcn4ag7sAKTULvekrNt+WQjdeB
	O11h9jZK1nfsUxY7qtmrUVds6PmcUq/U14Lo/tDFTY0fyqFfI24xeilDMCIa+dCYWK444LSRpeT
	TL40zQuPwuz0VHTAwhfyL7gWa6yGNgIhwqidKOpuuqIvQSo/NLdUoANw6gROuT8rpC+e2oNHn
X-Gm-Gg: ASbGncv7StZSuY1bA8QQUqx3XhvkLwoQxkrxkyiTSh56sWQq9cgXxa/X2Y9hNl57JHf
	AXCkF+o7vTmC3DLle1IH/2YvExXXJSG4godmZoQu9qRyfQaYr0Mk2gaknS5yBJF1agLmvxA2UT0
	M3Elv8rprikDbVE85PEu1VuM/dTorr+cGdqWs3X50dXBvrjoYgvytbQJuI//LGk0Bj2ewX290OJ
	RyOehgxC5Ry/ZJ3LcpdhliND8V/TF/fnlpU9+wkz/X4O/ymsvxBHpTo5nSFhbaC6wPv+dcCsUZg
	VnCnI35uheyAZc0sQcFw/5QJMILy6Chs1tD2UzeGvoGms5DmSO3Nmgn/1/GXFDA4HaQyaGF3gmw
	5AMG29E0cn0X8kYtB4C55e9BH6dUXehvcqqgR+K210S3MjgIol5mCofTweGv+99w8ecL3yWEVI2
	sZ9wM4mw==
X-Received: by 2002:a17:902:ce07:b0:295:269d:87d1 with SMTP id d9443c01a7336-2986a766aa7mr251156195ad.52.1763557390126;
        Wed, 19 Nov 2025 05:03:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE0FMmmC8VqYlBnJep7nd+6w5haTfeS4GFnZNQ/QSppBw3MAtcC1Q6recFh3oZDWGQ4KtiN6w==
X-Received: by 2002:a17:902:ce07:b0:295:269d:87d1 with SMTP id d9443c01a7336-2986a766aa7mr251155515ad.52.1763557389362;
        Wed, 19 Nov 2025 05:03:09 -0800 (PST)
Received: from [10.133.33.195] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2986a60b116sm173504545ad.79.2025.11.19.05.03.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 05:03:09 -0800 (PST)
Message-ID: <8371403c-668e-48ed-9df6-5d4c6d04fc66@oss.qualcomm.com>
Date: Wed, 19 Nov 2025 21:03:04 +0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] rpmsg: char: Rework of rpmsg_eptdev_add() and its
 callers
To: Dawei Li <dawei.li@linux.dev>, andersson@kernel.org,
        mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        set_pte_at@outlook.com, zhongqiu.han@oss.qualcomm.com
References: <20251118154107.3100-1-dawei.li@linux.dev>
 <20251118154107.3100-3-dawei.li@linux.dev>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20251118154107.3100-3-dawei.li@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDEwMyBTYWx0ZWRfX9MGqmJS5bzb3
 H4xx7l2acod8G8NGRH1fsSg/1dXAXtu/OFqaVaS1FvlczLLuHK2eOFXOrXTDlUW2GqENF/OSnUn
 UKvADMD1LJM0HuA1oI0DBpKmgzsiGkpF3v2X+ly6r+SFEzbnUtYK2WGGm0mYGS4uCcCvTTDZCdC
 PXgdv5xpbwP+paAGq17i8wv+UkVwlG0rpyNxYayOPa8QKsRzJ5+4gOg9EjX0H9bil3NJLoK9H9H
 8bpwY8iOYeFoEcfdwJyGKw/23RlyCrYiVczSTMOtvPvEn5H5hBWs+mWW7PiOi9WGslzIqKbMrag
 gDeoQqLkIYa2q7OnrXJd+1dLpet6hfyvpdcP/K+NDSFZ4nhWSmsvn47zcqUV/bwPr1tvwHk/ULH
 wbaDRZLezONIz2pYri225Kf1XPQt5Q==
X-Proofpoint-GUID: JcpRAksY_Hkcfwu0GzTRv0DT8xkYNgYA
X-Authority-Analysis: v=2.4 cv=a7k9NESF c=1 sm=1 tr=0 ts=691dc00f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=QuOXyrIzizJcR910CjsA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: JcpRAksY_Hkcfwu0GzTRv0DT8xkYNgYA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_03,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190103

On 11/18/2025 11:41 PM, Dawei Li wrote:
> For every caller of rpmsg_eptdev_add(), eptdev is allocated in
> rpmsg_eptdev_alloc(). Resource should be freed where it's allocated,
> In this case, eptdev should be freed in caller of rpmsg_eptdev_add() rather
> than rpmsg_eptdev_add() itself.
> 
> Move the error handling from rpmsg_eptdev_add() to its callers.
> 
> Fixes: 2410558f5f11 ("rpmsg: char: Implement eptdev based on anonymous inode")

Just for reference, it would be better if the commit message clearly
explained what is being fixed. Just like V3 2/3

https://lore.kernel.org/all/20251113153909.3789-3-dawei.li@linux.dev/


> Signed-off-by: Dawei Li <dawei.li@linux.dev>
> ---
>   drivers/rpmsg/rpmsg_char.c | 26 +++++++++++++++-----------
>   1 file changed, 15 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index 373b627581e8..56371899212f 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -470,7 +470,7 @@ static int rpmsg_eptdev_add(struct rpmsg_eptdev *eptdev,
>   	if (cdev) {
>   		ret = ida_alloc_max(&rpmsg_minor_ida, RPMSG_DEV_MAX - 1, GFP_KERNEL);
>   		if (ret < 0)
> -			goto free_eptdev;
> +			return ret;
>   
>   		dev->devt = MKDEV(MAJOR(rpmsg_major), ret);
>   	}
> @@ -478,7 +478,7 @@ static int rpmsg_eptdev_add(struct rpmsg_eptdev *eptdev,
>   	/* Anonymous inode device still need device name for dev_err() and friends */
>   	ret = ida_alloc(&rpmsg_ept_ida, GFP_KERNEL);
>   	if (ret < 0)
> -		goto free_eptdev;
> +		return ret;
>   	dev->id = ret;
>   	dev_set_name(dev, "rpmsg%d", ret);
>   
> @@ -486,15 +486,8 @@ static int rpmsg_eptdev_add(struct rpmsg_eptdev *eptdev,
>   
>   	if (cdev) {
>   		ret = cdev_device_add(&eptdev->cdev, &eptdev->dev);
> -		if (ret)
> -			goto free_eptdev;
>   	}
>   
> -	return ret;
> -
> -free_eptdev:
> -	put_device(dev);
> -
>   	return ret;
>   }
>   
> @@ -507,12 +500,17 @@ int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent
>   			       struct rpmsg_channel_info chinfo)
>   {
>   	struct rpmsg_eptdev *eptdev;
> +	int ret;
>   
>   	eptdev = rpmsg_chrdev_eptdev_alloc(rpdev, parent);
>   	if (IS_ERR(eptdev))
>   		return PTR_ERR(eptdev);
>   
> -	return rpmsg_chrdev_eptdev_add(eptdev, chinfo);
> +	ret = rpmsg_chrdev_eptdev_add(eptdev, chinfo);
> +	if (ret)
> +		put_device(&eptdev->dev);
> +
> +	return ret;
>   }
>   EXPORT_SYMBOL(rpmsg_chrdev_eptdev_create);
>   
> @@ -544,6 +542,7 @@ int rpmsg_anonymous_eptdev_create(struct rpmsg_device *rpdev, struct device *par
>   	ret =  rpmsg_eptdev_add(eptdev, chinfo, false);
>   	if (ret) {
>   		dev_err(&eptdev->dev, "failed to add %s\n", eptdev->chinfo.name);
> +		put_device(&eptdev->dev);
>   		return ret;
>   	}
>   
> @@ -571,6 +570,7 @@ static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
>   	struct rpmsg_channel_info chinfo;
>   	struct rpmsg_eptdev *eptdev;
>   	struct device *dev = &rpdev->dev;
> +	int ret;
>   
>   	memcpy(chinfo.name, rpdev->id.name, RPMSG_NAME_SIZE);
>   	chinfo.src = rpdev->src;
> @@ -589,7 +589,11 @@ static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
>   	 */
>   	eptdev->default_ept->priv = eptdev;
>   
> -	return rpmsg_chrdev_eptdev_add(eptdev, chinfo);
> +	ret = rpmsg_chrdev_eptdev_add(eptdev, chinfo);
> +	if (ret)
> +		put_device(&eptdev->dev);
> +
> +	return ret;
>   }
>   
>   static void rpmsg_chrdev_remove(struct rpmsg_device *rpdev)


-- 
Thx and BRs,
Zhongqiu Han
