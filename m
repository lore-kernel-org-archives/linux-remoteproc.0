Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E15D5C07E99
	for <linux-remoteproc@archiver.kernel.org>; Mon, 12 Jul 2021 17:30:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B7BF7606A5
	for <linux-remoteproc@archiver.kernel.org>; Mon, 12 Jul 2021 17:30:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234224AbhGLRcv (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 12 Jul 2021 13:32:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233964AbhGLRcv (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 12 Jul 2021 13:32:51 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18478C0613DD
        for <linux-remoteproc@vger.kernel.org>; Mon, 12 Jul 2021 10:30:03 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id d12so18974902pgd.9
        for <linux-remoteproc@vger.kernel.org>; Mon, 12 Jul 2021 10:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Bl5lPT61BurctfIDgaQ/f+sYzra2LoJ5ZZtY4MpkY2g=;
        b=TqY7DcGO/1xFL+T2KqKL7w85TzTUNFwRjE2Gdn9SU28zTn/q682lhMKQ0D94N0/n9k
         arK8S11fW7lRxpmMy8nHbNL9qeckO/TixqSMYfFB7bV/U3Xj2axsiXJ3GjhrYl8+aOqL
         oVBAgj6qOiIp4iuMRqLcnc5sdlMr6CnRQNF9YzeBoh10u6TLlsucs3r4MApqHXcEmbGR
         W+7zPYvs5saKL7nKCRZYAwdLEQn+ZVHum2rNjD3y5RCgfjzPGQ4BNlIEYnUG+Gnb6Sqw
         9x2Q5bShpoRvGZnYN0JvvkXeC/jDEnH2zssWQTEMSXuwbZEk9+tbkL62OITli+kb8bXs
         j2CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Bl5lPT61BurctfIDgaQ/f+sYzra2LoJ5ZZtY4MpkY2g=;
        b=UusUd47ly3wzSjXi2+UAyRiLDUusVZQaFLoE9vBhGbaejvt3UZeBSFZm5QNWFLNi3e
         bfHUG+KPVOjXeOKBlkvtqRChJnhzNZD90cWY+741hfAQL75R+5a+ptV+QGLGbtBp4oje
         erGOflg2a4wLzHpKxj3klsk1QLt8f3nfccMJETAArCYB0vS4muaqJLUh06U5AX+AfJjx
         ewxA6XFUNtYOk5OsGUwmxasEMimCJOUQnydiyf8EpgK9dTZezmbIgHJi6pGCFHEXNTuk
         LuAiogreKSgNii6itGCyOl4PhmiTR800zmIgPY1l1HBpwP91dHjWHk6WBbT5nKe+BSOK
         LbBw==
X-Gm-Message-State: AOAM532XcbYXV2q/G1QX1APhf0iFZpJjojyrrGLxfb4nf49geYZcu7al
        UCvSonQEHmmFHIC6e2L6YsfV4A==
X-Google-Smtp-Source: ABdhPJzJ/qZkXJ5cnnU664jPmMtJ3W4uZcbnY7JuJfu8VUdQbkBY8OVfYOpHXf2OyJvY16nJ9O5HvA==
X-Received: by 2002:a63:5a5b:: with SMTP id k27mr248089pgm.74.1626111002679;
        Mon, 12 Jul 2021 10:30:02 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id j2sm16553920pfj.168.2021.07.12.10.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 10:30:01 -0700 (PDT)
Date:   Mon, 12 Jul 2021 11:29:59 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Dong Aisheng <aisheng.dong@nxp.com>
Cc:     linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, ohad@wizery.com,
        dongas86@gmail.com, bjorn.andersson@linaro.org, cleger@kalray.eu
Subject: Re: [PATCH 1/2] remoteproc: fix an typo in fw_elf_get_class code
 comments
Message-ID: <20210712172959.GA1779922@p14s>
References: <20210706142156.952794-1-aisheng.dong@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210706142156.952794-1-aisheng.dong@nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Jul 06, 2021 at 10:21:55PM +0800, Dong Aisheng wrote:
> Drop 'and' which looks like unnecessary.
> 
> Fixes: 73516a33588c ("remoteproc: Add elf helpers to access elf64 and elf32 fields")
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---
>  drivers/remoteproc/remoteproc_elf_helpers.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_elf_helpers.h b/drivers/remoteproc/remoteproc_elf_helpers.h
> index 26404e68e17a..e6de53a5000c 100644
> --- a/drivers/remoteproc/remoteproc_elf_helpers.h
> +++ b/drivers/remoteproc/remoteproc_elf_helpers.h
> @@ -15,7 +15,7 @@
>   * fw_elf_get_class - Get elf class
>   * @fw: the ELF firmware image
>   *
> - * Note that we use and elf32_hdr to access the class since the start of the
> + * Note that we use elf32_hdr to access the class since the start of the
>   * struct is the same for both elf class

The sentence should read:

"Note that we use an elf32_hdr..."

With the above:

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>   *
>   * Return: elf class of the firmware
> -- 
> 2.25.1
> 
