Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A636F142E77;
	Mon, 14 Oct 2024 20:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728938509; cv=none; b=XnnMfMHGYG5wKFPe5/lJajxiRp7HPdyeecE0N6IZhhknLG/4tNnZYdkh4BcHN08hWRmNbnJ+TMAfNh67v2vWpn4Qty3b6roCRBggq5SvKFhX5EbGNcW5nxEwlIViLqh3xCklQKIKX+egoJ3MCBHNOInajpqG8lvfdVI1AfLwJZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728938509; c=relaxed/simple;
	bh=KIhCvj8sHVSwzcZ32T75V9Q/rU0yXrZLHrMeYUiSD4o=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OIZY/XJ9VMs5tfehwG3+Bwk4dNJWiAt4C2cZ2588NdxM+ZrZVBbLHhKbjDMERm1XjdohetEtrZz3n+PxLQ3i0SF8FRbMXuX276RfgPuff3SLMLuUc0imBKt7BGLtLT5qlrV7YY3uQJVpI6RRe/nk/0XCSc55Q5jfPz6jhlOmVXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EsD+2lNo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EsD+2lNo"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49EBRt42028625;
	Mon, 14 Oct 2024 20:41:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RjwYi393CHmeC1ptbzYYFWdG
	n8zDimk5vEt4Iwwhf3w=; b=EsD+2lNoR53ZOU1TK1Uh9yHPDSoGq1JPhIZ49gco
	W5odmAorAIXfrB+xSj+uHzgoTjaY5XTOG/xVJLR4ygLV0DyT2fl7YvIOvo0mk1lq
	TDsfE9atl5I505rS2IqT7j8vAiIlfdgUl88xrQdnDkGETLgox8WKu9FDkHYtbWsl
	iJ3tYjdus4AmCgCDTrOeGOYE+wZPrRTISTbvk2L2+2JooRE/vCrgiK8mdaqiltWA
	A42oKlXpOBTTssFG8UftpBiRbryY8951czinlvTif9o+hS3pZVGrn59n2+bmTiYd
	PvWfEdaqJm9bhnoLisyH8ldPzoRd+jpGnjAQQeEwDiBRhg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4292evh9ye-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 20:41:43 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49EKfgG8012166
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 20:41:42 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 14 Oct 2024 13:41:41 -0700
Date: Tue, 15 Oct 2024 02:11:37 +0530
From: Mukesh Ojha <quic_mojha@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] remoteproc: Add a new remoteproc state RPROC_DEFUNCT
Message-ID: <Zw2CAbMozI8vu4SL@hu-mojha-hyd.qualcomm.com>
References: <20241014203118.1580024-1-quic_mojha@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241014203118.1580024-1-quic_mojha@quicinc.com>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 7WC7MWvtikZyL_OmV7edmpXpuk6X4P0E
X-Proofpoint-ORIG-GUID: 7WC7MWvtikZyL_OmV7edmpXpuk6X4P0E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 malwarescore=0 mlxlogscore=999 lowpriorityscore=0
 phishscore=0 adultscore=0 bulkscore=0 mlxscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410140147

On Tue, Oct 15, 2024 at 02:01:18AM +0530, Mukesh Ojha wrote:
> Multiple call to glink_subdev_stop() for the same remoteproc can happen
> if rproc_stop() fails from Process-A that leaves the rproc state to
> RPROC_CRASHED state later a call to recovery_store from user space in
> Process B triggers rproc_trigger_recovery() of the same remoteproc to
> recover it results in NULL pointer dereference issue in
> qcom_glink_smem_unregister().
> 
> There is other side to this issue if we want to fix this via adding a
> NULL check on glink->edge which does not guarantees that the remoteproc
> will recover in second call from Process B as it has failed in the first
> Process A during SMC shutdown call and may again fail at the same call
> and rproc can not recover for such case.
> 
> Add a new rproc state RPROC_DEFUNCT i.e., non recoverable state of
> remoteproc and the only way to recover from it via system restart.
> 
> 	Process-A                			Process-B
> 
>   fatal error interrupt happens
> 
>   rproc_crash_handler_work()
>     mutex_lock_interruptible(&rproc->lock);
>     ...
> 
>        rproc->state = RPROC_CRASHED;
>     ...
>     mutex_unlock(&rproc->lock);
> 
>     rproc_trigger_recovery()
>      mutex_lock_interruptible(&rproc->lock);
> 
>       adsp_stop()
>       qcom_q6v5_pas 20c00000.remoteproc: failed to shutdown: -22
>       remoteproc remoteproc3: can't stop rproc: -22
>      mutex_unlock(&rproc->lock);
> 
> 						echo enabled > /sys/class/remoteproc/remoteprocX/recovery
> 						recovery_store()
> 						 rproc_trigger_recovery()
> 						  mutex_lock_interruptible(&rproc->lock);
> 						   rproc_stop()
> 						    glink_subdev_stop()
> 						      qcom_glink_smem_unregister() ==|
>                                                                                      |
>                                                                                      V
> 						      Unable to handle kernel NULL pointer dereference
>                                                                 at virtual address 0000000000000358
> 
> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> ---
> Changes in v2:
>  - Removed NULL pointer check instead added a new state to signify
>    non-recoverable state of remoteproc.
> 
>  drivers/remoteproc/remoteproc_core.c  | 3 ++-
>  drivers/remoteproc/remoteproc_sysfs.c | 1 +
>  include/linux/remoteproc.h            | 5 ++++-
>  3 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index f276956f2c5c..494c8fcc63ca 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1727,6 +1727,7 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
>  	/* power off the remote processor */
>  	ret = rproc->ops->stop(rproc);
>  	if (ret) {
> +		rproc->state = RPROC_DEFUNCT;

I have put it here, but I am more inclined towards adding this
assignment in qcom remoteproc(pas) driver.

-Mukesh

>  	}
> @@ -1839,7 +1840,7 @@ int rproc_trigger_recovery(struct rproc *rproc)
>  		return ret;
>  
>  	/* State could have changed before we got the mutex */
> -	if (rproc->state != RPROC_CRASHED)
> +	if (rproc_start == RPROC_DEFUNCT || rproc->state != RPROC_CRASHED)
>  		goto unlock_mutex;
>  
>  	dev_err(dev, "recovering %s\n", rproc->name);
> diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
> index 138e752c5e4e..5f722b4576b2 100644
> --- a/drivers/remoteproc/remoteproc_sysfs.c
> +++ b/drivers/remoteproc/remoteproc_sysfs.c
> @@ -171,6 +171,7 @@ static const char * const rproc_state_string[] = {
>  	[RPROC_DELETED]		= "deleted",
>  	[RPROC_ATTACHED]	= "attached",
>  	[RPROC_DETACHED]	= "detached",
> +	[RPROC_DEFUNCT]		= "defunct",
>  	[RPROC_LAST]		= "invalid",
>  };
>  
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index b4795698d8c2..3e4ba06c6a9a 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -417,6 +417,8 @@ struct rproc_ops {
>   *			has attached to it
>   * @RPROC_DETACHED:	device has been booted by another entity and waiting
>   *			for the core to attach to it
> + * @RPROC_DEFUNCT:	device neither crashed nor responding to any of the
> + * 			requests and can only recover on system restart.
>   * @RPROC_LAST:		just keep this one at the end
>   *
>   * Please note that the values of these states are used as indices
> @@ -433,7 +435,8 @@ enum rproc_state {
>  	RPROC_DELETED	= 4,
>  	RPROC_ATTACHED	= 5,
>  	RPROC_DETACHED	= 6,
> -	RPROC_LAST	= 7,
> +	RPROC_DEFUNCT	= 7,
> +	RPROC_LAST	= 8,
>  };
>  
>  /**
> -- 
> 2.34.1
> 
