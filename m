Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CFF2C433F5
	for <linux-remoteproc@archiver.kernel.org>; Thu, 10 Feb 2022 18:48:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343553AbiBJSsG (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 10 Feb 2022 13:48:06 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:36842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343552AbiBJSsF (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 10 Feb 2022 13:48:05 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45547CE9
        for <linux-remoteproc@vger.kernel.org>; Thu, 10 Feb 2022 10:48:06 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id r19so11836473pfh.6
        for <linux-remoteproc@vger.kernel.org>; Thu, 10 Feb 2022 10:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VsLbb6fw09jdueYA3hgQp5c4zAw8XroJudfdKUin7Pk=;
        b=A8nvS+811owjf+WxW8Y85nR1hJR7SCEE+KgU8+3UxXLVggL/+xneQ3xxsdomZFPAXG
         OaZZns42B0hs+2AsdSfvl8hZUQmWzBzWaH+qByMuY7ubAhFgdcv1EROA3CJCgEy/N22l
         qmKSV+hHkJbd7bT6MgvX7/y2JnhJOHkdFr/61DANa7QNv4LT4OZu2oaxNjPV1Lga/EOK
         x2OpCvmMg468WnKAGYiPbFU1VuRr0K8cuufsAJcAQy0IEiH7azT/CN/3npSBGlK6TsiP
         rDNUBNMI0KBHn/4JWMEqwhUKIGMF3KH+fTYbZc6Wt/kmUsDuNzJoEeiaBD0Q7Euky40n
         KPng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VsLbb6fw09jdueYA3hgQp5c4zAw8XroJudfdKUin7Pk=;
        b=ERP450mxqOPw2BfebJctEk9cml1XBSuk9IFyW9EnO9bLunjXrvOe25KXAnnWPQ3A9c
         1NC0BNIOBM4ytQnAckUZkF5V6hQaCqJUhewHZRnaSoRYlb3rxOReyHiYt41v5v4Ew8Od
         FKjQ8rXRzlaKyVFOT+peqsNMrMVOTcOVn8khVOT9vXZyXsBV4n9/qG8MZU6ao+ynitit
         ihqa/YeaF0CsfIAFf+2Et/z+X54zFMAvt4ElA8VEHpfOXWwcRj++W4H8nbJwAr+v9bZK
         bv+GiQqLdPGMe2EAtCz1nGyiYOuNNVr9eP3MC5KL66sRHl1HYVkOeZiOLiOdHmlgQZz9
         MY5w==
X-Gm-Message-State: AOAM53278GMrbdMGhfSYPfYiKe4hc0T7a2dhtqcKMMEX1MlA3BOksBxp
        2Z7ocTITu+4DDMHWojOD7oHupA==
X-Google-Smtp-Source: ABdhPJyAcsZT8dibcimAmFBciTXwwwCwtwpwFfr1/pJSIRwcJLfqtsWO+mS9FQ3RSw4EpD30XVcViw==
X-Received: by 2002:a63:6ac3:: with SMTP id f186mr7163744pgc.81.1644518885741;
        Thu, 10 Feb 2022 10:48:05 -0800 (PST)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id oa10sm964695pjb.54.2022.02.10.10.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Feb 2022 10:48:04 -0800 (PST)
Date:   Thu, 10 Feb 2022 11:48:02 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Puranjay Mohan <p-mohan@ti.com>
Cc:     puranjay12@gmail.com, kishon@ti.com, vigneshr@ti.com,
        s-anna@ti.com, bjorn.andersson@linaro.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/2] remoteproc: Introduce deny_sysfs_ops flag
Message-ID: <20220210184802.GB3603040@p14s>
References: <20220209090342.13220-1-p-mohan@ti.com>
 <20220209090342.13220-2-p-mohan@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220209090342.13220-2-p-mohan@ti.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Puranjay,

On Wed, Feb 09, 2022 at 02:33:41PM +0530, Puranjay Mohan wrote:
> The remoteproc framework provides sysfs interfaces for changing
> the firmware name and for starting/stopping a remote processor
> through the sysfs files 'state' and 'firmware'. The 'recovery'
> sysfs file can also be used similarly to control the error recovery
> state machine of a remoteproc. These interfaces are currently
> allowed irrespective of how the remoteprocs were booted (like
> remoteproc self auto-boot, remoteproc client-driven boot etc).
> These interfaces can adversely affect a remoteproc and its clients
> especially when a remoteproc is being controlled by a remoteproc
> client driver(s). Also, not all remoteproc drivers may want to
> support the sysfs interfaces by default.
> 
> Add support to deny the sysfs state/firmware/recovery change by
> introducing a state flag 'deny_sysfs_ops' that the individual
> remoteproc drivers can set based on their usage needs. The default
> behavior is to allow the sysfs operations as before.
> 
> Implement attribute_group->is_visible() to hide the sysfs
> state/firmware/recovery entries when deny_sysfs_ops flag is set.
> 
> Signed-off-by: Puranjay Mohan <p-mohan@ti.com>
> ---
> Changes in v3->v4:
> Use mode = 0444 in rproc_is_visible() to make the sysfs entries
> read-only when the deny_sysfs_ops flag is set.
> ---
>  drivers/remoteproc/remoteproc_sysfs.c | 18 +++++++++++++++++-
>  include/linux/remoteproc.h            |  2 ++
>  2 files changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
> index ea8b89f97d7b..da2d0eecfa44 100644
> --- a/drivers/remoteproc/remoteproc_sysfs.c
> +++ b/drivers/remoteproc/remoteproc_sysfs.c
> @@ -230,6 +230,21 @@ static ssize_t name_show(struct device *dev, struct device_attribute *attr,
>  }
>  static DEVICE_ATTR_RO(name);
>  
> +static umode_t rproc_is_visible(struct kobject *kobj, struct attribute *attr,
> +				int n)
> +{
> +	struct device *dev = kobj_to_dev(kobj);
> +	struct rproc *rproc = to_rproc(dev);
> +	umode_t mode = attr->mode;
> +
> +	if (rproc->deny_sysfs_ops && (attr == &dev_attr_recovery.attr ||
> +				      attr == &dev_attr_firmware.attr ||
> +				      attr == &dev_attr_state.attr))

I was wondering if we should also add coredump to this group to make it an all
or nothing option (name is already read only).

> +		mode = 0444;

Much better.

> +
> +	return mode;
> +}
> +
>  static struct attribute *rproc_attrs[] = {
>  	&dev_attr_coredump.attr,
>  	&dev_attr_recovery.attr,
> @@ -240,7 +255,8 @@ static struct attribute *rproc_attrs[] = {
>  };
>  
>  static const struct attribute_group rproc_devgroup = {
> -	.attrs = rproc_attrs
> +	.attrs = rproc_attrs,
> +	.is_visible = rproc_is_visible,
>  };
>  
>  static const struct attribute_group *rproc_devgroups[] = {
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index e0600e1e5c17..3849c66ce38f 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -523,6 +523,7 @@ struct rproc_dump_segment {
>   * @table_sz: size of @cached_table
>   * @has_iommu: flag to indicate if remote processor is behind an MMU
>   * @auto_boot: flag to indicate if remote processor should be auto-started
> + * @deny_sysfs_ops: flag to not permit sysfs operations on state, firmware and recovery
>   * @dump_segments: list of segments in the firmware
>   * @nb_vdev: number of vdev currently handled by rproc
>   * @elf_class: firmware ELF class
> @@ -562,6 +563,7 @@ struct rproc {
>  	size_t table_sz;
>  	bool has_iommu;
>  	bool auto_boot;
> +	bool deny_sysfs_ops;

Wouldn't "sysfs_read_only" make more sense?


With or without the above and for this set:

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>  	struct list_head dump_segments;
>  	int nb_vdev;
>  	u8 elf_class;
> -- 
> 2.17.1
> 
