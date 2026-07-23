Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9BC448B92
	for <linux-remoteproc@vger.kernel.org>; Thu, 23 Jul 2026 14:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784818042; cv=none; b=PrUIyDJ9+Gy/wVt6bQVo8PS/RxlgqMWgwxo6XoU3mxNVjbyeGK0zWTQAIARQYvcEXsXKZtcRd2NmeqRWV+98saG5GjNIePJt/6rlYQG5+uOxZEvlRT7D5Fz41C8bGozBY+RI0Kh4tTRsNSnPBCmJ8aQqcFqdAMw1RwHS8X6LKuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784818042; c=relaxed/simple;
	bh=OWAq9jSxasHlzR2LpKP+JfM5pGc9vmlK182/yx84e5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H8wOI4u9EB3vmGHIiV/fT9rbATbI2Z9x31ZnXEyOUWTH/xR5VB8PBAKaN7YtBOswouGsdFIhjhARMlpgteEumwOd+5SZxrqP5DWDs/NARLGj+j/v9rZhdwd2sP6PvtXzZYD8l+TvgvyU7sBBb8FIuujeiAZi6OAlM0eGHbvrDas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KYogIpqk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gc/ul0zN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KYogIpqk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gc/ul0zN"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCvhXk020970
	for <linux-remoteproc@vger.kernel.org>; Thu, 23 Jul 2026 14:47:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sJFl/rWIG+3PwS5O855pyaCF
	IRlIDPx3F1eQXzJb6rY=; b=KYogIpqkeSNo3S0tmPkWYonseYfMq2howRuz2wLB
	k0fWKoP7E5ro5Dd3rOkK42def7nxyKXbiFEAhvnHS5qJOF0fjC7K2w2umOPFlETu
	Wr+KgiKU5z104tGVJwGw5lEsndG6x8zJ7/vUEfkoCL4UoTkL1dH8Mn3/oNCOVMK7
	ZMvyE7M3XVUDTU9CbUnfZUbIfeSDXBtQtOVeEGEV1NZdWpXGwziXIgmhufWN0gH8
	cRcf7NUH349palNvWcZxKxGwc8oV584bA5rzRhKYCb7pzQ21y6ZFwxlZuKff1fwH
	7iAl8tYQhjnCnFpcnfmm04Oz5nKL9ZE6jVgiJAV1ZhV+Cg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk6c7kmny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 23 Jul 2026 14:47:19 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84c4cd31b51so639660b3a.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 23 Jul 2026 07:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784818038; x=1785422838; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sJFl/rWIG+3PwS5O855pyaCFIRlIDPx3F1eQXzJb6rY=;
        b=gc/ul0zNLowdBUiJ24Ba7bALNKie1TcmMNlVuL03FdTO7h0MRJaiCqwmq6rIo5OCVb
         3By7CT625xr/Fd2DqCppqkRl0vQqSaAnYQhXmNgw20mWpPqt3ptq6aUm4a/IArUJXdK8
         eLAHeAg1QcUGVsuZ07ET017x2rB7dcIG700fD2PeGGYQTBgQAzrWQ/4YOjP8KgA1xsSh
         q+3AuB2xbeU1JLEl7XrK7hS9hNW0RV+7jnQGwfbcNYq1KmNAezClc7T/mVOfEDTeNWfj
         g5QZ+gUUEFJ57oI9tWSIX8Cdh9I8qDfd9t9gKvoyULzbtm2+Zfj2sadNdbZU7HHDklFb
         3UJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784818038; x=1785422838;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sJFl/rWIG+3PwS5O855pyaCFIRlIDPx3F1eQXzJb6rY=;
        b=b3fdTJux7vUYk82DXsChz5vAtJIEZNyBh1NfHasupxidhw+XTpokAJVN9ptOerle1T
         aa4PT+FTPGWExGQB/z/HRgLBoX4IrPWqVnpHBJT8qnyFci0pX1+E4/YCz7/FkQuVMQ0z
         sfn5rUR+TV7q0kJ5SGeG2WZY+6TKsfXiwUU/wXEgbzbzj1Gc3iwk6CVLyIzrCxUeB+FB
         zv/fOIqpuh9/XZfRihe3hkdbVGPTyP9gBjaI1SHEgeTdOpKkKqsdu+hw12ZY02KaX8iT
         Av8n13giGOWswcLn8W5YB/o/36ono3d28tIg95q5CgF7vNFeGJieFsqOe2JBG+S/7hIb
         EIig==
X-Forwarded-Encrypted: i=1; AHgh+RqfWQ24+xkKfaVy8QSIXwB1HD5JDU0FQnCzR3T8YokYLlGT9vWX2BHChMO9z12Yjv4XOBoZUKPq2yqwYnp3LWOY@vger.kernel.org
X-Gm-Message-State: AOJu0Yzerjw2H3RwAkWNG9pdZlc2tVuJiBp+7DyprQGQDEN1qofidb6g
	4lQOAjeEWurXMhALpVmzuF8H5TXWb+vR8PEPfCfWYpBnJ/KUwTKc14P8xHoAPryjt/xIYJxFMNb
	P6xDbZCg3NfGovGtepmCEPNqdgK7Gl+rtaCW6T+r4c0ftDVvkoEDl1u80/TTbFMA3ZDPQ6K2P
X-Gm-Gg: AR+sD10VUhe5wL8hI1qBJDKUDjNuuJA4yM+sjiqrigMiH4bGmZw1uZwq5TDPo3Eimxz
	MTYPgc7e0V1TRY0rDk+XFK/JBmMUGvcQGUMqwnrMowjI1UjDAO5DISD8rIhL8wey7So37tIFfxv
	rVeZcAhRu39b7h/1+JySb45aYpfRdzLjCa3/01OQmvIVkUqkHauMi1oQVsm4YobhTblfFG+4OOD
	YTzRFQ05EVvGIHazwAUqYcn/jLAvCOMRe9e8+8lGwphrI/lNrUahzZ4upY6gGJmqMO3H86tluKe
	QpOTG75TKGNvL0WU5YR3UZml1vY/5dkkAwxyYGUcAPnP3hxBS7c8N3oKjoRNGBmWwDxgWZLjT+u
	4DdLJM0HNXKLfLLWoVzpDLY22Q/M=
X-Received: by 2002:a05:6a21:730b:b0:3b5:6b5a:4f31 with SMTP id adf61e73a8af0-3c44cb53186mr3448204637.27.1784818038377;
        Thu, 23 Jul 2026 07:47:18 -0700 (PDT)
X-Received: by 2002:a05:6a21:730b:b0:3b5:6b5a:4f31 with SMTP id adf61e73a8af0-3c44cb53186mr3447843637.27.1784818033004;
        Thu, 23 Jul 2026 07:47:13 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147df097e0sm21090074eec.17.2026.07.23.07.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 07:47:12 -0700 (PDT)
Date: Thu, 23 Jul 2026 20:17:06 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Shengjiu Wang <shengjiu.wang@nxp.com>,
        Fernando Guzman Lugo <fernando.lugo@ti.com>,
        Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] remoteproc: Prevent crash handling to race with
 rproc_del()
Message-ID: <20260723144706.cep5sltjt3bnfldr@hu-mojha-hyd.qualcomm.com>
References: <20260723-rproc-rmmod-not-crashing-v1-0-546dfd5de0e6@oss.qualcomm.com>
 <20260723-rproc-rmmod-not-crashing-v1-2-546dfd5de0e6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723-rproc-rmmod-not-crashing-v1-2-546dfd5de0e6@oss.qualcomm.com>
X-Proofpoint-GUID: XYTTMZwoPRaIaqQoe7GAiqhrcSq5D53N
X-Proofpoint-ORIG-GUID: XYTTMZwoPRaIaqQoe7GAiqhrcSq5D53N
X-Authority-Analysis: v=2.4 cv=baZbluPB c=1 sm=1 tr=0 ts=6a622977 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=55bvNncFIk5IGNmgMasA:9 a=CjuIK1q_8ugA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE0NiBTYWx0ZWRfX+ZOTlgwkL5vh
 D/XDW0Gq6EBz9WtirgjAGdy87DFP31ENSrt2nlMWuBlqotpzlF5oDGkCgY5pVzMjs7KbXsZV2bb
 FaWrwGqOZGhYu+CySHMhYJwC8qFTL/o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE0NiBTYWx0ZWRfX8TipEYWX+64F
 VqjrVGzASyCrpJyP3IkK71lu/z0p6w6V+G9ykJAH3JmeJNWhcafDNANpQJBgzrw1GqH/nqFO4YR
 4aFS8H8GFfjSTrOOkAoaF+eoj51cvK69qxNpCSBNcsaztu5krjZ1LADohVD5ObWxkoEjtyImSBF
 qMB7pkoxcvTwxEzF2qd0t+eR/l8P+ApGCx7VRVs2PY/uETAO+udtqW9nAZAGkhkpB3EmNKVVVRg
 MRuQADFlz6qmnuKygg1oLYbaubbMnw1X0g2KNdrqYe8EGj3phLI8coXX2XEJ4CcX2fSh2gVCTtI
 4Ep7ZsreynqpoWMCumxSDqbJSvdugwVwjhGpYVd4IVGF5jdvUItQMfBDDC9LLJJy4k5Tr/oXEQP
 uA2YyzAhYoZoblFlmmTckHpBMNJOA0SE6V0juIZHVTi1psMFBY03hLMJR2X1KnuEyFa1pE5BJzM
 MnSdfVoxrwQMM4x/OZg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230146

On Thu, Jul 23, 2026 at 03:52:28AM +0000, Bjorn Andersson wrote:
> There's no synchronization between rproc_crash_handler_work() and
> rproc_del(), as such it's possible for a driver to be removed while
> crash-handler work is scheduled, or even executing - resulting in
> use-after-free issues.
> 
> To avoid this the scheduled work need to be cancelled and synchronized
> against before the removal proceeds.
> 
> In order to ensure that this doesn't race with the reporting, and
> thereby scheduling new work, a "deleting" flag is introduced. This is
> similar to the RPROC_DELETE state that was introduced to ensure that
> "start" didn't race with rproc_del(), but the existing mechanism can not
> be used as it's valid to call rproc_report_crash() in atomic context -
> and the "state" is protected by a mutex.
> 
> In the event that work is cancelled the pm_stay_awake() is left
> unbalanced and need to be unrolled.
> 
> The blocking and cancelling of crash-handler work prior to the actual
> rproc_shutdown() call does have the explicit side-effect that crashes
> resulting from the shutdown process will not enter the crash-handling
> path, and as such will not generate devcoredumps etc. Due to the
> existing mutual exclusion between these code paths there's no concrete
> reduction in functionality, but further work would be needed to handle
> this case.
> 
> Assisted-by: OpenCode:GPT-5.5
> Fixes: 8afd519c3470 ("remoteproc: add rproc_report_crash function to notify rproc crashes")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  drivers/remoteproc/remoteproc_core.c  | 42 +++++++++++++++++++++++++++--------
>  drivers/remoteproc/remoteproc_sysfs.c |  1 -
>  include/linux/remoteproc.h            | 13 ++++++-----
>  3 files changed, 41 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 3cd4570513c2..899d2058bc45 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1851,6 +1851,11 @@ int rproc_trigger_recovery(struct rproc *rproc)
>  	if (ret)
>  		return ret;
>  
> +	if (READ_ONCE(rproc->deleting)) {
> +		ret = -ENODEV;
> +		goto unlock_mutex;
> +	}
> +
>  	/* State could have changed before we got the mutex */
>  	if (rproc->state != RPROC_CRASHED)
>  		goto unlock_mutex;
> @@ -1883,6 +1888,11 @@ static void rproc_crash_handler_work(struct work_struct *work)
>  
>  	mutex_lock(&rproc->lock);
>  
> +	if (READ_ONCE(rproc->deleting)) {
> +		mutex_unlock(&rproc->lock);
> +		goto out;
> +	}
> +
>  	if (rproc->state == RPROC_CRASHED) {
>  		/* handle only the first crash detected */
>  		mutex_unlock(&rproc->lock);
> @@ -1938,9 +1948,9 @@ int rproc_boot(struct rproc *rproc)
>  		return ret;
>  	}
>  
> -	if (rproc->state == RPROC_DELETED) {
> +	if (READ_ONCE(rproc->deleting)) {
>  		ret = -ENODEV;
> -		dev_err(dev, "can't boot deleted rproc %s\n", rproc->name);
> +		dev_err(dev, "can't boot deleting rproc %s\n", rproc->name);
>  		goto unlock_mutex;
>  	}
>  
> @@ -2533,8 +2543,9 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>  	INIT_LIST_HEAD(&rproc->subdevs);
>  	INIT_LIST_HEAD(&rproc->dump_segments);
>  
> -	INIT_WORK(&rproc->crash_handler, rproc_crash_handler_work);
>  	INIT_WORK(&rproc->attach_work, rproc_attach_work);
> +	INIT_WORK(&rproc->crash_handler, rproc_crash_handler_work);
> +	spin_lock_init(&rproc->crash_handler_lock);
>  
>  	rproc->state = RPROC_OFFLINE;
>  
> @@ -2598,16 +2609,21 @@ EXPORT_SYMBOL(rproc_put);
>   */
>  int rproc_del(struct rproc *rproc)
>  {
> +	unsigned long flags;
> +
>  	if (!rproc)
>  		return -EINVAL;
>  
> +	spin_lock_irqsave(&rproc->crash_handler_lock, flags);
> +	WRITE_ONCE(rproc->deleting, true);
> +	spin_unlock_irqrestore(&rproc->crash_handler_lock, flags);
> +
> +	if (cancel_work_sync(&rproc->crash_handler))
> +		pm_relax(rproc->dev.parent);
> +
>  	/* TODO: make sure this works with rproc->power > 1 */
>  	rproc_shutdown(rproc);
>  
> -	mutex_lock(&rproc->lock);
> -	rproc->state = RPROC_DELETED;
> -	mutex_unlock(&rproc->lock);
> -
>  	rproc_delete_debug_dir(rproc);
>  
>  	/* the rproc is downref'ed as soon as it's removed from the klist */
> @@ -2719,18 +2735,26 @@ EXPORT_SYMBOL(rproc_get_by_child);
>   */
>  void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type)
>  {
> +	unsigned long flags;
> +
>  	if (!rproc) {
>  		pr_err("NULL rproc pointer\n");
>  		return;
>  	}
>  
> +	spin_lock_irqsave(&rproc->crash_handler_lock, flags);
> +	if (READ_ONCE(rproc->deleting)) {
> +		spin_unlock_irqrestore(&rproc->crash_handler_lock, flags);
> +		return;
> +	}
> +
>  	/* Prevent suspend while the remoteproc is being recovered */
>  	pm_stay_awake(rproc->dev.parent);
> +	queue_work(rproc_recovery_wq, &rproc->crash_handler);

Do we really need this inside the spinlock ?

> +	spin_unlock_irqrestore(&rproc->crash_handler_lock, flags);
>  
>  	dev_err(&rproc->dev, "crash detected in %s: type %s\n",
>  		rproc->name, rproc_crash_to_string(type));
> -
> -	queue_work(rproc_recovery_wq, &rproc->crash_handler);
>  }
>  EXPORT_SYMBOL(rproc_report_crash);
>  
> diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
> index 138e752c5e4e..925b0cdbe577 100644
> --- a/drivers/remoteproc/remoteproc_sysfs.c
> +++ b/drivers/remoteproc/remoteproc_sysfs.c
> @@ -168,7 +168,6 @@ static const char * const rproc_state_string[] = {
>  	[RPROC_SUSPENDED]	= "suspended",
>  	[RPROC_RUNNING]		= "running",
>  	[RPROC_CRASHED]		= "crashed",
> -	[RPROC_DELETED]		= "deleted",
>  	[RPROC_ATTACHED]	= "attached",
>  	[RPROC_DETACHED]	= "detached",
>  	[RPROC_LAST]		= "invalid",
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 17ed75a11e15..ef711a5b1a7f 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -37,6 +37,7 @@
>  
>  #include <linux/types.h>
>  #include <linux/mutex.h>
> +#include <linux/spinlock.h>
>  #include <linux/virtio.h>
>  #include <linux/cdev.h>
>  #include <linux/completion.h>
> @@ -145,7 +146,6 @@ struct rproc_ops {
>   *			a message.
>   * @RPROC_RUNNING:	device is up and running
>   * @RPROC_CRASHED:	device has crashed; need to start recovery
> - * @RPROC_DELETED:	device is deleted
>   * @RPROC_ATTACHED:	device has been booted by another entity and the core
>   *			has attached to it
>   * @RPROC_DETACHED:	device has been booted by another entity and waiting
> @@ -163,10 +163,9 @@ enum rproc_state {
>  	RPROC_SUSPENDED	= 1,
>  	RPROC_RUNNING	= 2,
>  	RPROC_CRASHED	= 3,
> -	RPROC_DELETED	= 4,
> -	RPROC_ATTACHED	= 5,
> -	RPROC_DETACHED	= 6,
> -	RPROC_LAST	= 7,
> +	RPROC_ATTACHED	= 4,
> +	RPROC_DETACHED	= 5,
> +	RPROC_LAST	= 6,
>  };
>  
>  /**
> @@ -261,6 +260,8 @@ enum rproc_features {
>   * @index: index of this rproc device
>   * @attach_work: workqueue for attaching rproc
>   * @crash_handler: workqueue for handling a crash
> + * @crash_handler_lock: serializes crash handler queueing and deletion
> + * @deleting: remoteproc deletion has begun
>   * @crash_cnt: crash counter
>   * @recovery_disabled: flag that state if recovery was disabled
>   * @max_notifyid: largest allocated notify id.
> @@ -305,6 +306,8 @@ struct rproc {
>  	int index;
>  	struct work_struct attach_work;
>  	struct work_struct crash_handler;
> +	spinlock_t crash_handler_lock;
> +	bool deleting;
>  	unsigned int crash_cnt;
>  	bool recovery_disabled;
>  	int max_notifyid;
> 
> -- 
> 2.53.0
> 

-- 
-Mukesh Ojha
