Return-Path: <SRS0=9bPA=DG=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37304C2D0A8
	for <linux-remoteproc@archiver.kernel.org>; Tue, 29 Sep 2020 03:29:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D273221734
	for <linux-remoteproc@archiver.kernel.org>; Tue, 29 Sep 2020 03:29:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F8gVtygB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727262AbgI2D3O (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 28 Sep 2020 23:29:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727212AbgI2D3O (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 28 Sep 2020 23:29:14 -0400
Received: from mail-oo1-xc42.google.com (mail-oo1-xc42.google.com [IPv6:2607:f8b0:4864:20::c42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CA74C0613D0
        for <linux-remoteproc@vger.kernel.org>; Mon, 28 Sep 2020 20:29:13 -0700 (PDT)
Received: by mail-oo1-xc42.google.com with SMTP id c4so913564oou.6
        for <linux-remoteproc@vger.kernel.org>; Mon, 28 Sep 2020 20:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hu4YXAuBLQLmzuM9LAe+jg7VyLMnvCxFxuS+4W73o84=;
        b=F8gVtygBYbZft86s9tfz/NKwd0H3W/gZ4dm9DjjXc2FkKzkD4KhqX1FK/LEBcHZun8
         GzwhBFCyaaOKZOoeJ1N/hktUq7NhoDNa33qoTeUpg9i0Fj9D89s9uN7nh3jIo8uhGq0K
         7F9PPyLFMzh6b2uxfE95sBVWauzUyAEVx6edlAfmmDm2fps3G2pfiKXoRBYfxkWyGc/0
         jAEwYm9eXaYXE0VizxOv82UBeC4IGkxVnauMQjW/0W35bOEZsS/BDX9J7AOXT+xqfr0b
         IJ0fMwYEo/p/it0S6RIFyC165DCF4xc00ep1k5Lvya90E/IoMcczwIBrnnFsiuzuWIs0
         9eNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hu4YXAuBLQLmzuM9LAe+jg7VyLMnvCxFxuS+4W73o84=;
        b=QWUjEg9u40Gj3BsyVGykFMuPo9lUqrUAP7WE/H070L0XdKWR5sCwX6UCvLvlL6p6X7
         CZBeVQXnpnmdAv11G8yTF2jWQIlbmIz0npxvGj7HVYkSOH4/g30nVH8egx7dazfLwcNk
         2vUraOM1HPSJrLSazEXYdwPh/6EEx2oS7tZmTryNotN02vkD+0qCi14VmTyfcOKlGFSg
         wlufF+5zTO2aMvRbMlPVQpWhdaSS+AzOUp6dbORSEpcBFD4MOeW3G2JTZ1KgyyfhKnIf
         fp0pLXsMQiqeKgsHj3reI7K9Xtdnd46SzzbkHO2ujEH+m7J3SPngjHi5H1J8nwwKeiUi
         0kfw==
X-Gm-Message-State: AOAM532JUZwt9CEMj3WHapoDPvlw/TLiBf0NGbkLoiUncI6FLxLG8JcZ
        ZpcJz6ulBgRQfCGQkNaIS39TpA==
X-Google-Smtp-Source: ABdhPJxiIqgT96/r1ZkxQ8S6nww5fR0axZFT9tzfWN/Jg5Eg443rLZKF8z8J/5x3gZk9l5NxPGSJyg==
X-Received: by 2002:a4a:315b:: with SMTP id v27mr3088101oog.20.1601350152825;
        Mon, 28 Sep 2020 20:29:12 -0700 (PDT)
Received: from builder.lan (99-135-181-32.lightspeed.austtx.sbcglobal.net. [99.135.181.32])
        by smtp.gmail.com with ESMTPSA id k19sm776741otb.45.2020.09.28.20.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 20:29:12 -0700 (PDT)
Date:   Mon, 28 Sep 2020 22:24:44 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rishabh Bhatnagar <rishabhb@codeaurora.org>
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        tsoni@codeaurora.org, psodagud@codeaurora.org,
        sidgup@codeaurora.org
Subject: Re: [PATCH v6 1/3] remoteproc: Move coredump configuration to sysfs
Message-ID: <20200929032444.GC71055@builder.lan>
References: <1601331456-20432-1-git-send-email-rishabhb@codeaurora.org>
 <1601331456-20432-2-git-send-email-rishabhb@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1601331456-20432-2-git-send-email-rishabhb@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon 28 Sep 17:17 CDT 2020, Rishabh Bhatnagar wrote:

> Move coredump configuration from debugfs to sysfs.This will
> allow usage of this configuration feature in production
> devices where access to debugfs might be limited.
> 
> Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>

I like the end result of this series now Rishabh, but...

> ---
>  Documentation/ABI/testing/sysfs-class-remoteproc | 24 +++++++
>  drivers/remoteproc/remoteproc_debugfs.c          | 90 ------------------------
>  drivers/remoteproc/remoteproc_sysfs.c            | 64 +++++++++++++++++
>  3 files changed, 88 insertions(+), 90 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-remoteproc b/Documentation/ABI/testing/sysfs-class-remoteproc
> index 36094fb..f6c44fa 100644
> --- a/Documentation/ABI/testing/sysfs-class-remoteproc
> +++ b/Documentation/ABI/testing/sysfs-class-remoteproc
> @@ -58,3 +58,27 @@ Description:	Remote processor name
>  		Reports the name of the remote processor. This can be used by
>  		userspace in exactly identifying a remote processor and ease
>  		up the usage in modifying the 'firmware' or 'state' files.
> +
> +What:		/sys/class/remoteproc/.../coredump
> +Date:		July 2020
> +Contact:	Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>
> +Description:	Remote processor coredump configuration
> +
> +		Reports the coredump configuration of the remote processor,
> +		which will be one of:
> +
> +		"default"

...can you please make this "enabled" already here, so that patch 3
doesn't touch the definition of the sysfs. That way we don't introduce a
new sysfs attribute and immediately change it.

Please keep the remainder (rename of defines etc) in patch 3 as is - I
just want the string exposed to userspace to be consistent here.

(Or if you find the end result, you can move patch 3 before this change
in the series)

Regards,
Bjorn

> +		"inline"
> +		"disabled"
> +
> +		"default" means when the remote processor's coredump is
> +		collected it will be copied to a separate buffer and that
> +		buffer is exposed to userspace.
> +
> +		"inline" means when the remote processor's coredump is
> +		collected userspace will directly read from the remote
> +		processor's device memory. Extra buffer will not be used to
> +		copy the dump. Also recovery process will not proceed until
> +		all data is read by usersapce.
> +
> +		"disabled" means no dump will be collected.
> diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
> index 2e3b3e2..732770e 100644
> --- a/drivers/remoteproc/remoteproc_debugfs.c
> +++ b/drivers/remoteproc/remoteproc_debugfs.c
> @@ -28,94 +28,6 @@
>  static struct dentry *rproc_dbg;
>  
>  /*
> - * A coredump-configuration-to-string lookup table, for exposing a
> - * human readable configuration via debugfs. Always keep in sync with
> - * enum rproc_coredump_mechanism
> - */
> -static const char * const rproc_coredump_str[] = {
> -	[RPROC_COREDUMP_DEFAULT]	= "default",
> -	[RPROC_COREDUMP_INLINE]		= "inline",
> -	[RPROC_COREDUMP_DISABLED]	= "disabled",
> -};
> -
> -/* Expose the current coredump configuration via debugfs */
> -static ssize_t rproc_coredump_read(struct file *filp, char __user *userbuf,
> -				   size_t count, loff_t *ppos)
> -{
> -	struct rproc *rproc = filp->private_data;
> -	char buf[20];
> -	int len;
> -
> -	len = scnprintf(buf, sizeof(buf), "%s\n",
> -			rproc_coredump_str[rproc->dump_conf]);
> -
> -	return simple_read_from_buffer(userbuf, count, ppos, buf, len);
> -}
> -
> -/*
> - * By writing to the 'coredump' debugfs entry, we control the behavior of the
> - * coredump mechanism dynamically. The default value of this entry is "default".
> - *
> - * The 'coredump' debugfs entry supports these commands:
> - *
> - * default:	This is the default coredump mechanism. When the remoteproc
> - *		crashes the entire coredump will be copied to a separate buffer
> - *		and exposed to userspace.
> - *
> - * inline:	The coredump will not be copied to a separate buffer and the
> - *		recovery process will have to wait until data is read by
> - *		userspace. But this avoid usage of extra memory.
> - *
> - * disabled:	This will disable coredump. Recovery will proceed without
> - *		collecting any dump.
> - */
> -static ssize_t rproc_coredump_write(struct file *filp,
> -				    const char __user *user_buf, size_t count,
> -				    loff_t *ppos)
> -{
> -	struct rproc *rproc = filp->private_data;
> -	int ret, err = 0;
> -	char buf[20];
> -
> -	if (count > sizeof(buf))
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
> -	if (rproc->state == RPROC_CRASHED) {
> -		dev_err(&rproc->dev, "can't change coredump configuration\n");
> -		err = -EBUSY;
> -		goto out;
> -	}
> -
> -	if (!strncmp(buf, "disable", count)) {
> -		rproc->dump_conf = RPROC_COREDUMP_DISABLED;
> -	} else if (!strncmp(buf, "inline", count)) {
> -		rproc->dump_conf = RPROC_COREDUMP_INLINE;
> -	} else if (!strncmp(buf, "default", count)) {
> -		rproc->dump_conf = RPROC_COREDUMP_DEFAULT;
> -	} else {
> -		dev_err(&rproc->dev, "Invalid coredump configuration\n");
> -		err = -EINVAL;
> -	}
> -out:
> -	return err ? err : count;
> -}
> -
> -static const struct file_operations rproc_coredump_fops = {
> -	.read = rproc_coredump_read,
> -	.write = rproc_coredump_write,
> -	.open = simple_open,
> -	.llseek = generic_file_llseek,
> -};
> -
> -/*
>   * Some remote processors may support dumping trace logs into a shared
>   * memory buffer. We expose this trace buffer using debugfs, so users
>   * can easily tell what's going on remotely.
> @@ -425,8 +337,6 @@ void rproc_create_debug_dir(struct rproc *rproc)
>  			    rproc, &rproc_rsc_table_fops);
>  	debugfs_create_file("carveout_memories", 0400, rproc->dbg_dir,
>  			    rproc, &rproc_carveouts_fops);
> -	debugfs_create_file("coredump", 0600, rproc->dbg_dir,
> -			    rproc, &rproc_coredump_fops);
>  }
>  
>  void __init rproc_init_debugfs(void)
> diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
> index eea514c..2a44571 100644
> --- a/drivers/remoteproc/remoteproc_sysfs.c
> +++ b/drivers/remoteproc/remoteproc_sysfs.c
> @@ -10,6 +10,69 @@
>  
>  #define to_rproc(d) container_of(d, struct rproc, dev)
>  
> +/*
> + * A coredump-configuration-to-string lookup table, for exposing a
> + * human readable configuration via sysfs. Always keep in sync with
> + * enum rproc_coredump_mechanism
> + */
> +static const char * const rproc_coredump_str[] = {
> +	[RPROC_COREDUMP_DEFAULT]	= "default",
> +	[RPROC_COREDUMP_INLINE]		= "inline",
> +	[RPROC_COREDUMP_DISABLED]	= "disabled",
> +};
> +
> +/* Expose the current coredump configuration via debugfs */
> +static ssize_t coredump_show(struct device *dev,
> +			     struct device_attribute *attr, char *buf)
> +{
> +	struct rproc *rproc = to_rproc(dev);
> +
> +	return sprintf(buf, "%s\n", rproc_coredump_str[rproc->dump_conf]);
> +}
> +
> +/*
> + * By writing to the 'coredump' sysfs entry, we control the behavior of the
> + * coredump mechanism dynamically. The default value of this entry is "default".
> + *
> + * The 'coredump' sysfs entry supports these commands:
> + *
> + * default:	This is the default coredump mechanism. When the remoteproc
> + *		crashes the entire coredump will be copied to a separate buffer
> + *		and exposed to userspace.
> + *
> + * inline:	The coredump will not be copied to a separate buffer and the
> + *		recovery process will have to wait until data is read by
> + *		userspace. But this avoid usage of extra memory.
> + *
> + * disabled:	This will disable coredump. Recovery will proceed without
> + *		collecting any dump.
> + */
> +static ssize_t coredump_store(struct device *dev,
> +			      struct device_attribute *attr,
> +			      const char *buf, size_t count)
> +{
> +	struct rproc *rproc = to_rproc(dev);
> +
> +	if (rproc->state == RPROC_CRASHED) {
> +		dev_err(&rproc->dev, "can't change coredump configuration\n");
> +		return -EBUSY;
> +	}
> +
> +	if (sysfs_streq(buf, "disabled")) {
> +		rproc->dump_conf = RPROC_COREDUMP_DISABLED;
> +	} else if (sysfs_streq(buf, "inline")) {
> +		rproc->dump_conf = RPROC_COREDUMP_INLINE;
> +	} else if (sysfs_streq(buf, "default")) {
> +		rproc->dump_conf = RPROC_COREDUMP_DEFAULT;
> +	} else {
> +		dev_err(&rproc->dev, "Invalid coredump configuration\n");
> +		return -EINVAL;
> +	}
> +
> +	return count;
> +}
> +static DEVICE_ATTR_RW(coredump);
> +
>  /* Expose the loaded / running firmware name via sysfs */
>  static ssize_t firmware_show(struct device *dev, struct device_attribute *attr,
>  			  char *buf)
> @@ -138,6 +201,7 @@ static ssize_t name_show(struct device *dev, struct device_attribute *attr,
>  static DEVICE_ATTR_RO(name);
>  
>  static struct attribute *rproc_attrs[] = {
> +	&dev_attr_coredump.attr,
>  	&dev_attr_firmware.attr,
>  	&dev_attr_state.attr,
>  	&dev_attr_name.attr,
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
