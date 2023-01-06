Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50027C3DA7A
	for <linux-remoteproc@archiver.kernel.org>; Fri,  6 Jan 2023 18:14:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbjAFSOd (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 6 Jan 2023 13:14:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229698AbjAFSOb (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 6 Jan 2023 13:14:31 -0500
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC14C78A4F
        for <linux-remoteproc@vger.kernel.org>; Fri,  6 Jan 2023 10:14:28 -0800 (PST)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-4c1073f545bso33179427b3.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 06 Jan 2023 10:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xP3geULSyX4lV8d6R9rMjnULV5w7kHHpTYX3xrPNxuU=;
        b=UsNe0gNyAmOwYoDLj/i8PWxRee4X8jVDyisS53x003xJU8GpJ9FGr7LBLz9Q7mCcuZ
         FP3rrd6blhEJhWHOaKCHN4riLuLTcrxVNIBsFEt8yoKjUhMM61KI6jRYNZZUZcDLsxHd
         YhexIyBurtEAKJ0MtEO5v0WzSugvXSGoaDyejb3le0GET1TY5oD0cvBHWRuCZif2br2K
         LxVd565xq0N7YcPuCC2Nzv/5fcsQAbUXVBZNE8abWQjr6DdDbpvbkkCdgDnZyVM4X0DL
         bB5JTEjH/tCsNe8cTCWMiF9KG+7nl6HOBNhqYHa6z9w/U5HsrMW9a7y9LumOrzpeuivT
         IgSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xP3geULSyX4lV8d6R9rMjnULV5w7kHHpTYX3xrPNxuU=;
        b=Rd4uskZ7db0jbK2eNfRfp5/5RyiO2cPm/aqdKp727QclpJeDEFmB6xJAtkz5bOT9hC
         rGc61CNy8+plENroefl9btHfjiotIqJIyDIJa2waWvbJELXWcCQYqKIu+a0svNojvVtI
         lIRcEXMjhsidB3NF6skp4PZ0AHGHLYX9sKNRqSMrOO6aM590iaQAE5yl6F0EtC/0vd9n
         1mQQoke4WXYHoPt+ubXYCe4v/5qaTxaD+LwN81JCO8ajQpnhuUe+DfDYNWksRAJObYB0
         +j8aBbXOBTjk4Ryep9PR5Ccxi5c2neGCnSnFWLx3g9J1nm1TZmD1WXDJcBK16yiwXnhL
         ERXg==
X-Gm-Message-State: AFqh2kpzbdT5L+gXl2eEF82KlYLmwXA5cMl4HeKbQLUDGU9CW6pNQlcr
        nGTTICoF1ppW491BiUzBy9SIhkhQeQIDp2dsSHOgIg==
X-Google-Smtp-Source: AMrXdXslvebv24QddXX/TLgWhNaCTYaNYEw3yuKcUZCybMMAI19TPi0KCw62PgInbStQYarDYBZo8VgZN7ECFstTgWU=
X-Received: by 2002:a81:6702:0:b0:477:b56e:e1d6 with SMTP id
 b2-20020a816702000000b00477b56ee1d6mr5205418ywc.188.1673028867810; Fri, 06
 Jan 2023 10:14:27 -0800 (PST)
MIME-Version: 1.0
References: <e0ced334-e6c1-caeb-322a-f67a23ee58da@linaro.org>
In-Reply-To: <e0ced334-e6c1-caeb-322a-f67a23ee58da@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 6 Jan 2023 20:14:16 +0200
Message-ID: <CAA8EJpr0A=VjWEv6NPaZ-t_3TgNaWpsVO8_inJhxqoThry_zZA@mail.gmail.com>
Subject: Re: Annoying message on the console for the db845c board
To:     Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        "agross@kernel.org" <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        linux-remoteproc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, 6 Jan 2023 at 18:37, Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
>
>
> Hi all,
>
> Does anyone have an idea on how to fix these timeout messages ? They are
> displayed again and again every 5 seconds and that saturates the
> filesystem after awhile.

Could you please check that you have CONFIG_QCOM_RMTFS_MEM enabled and
the rmtfs daemon running?
I think that's the usual cause of such messages.

>
> ...
> [   24.662181] qcom-q6v5-mss 4080000.remoteproc: start timed out
> [   24.768150] qcom-q6v5-mss 4080000.remoteproc: port failed halt
> [   24.777618] remoteproc remoteproc0: can't start rproc
> 4080000.remoteproc: -110
> [   24.785022] remoteproc remoteproc0: Boot failed: -110
> [   24.833657] remoteproc remoteproc0: powering up 4080000.remoteproc
> [   24.840126] remoteproc remoteproc0: Booting fw image
> qcom/sdm845/mba.mbn, size 238304
> [   24.897361] qcom-q6v5-mss 4080000.remoteproc: MBA booted without
> debug policy, loading mpss
> [   31.573938] qcom-q6v5-mss 4080000.remoteproc: start timed out
> [   31.680229] qcom-q6v5-mss 4080000.remoteproc: port failed halt
> [   31.689683] remoteproc remoteproc0: can't start rproc
> 4080000.remoteproc: -110
> [   31.697070] remoteproc remoteproc0: Boot failed: -110
> [   31.765283] remoteproc remoteproc0: powering up 4080000.remoteproc
> [   31.771758] remoteproc remoteproc0: Booting fw image
> qcom/sdm845/mba.mbn, size 238304
> [   31.820553] qcom-q6v5-mss 4080000.remoteproc: MBA booted without
> debug policy, loading mpss
> ....


-- 
With best wishes
Dmitry
