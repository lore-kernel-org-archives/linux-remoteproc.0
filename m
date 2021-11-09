Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50093C4167B
	for <linux-remoteproc@archiver.kernel.org>; Tue,  9 Nov 2021 08:41:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 38E7C611C4
	for <linux-remoteproc@archiver.kernel.org>; Tue,  9 Nov 2021 08:41:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244391AbhKIIoO (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 9 Nov 2021 03:44:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244457AbhKIIn4 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 9 Nov 2021 03:43:56 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABD42C061764;
        Tue,  9 Nov 2021 00:41:09 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id w1so74042451edd.10;
        Tue, 09 Nov 2021 00:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AJX2pUmfzPpLjrrxgxxO1bbzmWpMPOrJUiDQcak4Rxw=;
        b=Xhx+JkZ1YjdLPVM9vGKZgR/eZK+rAJhk3ZZDvjCiEXEUP6oV33ghLj9du+H3sS+cBZ
         cMy64rsO3KgnXTLlNZuT0g7csOSOy6xfvfEguLeJqgek/sNrB9mJSgNhXgBBO3oEDKyM
         vC0Gxy9Mo+D8j8aEiyVXB9sg01pUlraH9dA0yjAXCh0O+XsvRndQqeBjZEeGhPSl14Be
         OdGaorvu9c7r+RDp44ERCowykm6aWMzwUZFKbpr7EjINat7OXewj8SFkxSJhmM73NIou
         CY6SDVVjVV+joj1wTkbXfhilwW+86rUeyZNiFA0LsC9jgfMZ1Ki76PdyEEE96qicncG4
         msdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AJX2pUmfzPpLjrrxgxxO1bbzmWpMPOrJUiDQcak4Rxw=;
        b=uLBbg8LxOk+HBnPhj6/Q6ge60wkDwLSaTTwsUH6MVDzrQK9g5JRe2PBYtlgH+whoZX
         i8ZqrXaSDlTdQlR2VYQEROwgKaYYIVP6Ib3mQJX4slPIHBmeAVd2BAfT3p+p0G84Rij2
         kkxJB4/XBFo3rWt/QkR0qIUO1SKgDgD0jkuvCIV/GFRCNcojhG14bvSQol0yMNA4y3Yv
         8L2dUdVzQBI45QkQG369OOrW8HD6a5VJOLbBoxRORXkZPZbVdU0sUdQY2AVxUWw5NFCd
         6XD8CnC88qWjQ7e6FU4j95DJluX3bvZ128vp2oAn6jGJFW8Ia/QLx+RjnhiWrb5VeWm3
         rHSg==
X-Gm-Message-State: AOAM532fWFTN77zwURGQjufo4cB/ThuKrpmTP657MaEHQUKx0yFK1iMi
        06p/EoyhYgOpRUo0KchMzyLobgvUbDa7/yTrgfNwd2TNeeg=
X-Google-Smtp-Source: ABdhPJxW2xe6xbM2FmzJ/BPWyMLO+LNPRG1OB5qvb0UPIHkOH50jO3GIVddC+4hV8eCU8mvE1ukk/t6U5rA8jOFZm+Q=
X-Received: by 2002:a05:6402:3493:: with SMTP id v19mr7631155edc.149.1636447268090;
 Tue, 09 Nov 2021 00:41:08 -0800 (PST)
MIME-Version: 1.0
References: <20211109083051.17831-1-christian.gmeiner@gmail.com> <20211109083051.17831-2-christian.gmeiner@gmail.com>
In-Reply-To: <20211109083051.17831-2-christian.gmeiner@gmail.com>
From:   Christian Gmeiner <christian.gmeiner@gmail.com>
Date:   Tue, 9 Nov 2021 09:40:56 +0100
Message-ID: <CAH9NwWdOt2xnRtbYZFnpU1vornqNcUX5dVUOLut2Zma844FggA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] rpmsg: add syslog driver
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi.

Am Di., 9. Nov. 2021 um 09:31 Uhr schrieb Christian Gmeiner
<christian.gmeiner@gmail.com>:
>
> Allows the remote firmware to log into syslog.
>
> Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
> ---
>  drivers/rpmsg/Kconfig  | 8 ++++++++
>  drivers/rpmsg/Makefile | 1 +
>  2 files changed, 9 insertions(+)
>
> diff --git a/drivers/rpmsg/Kconfig b/drivers/rpmsg/Kconfig
> index 0b4407abdf13..801f9956ec21 100644
> --- a/drivers/rpmsg/Kconfig
> +++ b/drivers/rpmsg/Kconfig
> @@ -73,4 +73,12 @@ config RPMSG_VIRTIO
>         select RPMSG_NS
>         select VIRTIO
>
> +config RPMSG_SYSLOG
> +       tristate "SYSLOG device interface"
> +       depends on RPMSG
> +       help
> +         Say Y here to export rpmsg endpoints as device files, usually found
> +         in /dev. They make it possible for user-space programs to send and
> +         receive rpmsg packets.
> +
>  endmenu
> diff --git a/drivers/rpmsg/Makefile b/drivers/rpmsg/Makefile
> index 8d452656f0ee..75b2ec7133a5 100644
> --- a/drivers/rpmsg/Makefile
> +++ b/drivers/rpmsg/Makefile
> @@ -9,3 +9,4 @@ obj-$(CONFIG_RPMSG_QCOM_GLINK_RPM) += qcom_glink_rpm.o
>  obj-$(CONFIG_RPMSG_QCOM_GLINK_SMEM) += qcom_glink_smem.o
>  obj-$(CONFIG_RPMSG_QCOM_SMD)   += qcom_smd.o
>  obj-$(CONFIG_RPMSG_VIRTIO)     += virtio_rpmsg_bus.o
> +obj-$(CONFIG_RPMSG_SYSLOG)     += rpmsg_syslog.o
> --
> 2.33.1
>

I just sent a v2 as I was missing the rpmsg_syslog.c - need more coffee.

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
