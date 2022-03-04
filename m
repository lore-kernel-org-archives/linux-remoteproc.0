Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D499C433EF
	for <linux-remoteproc@archiver.kernel.org>; Fri,  4 Mar 2022 16:53:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240416AbiCDQyj (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 4 Mar 2022 11:54:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240211AbiCDQyi (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 4 Mar 2022 11:54:38 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2CBAE033
        for <linux-remoteproc@vger.kernel.org>; Fri,  4 Mar 2022 08:53:50 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id q11so8232570pln.11
        for <linux-remoteproc@vger.kernel.org>; Fri, 04 Mar 2022 08:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZJXcL3W0PceqyXw7IwKfN6bUx/3T6GH15UnFDMEPoyo=;
        b=NxwJ+wJHufNaI64Yw/N2Vt9y267jPm97S7C07biM+6lpT/aiHcUYs8IiVXNvtXVH3M
         HMEk/a9R/Ku0yCWlpbEECB7MApj65vJTN0ULmL1tvSdIel5emNYt0KOZYpMvXymY7hP5
         z33R5CBVh2ogXPDlREqfcHRP6+oIlbfZH4Vka1S1psxJMcUTGOIZCikFlRqXU8QzLV3A
         ElJcXS/gNePe1BY2rL2w8fg7c0nUU63MhjZ6BKlaxp0I5d+swl/FewWpdmGWCvqrpw+p
         gixHUt+g966yE9LPX8FvwzjeT4NhNChkzwwiCDSzP3nUUTcfmAxAvE87AzxEl6Saab+w
         QYPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZJXcL3W0PceqyXw7IwKfN6bUx/3T6GH15UnFDMEPoyo=;
        b=kDpOYeK2zDTlAiXFX6ymbFqiYMDO8f/OjLiLazukfdYNVmSBdNZ3ZD2NxONmlK82eI
         R/irLzZmYXMBZk3bxZaByQCiqm10IsroXTKVM//I+4NQuCMp89m2safmZR/UH6b7cPhl
         A9k0aRt5xxTsdUC3UDYGsp+SIAITctdf2FykXno0YVBY2LdshDpoT82/VdaGLig87h29
         SQaverLljuxZJl6pKT+AaRsD9L1vzZAaW4Sp4WlQTuasv+P4FIsjApBPUwOZEajxqVGO
         LZ3FnEUTLT25B84T5ra95WWKjlCKXBZZfm+mnVbw2x0KY8VGw5UxVc+xKjee3aQSI5ls
         qmDA==
X-Gm-Message-State: AOAM530r7CnzYb3LMv7S3sBUUXlLUcsMghMXEnTJlFsZI4gtNo66hIio
        JFvvjWqxe2bSiDGHxSl5p1qLpa4nOMYeIA==
X-Google-Smtp-Source: ABdhPJzyp3E1abihfMJ+ATBcvCgaGVdYSLV9D9EeJ3juz7sdVGYzhlEMIMYMxOdbDTfF5OXRPauR6w==
X-Received: by 2002:a17:90a:6c01:b0:1bf:1e67:b532 with SMTP id x1-20020a17090a6c0100b001bf1e67b532mr6524691pjj.138.1646412830143;
        Fri, 04 Mar 2022 08:53:50 -0800 (PST)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id l20-20020a056a00141400b004f65cedfb09sm6451193pfu.48.2022.03.04.08.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 08:53:48 -0800 (PST)
Date:   Fri, 4 Mar 2022 09:53:46 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Puranjay Mohan <p-mohan@ti.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>, vigneshr@ti.com,
        s-anna@ti.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [EXTERNAL] Re: [PATCH v5 1/2] remoteproc: Introduce
 sysfs_read_only flag
Message-ID: <20220304165346.GA1646337@p14s>
References: <20220216081224.9956-1-p-mohan@ti.com>
 <20220216081224.9956-2-p-mohan@ti.com>
 <0d44d73f-d882-83db-9cf2-09f7cdc91ab2@ti.com>
 <Yg80gABeszDDN/m6@ripper>
 <869aa1ad-e3ed-cd0b-ab5e-a4b7d1d23311@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <869aa1ad-e3ed-cd0b-ab5e-a4b7d1d23311@ti.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Mar 03, 2022 at 01:30:08PM +0530, Puranjay Mohan wrote:
> Hi Bjorn,
> Hi Mathieu,
> 
> When is this series expected to be applied?
> 
> I am going to post another series titled "PRU Consumer API".
> One patch from that series depends on this "Introduce sysfs_read_only
> flag" patch.
> 
> Please let me know so I can rebase and post that series.

Applied and pushed.

Thanks,
Mathieu

> 
> Thanks,
> Puranjay Mohan
> 
> On 18/02/22 11:24, Bjorn Andersson wrote:
> > On Thu 17 Feb 21:00 PST 2022, Kishon Vijay Abraham I wrote:
> > 
> >>
> >>
> >> On 16/02/22 1:42 pm, Puranjay Mohan wrote:
> >>> The remoteproc framework provides sysfs interfaces for changing
> >>> the firmware name and for starting/stopping a remote processor
> >>> through the sysfs files 'state' and 'firmware'. The 'coredump'
> >>> file is used to set the coredump configuration. The 'recovery'
> >>> sysfs file can also be used similarly to control the error recovery
> >>> state machine of a remoteproc. These interfaces are currently
> >>> allowed irrespective of how the remoteprocs were booted (like
> >>> remoteproc self auto-boot, remoteproc client-driven boot etc).
> >>> These interfaces can adversely affect a remoteproc and its clients
> >>> especially when a remoteproc is being controlled by a remoteproc
> >>> client driver(s). Also, not all remoteproc drivers may want to
> >>> support the sysfs interfaces by default.
> >>>
> >>> Add support to make the remoteproc sysfs files read only by
> >>> introducing a state flag 'sysfs_read_only' that the individual
> >>> remoteproc drivers can set based on their usage needs. The default
> >>> behavior is to allow the sysfs operations as before.
> >>>
> >>> Implement attribute_group->is_visible() to make the sysfs
> >>> entries read only when 'sysfs_read_only' flag is set.
> >>>
> >>> Signed-off-by: Puranjay Mohan <p-mohan@ti.com>
> >>> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> >>> ---
> >>> Changes in v4->v5:
> >>> Rename deny_sysfs_ops to sysfs_read_only.
> >>> Make coredump readonly with other files.
> >>>
> >>> Changes in v3->v4:
> >>> Use mode = 0444 in rproc_is_visible() to make the sysfs entries
> >>> read-only when the deny_sysfs_ops flag is set.
> >>> ---
> >>>  drivers/remoteproc/remoteproc_sysfs.c | 19 ++++++++++++++++++-
> >>>  include/linux/remoteproc.h            |  2 ++
> >>>  2 files changed, 20 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
> >>> index ea8b89f97d7b..abf0cd05d5e1 100644
> >>> --- a/drivers/remoteproc/remoteproc_sysfs.c
> >>> +++ b/drivers/remoteproc/remoteproc_sysfs.c
> >>> @@ -230,6 +230,22 @@ static ssize_t name_show(struct device *dev, struct device_attribute *attr,
> >>>  }
> >>>  static DEVICE_ATTR_RO(name);
> >>>  
> >>> +static umode_t rproc_is_visible(struct kobject *kobj, struct attribute *attr,
> >>> +				int n)
> >>> +{
> >>> +	struct device *dev = kobj_to_dev(kobj);
> >>> +	struct rproc *rproc = to_rproc(dev);
> >>> +	umode_t mode = attr->mode;
> >>> +
> >>> +	if (rproc->sysfs_read_only && (attr == &dev_attr_recovery.attr ||
> >>> +				       attr == &dev_attr_firmware.attr ||
> >>> +				       attr == &dev_attr_state.attr ||
> >>> +				       attr == &dev_attr_coredump.attr))
> >>> +		mode = 0444;
> >>
> >> Nitpick: use S_IRUGO instead of 0444.
> >>
> > 
> > Thanks for the suggestion Kishon, but I like 0444, it has direct meaning
> > to me.
> > 
> > So unless there's some directive to use S_I*** throughout the kernel I
> > would prefer this.
> > 
> > Regards,
> > Bjorn
> > 
> >> Thanks,
> >> Kishon
> >>> +
> >>> +	return mode;
> >>> +}
> >>> +
> >>>  static struct attribute *rproc_attrs[] = {
> >>>  	&dev_attr_coredump.attr,
> >>>  	&dev_attr_recovery.attr,
> >>> @@ -240,7 +256,8 @@ static struct attribute *rproc_attrs[] = {
> >>>  };
> >>>  
> >>>  static const struct attribute_group rproc_devgroup = {
> >>> -	.attrs = rproc_attrs
> >>> +	.attrs = rproc_attrs,
> >>> +	.is_visible = rproc_is_visible,
> >>>  };
> >>>  
> >>>  static const struct attribute_group *rproc_devgroups[] = {
> >>> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> >>> index e0600e1e5c17..93a1d0050fbc 100644
> >>> --- a/include/linux/remoteproc.h
> >>> +++ b/include/linux/remoteproc.h
> >>> @@ -523,6 +523,7 @@ struct rproc_dump_segment {
> >>>   * @table_sz: size of @cached_table
> >>>   * @has_iommu: flag to indicate if remote processor is behind an MMU
> >>>   * @auto_boot: flag to indicate if remote processor should be auto-started
> >>> + * @sysfs_read_only: flag to make remoteproc sysfs files read only
> >>>   * @dump_segments: list of segments in the firmware
> >>>   * @nb_vdev: number of vdev currently handled by rproc
> >>>   * @elf_class: firmware ELF class
> >>> @@ -562,6 +563,7 @@ struct rproc {
> >>>  	size_t table_sz;
> >>>  	bool has_iommu;
> >>>  	bool auto_boot;
> >>> +	bool sysfs_read_only;
> >>>  	struct list_head dump_segments;
> >>>  	int nb_vdev;
> >>>  	u8 elf_class;
> >>>
