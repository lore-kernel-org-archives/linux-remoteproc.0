Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8423019C1
	for <linux-remoteproc@vger.kernel.org>; Fri, 14 Nov 2025 09:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763114015; cv=none; b=XULTIIFkPk0JWdh9DsI7sJKylgcTIlecLRUC//D1hpoJMt24qEI3aNDhfmkpZYc0e6Vo1VwZRr1x5aJufmCA+RTn7ZOaR5SGSfmb7yNnlNY38Rz+lCdRt+HaT/W/kawu6o5sZo9mbjSj2DYtFkJFRYnsXSrQK4Jw23eEEJ0hxGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763114015; c=relaxed/simple;
	bh=JCqCtu+B24moKCMj67ct3xQj8gutWMX96g/hwIxNvlo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hKgwpV9LuGd9mOAZkUOrBEATtLhPzjAuweW5ykQ1NDQH2avlkr8tOCGGb6hWtKjrrCK86E7E86kwYZGzpL7xJg2xaPLRZ9qe+KZLHG6KlfCO0RR8e4fDBnOOC/trZSpFnV+OSOkrEpnN/7P0Fp6J8SxhtNksiP2dd8NOisUdmhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MqTGg7GA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TOe2upKB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MqTGg7GA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TOe2upKB"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE8C9j11704225
	for <linux-remoteproc@vger.kernel.org>; Fri, 14 Nov 2025 09:53:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W1jpSPh6amMZiKWlTx7im3xNtPR278xyuCPgOEjSw/4=; b=MqTGg7GA/6q7r34w
	mCZQNVzctuGdxuakawOX4M8kKegkgjFBHY6OMYslKkjcghWlzqLIxRO0vP2YyqNR
	ZZZma7mURpgw3AHvxzNu67eTdtAM4FApOyJA+AkxK0MZTB2xY2EOgdy14gIDfvgF
	FH03JEpqKoncfOUul0hWt2VyKZPUBhMieDX0TUBM2nCromWZaWBP5jQgp8bjJ5SV
	4nhR3cSiz21haOVNTJ8QHrRdEuiu+Anqf0IvckUxT44Q7IzQ4NSRjFt8oHsc71Od
	fOhIfD5yKVZ3332YomQJZ092p+iySFejqDKBVtdf3RVv+8HTFZjjozukNXmSq6pz
	fubhvQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9e9qvv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 14 Nov 2025 09:53:31 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3418ad76023so4434410a91.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 14 Nov 2025 01:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763114011; x=1763718811; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W1jpSPh6amMZiKWlTx7im3xNtPR278xyuCPgOEjSw/4=;
        b=TOe2upKBl9s/XDrCPsj4hiu687JPUM6fyD5W1IAzst9e6tZ5WHn/OfiU7A1rV22tXQ
         8YLEr7ar5KMwHSlo/C8biPLkDuPVyJKIviS2LQORn7or9PDszbxWPHFYVbN+CRXLhFcS
         Ml9uZns+FGJYONWbXfsSS6scLQKx/A6wyKmUUNUw8r1mqx4s+DcoX0TZbY7vOtFGj1Il
         GuFajq6PwDKzLtJD1RJHlQCSyWQ/cykHRrOHTZ8TqQLuDgaZ7KW6HaK2o0kplaFW25Xf
         yXYSZlqqvIZqEkYM2LBZyzVsaPfM1TT5rbRdGayNn+uGBAog5O9euRIENm30WhvH8W3W
         aZig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763114011; x=1763718811;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W1jpSPh6amMZiKWlTx7im3xNtPR278xyuCPgOEjSw/4=;
        b=PjQXAyp2YZHXPyS8oa/2XGJRXISqqMu6fy/bKPiwH2YlPKGuriqch1k2TYrWFzlpvL
         eoObwUOantUbSCiaSGeD3Y0okQsSUGEMmSBoaGZTdNabeLXBX8+BqndlfzJ5FodMUiWj
         OGpMux6DsvVcww1FTB+1rvgXQWKHGrvF3isYsTCPlIvyii7Dx9YLiE5wALIrsamW0WyR
         ZIWr4RKpOVSCBmB+DDniJokhCqU59IFgDeLH1gPkOedHdH2cBQKIPlKXxxGrm257qco7
         7P3v6jCjmBk2XHJ3ZbOsiaAwcgJDR2qRrxWh1cr6Na3dOXo2WDCmeaF91wtqxXP5gWyZ
         FyLw==
X-Gm-Message-State: AOJu0YwH8FSYpu6ckTBJOgt5FjSqaLURSusyOI1H04I4hW4Cz0ucKi61
	PCATysNpjsQonSE1uWpewKRpHHuJoYjTe6I94rLtjaRR2SJ91lWqDHpNwFxdZhEWitaU2if3yvD
	KG450cUIOjX8+lzeXA0NpUDfcIuMl2fzEBB9+YPO+EBESKnZYB93jGEJ/q9RU5a/enBKU4TOV
X-Gm-Gg: ASbGnctXlMtce7D8pNi/K1E1rPBKtwPrBtqbTuiGah246U0fByWP80JMVaZ55W+Q5W0
	Z5cywm9o6EQOE8CAJR9IBTilTlRM/JsobPXyPRbIc8WToQfPBe9I0eo9F5lIkB51+nZ3xAzt7NA
	NYyWUe4YlN/O12Q8fCvH5HfeGX6X0tRvLziGkm4BnOQ8j/dM43kz20MjuD1vHLwjVd93I76awT6
	BOxV9W7SPyMIZVtmqJ5ivnOkPk1NBcjKSqd+ZJl3imFg67CHSsvNFWmMzaeYyBfVg9e8OvzSeUN
	p0dKTlLHd5a8xp1S99iOrvGhFZefFXIzIf8hBiq9ohb2kAO0AXv6fGqClk9AO4ooy/SObVmZzEE
	AYzcOCgBi/WNQasqqDuH7IQJgD/rVlMHq896E0c22X4W2rgbd6EofXUny8wAMtI/hKaKWuZm+X1
	hCB+Rq
X-Received: by 2002:a17:90b:558e:b0:343:7714:4c9e with SMTP id 98e67ed59e1d1-343f9ea692bmr2679462a91.2.1763114010920;
        Fri, 14 Nov 2025 01:53:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE/vlDbqeOubX/kgw6Ccp3AtHqkGyW/kTCh0sGRQ4ifsVtKa1NMRuly+J8OYfdZO5ntdtOy/g==
X-Received: by 2002:a17:90b:558e:b0:343:7714:4c9e with SMTP id 98e67ed59e1d1-343f9ea692bmr2679434a91.2.1763114010394;
        Fri, 14 Nov 2025 01:53:30 -0800 (PST)
Received: from [10.133.33.68] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343e07156absm8602249a91.5.2025.11.14.01.53.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 01:53:30 -0800 (PST)
Message-ID: <59e84220-801c-45e3-a8de-f0536e79ffb9@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 17:53:26 +0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] rpmsg: char: Rework exception handling of
 rpmsg_eptdev_add()
To: Dawei Li <dawei.li@linux.dev>, andersson@kernel.org,
        mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        set_pte_at@outlook.com, Dan Carpenter <dan.carpenter@linaro.org>
References: <20251113153909.3789-1-dawei.li@linux.dev>
 <20251113153909.3789-4-dawei.li@linux.dev>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20251113153909.3789-4-dawei.li@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ccPfb3DM c=1 sm=1 tr=0 ts=6916fc1b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=XFdbuqICzAx1cFq27NgA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: nC6YNJT4HZq_pPkhnd25uJeI7B34aE7Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA3OCBTYWx0ZWRfX3OZ2LmBHhqov
 WDzLTShFGRjotyS1BIEAc9pRUbfhBLT4pjpUu/TNkpJmqYEFEb/fG6l0tZRx0qztgJKux1ZtsT2
 KgcFREH6uKX1+nWN8TrgWRvHhDMNEK9CuYogZeAbxwvLEH3tgxzHJs5JY5LJYa/Z+qGYCbnqrBe
 ySMEhUBXJ+osQwnRMrhngavliJlSoUgyPI/XOcp4PZEmnNM5VNvI3H8SUJybUI3t2NypyVSu+WV
 3UUiA8oQW2qNuQP5e1UafVSGKhXKQCCmnt3a1wHeq0RSn0j46Qoi/A/2a3ouLpLf7Vs+gIJEd+d
 qB2euoTaSOI4ssPRz1ITt4KtWvfl03nUoDh3DO3RAhX1CPFW2lxz/L9cf0zHt2TVBCFI+hPS7Ls
 bW+s3Qi4OKORhnsiT/z82UkiKaFuRA==
X-Proofpoint-ORIG-GUID: nC6YNJT4HZq_pPkhnd25uJeI7B34aE7Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140078

On 11/13/2025 11:39 PM, Dawei Li wrote:
> Rework  error handling of rpmsg_eptdev_add() and its callers, following
> rule of "release resource where it's allocated".
> 
> Fixes: 2410558f5f11 ("rpmsg: char: Implement eptdev based on anonymous inode")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/all/aPi6gPZE2_ztOjIW@stanley.mountain/
> 
> Signed-off-by: Dawei Li <dawei.li@linux.dev>
> ---
>   drivers/rpmsg/rpmsg_char.c | 60 +++++++++++++++++++++-----------------
>   1 file changed, 33 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index 0919ad0a19df..92c176e9b0e4 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -460,44 +460,34 @@ static int rpmsg_eptdev_add(struct rpmsg_eptdev *eptdev,
>   
>   	eptdev->chinfo = chinfo;
>   
> -	if (cdev) {
> -		ret = ida_alloc_max(&rpmsg_minor_ida, RPMSG_DEV_MAX - 1, GFP_KERNEL);
> -		if (ret < 0)
> -			goto free_eptdev;
> -
> -		dev->devt = MKDEV(MAJOR(rpmsg_major), ret);
> -	}
> -
>   	/* Anonymous inode device still need device name for dev_err() and friends */
>   	ret = ida_alloc(&rpmsg_ept_ida, GFP_KERNEL);
>   	if (ret < 0)
> -		goto free_minor_ida;
> +		return ret;
>   	dev->id = ret;
>   	dev_set_name(dev, "rpmsg%d", ret);
>   
> -	ret = 0;
> -
>   	if (cdev) {
> +		ret = ida_alloc_max(&rpmsg_minor_ida, RPMSG_DEV_MAX - 1, GFP_KERNEL);
> +		if (ret < 0) {
> +			ida_free(&rpmsg_ept_ida, dev->id);
> +			return ret;
> +		}
> +
> +		dev->devt = MKDEV(MAJOR(rpmsg_major), ret);
> +
>   		ret = cdev_device_add(&eptdev->cdev, &eptdev->dev);
> -		if (ret)
> -			goto free_ept_ida;
> +		if (ret) {
> +			ida_free(&rpmsg_ept_ida, dev->id);
> +			ida_free(&rpmsg_minor_ida, MINOR(dev->devt));
> +			return ret;
> +		}
>   	}
>   
>   	/* We can now rely on the release function for cleanup */
>   	dev->release = rpmsg_eptdev_release_device;
>   
> -	return ret;
> -
> -free_ept_ida:
> -	ida_free(&rpmsg_ept_ida, dev->id);
> -free_minor_ida:
> -	if (cdev)
> -		ida_free(&rpmsg_minor_ida, MINOR(dev->devt));
> -free_eptdev:
> -	dev_err(&eptdev->dev, "failed to add %s\n", eptdev->chinfo.name);
> -	kfree(eptdev);
> -
> -	return ret;
> +	return 0;
>   }
>   
>   static int rpmsg_chrdev_eptdev_add(struct rpmsg_eptdev *eptdev, struct rpmsg_channel_info chinfo)
> @@ -509,12 +499,17 @@ int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent
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
> +		kfree(eptdev);
> +
> +	return ret;
>   }
>   EXPORT_SYMBOL(rpmsg_chrdev_eptdev_create);
>   
> @@ -545,6 +540,12 @@ int rpmsg_anonymous_eptdev_create(struct rpmsg_device *rpdev, struct device *par
>   
>   	ret =  rpmsg_eptdev_add(eptdev, chinfo, false);
>   	if (ret) {
> +		dev_err(&eptdev->dev, "failed to add %s\n", eptdev->chinfo.name);
> +		/*
> +		 * Avoid put_device() or WARN() will be triggered due to absence of
> +		 * device::release(), refer to device_release().

Hi Dawei,

As I mentioned about the potential memory leak issue in patch 1/3, we
could consider still using put_device for management, as this better
aligns with the driver model standards and avoids potential issue.
However, this requires assigning the release function in advance and
also handling the special case where ida allocation fails in
rpmsg_eptdev_add (removing the manual ida release).



> +		 */
> +		kfree(eptdev);
>   		return ret;
>   	}
>   
> @@ -572,6 +573,7 @@ static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
>   	struct rpmsg_channel_info chinfo;
>   	struct rpmsg_eptdev *eptdev;
>   	struct device *dev = &rpdev->dev;
> +	int ret;
>   
>   	memcpy(chinfo.name, rpdev->id.name, RPMSG_NAME_SIZE);
>   	chinfo.src = rpdev->src;
> @@ -590,7 +592,11 @@ static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
>   	 */
>   	eptdev->default_ept->priv = eptdev;
>   
> -	return rpmsg_chrdev_eptdev_add(eptdev, chinfo);
> +	ret = rpmsg_chrdev_eptdev_add(eptdev, chinfo);
> +	if (ret)
> +		kfree(eptdev);
> +
> +	return ret;
>   }
>   
>   static void rpmsg_chrdev_remove(struct rpmsg_device *rpdev)


-- 
Thx and BRs,
Zhongqiu Han
