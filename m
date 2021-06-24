Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D01CDC49EA5
	for <linux-remoteproc@archiver.kernel.org>; Thu, 24 Jun 2021 19:35:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AC1F6613CE
	for <linux-remoteproc@archiver.kernel.org>; Thu, 24 Jun 2021 19:35:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232549AbhFXThh (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 24 Jun 2021 15:37:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232528AbhFXThh (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 24 Jun 2021 15:37:37 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA91DC061574
        for <linux-remoteproc@vger.kernel.org>; Thu, 24 Jun 2021 12:35:17 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id i4so3477231plt.12
        for <linux-remoteproc@vger.kernel.org>; Thu, 24 Jun 2021 12:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cR7YS9ATIxd4zoiIy9rylZXD2qq+uqew/4fF12E5HJo=;
        b=y81zyvUlQzFcnrRgNVzC2Npuhy7MSjAWfduB86aN/c5lvDnd1oaRjTDZ+TQHvhHF1Y
         T7kEyiHYSZfN507A97k3bq1QLDNOCa0iaZ2T5weLxYvLWNzEBQsudTMhZIIhOgCfa07E
         96Ope854MIcvprI8g8zZsVrrT5NkEAeEn3EfdiLHLwCf28/V0qRFYF5zYAGCxECtQ7xW
         TTuWrIM49feTkkfI8msMvTxfu3iTjWIeRsQ//HqMjS/Iw3QOlBIFdmKZnFZF0vst3Gl2
         D/xHd3bfS++o2qxJgQcArCBuDRSskSwIqRVrgZ9Tp6Q98AjtnlqSFbitMW0y0ttoDUT9
         J2qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cR7YS9ATIxd4zoiIy9rylZXD2qq+uqew/4fF12E5HJo=;
        b=JoGu8guqiD5/Kqq/Gkxb35qnEr09uC13SG1aCDUBQJrlDwb73WMvQ0Gu8/yZ4X+7u6
         BVTklFKLOnAsCisPtnELcpduvYnxW1l3g6dtYCnaCCE5/rse3P91mfkZ5IzSUGQ5BIWj
         5dqrbjEregVFgeuCdfq+sJlD7+JxD8IKis9jfkUeSRdCUIfa8D/CCIFewrs4+C0xq8YM
         nKKWvzwvagpu6H9RheAq1l5AXvHv+kM2AA2pFbmwt8DuOH7hE1A5hZiGDoq0dmbT/vty
         1R1R5+KasT3k2Hu58ocbhEyywWGMZGrFJkQMqs5Vsyw0r+GDrXiHruwIU//BM02s2zcN
         Yogg==
X-Gm-Message-State: AOAM532oZkjZMYl5DBYGzD14TDUmEeqhsXs3eWk9MSlIJhVp0phS/6TU
        SHg8ClDrZoQQUGTt7HDndzwUO215qeIpBA==
X-Google-Smtp-Source: ABdhPJx3qK7XLdw1zcP6mb/64UanptxR6WiY/S1CaZyavVNJGCeG9tHlNcc0Ungh4d5t4ZrYtBfXYw==
X-Received: by 2002:a17:90a:ff08:: with SMTP id ce8mr6880242pjb.167.1624563317355;
        Thu, 24 Jun 2021 12:35:17 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id b18sm9182937pjq.2.2021.06.24.12.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 12:35:16 -0700 (PDT)
Date:   Thu, 24 Jun 2021 13:35:14 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: remoteproc DMA API abuse status
Message-ID: <20210624193514.GA1090275@p14s>
References: <20210623134307.GA29505@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210623134307.GA29505@lst.de>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Good day Christoph,

On Wed, Jun 23, 2021 at 03:43:07PM +0200, Christoph Hellwig wrote:
> Hi remoteproc maintainers,
> 
> did you make any progress to get remoteproc out of creating fake
> devices that fake their dma ops status and the abuse of
> dma_declare_coherent_memory in removeproc_virtio?  I remember we had
> a discussion on this a long time ago, and there was an unfinished
> patchset to change the memory pool handling.  What happened to all that?

I believe the conversation and patchset you are referring to are pre-dating my
time in this subsystem.  To make sure I am looking at the right thing, can you
(or anyone else) point me to that discussion and related patches?  

Thanks,
Mathieu
