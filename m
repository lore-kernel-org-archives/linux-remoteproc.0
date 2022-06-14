Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB9B4C433EF
	for <linux-remoteproc@archiver.kernel.org>; Tue, 14 Jun 2022 23:10:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236971AbiFNXKB (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 14 Jun 2022 19:10:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234450AbiFNXKA (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 14 Jun 2022 19:10:00 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A691E515AE
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Jun 2022 16:09:59 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id u12so19905881eja.8
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Jun 2022 16:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qhv7YLyAi4BrmQXx3nUWE7hhcFNv7AcKBHmsYhP5KPM=;
        b=cNgezFl+M+gTPGuMJRJWa0Mbg58VEK5mM4OGpXpx84sJr9RbU7N3RzHHAz5E3evMnJ
         rdhwzHZop0iS2+06lJCH6gvL10x0FjATjKPL1jDdUaRI+r0hD35NWOiTjMsPkwU7w16x
         HpF4p5puSupgKso7I4kYDUcO29taypkE36PGf4uG1N9WWE+drNyHEdTDMABxZEz+mXPn
         kvM/vBVyXIIETZg5j5Sgyz2fo8gfX/m5viI1gNz3DKVlq7vesP8jKgL0//9bpJ1e0u4v
         vwpXJ6maxn+hfgqnFWiFrNSMdGrnGCwx1YzLuuPWYX/EuK2PP/IW5D5eV/WsQXk5isWa
         wkKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qhv7YLyAi4BrmQXx3nUWE7hhcFNv7AcKBHmsYhP5KPM=;
        b=IIoiTkRnHCWsHk476kwajpH5BoqT9nlbgjQgE/xuxXcwpbvi9Az4ugTLC7bq4cGogf
         IZZ6i6+l+bEqyYIyJza1P3IrZcQkTUI/5IUUFkwrWIBgfUV6RIoopBpUi6fwNcb/6RPN
         qa58Rsz21A0UoKsoWyulD8WJXE0JK0My8Vr6sYAWDRx1TluKgI7xFGMhfu6rJJDiFkT4
         MPCQwUr7qrMXwrjrr/ekapfbp3ewVFMtmWng54FAcRW0aNkNmAzyHn8OuEXHWZnC6JOb
         djxrkN5CTOnqUUPWOOrREFuyTxFMkeMr1lyiBnp5NOsvcgVKnxCPubOY+sWdFx5iWhuw
         Y9RA==
X-Gm-Message-State: AJIora/tNdU1IkElsksCTPo74jON1DHE3yr6ziTu0ND/QkvnPWVU8/hB
        M+Gx3paxBW7NdHQafbA6ZxsHqq4KndzVXkzmzIMLwQ==
X-Google-Smtp-Source: AGRyM1tdS4T7dOBzwuIh4syn5mV1pdfjDpNBZAVBPhL1m3tv8qL3cQrVJclclkViVM4AOjSU8cenih372VNztuAKfZI=
X-Received: by 2002:a17:906:79ca:b0:705:111f:12dc with SMTP id
 m10-20020a17090679ca00b00705111f12dcmr6462486ejo.602.1655248198216; Tue, 14
 Jun 2022 16:09:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220608130406.46005-1-wangxiang@cdjrlc.com>
In-Reply-To: <20220608130406.46005-1-wangxiang@cdjrlc.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Tue, 14 Jun 2022 17:09:46 -0600
Message-ID: <CANLsYkxLi1G1T57AVwNu+Mg7YbqE3Lox3Auh3YAT9mZsMH0r3w@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: omap_remoteproc: Fix typo in comment
To:     Xiang wangx <wangxiang@cdjrlc.com>
Cc:     bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, 8 Jun 2022 at 07:04, Xiang wangx <wangxiang@cdjrlc.com> wrote:
>
> Delete the redundant word 'The'.
> Delete the redundant word 'to'.
>
> Signed-off-by: Xiang wangx <wangxiang@cdjrlc.com>
> ---
>  drivers/remoteproc/omap_remoteproc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>

I have applied this patch.

Thanks,
Mathieu

> diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
> index 32a588fefbdc..430fab0266ed 100644
> --- a/drivers/remoteproc/omap_remoteproc.c
> +++ b/drivers/remoteproc/omap_remoteproc.c
> @@ -243,7 +243,7 @@ static inline int omap_rproc_get_timer_irq(struct omap_rproc_timer *timer)
>   * omap_rproc_ack_timer_irq() - acknowledge a timer irq
>   * @timer: handle to a OMAP rproc timer
>   *
> - * This function is used to clear the irq associated with a watchdog timer. The
> + * This function is used to clear the irq associated with a watchdog timer.
>   * The function is called by the OMAP remoteproc upon a watchdog event on the
>   * remote processor to clear the interrupt status of the watchdog timer.
>   */
> @@ -303,7 +303,7 @@ static irqreturn_t omap_rproc_watchdog_isr(int irq, void *data)
>   * @configure: boolean flag used to acquire and configure the timer handle
>   *
>   * This function is used primarily to enable the timers associated with
> - * a remoteproc. The configure flag is provided to allow the driver to
> + * a remoteproc. The configure flag is provided to allow the driver
>   * to either acquire and start a timer (during device initialization) or
>   * to just start a timer (during a resume operation).
>   *
> @@ -443,7 +443,7 @@ static int omap_rproc_enable_timers(struct rproc *rproc, bool configure)
>   * @configure: boolean flag used to release the timer handle
>   *
>   * This function is used primarily to disable the timers associated with
> - * a remoteproc. The configure flag is provided to allow the driver to
> + * a remoteproc. The configure flag is provided to allow the driver
>   * to either stop and release a timer (during device shutdown) or to just
>   * stop a timer (during a suspend operation).
>   *
> --
> 2.36.1
>
