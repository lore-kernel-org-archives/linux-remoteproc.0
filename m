Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1BF6C433DB
	for <linux-remoteproc@archiver.kernel.org>; Tue, 30 Mar 2021 14:42:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 90584619C8
	for <linux-remoteproc@archiver.kernel.org>; Tue, 30 Mar 2021 14:42:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232143AbhC3Ol7 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 30 Mar 2021 10:41:59 -0400
Received: from mail-oi1-f174.google.com ([209.85.167.174]:45965 "EHLO
        mail-oi1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231933AbhC3Olt (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 30 Mar 2021 10:41:49 -0400
Received: by mail-oi1-f174.google.com with SMTP id d12so16665700oiw.12;
        Tue, 30 Mar 2021 07:41:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eZVk5HwOIZYw5GgIVnw8moCjCB0WlBS7c5il9aL9gfg=;
        b=ScU//9z3CSH4YD6mgg6+KeeGBsTt84vPy1Z7wvuBtJ+s1tv7/nCb9m40sp38XDfYu/
         owBywZJ2W+nDtmBYs3DLs5Yd3K/K9qC9brGHxv8l0zLveOYmd+GlarxeND3jhVKJCHw7
         UpvD0Cd5SJ6hSeLUTxobdsT2mdy81LyXh6ZhDey7MjQ8ZmAeO4lwFLRcUT3QpNUGabRA
         1scgJK2WJP3eHtymnUPifqkKxsO/QQphtpJwOgMAMGy011q7638A3EcSMsPDopyddoXm
         jYLP1H7pB29KFHRf5M59SL136lG0jnynlTSu4fa88GGOUI79gZjwKvYxb5bFZ7c1oahe
         cU8g==
X-Gm-Message-State: AOAM532KNkyeZ1qLFoG5NtQ7cxRcjVRhtacPIEEjfjgeMIiX9JmKLDUM
        aekIGXIh3k4wBCn6GwhkKA==
X-Google-Smtp-Source: ABdhPJx55NwuqXBS3css907bO+xpLddBHVOG6AhiBjHmWmK11igajLJ2LYI1GahCDTKi3ToWCV5Z+w==
X-Received: by 2002:aca:b244:: with SMTP id b65mr3536409oif.134.1617115309176;
        Tue, 30 Mar 2021 07:41:49 -0700 (PDT)
Received: from robh.at.kernel.org ([172.58.99.136])
        by smtp.gmail.com with ESMTPSA id l26sm5185388otd.21.2021.03.30.07.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 07:41:47 -0700 (PDT)
Received: (nullmailer pid 278300 invoked by uid 1000);
        Tue, 30 Mar 2021 14:41:41 -0000
Date:   Tue, 30 Mar 2021 09:41:41 -0500
From:   Rob Herring <robh@kernel.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        linux-arm-kernel@lists.infradead.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-remoteproc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: stm32-rproc: add new
 mailbox channel for detach
Message-ID: <20210330144141.GA278273@robh.at.kernel.org>
References: <20210322092651.7381-1-arnaud.pouliquen@foss.st.com>
 <20210322092651.7381-2-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210322092651.7381-2-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, 22 Mar 2021 10:26:50 +0100, Arnaud Pouliquen wrote:
> Add the "detach" mailbox item, that allows to define a mailbox to
> send a IPCC signal to the remote processor on remoteproc detach action.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
> update from V1:
> 
> Fix indentation error reported by 'make dt_binding_check'.
> 
> ---
>  .../bindings/remoteproc/st,stm32-rproc.yaml           | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
