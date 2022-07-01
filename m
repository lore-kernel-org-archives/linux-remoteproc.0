Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39214C43334
	for <linux-remoteproc@archiver.kernel.org>; Fri,  1 Jul 2022 14:57:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231724AbiGAO5J (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 1 Jul 2022 10:57:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233645AbiGAO5I (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 1 Jul 2022 10:57:08 -0400
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2481E31380
        for <linux-remoteproc@vger.kernel.org>; Fri,  1 Jul 2022 07:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1656687425; x=1688223425;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=NKH1Z3DCO+Xbgs0dlJZ7l6oceR/8t2mqXIqp87E2rw4=;
  b=uYPyFqdPLSoPN5zBskXGn77vFepdVPduLdJUNQ3HVsx5sEJGTlRyKQNP
   BGUpxEsr3tDZ6P7jVA7TJNN23nw5tqf5XeT9V1+sGdg3WGrRrVMYIK+6p
   dlFkEuItHavbaPJp3qusoI+Jsfdi6gepe7iQA1oHs6FWyslyFr3g1nUas
   4=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 01 Jul 2022 07:57:05 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2022 07:57:04 -0700
Received: from [10.216.41.49] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.47.97.222) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 1 Jul 2022
 07:57:02 -0700
Message-ID: <6f962e8b-9404-9abc-915b-aa5df4f34d88@quicinc.com>
Date:   Fri, 1 Jul 2022 20:26:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v4 ] remoteproc: Use unbounded workqueue for recovery work
Content-Language: en-US
To:     <linux-remoteproc@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>
CC:     <bjorn.andersson@linaro.org>, <mathieu.poirier@linaro.org>
References: <1650367554-15510-1-git-send-email-quic_mojha@quicinc.com>
From:   Mukesh Ojha <quic_mojha@quicinc.com>
In-Reply-To: <1650367554-15510-1-git-send-email-quic_mojha@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.47.97.222)
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Bjorn/Mathieu,

Could you please review this ?

-Mukesh

On 4/19/2022 4:55 PM, Mukesh Ojha wrote:
> There could be a scenario when there is too much load on a core
> (n number of tasks which is affined) or in a case when multiple
> rproc subsystem is going for recovery, they queue their recovery
> work to one core so even though subsystem are independent their
> recovery will be delayed if one of the subsystem recovery work
> is taking more time in completing.
> 
> If we make this queue unbounded, the recovery work could be picked
> on any cpu. This patch is trying to address this.
> 
> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> ---
> Changes in v4:
>    - Removed fallback option on @sarvana comment
>    - Fail the init on workqueue creation failure.
>    - modified commit text.
> 
> Changes in v3:
>    - Add fallback option to go back to earlier path incase recovery wq
>      creation fails.
> 
> Changes in v2:
>    - Removed WQ_HIGHPRI.
>    - Updated commit text.
> 
> 
>   drivers/remoteproc/remoteproc_core.c | 15 +++++++++++++--
>   1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index c510125..c8a1e3e 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -59,6 +59,7 @@ static int rproc_release_carveout(struct rproc *rproc,
>   
>   /* Unique indices for remoteproc devices */
>   static DEFINE_IDA(rproc_dev_index);
> +static struct workqueue_struct *rproc_recovery_wq;
>   
>   static const char * const rproc_crash_names[] = {
>   	[RPROC_MMUFAULT]	= "mmufault",
> @@ -2755,8 +2756,7 @@ void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type)
>   	dev_err(&rproc->dev, "crash detected in %s: type %s\n",
>   		rproc->name, rproc_crash_to_string(type));
>   
> -	/* Have a worker handle the error; ensure system is not suspended */
> -	queue_work(system_freezable_wq, &rproc->crash_handler);
> +	queue_work(rproc_recovery_wq, &rproc->crash_handler);
>   }
>   EXPORT_SYMBOL(rproc_report_crash);
>   
> @@ -2805,6 +2805,13 @@ static void __exit rproc_exit_panic(void)
>   
>   static int __init remoteproc_init(void)
>   {
> +	rproc_recovery_wq = alloc_workqueue("rproc_recovery_wq",
> +						WQ_UNBOUND | WQ_FREEZABLE, 0);
> +	if (!rproc_recovery_wq) {
> +		pr_err("remoteproc: creation of rproc_recovery_wq failed\n");
> +		return -ENOMEM;
> +	}
> +
>   	rproc_init_sysfs();
>   	rproc_init_debugfs();
>   	rproc_init_cdev();
> @@ -2818,9 +2825,13 @@ static void __exit remoteproc_exit(void)
>   {
>   	ida_destroy(&rproc_dev_index);
>   
> +	if (!rproc_recovery_wq)
> +		return;
> +
>   	rproc_exit_panic();
>   	rproc_exit_debugfs();
>   	rproc_exit_sysfs();
> +	destroy_workqueue(rproc_recovery_wq);
>   }
>   module_exit(remoteproc_exit);
>   
