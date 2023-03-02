Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBB37C678D4
	for <linux-remoteproc@archiver.kernel.org>; Thu,  2 Mar 2023 22:02:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229871AbjCBWCM (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 2 Mar 2023 17:02:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229614AbjCBWB5 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 2 Mar 2023 17:01:57 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 292835F6C9
        for <linux-remoteproc@vger.kernel.org>; Thu,  2 Mar 2023 14:01:31 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id q16so543530wrw.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 02 Mar 2023 14:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677794489;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eoLlFIKo+0HC5z28LpcjtRJj56OW9StYTeb8Ufax9js=;
        b=YpQcR7Fk9iV2T9fMbhThZBBI3/6zaasRJaHdsjGW9xKGPo4O7Ce+woLxIidUTkLdVW
         YnlO0mK+ywg8Z/jbg7gaL8bVeFN3Z6RmaW9l4An+tbGZeCmkgbaS6mevIiDp9uGG6icN
         3blWigkKz42aFytge/FoW+om2fZGXhxo7KRLSA6wUp4mg/Yl7VcToGqD5LhnIYqxD6bg
         XqQL8r+ee3LjdXEWrulYuu5wyUNZMQiKgCKfWkSjVxEshFQVDceePd5egARutR758B1d
         +xUUkUp16H4qrgvOk64HJpu+bNBpSgRm11PFhEOkXNTItmLGdZkKC01ySrfirtaa1PnS
         Sw5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677794489;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eoLlFIKo+0HC5z28LpcjtRJj56OW9StYTeb8Ufax9js=;
        b=QK2icYon2eHQPTptc0m6WXXbu9uYswHrBiZiJ1kilTRc3pN5p77o5aDxJ6Ij8d32vg
         torTCJn5/0vY746n/e8f6x3D3jNyXHln0Q8rDvskd99VgAzFOctRU8i6vWtLbw2pRN2Q
         v/PbQbo6W+erYwvG/wc4zxxgmjd1vKpUDG9p0nJX/9Bbs0SLATeH4kqYHxJu4GXMlC/E
         pRRPNADsqH75oyStzGgp1kjNeXAT38pXt2gaZ5Nx/rKXTCdrPpai/W/mputwTqo7N4pm
         GW+dQgxu5j6cgv0TckcBlbMIZLGAdEgJWzLO1QWedQH9P7s0d+MnUYOejw0IgHh2l7fd
         16Cw==
X-Gm-Message-State: AO0yUKXrDAjMVRkg+NgvJ3Yi7STQ99ILZ5JuH+fKlo1t5z14J+Hmi5LK
        FbX4Ya8n2ryC1l59t3CwDcZ7qmYVND35DRajS+DfaQ==
X-Google-Smtp-Source: AK7set8p2o8BjVZaPWOCquuwzj0H6Ba4FS/Y1kR8lKWg5AU835kdnwYfmn8lUlm0xHF4LlpzwHVVxhlKuA+A81J4M70=
X-Received: by 2002:adf:f7cb:0:b0:2c7:a39:78ae with SMTP id
 a11-20020adff7cb000000b002c70a3978aemr1975071wrq.13.1677794489531; Thu, 02
 Mar 2023 14:01:29 -0800 (PST)
MIME-Version: 1.0
References: <20230228130215.289081-1-nick.alcock@oracle.com> <20230228130215.289081-9-nick.alcock@oracle.com>
In-Reply-To: <20230228130215.289081-9-nick.alcock@oracle.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Thu, 2 Mar 2023 15:01:18 -0700
Message-ID: <CANLsYkxBR3Gi42Tsv-=QQ70BtvJCRcVPz6gn=9Q-zXzkt6Vz+A@mail.gmail.com>
Subject: Re: [PATCH 08/20] remoteproc: remove MODULE_LICENSE in non-modules
To:     Nick Alcock <nick.alcock@oracle.com>
Cc:     mcgrof@kernel.org, linux-modules@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, 28 Feb 2023 at 06:03, Nick Alcock <nick.alcock@oracle.com> wrote:
>
> Since commit 8b41fc4454e ("kbuild: create modules.builtin without
> Makefile.modbuiltin or tristate.conf"), MODULE_LICENSE declarations
> are used to identify modules. As a consequence, uses of the macro
> in non-modules will cause modprobe to misidentify their containing
> object file as a module when it is not (false positives), and modprobe
> might succeed rather than failing with a suitable error message.
>
> So remove it in the files in this commit, none of which can be built as
> modules.
>
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
> Suggested-by: Luis Chamberlain <mcgrof@kernel.org>
> Cc: Luis Chamberlain <mcgrof@kernel.org>
> Cc: linux-modules@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: linux-remoteproc@vger.kernel.org
> ---
>  drivers/remoteproc/remoteproc_core.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 1cd4815a6dd19..de1ace44cb57b 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -2765,5 +2765,4 @@ static void __exit remoteproc_exit(void)
>  }
>  module_exit(remoteproc_exit);
>
> -MODULE_LICENSE("GPL v2");

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>  MODULE_DESCRIPTION("Generic Remote Processor Framework");
> --
> 2.39.1.268.g9de2f9a303
>
