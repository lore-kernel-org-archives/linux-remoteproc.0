Return-Path: <SRS0=9zZj=62=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CFDAC54E8D
	for <linux-remoteproc@archiver.kernel.org>; Tue, 12 May 2020 05:14:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 397A920736
	for <linux-remoteproc@archiver.kernel.org>; Tue, 12 May 2020 05:14:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vDQXBNad"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728814AbgELFO6 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 12 May 2020 01:14:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725874AbgELFO5 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 12 May 2020 01:14:57 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 986FCC061A0C
        for <linux-remoteproc@vger.kernel.org>; Mon, 11 May 2020 22:14:56 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id x15so5212392pfa.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 11 May 2020 22:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3KgDwL4jTZSbdM6dDCdBrk9zZ/jBRwWTO1ICAFFMTh0=;
        b=vDQXBNadfhjrgUfrXrCJgVZpGlN+Kp3lQw+DWHzORFIQTAcoT0bfWrgrz+Ocp+W8+T
         NJv5/81yfNou3cTJWqF70oPbScunuoEUyPRwmjitVjZEBqgzhcHwSelPI1Wijhoa+Dlo
         dNXZOsz3asKOSfXnAcyJX2BtSoNmcXAuz4HWD0UJe4QifVJWuqqzv3WxKAgKndlnyrE6
         mxGViQZz0mnbVDlB0/50UKcCjLE1CGegw/WYZqDtNZOHwM3KET5O1wAw0e+JRBPKTkCH
         69FawH6DE/JZXsMKfux5NRSCfpCV8IjZampjQ/yK2fH3AFI83ncwh7+mtec/Uw/TJhc9
         CpDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3KgDwL4jTZSbdM6dDCdBrk9zZ/jBRwWTO1ICAFFMTh0=;
        b=ElxrGI5e+qID5LllcfIX7h8PeCbiiqHTQM1ShFgS4niNZi5ccySvmDFw6+Bo7m+AJI
         gwm9JVw3rVnZXQUdkVFx5JBaUGNZxwPDsJX3Jnsfo36QkPyOqJdZJf3LXzgW5p1yG9N8
         6PeN9+d3DRMzHp0Ooq/ZNNrkHmoVRwi6aZazga+qe9pbQHi1+BEej/9WOGXtooABokqe
         E7imJ1jEHmJ7GV0sTtSlyOyE00/1SinXeNiIBqW7by5sSOEg6RnEmsHlgabBGWl0NcXH
         zEOkYAHRxxC8l3v2ldQVhaP15UT6kqkVyVLkHETjFKNYxgnWOMnwbv6css3g2xj3SmjK
         YKSw==
X-Gm-Message-State: AGi0PubePmQph/KWv5Gxvt5+9w2pefEAW6/1Uw2P9ckgPNzHt+QtzSRb
        RHUvofNvnYNioupc/ok8b6Ybzw==
X-Google-Smtp-Source: APiQypJS5MlArQOm+F1lj4dnvTyYs8jFwXEUecOX+vcz+8GK8SG9mCF0p/0mIA/EMovIGzMIzBKkvg==
X-Received: by 2002:a63:c306:: with SMTP id c6mr18129415pgd.311.1589260495916;
        Mon, 11 May 2020 22:14:55 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id c63sm10806244pfc.2.2020.05.11.22.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 22:14:55 -0700 (PDT)
Date:   Mon, 11 May 2020 22:13:21 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     rishabhb@codeaurora.org
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        ohad@wizery.com, mathieu.poirier@linaro.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, sidgup@codeaurora.org,
        linux-remoteproc-owner@vger.kernel.org
Subject: Re: [PATCH 2/3] remoteproc: Add inline coredump functionality
Message-ID: <20200512051321.GA16107@builder.lan>
References: <1587062312-4939-1-git-send-email-rishabhb@codeaurora.org>
 <1587062312-4939-2-git-send-email-rishabhb@codeaurora.org>
 <20200507202121.GK2329931@builder.lan>
 <7deb97ab40dd36d5a51111147cf4c14e@codeaurora.org>
 <20200512003028.GA2165@builder.lan>
 <7396b8707d4cf38173f2d1b3968e7fc6@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7396b8707d4cf38173f2d1b3968e7fc6@codeaurora.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon 11 May 17:41 PDT 2020, rishabhb@codeaurora.org wrote:

> On 2020-05-11 17:30, Bjorn Andersson wrote:
> > On Mon 11 May 17:11 PDT 2020, rishabhb@codeaurora.org wrote:
> > > On 2020-05-07 13:21, Bjorn Andersson wrote:
> > > > On Thu 16 Apr 11:38 PDT 2020, Rishabh Bhatnagar wrote:
> > > > > diff --git a/drivers/remoteproc/remoteproc_coredump.c
> > > > > b/drivers/remoteproc/remoteproc_coredump.c
[..]
> > > > > +static ssize_t rproc_read_dump(char *buffer, loff_t offset, size_t
> > > > > count,
> > > > > +				void *data, size_t header_size)
> > > > > +{
> > > > > +	void *device_mem;
> > > > > +	size_t data_left, copy_size, bytes_left = count;
> > > > > +	unsigned long addr;
> > > > > +	struct rproc_coredump_state *dump_state = data;
> > > > > +	struct rproc *rproc = dump_state->rproc;
> > > > > +	void *elfcore = dump_state->header;
> > > > > +
> > > > > +	/* Copy the header first */
> > > > > +	if (offset < header_size) {
> > > > > +		copy_size = header_size - offset;
> > > > > +		copy_size = min(copy_size, bytes_left);
> > > > > +
> > > > > +		memcpy(buffer, elfcore + offset, copy_size);
> > > > > +		offset += copy_size;
> > > > > +		bytes_left -= copy_size;
> > > > > +		buffer += copy_size;
> > > > > +	}
> > > >
> > > > Perhaps you can take inspiration from devcd_readv() here?
> > > >
> > > > > +
> > > > > +	while (bytes_left) {
> > > > > +		addr = resolve_addr(offset - header_size,
> > > > > +				    &rproc->dump_segments, &data_left);
> > > > > +		/* EOF check */
> > > > > +		if (data_left == 0) {
> > > >
> > > > Afaict data_left denotes the amount of data left in this particular
> > > > segment, rather than in the entire core.
> > > >
> > > Yes, but it only returns 0 when the final segment has been copied
> > > completely.  Otherwise it gives data left to copy for every segment
> > > and moves to next segment once the current one is copied.
> > 
> > You're right.
> > 
> > > > I think you should start by making bytes_left the minimum of the core
> > > > size and @count and then have this loop as long as bytes_left, copying
> > > > data to the buffer either from header or an appropriate segment based on
> > > > the current offset.
> > > >
> > > That would require an extra function that calculates entire core size,
> > > as its not available right now. Do you see any missed corner cases
> > > with this
> > > approach?
> > 
> > You're looping over all the segments as you're building the header
> > anyways, so you could simply store this in the dump_state. I think this
> > depend more on the ability to reuse the read function between inline and
> > default coredump.
> > 
> > Regards,
> > Bjorn
> 
> Wouldn't the first if condition take care of "default" dump as it is?
> The header_size in that case would involve the 'header + all segments'.

Correct.

Regards,
Bjorn
