Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0A5AC63797
	for <linux-remoteproc@archiver.kernel.org>; Tue, 17 Jan 2023 09:30:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236592AbjAQJaj (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 17 Jan 2023 04:30:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236598AbjAQJaS (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 17 Jan 2023 04:30:18 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC2D02F79B;
        Tue, 17 Jan 2023 01:28:54 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id tz11so9504776ejc.0;
        Tue, 17 Jan 2023 01:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jn2DB03+zQz9YkRWZcTUuqN6EwsjvQ9H80/PTg1Q3xc=;
        b=mt43Ik9DaqYec+BGI5vs1pyXnQg1sn6Pa6JrQt5XGWgbzaY0xaTaPqi43HjuYXUFbm
         wPvl/+ibsbxMl91qcC0hfXrZbgtCFQMo/sekdOJmELK7xalN6dAIU1KbP7MXjnzcD6p/
         f0OANhmUWZdPwGgQD/51SsfOT3/kZr0JFPfROlAxXUvwBf/Pg3CGcKalJRUtls4Tuw7p
         /Up6enmv9yjrgDWk7mKr4IHBxHQO5zxyKprVPwFFbi8W8c9sOwVJYdJgKVjdYPlAMVm+
         DYHPMklo3CJCV0KeQMnWfEdjFErTgBr6Zq01pk9l9d0W2N9GFLKwDCqGhZlARP5VfohM
         Aolg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jn2DB03+zQz9YkRWZcTUuqN6EwsjvQ9H80/PTg1Q3xc=;
        b=tiBNub6pPQx9g/K12azvKFji8ZABDPVUq45UI4RvIaTdrEVDGvvkOgwv1lP1m+N2uM
         4w36GO+EbzasJmoQQltSsZEya1ElMu1aDq6FE1suEosf12CfsiR1xtvGewBuLbkbbFcT
         sAacKlXmKlDo+HvUtPN5IY56J4e5dJUfoQyrUdr5yGurk5K+HuuFJZaOby5nx//5Cro1
         77gduYrFfgZUrE82iPH5ueSK0UmFw4td/T8tgO3A2rJz/yjsIQQQYsGSAB+nawOFBQWy
         XKZp92F2sad71kNB1ViqZ55GLQwrEFErPU0uxWjw4LuWniNUbSV63G5EBQtQwQHzTOoF
         G+PQ==
X-Gm-Message-State: AFqh2krbGpU5LBR+OBkhVxllqwBGL6Xaj5GDF4UBwt/8ZJ5iSwYo10pV
        TLU813+pXmNEW0MVCES/j2X6B3pElQ+DhT0Y/vE=
X-Google-Smtp-Source: AMrXdXuA93WO+IMVhM0pq3YPloZN4oMOrSL1EXDmhihlX79PLc7Vpo7cau2bsGQMrarARaqibi8O0Z1TFFtMD4jWYho=
X-Received: by 2002:a17:906:86cc:b0:872:1ad9:460b with SMTP id
 j12-20020a17090686cc00b008721ad9460bmr143128ejy.152.1673947733463; Tue, 17
 Jan 2023 01:28:53 -0800 (PST)
MIME-Version: 1.0
References: <20230116225343.26336-1-iuliana.prodan@oss.nxp.com>
In-Reply-To: <20230116225343.26336-1-iuliana.prodan@oss.nxp.com>
From:   Daniel Baluta <daniel.baluta@gmail.com>
Date:   Tue, 17 Jan 2023 11:28:41 +0200
Message-ID: <CAEnQRZDXPtE096aPHRcggdzeha5MeUaWsXqncYE33cdYBByV6Q@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: imx_dsp_rproc: add module parameter to ignore
 ready flag from remote processor
To:     "Iuliana Prodan (OSS)" <iuliana.prodan@oss.nxp.com>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        "S.J. Wang" <shengjiu.wang@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        SOF-Team <sof-team@msteams.nxp.com>,
        Mpuaudiosw <Mpuaudiosw@nxp.com>,
        Iuliana Prodan <iuliana.prodan@nxp.com>,
        linux-imx <linux-imx@nxp.com>, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Jan 17, 2023 at 1:21 AM Iuliana Prodan (OSS)
<iuliana.prodan@oss.nxp.com> wrote:
>
> From: Iuliana Prodan <iuliana.prodan@nxp.com>
>
> There are cases when we want to test a simple "hello world"
> application on the DSP and we don't have IPC between the cores.
> Therefore, skip the wait for remote processor to start.
>
> Added "ignoreready" flag while inserting the module to ignore
> remote processor reply after start.
> By default, this is off - do not ignore reply from rproc.

I think that ignore_dsp_ready would be a clearer name flag.
