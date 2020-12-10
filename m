Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 145E5C433FE
	for <linux-remoteproc@archiver.kernel.org>; Thu, 10 Dec 2020 19:15:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BBD452388B
	for <linux-remoteproc@archiver.kernel.org>; Thu, 10 Dec 2020 19:15:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393327AbgLJTOc (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 10 Dec 2020 14:14:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392440AbgLJTOY (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 10 Dec 2020 14:14:24 -0500
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F900C0613D6
        for <linux-remoteproc@vger.kernel.org>; Thu, 10 Dec 2020 11:13:44 -0800 (PST)
Received: by mail-ot1-x32a.google.com with SMTP id j12so5948079ota.7
        for <linux-remoteproc@vger.kernel.org>; Thu, 10 Dec 2020 11:13:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rV+7QbIpoEHyV1QEHhNp3YtVSX1/V3k8/A1NIhk+ID4=;
        b=SebKKM2A6F1mWz9TyAm2rHniatujs6WnYYjDJT1UEfD57Pv4fvPFZd4VfAbXFLbjj7
         BTAXrBWyVydj+7toBtnKqAAXg/gL78KVEb4UgwUvpGPFL+WjJ3Et3+Djo7xXIVwGGzoJ
         Q3XQy1sAtSn9NpGQH1v8J23IxreP9D98pikJ48dAVf4Jin/xOL6cJiSHdHrTsChGMzm8
         pYtMoz3kY1ktY5TFKiIB4/uckenADHq+3/zgm6+Q5S8U5cV/Ece/iEzXkXLMGGNBiCgI
         xQv9hDzOQCNMd+lAbmAXqa1u7P9ZCX2/2ev57nsK+Yh4bBWoZvyeuyKhcplBEahH7WMt
         1/aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rV+7QbIpoEHyV1QEHhNp3YtVSX1/V3k8/A1NIhk+ID4=;
        b=nTVzlrlZxAsXM6Xn+qTVY7efCgZH6UEmZtrZU1BY6Zru3yIvApgSgGpJsD8LuPaQWy
         +nbgjsIArf2VpJva+8Iurr2jbfx04vXDbGKt3vldw3CXHk5T5ujggcf4zI7iCK8nIXNQ
         s9RNENe5uj610HtH7uuHmhcIILz2q9UbqSw3+ynWqD42aELbTCYB4q37XFgrwRjtlzn6
         28AvS1okU2kbaT19NJ6R7jq8Masx87grB5ugOdP1rauLGMmAYlcBXErL4kAh8pkn+75B
         HJg1QfliFB5Dr8xOlP5yWj4PyYc2cbZUPVSJeKsnsvtNAhnbkL9MlZl3E72//YsOd8VL
         3+pQ==
X-Gm-Message-State: AOAM533Q/B0EEzSbZGocqeFBJ5SpbWNo3VEqlT+SJsjcqH6hQd+yWmn/
        mEgw7pDmeNthr/Ab6cg8WC8IDxZ8TTkgzw==
X-Google-Smtp-Source: ABdhPJyNR5NlijxCxWh1GOoMaQStn0ETWQLD0me+RpD+TTHMBngQj/gW1GRC2Gjq6CqVLzH4bZEBfw==
X-Received: by 2002:a9d:5b4:: with SMTP id 49mr6984843otd.136.1607627623808;
        Thu, 10 Dec 2020 11:13:43 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id v13sm1197641oic.17.2020.12.10.11.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 11:13:42 -0800 (PST)
Date:   Thu, 10 Dec 2020 13:13:40 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Tzung-Bi Shih <tzungbi@google.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] remoteproc/mediatek: change MT8192 CFG register base
Message-ID: <X9JzZKtgGYELamYe@builder.lan>
References: <20201210054109.587795-1-tzungbi@google.com>
 <X9JUmRarnxPaXtrZ@builder.lan>
 <CA+Px+wUqWh+_B6rQ1kyZRALF9r-HE8ZWpgt0c9B6doxRXLZ+9g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+Px+wUqWh+_B6rQ1kyZRALF9r-HE8ZWpgt0c9B6doxRXLZ+9g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu 10 Dec 11:09 CST 2020, Tzung-Bi Shih wrote:

> On Fri, Dec 11, 2020 at 1:02 AM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > On Wed 09 Dec 23:41 CST 2020, Tzung-Bi Shih wrote:
> >
> > > The correct MT8192 CFG register base is 0x20000 off.  Changes the
> > > registers accordingly.
> > >
> > > Fixes: fd0b6c1ff85a ("remoteproc/mediatek: Add support for mt8192 SCP")
> > > Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> >
> > I presume there's an associated DT change with this?
> >
> > I'm okay with taking this, but would like to have Matthias ack on the
> > fact that we're breaking backwards compatibility with older DTS.
> >
> > (Or I could ack this and Matthias can take it together with the DT
> > change, to reduce the breakage gap in the git history?)
> 
> Yes, it has associated DT changes.  But the board "MT8192 SCP" is
> still under development, the DTS part hasn't been sent to upstream
> yet.
> 
> Thus, it won't break anyone else.

Then I don't mind merging this, will include it in v5.11.

Thank you,
Bjorn
