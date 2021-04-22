Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58EE8C433ED
	for <linux-remoteproc@archiver.kernel.org>; Thu, 22 Apr 2021 16:32:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 23F0A613B8
	for <linux-remoteproc@archiver.kernel.org>; Thu, 22 Apr 2021 16:32:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237920AbhDVQcz (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 22 Apr 2021 12:32:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236603AbhDVQcz (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 22 Apr 2021 12:32:55 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A61DC06138B
        for <linux-remoteproc@vger.kernel.org>; Thu, 22 Apr 2021 09:32:20 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id y1so8158319plg.11
        for <linux-remoteproc@vger.kernel.org>; Thu, 22 Apr 2021 09:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cozMNl4x0aoDfS151vd4k3rQFwhI4XY6oBVsQT9uHNQ=;
        b=Nn248TtiVAoPlwvqR27j4chs/hwfU/A16DV50RupiPpu/t46mpFxp07L1eIAVXAFq0
         8+rmYuoevJMFuOBc5+rZWv1sO8jgLjU+X9MnOuov5H40vc9O1B4o4OBAn8eCt2znBw1K
         zsk7pAdtxtX03L2SPZyca9kC6Z3QehisnxckskRcBVm8N0f74qMvAe4uQY98nltmGMzk
         CLovQr/wxoJiiiNJFkqzQg8weB/t6DHb50ktkSUh/aCPxYY1OK1TdwASNC473IReV9IP
         svTny4CV8QwOCqW6DpLkWfXrj+SBEtz1CB5pqT4zH/CCAPWS+dp3L4fNyC3i3UOulnK8
         qszA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cozMNl4x0aoDfS151vd4k3rQFwhI4XY6oBVsQT9uHNQ=;
        b=i2eHByqCviEAdd/mHqxZ4EZf5H/oovJZ0Yh6jGbfeOfCpeTVSmaaTKsa9udlotQzXQ
         lgyJjYifmw1KKBs366hTUtNmQcJcSucwdZK9BCgnLOmjI/XfLUOCR6MLskFKo8K+Ltg1
         bm6wWb5QiYoiT8EWtR6xaby4biVXjwLG3I9uLyMOaphhHRqEKmikIRYJcJrDk0AEF25D
         0IEzAN6BK2fHmzysXBUTJyS/i5cG2yeW+p60fzsMBJrkxxElpJanYaI1QnQ1/fQlv3E5
         nsVWNNliAuS81ygZRClUhI/uD9axFhhw0A9aFkByTZiKmM4kLJRA6mPLkRN13Xbm9xa8
         AZJQ==
X-Gm-Message-State: AOAM530PSlskt6COzxKegVuADD1E+xzooWhCYzoYJ6fFkWZ7ZMEfnIrf
        Ye7ihPmOOtkVNLHVJfOLu3GScQ==
X-Google-Smtp-Source: ABdhPJzF2Qsbwpp8tTcZe/nkV/+BMAURDtxF0quVJv8hmQraI3YmZbIo9O4WxwfiFlKpAnHrEPwrdA==
X-Received: by 2002:a17:90a:a78c:: with SMTP id f12mr873180pjq.219.1619109139744;
        Thu, 22 Apr 2021 09:32:19 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id z188sm2717992pgb.89.2021.04.22.09.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Apr 2021 09:32:19 -0700 (PDT)
Date:   Thu, 22 Apr 2021 10:32:17 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 2/7] rpmsg: Move the rpmsg control device from
 rpmsg_char to rpmsg_ctrl
Message-ID: <20210422163217.GB1256950@xps15>
References: <20210413134458.17912-1-arnaud.pouliquen@foss.st.com>
 <20210413134458.17912-3-arnaud.pouliquen@foss.st.com>
 <20210421180455.GE1223348@xps15>
 <bb376229-006f-af16-2006-4ef9edea87f5@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb376229-006f-af16-2006-4ef9edea87f5@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Apr 22, 2021 at 09:56:41AM +0200, Arnaud POULIQUEN wrote:
> 
> 
> On 4/21/21 8:04 PM, Mathieu Poirier wrote:
> > On Tue, Apr 13, 2021 at 03:44:53PM +0200, Arnaud Pouliquen wrote:
> >> Create the rpmsg_ctrl.c module and move the code related to the
> >> rpmsg_ctrldev device in this new module.
> >>
> >> Add the dependency between rpmsg_char and rpmsg_ctrl in the
> >> kconfig file.
> >>
> >> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> >> ---
> >> update from v1:
> >> - keep "rpmsg_chrdev" driver name in rpmsg_ctrl, driver will be renamed
> >>   in next path that renames the rpmsg_chrdev_create_eptdev.
> >> - rename the chardev regions
> >> - move RPMSG_DEV_MAX to rpmsg_char.h
> >> ---
> >>  drivers/rpmsg/Kconfig      |   9 ++
> >>  drivers/rpmsg/Makefile     |   1 +
> >>  drivers/rpmsg/rpmsg_char.c | 181 +----------------------------
> >>  drivers/rpmsg/rpmsg_char.h |   2 +
> >>  drivers/rpmsg/rpmsg_ctrl.c | 231 +++++++++++++++++++++++++++++++++++++
> >>  5 files changed, 245 insertions(+), 179 deletions(-)
> >>  create mode 100644 drivers/rpmsg/rpmsg_ctrl.c
> >>
> >> diff --git a/drivers/rpmsg/Kconfig b/drivers/rpmsg/Kconfig
> >> index 0b4407abdf13..d822ec9ec692 100644
> >> --- a/drivers/rpmsg/Kconfig
> 
> snip[...]
> 
> >> +static int rpmsg_ctrldev_init(void)
> >> +{
> >> +	int ret;
> >> +
> >> +	ret = alloc_chrdev_region(&rpmsg_major, 0, RPMSG_DEV_MAX, "rpmsg_ctrl");
> >> +	if (ret < 0) {
> >> +		pr_err("rpmsg: failed to allocate char dev region\n");
> >> +		return ret;
> >> +	}
> >> +
> >> +	rpmsg_class = class_create(THIS_MODULE, "rpmsg");
> > 
> > This class thing really bothers me.  Keeping this here means that rpmsg_eptdevs
> > created from user space will be associated to this rpmsg_class but those created
> > from the name service won't.  As such I propose to move this to rpmsg_char and
> > simply not associate the control device to the class.
> > 
> > Otherwise we'd have to introduce some mechanic only to deal with the creation of
> > the class and I don't think it is worth.  We can revise that approach if someone
> > complains we broke their user space. 
> 
> I agree with that as it was my first proposed approach here [1]

Yeah, sorry about that.  This patch review process is not an exact science...

> 
> [1] https://www.spinics.net/lists/linux-arm-msm/msg81194.html
> 
> Thanks,
> Arnaud
> 
> > 
> > 
> >> +	if (IS_ERR(rpmsg_class)) {
> >> +		pr_err("failed to create rpmsg class\n");
> >> +		ret = PTR_ERR(rpmsg_class);
> >> +		goto free_region;
> >> +	}
> >> +
> >> +	ret = register_rpmsg_driver(&rpmsg_ctrldev_driver);
> >> +	if (ret < 0) {
> >> +		pr_err("rpmsg ctrl: failed to register rpmsg driver\n");
> >> +		goto free_class;
> >> +	}
> >> +
> >> +	return 0;
> >> +
> >> +free_class:
> >> +	class_destroy(rpmsg_class);
> >> +free_region:
> >> +	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
> >> +
> >> +	return ret;
> >> +}
> >> +postcore_initcall(rpmsg_ctrldev_init);
> >> +
> >> +static void rpmsg_ctrldev_exit(void)
> >> +{
> >> +	unregister_rpmsg_driver(&rpmsg_ctrldev_driver);
> >> +	class_destroy(rpmsg_class);
> >> +	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
> >> +}
> >> +module_exit(rpmsg_ctrldev_exit);
> >> +
> >> +MODULE_DESCRIPTION("rpmsg control interface");
> >> +MODULE_ALIAS("rpmsg:" KBUILD_MODNAME);
> >> +MODULE_LICENSE("GPL v2");
> >> -- 
> >> 2.17.1
> >>
