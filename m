Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409C71862
	for <linux-remoteproc@vger.kernel.org>; Thu,  3 Apr 2025 08:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743667283; cv=none; b=A74h7EmWTbPb/CyiaKzX39dx2Cv3bWAdcEVGZSXpRSLLLh2iQJAXE9EJUwH/jL2e2mlWkc0aZTce/TwU/GsOUgDJfTZh6buDESU/EIzNBVCM+7MAsLOESbavL8UlGv4+xkXn/k1LX7nBC+wrmcybRASKFeTAbwjQNG5d/Xk4H0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743667283; c=relaxed/simple;
	bh=2bLtUqYUxNe/2tQq/3j+n7rAk2elXyGgsa2cluhVKBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JGCUT9rT7+6dZl4Pgds3t0fGaDQfC+H2hKXZzo09VsYmV2usF4/aIQz2RdTNDHy5KcOurRJIhKC9q2cCAVWCaPGg6HxtlfEGszZwj19bf3lZZqP2VA89H1tBkmdbOi1gdwidCIuv0BZ0o85yHamTiilvhu2UmXNVxFGRJ9/IakM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jfQM0jro; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jfQM0jro"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53363KfB025337
	for <linux-remoteproc@vger.kernel.org>; Thu, 3 Apr 2025 08:01:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jONCYDqLALq85AX0kk8sfZgM
	K4jPVjtN28Vptd20OVQ=; b=jfQM0jroMJiTGWi1Ty+SZyzjs1U4oOHAscN1/W1R
	VqEmXvF0XP+pR8D7sZHviQMG0oGJHTrWG2vZ94NdQCCcohO2P0JMv+qYt1HYzfqy
	rq4CbnE6hN7MSyk8jCLnzK0Ogn14Q99Zyqmri48Y1V+hWwHyVUQUslsvVLqDQqbB
	2FIvYsyYtdpatlc3Yr1UZv7SL6st3PfT/wKshGfExbFd7Mk4jhNQBM2ifeSKJbM0
	bQMAsqpYiKMTgstbkP8J++9ghNgdwvTdBY9XiiS7XCg6G4lQf3QsNIc/WSTnLN4Z
	AMy6OPIwQzau+uj/UmzX3ywZmPstw2jr/7kXqWL+YwOrOg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45sc2ysbb5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 03 Apr 2025 08:01:19 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-af8d8e0689eso762880a12.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 03 Apr 2025 01:01:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743667278; x=1744272078;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jONCYDqLALq85AX0kk8sfZgMK4jPVjtN28Vptd20OVQ=;
        b=o5aKrqoev8hIp+J9aMiLTy+qAU5cGFz+5I6QpkWv9GKiV6R7fBUOgpDuFSRrTSLs4v
         1g3EC1lAmLBV2a3VdhjmCgSIhE36hElDBBs0JcV4M0YViCdI1996Gqe37OVQxsCRYY9Z
         n8gjDnVamFBeRjy+gB0wCeoJ9WJjkZLiP0lNH52TO1B+7EddlMRApB3OafXe8R5RXSX9
         0k1mxBghoLtelPNklPvWb0VFYxGnn4JlRDLSmRTbjXCFR7Xqs1pm3bfnaP9Wu0NeiZgV
         X5uSauZaMOOTI6dHLYN5Pi/xKXxR1w1+iGnJjBQEPhJG4txDWs0nGGdN3z01gIP7pKas
         yypw==
X-Forwarded-Encrypted: i=1; AJvYcCVrPUn55rUYol1cKx9TFmHZvEEzHOrzEyPBU/8t95EmnOr8HI4s669JVXtbrOzGpJwODoL+YLyubofcrs3J+Tjg@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2U1WD8YNEEl/F9CnvMVanAIHylPRp0sgnivUFOWII0LqqH6O1
	Op5ehgqay9s0Zorflgd7katwbRrjKdHXkMNuABLS8DO7BTXt1NVabOfWKpKIBMAkCR1V3SaXM5Q
	yDG8T6xd6npguTigUTtyPLOXFwrwKhRfBiPzSSNhjPkmGPfN67k/HtDbC/iRz45osKXxB
X-Gm-Gg: ASbGncu0c0plNoYAZ1YVEmg0RKvMWfNt/NTFNCQBSWBH3s2dN3IIhdGOiiJfcY2nZar
	xP5ULILjNHZ3rq0Opd2cf83mWwDk/IvHm5XUgXApOC+LqjutvYMFI+iw6BqeZWDJXvlq6kkUIQ8
	vuA1t3ll96Ro0I1ZYUsK0Q+U6p3AbYUl8gxW2l+hI1bnvO+7cK7qvSggo1M7rT2u6NkD/bFd4ze
	JVEayxoa1RpuZCrKjwJg69iM0N0inCry5mFBKJqKlEqhI9JP1/VPn0zcEzPbr90srFS2god9uOU
	NVtYFWgNf0x2OC6pCutAMxf/Ee5YolkE4OXdWpXovYo=
X-Received: by 2002:a05:6a21:3a4a:b0:1f5:8d3b:e2a6 with SMTP id adf61e73a8af0-2009f7780demr33282592637.27.1743667278334;
        Thu, 03 Apr 2025 01:01:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmapgir2sdInSd/leLtht7M4Wcu9w7gDLn02Si83/CzKP+rm1uSI5CrRqjElHpY7Ipiuc8lw==
X-Received: by 2002:a05:6a21:3a4a:b0:1f5:8d3b:e2a6 with SMTP id adf61e73a8af0-2009f7780demr33282505637.27.1743667277576;
        Thu, 03 Apr 2025 01:01:17 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc352c6esm660325a12.46.2025.04.03.01.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:01:17 -0700 (PDT)
Date: Thu, 3 Apr 2025 13:31:12 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] remoteproc: Add device awake calls in rproc boot and
 shutdown path
Message-ID: <Z+5ASLD3F2TBtn38@hu-mojha-hyd.qualcomm.com>
References: <20250401075921.313348-1-quic_schowdhu@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401075921.313348-1-quic_schowdhu@quicinc.com>
X-Authority-Analysis: v=2.4 cv=AMoviu7M c=1 sm=1 tr=0 ts=67ee404f cx=c_pps a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=9Q7f8ODUNuIRQmgIIaoA:9 a=lR5CYZuvRWYf1zzp:21
 a=CjuIK1q_8ugA:10 a=x9snwWr2DeNwDh03kgHS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: zoJRfxmsNomJNPKjwLRiTo5YUInKsqgV
X-Proofpoint-ORIG-GUID: zoJRfxmsNomJNPKjwLRiTo5YUInKsqgV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_03,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 mlxscore=0 impostorscore=0
 clxscore=1015 spamscore=0 phishscore=0 mlxlogscore=999 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504030033

On Tue, Apr 01, 2025 at 01:29:21PM +0530, Souradeep Chowdhury wrote:
> Add device awake calls in case of rproc boot and rproc shutdown path.
> Currently, device awake call is only present in the recovery path
> of remoteproc. If a user stops and starts rproc by using the sysfs
> interface, then on pm suspension the firmware loading fails as the

"firmware loading which relies on userspace to load the firmware may
fail as during suspend freezing of processes happens and due to which
usermodehelper gets disable."

> request_firmware call under adsp_load returns failure. Add device
> awake calls to fix this.
> 
> Signed-off-by: Souradeep Chowdhury <quic_schowdhu@quicinc.com>
> ---
> Changes in v4
> 
> *Remove stability from mailing list
> *Remove the extra tab in v3
> *Change the commit description

nit: It would have been better if you have added detail what are all thing
happened between as v1-v3 here and link to respective lore links.

Changes in v3: 
..,

Changes in v2:
..,

> 
>  drivers/remoteproc/remoteproc_core.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index c2cf0d277729..5d6c4e694b4c 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1917,6 +1917,7 @@ int rproc_boot(struct rproc *rproc)
>  		return -EINVAL;
>  	}
>  
> +	pm_stay_awake(rproc->dev.parent);
>  	dev = &rproc->dev;
>  
>  	ret = mutex_lock_interruptible(&rproc->lock);
> @@ -1961,6 +1962,7 @@ int rproc_boot(struct rproc *rproc)
>  		atomic_dec(&rproc->power);
>  unlock_mutex:
>  	mutex_unlock(&rproc->lock);
> +	pm_relax(rproc->dev.parent);
>  	return ret;
>  }
>  EXPORT_SYMBOL(rproc_boot);
> @@ -1991,6 +1993,7 @@ int rproc_shutdown(struct rproc *rproc)
>  	struct device *dev = &rproc->dev;
>  	int ret = 0;
>  
> +	pm_stay_awake(rproc->dev.parent);
>  	ret = mutex_lock_interruptible(&rproc->lock);
>  	if (ret) {
>  		dev_err(dev, "can't lock rproc %s: %d\n", rproc->name, ret);
> @@ -2027,6 +2030,7 @@ int rproc_shutdown(struct rproc *rproc)
>  	rproc->table_ptr = NULL;
>  out:
>  	mutex_unlock(&rproc->lock);
> +	pm_relax(rproc->dev.parent);
>  	return ret;
>  }
>  EXPORT_SYMBOL(rproc_shutdown);

Changes looks fine to me.
Feel free to add

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-Mukesh
