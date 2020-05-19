Return-Path: <SRS0=V02Z=7B=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45384C433E0
	for <linux-remoteproc@archiver.kernel.org>; Tue, 19 May 2020 22:49:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 111FE207C4
	for <linux-remoteproc@archiver.kernel.org>; Tue, 19 May 2020 22:49:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t8dBf2Re"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726898AbgESWtR (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 19 May 2020 18:49:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726535AbgESWtQ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 19 May 2020 18:49:16 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D879C061A0F
        for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2020 15:49:16 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id n18so615469pfa.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2020 15:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4Ty1uax6DhWGAFtgE02Vizy5V0zxupHIkWCZHfOEkhA=;
        b=t8dBf2Re30D48kdWaxnWeg5qjnHBsSPjh8gl3yhU3/omM3rZox4QiSWEztEngqMnt7
         TJ9KJ9Dk6HH/bIfagl0fdv1s/3aaysmvRj6eeG9OrsYQl27NhGIVFLEfv8mGRUqb6UTl
         WGod58OPLLNcOrUZBVVgeF8ecKbVV2bKXPJT2OwjxTjrIje6Wp8RnjOx2p1udFNGb4bL
         Y1lfYVjRlJAXESxTeaahmjF7k8LyJVBejv9EzcznGcLs6BlqpMydDPDqXGUQl3+BJg0L
         tu0QKrN5lM/ydX1HxIfs7bV6nHOlx5jHnhxJnnwuAl2b1Ud1SKH0qz/gRpHIgJILyvUw
         9EiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4Ty1uax6DhWGAFtgE02Vizy5V0zxupHIkWCZHfOEkhA=;
        b=BSq8L7OEhHx9/DNQeWx6WlSTg+CznYJNK+o2fg9lTxUTdickvarDkR8ldCkk0fugDF
         DvAmHnxCJCAW59fpsBsacrNmKzS5vJMc2UCU5vLfvUOZAzeNWn06tD/ZZeNs3aaBp0Hy
         /OK/uCKNePMObtRA9q3kt/mvKXqK+xXYWSUi6bf9FtmGxP4TvMgxyw9ahIItNtBK0wIx
         ADa3o75JjoBh1pUsYyDB5AeDkcYi9ZvAxY3UpRk2DhR9yTFqlHtfSH+Zu5nN1ghBuITd
         uR4qYvTvINbj1RIvkib6to7nUtLOnp46rflEowipl5q1n0YK5NwRp7j/pqeH3/MEkzOF
         gntg==
X-Gm-Message-State: AOAM532VKTwNpoW8QnRiC9ANB7YaPzz/64tie3eUJlZtC2d/sdlnb5J/
        LaC8TruJPEsS6Fhs7cB9SoOU2Q==
X-Google-Smtp-Source: ABdhPJxrF0PPloT5L7c9LARzGBOK1gTA/drsLOH7U808yVpudmrjPQgxJ5DYlfOA1iS9t+A1KuDyCQ==
X-Received: by 2002:aa7:9e90:: with SMTP id p16mr1341252pfq.38.1589928556006;
        Tue, 19 May 2020 15:49:16 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id l1sm447873pjr.17.2020.05.19.15.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 15:49:15 -0700 (PDT)
Date:   Tue, 19 May 2020 16:49:13 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arun Kumar Neelakantam <aneela@codeaurora.org>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org, clew@codeaurora.org,
        sricharan@codeaurora.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH V4 0/4] Add TIOCM Signals support for RPMSG char
 devices
Message-ID: <20200519224913.GD26832@xps15>
References: <1589346671-15226-1-git-send-email-aneela@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1589346671-15226-1-git-send-email-aneela@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, May 13, 2020 at 10:41:07AM +0530, Arun Kumar Neelakantam wrote:
> Glink transport support signals to exchange state notification between
> local and remote side clients. Adding support to send/receive the signal
> command and notify the clients through callback and POLL notification.

From a general point of view it is hard to have an understanding of what this
patchset does and if it is the right solution due to a lack of context.

The cover letter and changelogs are sparse to a point where a
reviewer not familiar with the QC/Glink implementation can't offer much more
than syntactic comments.

Thanks,
Mathieu

> 
> Changes since v3:
> - Correct the TICOMGET case handling as per new rpmsg_get_signals prototype
> - Update the rpmsg_get_signals function header
> 
> Changes since v2:
> - Modify the rpmsg_get_signals function prototype
> 
> Changes since v1:
> - Split the patches as per functional areas like core, char, glink
> - Add set, clear mask for TIOCMSET
> - Merge the char signal callback and POLLPRI patches
> 
> Arun Kumar Neelakantam (4):
>   rpmsg: core: Add signal API support
>   rpmsg: glink: Add support to handle signals command
>   rpmsg: char: Add TIOCMGET/TIOCMSET ioctl support
>   rpmsg: char: Add signal callback and POLLPRI support
> 
>  drivers/rpmsg/qcom_glink_native.c | 126 ++++++++++++++++++++++++++++++++++++++
>  drivers/rpmsg/rpmsg_char.c        |  75 ++++++++++++++++++++++-
>  drivers/rpmsg/rpmsg_core.c        |  41 +++++++++++++
>  drivers/rpmsg/rpmsg_internal.h    |   5 ++
>  include/linux/rpmsg.h             |  26 ++++++++
>  5 files changed, 270 insertions(+), 3 deletions(-)
> 
> -- 
> 2.7.4
