Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C169C47082
	for <linux-remoteproc@archiver.kernel.org>; Mon, 31 May 2021 23:25:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 095B361287
	for <linux-remoteproc@archiver.kernel.org>; Mon, 31 May 2021 23:25:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231571AbhEaX11 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 31 May 2021 19:27:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231377AbhEaX10 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 31 May 2021 19:27:26 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA4AEC061574
        for <linux-remoteproc@vger.kernel.org>; Mon, 31 May 2021 16:25:45 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id a21so2829405oiw.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 31 May 2021 16:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=P5FtqPsnwQZKDb7nl4cAUBTTfq1pNiJvv/ldE5ugEj0=;
        b=fVadRQuCiJamzw9jA5cKHzbZFlqlakyrj8y8bMx20uaFA13ORZhkqb/CugiaABxwrb
         CbmeeyUOJp9/f4CTvbSwAsQO2TCTZFeZt7IL/6rEgcqwm1vPSDU4gwxjfgdIlfbLruwg
         CKKstjrEvjmqVGh2WGAE1xBo7u/tTCFnxJ2N/HZ2wvrg9HooEHhsWfOUKi2ZMN82ftP3
         pVVOj/9H+vcakbBtEAIA8Zyl6u63iR8hHbFOrO1ox1r+2v0owNv4eqvhC4wvK69PLiP8
         y+JkEhyY/mlBTlomdZEG9kliF/bgyVTDynSVHn1ar4aOMANGyOC5LxUFKqrTXnjY7iin
         AIMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=P5FtqPsnwQZKDb7nl4cAUBTTfq1pNiJvv/ldE5ugEj0=;
        b=CXpkBjfUmqdbQP+i/+D46afXrEPHBVgukmmUCAzKaeGS6jKsX7WxJxgNUeGvw3KFXs
         ry/fuIaHB28E3br1vUgtfYy52/60eG2Om+hjD4xfG2B22q/nVRz1ZN0lU7fw7WOJ/cDz
         HXKKxIHUYdFFMnjPMIoiZYJrdCuSkwpMQgsxNFkIsZYhPFdeM7Vv6O1Mol1Vn7CI0Sa8
         NEir6Qb5iMHCGYEFU2ZKdftTwddEzRlUI8nfPVC28tR+clQ8JUj+G93TNLHcY6XdnkXK
         U5H+GUbbd0ZFXsKhyFhdcxAGUar/6PEWxZnDUQnVhqHT9Z/0+G6eI9kxIcqXCDS7pVWM
         Yqjg==
X-Gm-Message-State: AOAM530QCyL1OVnNgkzRVr3abnhGiFwf6mGy9ORSyRzYMG1snjOnA5eW
        Z6HjWRdgYwDsUie/FoYTMP88TiFzT+u8Nw==
X-Google-Smtp-Source: ABdhPJyAoYAZKUW2Fj841yJnkucpoNLVHBR3f2ywfsfwnNoOLPcyVuxXcjJtiebkaV9cbx2Rp8otsQ==
X-Received: by 2002:a54:4011:: with SMTP id x17mr15789052oie.112.1622503545112;
        Mon, 31 May 2021 16:25:45 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id r10sm3076856oic.4.2021.05.31.16.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 16:25:44 -0700 (PDT)
Date:   Mon, 31 May 2021 18:25:42 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Hillf Danton <hdanton@sina.com>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Alex Elder <elder@linaro.org>, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] remoteproc: use freezable workqueue for crash
 notifications
Message-ID: <YLVwdsa97jYjKKU6@yoga>
References: <20210519234418.1196387-1-elder@linaro.org>
 <20210519234418.1196387-2-elder@linaro.org>
 <YLBpmdZoGDXNz64y@builder.lan>
 <20210529024847.5164-1-hdanton@sina.com>
 <20210530030728.8340-1-hdanton@sina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210530030728.8340-1-hdanton@sina.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Sat 29 May 22:07 CDT 2021, Hillf Danton wrote:

> On Sat, 29 May 2021 12:28:36 -0500 Bjorn Andersson wrote:
> >
> >Can you please explain why the mutex_lock() "requires" the context
> >executing it to be "unbound"? The lock is there to protect against
> >concurrent modifications of the state coming from e.g. sysfs.
> 
> There are simple and light events pending on the bound workqueue,
> 
> static void foo_event_fn(struct work_struct *w)
> {
> 	struct bar_struct *bar = container_of(w, struct bar_struct, work);
> 
> 	spin_lock_irq(&foo_lock);
> 	list_del(&bar->list);
> 	spin_unlock_irq(&foo_lock);
> 
> 	kfree(bar);
> 	return;
> or
> 	if (bar has waiter)
> 		wake_up();
> }
> 
> and they are not tough enough to tolerate a schedule() for which the unbound
> wq is allocated.

If you have work that is so latency sensitive that it can't handle other
work items sleeping momentarily, is it really a good idea to schedule
them on the system wide queues - or even schedule them at all?

That said, the proposed patch does not move the work from an unbound to
a bound queue, it simply moves it from one bound system queue to another
and further changes to this should be done in a separate patch - backed
by some measurements/data.

Thanks,
Bjorn
