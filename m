Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E874FEE4993
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Aug 2023 14:14:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233172AbjHVOOE (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 22 Aug 2023 10:14:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233912AbjHVOOD (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 22 Aug 2023 10:14:03 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EA1010DD
        for <linux-remoteproc@vger.kernel.org>; Tue, 22 Aug 2023 07:13:40 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4ff8f2630e3so7223779e87.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 22 Aug 2023 07:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692713587; x=1693318387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qlf757eoDSDlDC2/xdNWV7d3ANWTplyyyWV2GEtJQb0=;
        b=QgnC0/Hte7k5i+o70NAqpNDm8t7tLVRiiKkqTFdSJuJugGpEGQJhAaiSLde++cweT0
         Uf6OA6FGxSLPPLS5TwiBYUNmTWkq5aTwyCkRHcCXOqIiYdW492dLi1QYqV1f8OsvWKW2
         eArEElPlku3fKew6g7MOPe0ZKB5yVXudPhQuZOa6OfQ6naKYEozAyX4bCJEYnbQhCex7
         sqFwQr4WlVJ6axPME+Mu308cc0JyEf284RWSw/oQCZoycx3iVLwMXS6ADjcU0D+0hv0v
         arassDar3CUkcVNEbnOy6unY+yZ45zxDKMWBYQX9xEyJnwuP6rqJaeDDq9MBvKzW3zzM
         QNCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692713587; x=1693318387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qlf757eoDSDlDC2/xdNWV7d3ANWTplyyyWV2GEtJQb0=;
        b=NIk/+LVC7V80jzfFIEE+6w3m5F+XOgChxvhdB/XtwUYkDQy03K5xPnvkkLGb47WAO/
         axIREXmCKpNguLpQJLdNLYzds6jI2bNttCj4oIJFwWngjH6T4QL2UWo2PQUMU2cZt54t
         ZpBMEHVbA+QI1O8EfI6vTs8V0+WYFev6MNb+ySoiD+i63nd4NVcGo1w4mhti/aeJJJld
         h2rHYnymmCMPxPe3YqLfxCedfHbdgxeU9MpvRh21U4yo8ZZT3zV1nr7H9uB1xM3aGT78
         AfgmF0YyOO8bP7AsFzsjY2NfotO4JhCRv4K7OuGiyXMqGyJV0irA0n/0zypXDJf0zu9Z
         qxxA==
X-Gm-Message-State: AOJu0YwgWNL+v7On44PVAPmUN3XQFFRRty/glUovzVCjzS7veBY9yZko
        umpU35wh4R0opFG9ekK6pf4WvPTng0LLV7UEA3k=
X-Google-Smtp-Source: AGHT+IEMngMY2OAZ3sZc9CX0K0hGviCPc/hqCZHJ+S5A3YhZ3nZ7RDdVrze5ZrN92awBxLUO+3/VK3Te4H4tLKKK4VQ=
X-Received: by 2002:ac2:4f15:0:b0:4fb:911b:4e19 with SMTP id
 k21-20020ac24f15000000b004fb911b4e19mr7821937lfr.35.1692713587268; Tue, 22
 Aug 2023 07:13:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAEnQRZAHzbCBuYvyTxzLJWmEUw4ytY+F8i_Qk0O9Z3ZW0L1bOg@mail.gmail.com>
In-Reply-To: <CAEnQRZAHzbCBuYvyTxzLJWmEUw4ytY+F8i_Qk0O9Z3ZW0L1bOg@mail.gmail.com>
From:   Daniel Baluta <daniel.baluta@gmail.com>
Date:   Tue, 22 Aug 2023 17:12:55 +0300
Message-ID: <CAEnQRZCqS4+zaUDrFVcHo+eu-8ko4WC2TQtuG=-b5qeA4YU=ew@mail.gmail.com>
Subject: Re: Discussion about imx_dsp_rproc FW_READY policy
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "S.j. Wang" <shengjiu.wang@nxp.com>
Cc:     Iuliana Prodan <iuliana.prodan@nxp.com>,
        linux-remoteproc@vger.kernel.org, dl-linux-imx <linux-imx@nxp.com>,
        Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>,
        Carlo Caione <ccaione@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mathieu, S.J,

Any comments about this?

I feel that the Linux kernel driver shouldn't enforce the policy of
waiting for a reply or confirmation that the firmware booted.

The Linux kernel driver should offer a mechanism for checking this and
the policy should be set either in userspace or via dts.

First option would be to have an ioctl but we need to also mirror this
in the sysfs interface. Second option would be to have a property in
the dts.

What do you think?

We are trying to fix this in the firmware side:

https://github.com/zephyrproject-rtos/zephyr/pull/61709

but we are getting some setbacks there too.


Daniel.

On Wed, Jul 26, 2023 at 11:26=E2=80=AFAM Daniel Baluta <daniel.baluta@gmail=
.com> wrote:
>
> Hello all,
>
> I want to start this thread in order to clarify what assumptions a
> remoteproc driver is able to make
> about a firmware loaded on a remote processor.
>
> Discussion is generated by this thread:
>
> [1] https://www.spinics.net/lists/kernel/msg4857733.html
>
> imx_dsp_rproc driver assumes that the remote firmware will send a
> notification once it has booted up and this is the default behavior.
>
> This doesn't work well with Zephyr samples which do not send such notific=
ation!
>
> I want to get an agreement for the following questions:
>
> 1) What should be the default behavior of a remote proc driver?
>
> In my opinion it should not make any assumption about the remote part.
> Thus by default the driver should not wait for any message!
>
> 2) How can we support various "protocols" of starting up. Eg (wait for
> firmware / no wait for firmware).
>
> In patch [1] Iulia proposed to add a flag that will select the correct
> behavior. As per Mathieu's comments this doesn't
> scale up, for next flags.
>
> How can we solve this? In my opinion using a kernel module parameter
> OR a device tree property should be enough.
>
> What do you think?
>
> thanks,
> Daniel.
