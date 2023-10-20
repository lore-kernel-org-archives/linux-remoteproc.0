Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3C0AC001E0
	for <linux-remoteproc@archiver.kernel.org>; Fri, 20 Oct 2023 00:16:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346761AbjJTAQA (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 19 Oct 2023 20:16:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346758AbjJTAP7 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 19 Oct 2023 20:15:59 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4136E132
        for <linux-remoteproc@vger.kernel.org>; Thu, 19 Oct 2023 17:15:57 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-6ce37d0f1a9so8768a34.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 19 Oct 2023 17:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1697760956; x=1698365756; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KCVrvRoy4SGPWE20sLca2ThSQwQI5qn6X68QgvLEZPo=;
        b=Z8c2oT9ABdXS4JFpoFEZXMc5FLveIg5FD1kmw/RtiibToeWIBu5R53AjQYfm7xMfap
         uDQPfXMeufg3Z7xV1ZfPji8+K3NFQsuMz6tFzL8Nhey0UkkLOd9iMnBVeiTCcEpyu/IX
         AQS2Bo628GnAj+2mDbiL0d8lDG/zDwg41Ca+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697760956; x=1698365756;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KCVrvRoy4SGPWE20sLca2ThSQwQI5qn6X68QgvLEZPo=;
        b=JyWbld93zqAo2gV/+grs28pnZYDxXqu6xL82Ah1X7vEQTGG6mPZIqUiKScfcErAx3y
         jSGGVY6qrlnjuguHuk3b0oPdXzx2OOFTRGkSBfsPgVbtvR0Nj1WoAwMlTAW5UV/lzIJj
         YjJ8JcW6scgZm01O8XPja0NEtjC9YUzbB0fcjbI9CIaQSMpEwbUbRUvYTTl5I5jMtHUy
         T5TmujdmS29XsMjxXGSFTMJ5l3qXiQeQiaKx9Uk+O9Fk54RfKLTffRikeoKuFUR0wcPg
         +dq1r9F+ZLvaqds4odoLdnxkSZaQM9bPK8L8DT3PAL2uZf0Q0+PuB3yQHvF8EuFAa38p
         9XGQ==
X-Gm-Message-State: AOJu0YyV3B4aTkBPtng3QqehUCVkX5j+FXphaIG6akAkpgGjF5KwytG/
        q1gbshKN4pmSzzJ8BE0KS6/wiw==
X-Google-Smtp-Source: AGHT+IEHLvazYVGD5+oh4u6xlbwXIAQEvzEsnULcGkmSyGkZHb+qUhJKu+91HBvjlkfySxvWpaKNQw==
X-Received: by 2002:a05:6830:2b23:b0:6be:fe1e:c13 with SMTP id l35-20020a0568302b2300b006befe1e0c13mr503343otv.0.1697760956577;
        Thu, 19 Oct 2023 17:15:56 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id x11-20020aa78f0b000000b00690fe1c928csm351482pfr.147.2023.10.19.17.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 17:15:55 -0700 (PDT)
Date:   Thu, 19 Oct 2023 17:15:55 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Justin Stitt <justinstitt@google.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH] net: wwan: replace deprecated strncpy with strscpy_pad
Message-ID: <202310191715.5436893DD0@keescook>
References: <20231018-strncpy-drivers-net-wwan-rpmsg_wwan_ctrl-c-v1-1-4e343270373a@google.com>
 <202310182232.A569D262@keescook>
 <ZTExfv2aHPD2B1ze@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZTExfv2aHPD2B1ze@gerhold.net>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Oct 19, 2023 at 03:39:10PM +0200, Stephan Gerhold wrote:
> Hm, strscpy_pad() is neither a typical compiler builtin nor an inline
> function, so my naive assumption would be that this could only be
> optimized away with LTO?

Oops, yes, my mistake. I'm too used to the other fortified helpers that
are inlined...

-- 
Kees Cook
