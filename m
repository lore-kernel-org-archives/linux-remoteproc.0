Return-Path: <SRS0=hTqE=EK=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11BE3C2D0A3
	for <linux-remoteproc@archiver.kernel.org>; Wed,  4 Nov 2020 17:30:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8C1FD20759
	for <linux-remoteproc@archiver.kernel.org>; Wed,  4 Nov 2020 17:30:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Uu+amMxs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728387AbgKDRaR (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 4 Nov 2020 12:30:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726729AbgKDRaQ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 4 Nov 2020 12:30:16 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AE2AC0613D3
        for <linux-remoteproc@vger.kernel.org>; Wed,  4 Nov 2020 09:30:15 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id e21so145967pgr.11
        for <linux-remoteproc@vger.kernel.org>; Wed, 04 Nov 2020 09:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KBs253keL2FVLGE94Xuwy8wDxZWiR3xwTBVRKfiGZfU=;
        b=Uu+amMxsUOe2kcdjXNs+sOVilfNh4IdJnJqBY4TjoskwdZfdlMU6DVqQA69H4EgHab
         dtYkUWJk/b1LHEeWjdJnrHVON2V2y+0wlVFyZrkjH7+w7OowCur9Rhs5GQkudPg8CAwu
         i/49iYC9hyhihkzsJR9Rvq700LB5uvgX8VQbeaqDT9kDuEhmw6mn/RM2KT96HHrccjAl
         /qwrXF+6MaIdY7wujheOifjpXYpTAZ+ZCI+0IIfHJQjix2I1lo3Xru55TgHNtPzo4XhY
         6vRUxorGxvqLYz41cyeshi2XprpvK06p2hRwBgMz9fEOpECARatt9nQljrtvY6jEHaZv
         teWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KBs253keL2FVLGE94Xuwy8wDxZWiR3xwTBVRKfiGZfU=;
        b=jK+kfT9UsPkpqpQQA/V8dSBfS97F9rwAeXmAK9IakqLtzC66RAknihZ0XqKjkYOE6H
         PU01FDf1Znt1uf+daK0DBDQE00EMGCalaODJ4BegEjpe/veIfqkykd4wGwb7wuO8zdNf
         UyBigXs3cM+lAsRdfMnv/T5jMW+0D+N96x+JwpsApG/rbMb8vYiORDFi4AcKEs4UKrkq
         F9ZuV6bdKthvVJpu/ChD+6Ig2BPED/WH6jVCF8yqcb98aJmQ6taW/uTR7pLFU9VSV6oe
         9Q7LYu5DZAPn4Cr61i4yo0QujbXhrHXWwsm86wYuQlJpcFotZ8S023ozgdCq7em9QOqb
         sHsA==
X-Gm-Message-State: AOAM533JSZSpHVra+Ug5WQJ6RvctvkSLmFDQj8+lPAR1cNe03mOo0GZE
        heevv0bjnLKUbBtXeLKmSmqXdw==
X-Google-Smtp-Source: ABdhPJz9dViIzwyCsD5c2JZ6e/TuNnDpUCLXjZh2tYdCGDaexykCkGG7TLl4dmVn0IL8MOiDdVxTdg==
X-Received: by 2002:a63:194a:: with SMTP id 10mr7114141pgz.68.1604511014774;
        Wed, 04 Nov 2020 09:30:14 -0800 (PST)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id 199sm3055083pgg.18.2020.11.04.09.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 09:30:13 -0800 (PST)
Date:   Wed, 4 Nov 2020 10:30:11 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        arnaud.pouliquen@st.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/8] rpmsg: Move structure rpmsg_ns_msg to header file
Message-ID: <20201104173011.GA2893396@xps15>
References: <20201027175218.1033609-1-mathieu.poirier@linaro.org>
 <20201027175218.1033609-4-mathieu.poirier@linaro.org>
 <20201103163225.GA19947@ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201103163225.GA19947@ubuntu>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Nov 03, 2020 at 05:32:26PM +0100, Guennadi Liakhovetski wrote:
> Hi Mathieu,
> 
> On Tue, Oct 27, 2020 at 11:52:13AM -0600, Mathieu Poirier wrote:
> > Move structure rpmsg_ns_msg to its own header file so that
> > it can be used by other entities.
> > 
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> > ---
> >  drivers/rpmsg/virtio_rpmsg_bus.c | 32 +-----------------------
> >  include/linux/rpmsg_ns.h         | 42 ++++++++++++++++++++++++++++++++
> 
> Sorry for a delayed comment, it just occurred to me: there is a 
> include/linux/rpmsg directory already, so, perhaps it would be 
> better to place the new headers there as include/linux/rpmsg/ns.h 
> and include/linux/rpmsg/byteorder.h?

Yes - I think that's a good suggestion.

> 
> Thanks
> Guennadi
