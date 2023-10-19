Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF832CDB483
	for <linux-remoteproc@archiver.kernel.org>; Thu, 19 Oct 2023 05:35:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232620AbjJSFfc (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 19 Oct 2023 01:35:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232681AbjJSFfb (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 19 Oct 2023 01:35:31 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A63E7126
        for <linux-remoteproc@vger.kernel.org>; Wed, 18 Oct 2023 22:35:28 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1c87a85332bso65801975ad.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 18 Oct 2023 22:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1697693728; x=1698298528; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NfobpSr7vKEGPH54g86JM2Np+bjWhjxTMm3BnchjKQ0=;
        b=fQuPntFtrXBrqOA5X1FYTkpOT/zHpG9OLlVqSGDGS8Zudy7WmI5zDxOrqmQjO8kMBJ
         /niDxix/PjtbdpJMHtFgTG8VGqY7VTQZJUUWoPqiw7hUMZbWki2yh6HwXTlZYLLlGOPU
         Ou8sgYBgOZyRUdEP/5IlqkprlDahC6At1/5E4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697693728; x=1698298528;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NfobpSr7vKEGPH54g86JM2Np+bjWhjxTMm3BnchjKQ0=;
        b=U2F3bL42QqWcxYiw7kT4W37FR85/Tr5EPwJYktjct7NF84klKNEBFxVpMwunzuyE3W
         ly7cbhqLAdU0R+bzRhTCzD3UNmh5f0FuZUwP8M7TRUBcfRLPy681DDzuDNZT8QwAfydt
         zuHWeyStKd4mF1EcQlmzdxgB7du/l6tCh1cXwDXOupWo3YfeVy1CRvL/bSX6qnWqiw3v
         s7IQFG5DSmlgKucq73pGrhulPNnL3dx0fpYA+veJ3lrJb39823ISPRaHO0x+MX/EVD9C
         tzh8B0UX/O9ZcVNgY+7if90qMIB7MRcgE4ZQfG4y8xUG/8EyUOkgOI/zABeoQJ9695/N
         ms/g==
X-Gm-Message-State: AOJu0Yxk+T/1XOFEY5Zi41oEtaub0dWIStQdyH9JXQ+D5/4Y9LKFV/Ml
        jHqQw0AcXrWajFF4noxz8MPPRw==
X-Google-Smtp-Source: AGHT+IHWgfmf8zIXxwIjD4ZleHld0EiD88e4q1WNeVI5olT0uObTayiLltt3PVMa2zo4Kom7Jk92AA==
X-Received: by 2002:a17:903:1cb:b0:1c6:a0b:7b9a with SMTP id e11-20020a17090301cb00b001c60a0b7b9amr1450654plh.3.1697693728114;
        Wed, 18 Oct 2023 22:35:28 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id u2-20020a17090341c200b001c74df14e6esm903825ple.51.2023.10.18.22.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 22:35:27 -0700 (PDT)
Date:   Wed, 18 Oct 2023 22:35:26 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Justin Stitt <justinstitt@google.com>
Cc:     Stephan Gerhold <stephan@gerhold.net>,
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
Message-ID: <202310182232.A569D262@keescook>
References: <20231018-strncpy-drivers-net-wwan-rpmsg_wwan_ctrl-c-v1-1-4e343270373a@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231018-strncpy-drivers-net-wwan-rpmsg_wwan_ctrl-c-v1-1-4e343270373a@google.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Oct 18, 2023 at 10:14:55PM +0000, Justin Stitt wrote:
> strncpy() is deprecated for use on NUL-terminated destination strings
> [1] and as such we should prefer more robust and less ambiguous string
> interfaces.
> 
> We expect chinfo.name to be NUL-terminated based on its use with format
> strings and sprintf:
> rpmsg/rpmsg_char.c
> 165:            dev_err(dev, "failed to open %s\n", eptdev->chinfo.name);
> 368:    return sprintf(buf, "%s\n", eptdev->chinfo.name);
> 
> ... and with strcmp():
> |  static struct rpmsg_endpoint *qcom_glink_create_ept(struct rpmsg_device *rpdev,
> |  						    rpmsg_rx_cb_t cb,
> |  						    void *priv,
> |  						    struct rpmsg_channel_info
> |  									chinfo)
> |  ...
> |  const char *name = chinfo.name;
> |  ...
> |  		if (!strcmp(channel->name, name))
> 
> Moreover, as chinfo is not kzalloc'd, let's opt to NUL-pad the
> destination buffer
> 
> Similar change to:
> Commit 766279a8f85d ("rpmsg: qcom: glink: replace strncpy() with strscpy_pad()")
> and
> Commit 08de420a8014 ("rpmsg: glink: Replace strncpy() with strscpy_pad()")
> 
> Considering the above, a suitable replacement is `strscpy_pad` due to
> the fact that it guarantees both NUL-termination and NUL-padding on the
> destination buffer.
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
> Link: https://github.com/KSPP/linux/issues/90
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---
> Note: build-tested only.
> 
> Found with: $ rg "strncpy\("
> ---
>  drivers/net/wwan/rpmsg_wwan_ctrl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wwan/rpmsg_wwan_ctrl.c b/drivers/net/wwan/rpmsg_wwan_ctrl.c
> index 86b60aadfa11..39f5e780c478 100644
> --- a/drivers/net/wwan/rpmsg_wwan_ctrl.c
> +++ b/drivers/net/wwan/rpmsg_wwan_ctrl.c
> @@ -37,7 +37,7 @@ static int rpmsg_wwan_ctrl_start(struct wwan_port *port)
>  		.dst = RPMSG_ADDR_ANY,
>  	};

"chinfo" is initialized immediately above here, which means that it is
actually already zero filled for all the members that aren't explicitly
initialized, so the _pad variant isn't needed. I suspect Dead Store
Elimination will optimize it all away anyway, so this is probably fine.

>  
> -	strncpy(chinfo.name, rpwwan->rpdev->id.name, RPMSG_NAME_SIZE);
> +	strscpy_pad(chinfo.name, rpwwan->rpdev->id.name, sizeof(chinfo.name));

Yup, sizeof() replacement looks correct:

struct rpmsg_channel_info {
        char name[RPMSG_NAME_SIZE];

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

-- 
Kees Cook
