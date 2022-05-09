Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9BD6C433F5
	for <linux-remoteproc@archiver.kernel.org>; Mon,  9 May 2022 17:01:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239423AbiEIRFv (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 9 May 2022 13:05:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239416AbiEIRFu (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 9 May 2022 13:05:50 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72A1F17CC8F
        for <linux-remoteproc@vger.kernel.org>; Mon,  9 May 2022 10:01:54 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id iq10so13726143pjb.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 09 May 2022 10:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=drmB4B/KeU3fHWFx597AR+Yu/A5DLZU91oSasUCiT7U=;
        b=m1NE+UqwuE2JCokeZ/4NnYbjGBL1hDxABFvO2l9oOixcazovqQf/zz8Azbq0eOo08J
         9dzO0LDQi8DcPKmus+QALfQFs0j7JWEjW73jBqepNzASDsb+O4TuxSoCEZsPZQzE+9Dw
         4mMPzh0cj0SqCkhby2T4QPSK84JFJbmhvDa44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=drmB4B/KeU3fHWFx597AR+Yu/A5DLZU91oSasUCiT7U=;
        b=KpPp7szT2NYJ8c8v90fsZJKjNg8+4SHiuk/rWEugqwoWFPEcE1LHy2JMhtypuzlYGM
         ipQwcz5Vw2r+8mDxIgunT5jvZqzvYrMelni5BT9zNWOQqtxRASAQS5jUMDuqVLowCeO2
         fB5CXdIe/Wl+UfZSNomw7SGgDVy5gWSDl7WCToXtk7BtwLI6Vr4Q7Sft5vPNEcu4Sj0b
         OKxsjzoj312+1USIZEOoW1AGg3DPJNZO57nSoUSvT1wS4ipEmszZ0a0C9GqDXfmZQY88
         TIRXdus1NJJ/ePJ9+smUBZc2886HJ105VyNS9uS1UExMOGa2Hp1EmsrSx0wEQrOxf/uL
         f5zQ==
X-Gm-Message-State: AOAM532BOTpjH+hrev+r9GU5weFvB4IF6yUQBGXimksG6VDBui2hlI/T
        LfcsNEPdaeiqtYwL39J/UCWGVA==
X-Google-Smtp-Source: ABdhPJzFx4RkUX7Re2fQ5VjSd7jPNvjGhUPAVnsG831dSlxazJfNq6euXwx81V8mDUA9ZdihKUhLDw==
X-Received: by 2002:a17:90b:1642:b0:1dc:6419:43ff with SMTP id il2-20020a17090b164200b001dc641943ffmr19092455pjb.229.1652115713987;
        Mon, 09 May 2022 10:01:53 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:753:614a:caf8:e14d])
        by smtp.gmail.com with UTF8SMTPSA id cq17-20020a17090af99100b001cd4989fec9sm12854513pjb.21.2022.05.09.10.01.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 May 2022 10:01:53 -0700 (PDT)
Date:   Mon, 9 May 2022 10:01:51 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sibi Sankar <quic_sibis@quicinc.com>
Cc:     bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, sboyd@kernel.org, agross@kernel.org,
        linux-remoteproc@vger.kernel.org, mathieu.poirier@linaro.org
Subject: Re: [PATCH] remoteproc: sysmon: Wait for SSCTL service to come up
Message-ID: <YnlI/9i1C720mgAX@google.com>
References: <1652065867-5669-1-git-send-email-quic_sibis@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1652065867-5669-1-git-send-email-quic_sibis@quicinc.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, May 09, 2022 at 08:41:07AM +0530, Sibi Sankar wrote:
> The SSCTL service comes up after a finite time when the remote Q6 comes
> out of reset. Any graceful shutdowns requested during this period will
> be a NOP and abrupt tearing down of the glink channel might lead to pending
> transactions on the remote Q6 side and will ultimately lead to a fatal
> error. Fix this by waiting for the SSCTL service when a graceful shutdown
> is requested.
> 
> Fixes: 1fb82ee806d1 ("remoteproc: qcom: Introduce sysmon")
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
