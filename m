Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77D43557FB
	for <linux-remoteproc@vger.kernel.org>; Mon, 12 Jan 2026 11:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768215771; cv=none; b=DH3ia1s1sDeX1YcOskQ4iXs1rCTlYACYMPV+ELUcOvoEnqNp33iU+OPAYjh8XHAFzInQyTNlwO7R/OZ2G/ntdEU5nvAdyyMLxJEfVmd8ZjtGkBJrsvyJi20Ez7rX6P4XPAZfdPqE1zGW0Dbbmcpfxoo7cZkdbKIznd58t31EOOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768215771; c=relaxed/simple;
	bh=BI77GbH2CShZAbyhTOA5FhIdqhX8qytSDV0VQ4JAovY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V1QgrMRzv8jplTe9JcNJAwrS/ga24zdfBu+2vjmaJaVBw2k8yjJtI537AeS3jdahIjmiN3S4xChQv92y+hhBfiWB/1SVto1xEI7uDhIfNLBPNuf87/gzFV+HgC6b/ICTyH2/PedvRDRJfHDVzAOW0qyAUDOC7coTSebfALQ213I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ROrxGrv5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tq6ug/pq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ROrxGrv5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tq6ug/pq"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C88HJo324913
	for <linux-remoteproc@vger.kernel.org>; Mon, 12 Jan 2026 11:02:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	92nR8ehMAhwX0t6j0LKQ/eeB25uqU+Z3ZfW5smyUlNU=; b=ROrxGrv5PMh8JHlk
	Sk4yE8LYMTinFyDonoYOYc0uHtbi8FwdLsCQ1GCPsvVvWAqvKO+Enep6lTfPyEKn
	DrdhcPuH/xwuH4m+6Mm2j9u0KPiILHIv6Wb6tJRDmmSu+R3u0ItCQJv61NYrljxZ
	ogxYJwWH98mOc/eRzLx8xo3CsiVB9j+tIiIpbXeDT4oKq/xGa9MGEx6Nhbpw3HcS
	gBMicWLRnER7gtzuZG1Oa2v5Yx6De3gSYbL+d47MWAOsyhE8szpJcAv0Brm1oQZi
	1ZieOhCirC9a5TGnASRsqr23/CWgq7V9CeBzI6m+fhESnUQiSukJ7JxqEBJOzxrn
	gVnxVg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bm8kytq4h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 12 Jan 2026 11:02:48 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-81eef665b49so4222719b3a.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 12 Jan 2026 03:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768215767; x=1768820567; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=92nR8ehMAhwX0t6j0LKQ/eeB25uqU+Z3ZfW5smyUlNU=;
        b=Tq6ug/pqCou6DSJG1PkAKEJ9S+XTgd6G8E9+EQ4BlANzuMi7/mviQgkzZrkXsp6I5z
         Fs0Sk5gqni5RW1AJAkyXDiKxPtR05zUfQwTZZZp6H08PUSWH2ERJ9uAY3alucxxOmxzP
         ty42RGAq27Ggj5TW5fQNgvwb7Q7OjMxQPj9HLLiPhi7Teqfzj1IuV78A82CWyTgVHlHI
         3WhX9+kPCP5yz4hMRZkUDFI5BzXexGhuR14P1B60FVXlq9mn3nGI84c8oaWauQ4dUaPR
         +lT6/J8hu77Vg0Yiapj4qCO0iJYZdKKlKfemyK/JvHZcExBU+4jFCCFbgx/YMXuHNXRt
         M41g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768215767; x=1768820567;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=92nR8ehMAhwX0t6j0LKQ/eeB25uqU+Z3ZfW5smyUlNU=;
        b=DVgls+1DSAJN1n7eZNVAUnImEo567PzgNNllKEU748KePNfT5i2RDkrqihGG8gA87S
         fE+fUS5YlVXxDGHOr0C/Dfl7g97lrGH7oED4lJukACqw3x/RPh3u2SAPJGIa950mWdCa
         xWR510i119jdZnzrR110HFjYJ5KkmoupG33Zc7Thk9DTdkOGEKZBhbJjKbJBw3u7NNUS
         PVRrLYbLWJzvvl3dTwyRB+cfU6QkX0MjWs9QCUQhC3LmPF23veB66w/XzbE3d6w86u1K
         iHtOcOLrxO/bOl3jKUjAug4AJrIKTCJ3cjkPC+6moRtmZzc35eztrLd62h031xQcHGa+
         ydVw==
X-Gm-Message-State: AOJu0Yxa/H0FtnsAJXkaoKKJ9uX9Sh7nC8pNvRSXLbhvV2o1ZXOQFf+q
	24Mtd50ki66nYqAocgOx1GCQ7apZnELOBR0wZMuRT4IY3lp9nJtYDinvdn8442JytHq+J0iskLm
	bTfnOb3A+6Aav53iSxiBEg26vNHcQQxj+IiaqYVrLwLHbx8zGxdMpNCvgwMD+FP92WDAQBhH6Ok
	GZ9mkK
X-Gm-Gg: AY/fxX6rzEhdAgHO20qxj1wtvW14ST9O83hZxqpFQBYEo92HMmmmHfqWKfWjs/4Ezr8
	AJMrgrU3Hje5uNJ3kuNgbNyoBvq3JBWvF2K6vKswiLIZ463Zq0coP9mFugB/us2J0zMnHi0HbCL
	cexlTkegJqQgLbcCCPnVkyUcnRhTxwfPUbKOkRGJbU+KFEj6DSlFiRCNBMwRrb8X56XdqIYKPIe
	9MJgw5B3kxtgt2/EUaH/s5iG/zrnglTU5MewuS1/cP9MfmTjXkwygA77zf/Z6XdUGQKR6fXmp4U
	kXcnSYo117SNW8wtve9XqbeeP5ygSm75IB9uiE6qYjXyNFblmomydylduHU/ASL2whszUoej7UR
	EIjjbiXongV4xyaXM+irWGmd4UPBvnqbYPLfvUnGiAjduq+CvC6ryScwUbcak9WFVgZsVqVCj+0
	z/RoCQeQ==
X-Received: by 2002:a05:6a20:7d9e:b0:366:14b0:1a2f with SMTP id adf61e73a8af0-3898f9c9b4bmr15346346637.61.1768215767427;
        Mon, 12 Jan 2026 03:02:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGrqrJYsPk/QB6i0gGWdfN2MeiWNBdjSyu5jeukt9NKG7MIDJo/tLhAQPMsMlUa1wr+AahUew==
X-Received: by 2002:a05:6a20:7d9e:b0:366:14b0:1a2f with SMTP id adf61e73a8af0-3898f9c9b4bmr15346320637.61.1768215766916;
        Mon, 12 Jan 2026 03:02:46 -0800 (PST)
Received: from [10.133.33.213] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cc05cd87asm17199022a12.15.2026.01.12.03.02.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 03:02:46 -0800 (PST)
Message-ID: <5fdae92c-207a-4544-9113-8aca8fef693b@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 19:02:42 +0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: virtio: fix uninitialized buffer use in
 rproc_virtio_get()
To: Kery Qi <qikeyu2017@gmail.com>, andersson@kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, zhongqiu.han@oss.qualcomm.com
References: <20260108192336.1826-1-qikeyu2017@gmail.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20260108192336.1826-1-qikeyu2017@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: od20snSH3fAR2Egqetb04scWSlazeq8q
X-Authority-Analysis: v=2.4 cv=ZuDg6t7G c=1 sm=1 tr=0 ts=6964d4d8 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=TOrbRP20InAV96cnAvYA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: od20snSH3fAR2Egqetb04scWSlazeq8q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4NyBTYWx0ZWRfXz7CK/BtdtEPE
 +bSSbaWNQdcbVG7IgCMiQmG4LeP/2Jfso7LfuaZHV8XjlXlPWY5BvsWfITEKo+j2JD2mRg8y9ED
 n7ItC+dOJ/zw18luPJLJVrFI10wVymj3QMIv7a4OIg2VN29r0RK7ur5/ddqNWWOAYKpAc65xAYC
 E7kEuy3N7LULLt+/qBDXyL3FFS52pcn254m17zcT8U6uSB9FhZGQLtQbInS3WQ8olHU/ZI6fQLo
 yrnyxGLjAGSVTKyqH9N+kD+pZ6r2vC+ymWu9tsCZiThkVTh08LXiD6aWhBRJcdiE83mUYKtdqfJ
 4tyKFodGwUoiaUxV++s37Ye7hOTgtq/OsC9yr4BCF9emZZ3yM/x3gPRumHZJj8zVeNdFh4hQPYt
 yOTN/vD6qAs4tM4x2VHiO9oj0DcSb6OeM3RmyE45/z1yqO7y9NFK069BxJeetV9jaxYXvc6R4YZ
 MAPV15dxKbP8okQy5Vg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120087

On 1/9/2026 3:23 AM, Kery Qi wrote:
> rproc_virtio_get() returns early on out-of-bounds access without touching
> the caller-provided buffer. Callers of virtio config accessors commonly
> pass stack storage and do not get an error code back, so stale/uninit
> bytes may be consumed as device configuration, leading to unpredictable
> behavior and potentially leaking stack data if later exposed.
> 
> Always clear the destination buffer, reject offsets past config_len, and
> clamp the read length to the available config bytes before copying.
> 
> Fixes: 92b38f851470 ("remoteproc: support virtio config space.")
> Signed-off-by: Kery Qi <qikeyu2017@gmail.com>

Please use ./scripts/get_maintainer.pl to retrieve the full list of
maintainer email and cc list.

> ---
>   drivers/remoteproc/remoteproc_virtio.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> index c5d46a878149..8fa8c8a86b4b 100644
> --- a/drivers/remoteproc/remoteproc_virtio.c
> +++ b/drivers/remoteproc/remoteproc_virtio.c
> @@ -298,10 +298,13 @@ static void rproc_virtio_get(struct virtio_device *vdev, unsigned int offset,
>   	rsc = (void *)rvdev->rproc->table_ptr + rvdev->rsc_offset;
>   	cfg = &rsc->vring[rsc->num_of_vrings];

Hi Kery,

You want to initialize the buffer to avoid issues caused by calling the
virtio_cread macro with an uninitialized variable buffer, which should
be fair enough,

virtio_cread(vdev, structname, member, ptr)
	vdev->config->get()
	OR
	__virtio_cread_many()
		vdev->config->get()


>   
> -	if (offset + len > rsc->config_len || offset + len < len) {
> -		dev_err(&vdev->dev, "rproc_virtio_get: access out of bounds\n");
> +	memset(buf, 0, len);
> +

The original check offset + len > rsc->config_len ensures that access to
the config space does not overflow, while offset + len < len is used to
detect unsigned integer overflow.


> +	if (offset > rsc->config_len)

Any log info?

>   		return;
> -	}

And then may I know what does this really mean? Are you suggesting a
quick fast path check or something else? Please clarify the reasoning
behind this, and if that makes sense, please split the initialization
and the boundary check into two separate patches.

> +
> +		if (len > rsc->config_len - offset)

Formatting issue here.

> +			len = rsc->config_len - offset;

Why is truncation allowed here? Any err log info?


>   
>   	memcpy(buf, cfg + offset, len);
>   }


-- 
Thx and BRs,
Zhongqiu Han
