Return-Path: <SRS0=ZH1X=C7=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF765C2D0E2
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Sep 2020 19:47:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7C08D20888
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Sep 2020 19:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600804077;
	bh=FOILoErzO/eovrAH2jJlxtNWqNgwjfhVtHHjYW4Lqso=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=eWkTLAfd7PIdJAErvtQvpwDzOSe1UcunBrPx2mSfsM4w/6S9B40Tc2B3AdvjCxt01
	 xKR5BAKj7QgbBXbGeG6ETiqzQhgD5AQIVfwcGTLf8k3tK+fg3jIzg+BlKliEzRljn7
	 vWrLTprrtutN7Qr4LmiX3k6SQWd3zNDT7Eu7O5KQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726686AbgIVTr5 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 22 Sep 2020 15:47:57 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:41581 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726448AbgIVTr4 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 22 Sep 2020 15:47:56 -0400
Received: by mail-io1-f66.google.com with SMTP id z13so21016147iom.8;
        Tue, 22 Sep 2020 12:47:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ri/bVbFH3r5EY2Mz3MO9WVs+h7y66U0Z5iJapj7IiXI=;
        b=g8xg6UBbbXTYXUgmTtu9o/VA5uX9Ohle6o6ESnvldeFafnPIhO478KH3RnIaPYKSrw
         JxlA5cYLhD69/gk8CJJP8ZPUbZlAmHIv8vpABJwINa5YwJnG/L+UTRC+wsalDB0giyYq
         h0J+Y0udVCF+JZOiO2I1I2roNcTcR9w1rpV7rmHONq86pBeswMdn7N5mK9mKBxbVMQlS
         /V7fI3FDStdJQKXCCLF2jpctGMGYNsGoIDkdDxLMpl21GGrjd2VE1DP/Ug7RKbtdaBcU
         /QK7mKdVFMnAQNmtNx/9M5dvyihxPxHE6oVuAlLHF2pqakz5puIJ+ERAyQiCakyDaxM7
         AuiA==
X-Gm-Message-State: AOAM530s709nbF+X/phETmeaKh0aCR92zlV2Dx+XS0mFIlQSnEBsXq3N
        BTCtTVHbmkQU6LrNXYNZYg==
X-Google-Smtp-Source: ABdhPJy3iTl88OD21S0eMhHBXW4ApuZoC8dsFK4Kp7SeKRHofvxUkXXeCMEkfhADIYuzvs2vzNHVgA==
X-Received: by 2002:a02:b199:: with SMTP id t25mr5313825jah.124.1600804076032;
        Tue, 22 Sep 2020 12:47:56 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id h2sm7832335ioj.5.2020.09.22.12.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 12:47:54 -0700 (PDT)
Received: (nullmailer pid 3121917 invoked by uid 1000);
        Tue, 22 Sep 2020 19:47:53 -0000
Date:   Tue, 22 Sep 2020 13:47:53 -0600
From:   Rob Herring <robh@kernel.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/4] TI K3 R5F remoteproc support
Message-ID: <20200922194753.GA3105316@bogus>
References: <20200908174556.21277-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200908174556.21277-1-s-anna@ti.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Sep 08, 2020 at 12:45:52PM -0500, Suman Anna wrote:
> Hi All,
> 
> The following is v4 of the TI K3 R5F remoteproc driver series supporting all
> the R5F processor clusters/subsystems on TI AM65x and J721E SoCs. Please
> see the v1 cover-letter [1] for the features supported on these R5F processors.
> 
> This series is a rebased version on top of the latest v5.9-rc baseline and
> includes very minor fixes w.r.t v3. The previous K3 DSP dependencies are now
> available in mainline kernel. Please see the individual patches for the delta
> differences (Only patches 1 and 2 updated).
> 
> Bjorn,
> This series is only waiting on bindings ack and the conclusion on the bindings
> discussion from v2 [4] on which I haven't seen any forward progress on this 
> despite all the clarifications. I do not expect any changes even w.r.t System DT,
> and we can't really have a common binding between TI and Xilinx R5Fs. 

Why not? I'm pretty sure lockstep or not is a thing for both and TCMs 
seem to be a common thing.

And I don't really think System DT will not impact it. Though it's not 
well enough defined to say either way IMO.

But if Bjorn wants to take this, fine. I'm not acking it though nor 
worrying about it for any compatibility with system DT.

Rob
