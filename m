Return-Path: <SRS0=H4uj=DH=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80EE0C2D0A8
	for <linux-remoteproc@archiver.kernel.org>; Wed, 30 Sep 2020 08:11:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 12686206C3
	for <linux-remoteproc@archiver.kernel.org>; Wed, 30 Sep 2020 08:11:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="oXQqT5tM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725535AbgI3ILS (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 30 Sep 2020 04:11:18 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:23714 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725440AbgI3ILS (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 30 Sep 2020 04:11:18 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 08U87UF9029009;
        Wed, 30 Sep 2020 10:11:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=U4NaeizldYybDCLGDRiQznotXAnB6Ugq5oCOzl1S2jk=;
 b=oXQqT5tMtLEN+2K1kqTnQm+iDospaFMLAdYEPwkptFvIgPD4ALFv2uFCLYzV4MyjNkiv
 6MHjWrB2qSgoZNCVeOLmcotNjWBBT9gP1LVjtX5uZ1iMsjwaPqoLWXHud+UGgxsMA4ON
 TZtPMYTXGrXAFKzShqprscn7te4DwQAAW4PeWxFQUQAcbmCGIomXUuVrCbk5V4KTiPV/
 oeznNq/ZCqqFjBXSTVx6ph1pQSF+rpvXyHKCBMSLGN6W6puXmyGyoxKD0U6HQn86eEiH
 60L5YqFkGalix1LedBEXuGqsaYvNGPNMur4HEgLCkfXDcPvZCbmpamb+7dt/qFPXVF0a YA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 33su3ywgq7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 30 Sep 2020 10:11:12 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4AAA610002A;
        Wed, 30 Sep 2020 10:11:10 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CB15A21E676;
        Wed, 30 Sep 2020 10:11:10 +0200 (CEST)
Received: from lmecxl0889.tpe.st.com (10.75.127.45) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 30 Sep
 2020 10:11:09 +0200
Subject: Re: [PATCH v6 2/3] remoteproc: Move recovery configuration to sysfs
To:     Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>
CC:     "tsoni@codeaurora.org" <tsoni@codeaurora.org>,
        "psodagud@codeaurora.org" <psodagud@codeaurora.org>,
        "sidgup@codeaurora.org" <sidgup@codeaurora.org>
References: <1601331456-20432-1-git-send-email-rishabhb@codeaurora.org>
 <1601331456-20432-3-git-send-email-rishabhb@codeaurora.org>
From:   Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <8a9dee56-b204-6160-1e69-60286543379e@st.com>
Date:   Wed, 30 Sep 2020 10:11:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1601331456-20432-3-git-send-email-rishabhb@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-30_05:2020-09-29,2020-09-30 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 9/29/20 12:17 AM, Rishabh Bhatnagar wrote:
> Move recovery configuration from debugfs to sysfs.This will
> allow usage of this configuration feature in production
> devices where access to debugfs might be limited.
> 
> Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
> ---
>  Documentation/ABI/testing/sysfs-class-remoteproc | 20 ++++++
>  drivers/remoteproc/remoteproc_debugfs.c          | 78 ------------------------
>  drivers/remoteproc/remoteproc_sysfs.c            | 56 +++++++++++++++++
>  3 files changed, 76 insertions(+), 78 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-remoteproc b/Documentation/ABI/testing/sysfs-class-remoteproc
> index f6c44fa..7368b50 100644
> --- a/Documentation/ABI/testing/sysfs-class-remoteproc
> +++ b/Documentation/ABI/testing/sysfs-class-remoteproc
> @@ -82,3 +82,23 @@ Description:	Remote processor coredump configuration
>  		all data is read by usersapce.
>  
>  		"disabled" means no dump will be collected.
> +
> +What:		/sys/class/remoteproc/.../recovery
> +Date:		July 2020
> +Contact:	Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>
> +Description:	Remote processor recovery mechanism
> +
> +		Reports the recovery mechanism of the remote processor,
> +		which will be one of:
> +
> +		"enabled"
> +		"disabled"
> +
> +		"enabled" means, the remote processor will be automatically
> +		recovered whenever it crashes. Moreover, if the remote
> +		processor crashes while recovery is disabled, it will
> +		be automatically recovered too as soon as recovery is enabled.
> +
> +		"disabled" means, a remote processor will remain in a crashed
> +		state if it crashes. This is useful for debugging purposes;
> +		without it, debugging a crash is substantially harder.
> diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
> index 732770e..c505f0e 100644
> --- a/drivers/remoteproc/remoteproc_debugfs.c
> +++ b/drivers/remoteproc/remoteproc_debugfs.c
> @@ -84,82 +84,6 @@ static const struct file_operations rproc_name_ops = {
>  	.llseek	= generic_file_llseek,
>  };
>  
> -/* expose recovery flag via debugfs */
> -static ssize_t rproc_recovery_read(struct file *filp, char __user *userbuf,
> -				   size_t count, loff_t *ppos)
> -{
> -	struct rproc *rproc = filp->private_data;
> -	char *buf = rproc->recovery_disabled ? "disabled\n" : "enabled\n";
> -
> -	return simple_read_from_buffer(userbuf, count, ppos, buf, strlen(buf));
> -}
> -
> -/*
> - * By writing to the 'recovery' debugfs entry, we control the behavior of the
> - * recovery mechanism dynamically. The default value of this entry is "enabled".
> - *
> - * The 'recovery' debugfs entry supports these commands:
> - *
> - * enabled:	When enabled, the remote processor will be automatically
> - *		recovered whenever it crashes. Moreover, if the remote
> - *		processor crashes while recovery is disabled, it will
> - *		be automatically recovered too as soon as recovery is enabled.
> - *
> - * disabled:	When disabled, a remote processor will remain in a crashed
> - *		state if it crashes. This is useful for debugging purposes;
> - *		without it, debugging a crash is substantially harder.
> - *
> - * recover:	This function will trigger an immediate recovery if the
> - *		remote processor is in a crashed state, without changing
> - *		or checking the recovery state (enabled/disabled).
> - *		This is useful during debugging sessions, when one expects
> - *		additional crashes to happen after enabling recovery. In this
> - *		case, enabling recovery will make it hard to debug subsequent
> - *		crashes, so it's recommended to keep recovery disabled, and
> - *		instead use the "recover" command as needed.
> - */
> -static ssize_t
> -rproc_recovery_write(struct file *filp, const char __user *user_buf,
> -		     size_t count, loff_t *ppos)
> -{
> -	struct rproc *rproc = filp->private_data;
> -	char buf[10];
> -	int ret;
> -
> -	if (count < 1 || count > sizeof(buf))
> -		return -EINVAL;
> -
> -	ret = copy_from_user(buf, user_buf, count);
> -	if (ret)
> -		return -EFAULT;
> -
> -	/* remove end of line */
> -	if (buf[count - 1] == '\n')
> -		buf[count - 1] = '\0';
> -
> -	if (!strncmp(buf, "enabled", count)) {
> -		/* change the flag and begin the recovery process if needed */
> -		rproc->recovery_disabled = false;
> -		rproc_trigger_recovery(rproc);
> -	} else if (!strncmp(buf, "disabled", count)) {
> -		rproc->recovery_disabled = true;
> -	} else if (!strncmp(buf, "recover", count)) {
> -		/* begin the recovery process without changing the flag */
> -		rproc_trigger_recovery(rproc);
> -	} else {
> -		return -EINVAL;
> -	}
> -
> -	return count;
> -}
> -
> -static const struct file_operations rproc_recovery_ops = {
> -	.read = rproc_recovery_read,
> -	.write = rproc_recovery_write,
> -	.open = simple_open,
> -	.llseek = generic_file_llseek,
> -};
> -
>  /* expose the crash trigger via debugfs */
>  static ssize_t
>  rproc_crash_write(struct file *filp, const char __user *user_buf,
> @@ -329,8 +253,6 @@ void rproc_create_debug_dir(struct rproc *rproc)
>  
>  	debugfs_create_file("name", 0400, rproc->dbg_dir,
>  			    rproc, &rproc_name_ops);
> -	debugfs_create_file("recovery", 0600, rproc->dbg_dir,
> -			    rproc, &rproc_recovery_ops);
>  	debugfs_create_file("crash", 0200, rproc->dbg_dir,
>  			    rproc, &rproc_crash_ops);
>  	debugfs_create_file("resource_table", 0400, rproc->dbg_dir,
> diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
> index 2a44571..e60a014 100644
> --- a/drivers/remoteproc/remoteproc_sysfs.c
> +++ b/drivers/remoteproc/remoteproc_sysfs.c
> @@ -10,6 +10,61 @@
>  
>  #define to_rproc(d) container_of(d, struct rproc, dev)
>  
> +static ssize_t recovery_show(struct device *dev,
> +			     struct device_attribute *attr, char *buf)
> +{
> +	struct rproc *rproc = to_rproc(dev);
> +
> +	return sprintf(buf, "%s", rproc->recovery_disabled ? "disabled\n" : "enabled\n");
> +}
> +
> +/*
> + * By writing to the 'recovery' sysfs entry, we control the behavior of the
> + * recovery mechanism dynamically. The default value of this entry is "enabled".
> + *
> + * The 'recovery' sysfs entry supports these commands:
> + *
> + * enabled:	When enabled, the remote processor will be automatically
> + *		recovered whenever it crashes. Moreover, if the remote
> + *		processor crashes while recovery is disabled, it will
> + *		be automatically recovered too as soon as recovery is enabled.
> + *
> + * disabled:	When disabled, a remote processor will remain in a crashed
> + *		state if it crashes. This is useful for debugging purposes;
> + *		without it, debugging a crash is substantially harder.
> + *
> + * recover:	This function will trigger an immediate recovery if the
> + *		remote processor is in a crashed state, without changing
> + *		or checking the recovery state (enabled/disabled).
> + *		This is useful during debugging sessions, when one expects

Recovery seems to be related to debugging, is it wise to expose it in sysfs?
This would allow the user space to restart remote processor and generate core
dumps at any time...Is this the expected behavior?

For your information, in the ST test suite, we use this mechanism also to simulate a
proc crash. This is useful for testing the recovery of RPMsg channels...

Regards
Arnaud

> + *		additional crashes to happen after enabling recovery. In this
> + *		case, enabling recovery will make it hard to debug subsequent
> + *		crashes, so it's recommended to keep recovery disabled, and
> + *		instead use the "recover" command as needed.
> + */
> +static ssize_t recovery_store(struct device *dev,
> +			      struct device_attribute *attr,
> +			      const char *buf, size_t count)
> +{
> +	struct rproc *rproc = to_rproc(dev);
> +
> +	if (sysfs_streq(buf, "enabled")) {
> +		/* change the flag and begin the recovery process if needed */
> +		rproc->recovery_disabled = false;
> +		rproc_trigger_recovery(rproc);
> +	} else if (sysfs_streq(buf, "disabled")) {
> +		rproc->recovery_disabled = true;
> +	} else if (sysfs_streq(buf, "recover")) {
> +		/* begin the recovery process without changing the flag */
> +		rproc_trigger_recovery(rproc);
> +	} else {
> +		return -EINVAL;
> +	}
> +
> +	return count;
> +}
> +static DEVICE_ATTR_RW(recovery);
> +
>  /*
>   * A coredump-configuration-to-string lookup table, for exposing a
>   * human readable configuration via sysfs. Always keep in sync with
> @@ -202,6 +257,7 @@ static DEVICE_ATTR_RO(name);
>  
>  static struct attribute *rproc_attrs[] = {
>  	&dev_attr_coredump.attr,
> +	&dev_attr_recovery.attr,
>  	&dev_attr_firmware.attr,
>  	&dev_attr_state.attr,
>  	&dev_attr_name.attr,
> 
