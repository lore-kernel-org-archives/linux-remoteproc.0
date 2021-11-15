Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D393C433F5
	for <linux-remoteproc@archiver.kernel.org>; Tue, 16 Nov 2021 03:10:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EA7A76320D
	for <linux-remoteproc@archiver.kernel.org>; Tue, 16 Nov 2021 03:10:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346886AbhKPDM4 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 15 Nov 2021 22:12:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244983AbhKPDMr (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 15 Nov 2021 22:12:47 -0500
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF6C7C10E5E9
        for <linux-remoteproc@vger.kernel.org>; Mon, 15 Nov 2021 15:40:32 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id n66so38194792oia.9
        for <linux-remoteproc@vger.kernel.org>; Mon, 15 Nov 2021 15:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=+vkIUHgpzbJDI/aE4qWRN6on5+ys3atnnjej/kwyIKA=;
        b=MvwYgzJfl2z6wYdr1mxeicKXhoW/hXOKCTTlNpU020Ph8jqOYoqbnuXHhEUhEeOuet
         /khOM4iBa9JfVkpDvECqEBzOP/8MS7WmvFsWxLf4lOHGHGj59aNacA7xJvWnp5R4rzeC
         9S0j6j9vp9ridHSVldRvp0Kb3u1mYuoSRjSWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=+vkIUHgpzbJDI/aE4qWRN6on5+ys3atnnjej/kwyIKA=;
        b=er2EO6m3mtfpbmTBs0HCsFWN4mEdV9iz7Xn9OCvjA9Vs+is4gLtDzD0gZiIGUOjEf0
         QBkgGsCkpP7ksMsYIK9ZiD1Kcp3wNErPgSN1VCc5BCk9MVaADkIsgyH7QhonkvcfeQJl
         bNF2V2krLbSc/qa0mefe6fxDli7+2BUkZq4aksOjGjvSNXJ7eq4023UQPv3leqXGixvE
         IXwmLlACibdfh4KgSF54cyxvNZ1yH+Ht1aHtd8p83ikFEioCuAET7S8cUGWkFrlL0cba
         BXptLTAjempL9POkCO3WSXjLqzLAaa/0nNVSTfdZzdr/tVQ9ZbzF2TeusGmDH16LTde/
         m+Ow==
X-Gm-Message-State: AOAM5328iKFrlZuKiTiinlxUJ4hq3h5CQvwLvzJtjMlWS3yT5PxrQUfg
        BIJyhBGKSqDvgESjBOPLaQp9PPpgw4RmoogHJiMKew==
X-Google-Smtp-Source: ABdhPJx6sFabeBeRR3jlaia33qeOJQBpKB1AbeYvHvZDZwyzUsfM+A7bo2X6isvJ81dQZc5z//IKWU21dGnPlynzfeA=
X-Received: by 2002:a54:4506:: with SMTP id l6mr49040451oil.32.1637019632340;
 Mon, 15 Nov 2021 15:40:32 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 15 Nov 2021 15:40:32 -0800
MIME-Version: 1.0
In-Reply-To: <1635860673-12146-2-git-send-email-pillair@codeaurora.org>
References: <1635860673-12146-1-git-send-email-pillair@codeaurora.org> <1635860673-12146-2-git-send-email-pillair@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 15 Nov 2021 15:40:31 -0800
Message-ID: <CAE-0n52ONQVGG__JsLUVjjCOdHnw+xqx5HF89ZBGrUF0yjusSg@mail.gmail.com>
Subject: Re: [PATCH v8 1/3] dt-bindings: remoteproc: qcom: adsp: Convert
 binding to YAML
To:     Rakesh Pillai <pillair@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        ohad@wizery.com, p.zabel@pengutronix.de, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sibis@codeaurora.org, mpubbise@codeaurora.org, kuabhs@chromium.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Quoting Rakesh Pillai (2021-11-02 06:44:31)
> Convert Qualcomm ADSP/CDSP Remoteproc devicetree
> binding to YAML.
>
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
