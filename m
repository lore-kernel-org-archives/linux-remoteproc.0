Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6677C04FDE
	for <linux-remoteproc@archiver.kernel.org>; Fri,  9 Dec 2022 20:52:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229678AbiLIUws (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 9 Dec 2022 15:52:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229738AbiLIUwq (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 9 Dec 2022 15:52:46 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D5E0BCBE
        for <linux-remoteproc@vger.kernel.org>; Fri,  9 Dec 2022 12:52:44 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id x28so8831007lfn.6
        for <linux-remoteproc@vger.kernel.org>; Fri, 09 Dec 2022 12:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Jj9hWgWY6DzifYBIvFgTsPapdUtki3fp8cPuRUAv5cU=;
        b=X31HflyuE5ExTUYKMZ1LI6Zs0Si1rbwcCV0qulY4VPQABapKV1wmpSmX/nGbkzAnmw
         TjBWIsDUbIp5E5tcwg8VNeaaOXjFuSy0izUKNbCG0L7ODuVA+52P9IjqO7baKVkHEyva
         bLyvN2Dc5Jh+lO5z/Eib+he9nr+J4Jtu6tr8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jj9hWgWY6DzifYBIvFgTsPapdUtki3fp8cPuRUAv5cU=;
        b=OzjwB8LB+tQNdscTD8BetvmybigKWuSDQROjrb8WeIBWEYxmOxHvFqpjsUEZ/rusG8
         jC4FxPsTijVJ3z0haH82CUIFvSzTybvTEAVmYPDeRU9176szluJaR/VDLoGn4noVqP1N
         L8r1HGTwjqzxRTSO1UAnI+X1/YQOp58J+cw3KjTj/a4qv5hb+OswT/IqUPmHMl5Xb/3w
         6au9HUsgDAKwDhP7IbO+ORvmHHbOXeA0ydB1qxhYwUS33vcB0qnOBXCbRv3aTYAoj5vL
         wX0pEQ1A+/sw+FGV9JM+WuOt1sINVVGWeOLFDXiHdA/to1GGRwGut8PgaDi8XJBiStZY
         7Nlg==
X-Gm-Message-State: ANoB5pnGIeQ/W/8dqCGvgmeMqSmU+ik+CwN/2h1pcglI1vBbfoYYKDqO
        U5jT3iWUaEVoe02SHZH1h5xzXY7cBlsP3TXLQzzwnQ==
X-Google-Smtp-Source: AA0mqf7MC4Uryvkm5Y9sHf/fsm/ghqu2q3sYTfxfmTOOaObG5TKXiLAgEubGJE1ayHAEA+rzNVvKX/hqSBAVlhtWzK8=
X-Received: by 2002:ac2:5e37:0:b0:4a2:4d72:6cc2 with SMTP id
 o23-20020ac25e37000000b004a24d726cc2mr35867808lfg.511.1670619162961; Fri, 09
 Dec 2022 12:52:42 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 9 Dec 2022 15:52:42 -0500
MIME-Version: 1.0
In-Reply-To: <ec403926-24ef-947d-2a1c-6cbf0e31ab89@quicinc.com>
References: <1669897248-23052-1-git-send-email-quic_srivasam@quicinc.com>
 <CAE-0n520=mjdc4H1m8au0iBo2qEeaL8OrF1HCP0bXORe2Wa_7w@mail.gmail.com> <ec403926-24ef-947d-2a1c-6cbf0e31ab89@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 9 Dec 2022 15:52:42 -0500
Message-ID: <CAE-0n50VYGNF_rGzyb_2Jd8dY8cFx3BeOw0s-ywELkRqEEig4g@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: elf_loader: Update resource table name check
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        agross@kernel.org, andersson@kernel.org, bgoswami@quicinc.com,
        broonie@kernel.org, devicetree@vger.kernel.org,
        judyhsiao@chromium.org, krzysztof.kozlowski@linaro.org,
        lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        mathieu.poirier@linaro.org, perex@perex.cz, quic_plai@quicinc.com,
        quic_rohkumar@quicinc.com, robh+dt@kernel.org,
        srinivas.kandagatla@linaro.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2022-12-08 05:40:54)
>
> On 12/7/2022 7:25 AM, Stephen Boyd wrote:
> Thanks for Your Time Stephen!!!
> > Quoting Srinivasa Rao Mandadapu (2022-12-01 04:20:48)
> >> Update resource table name check with sub string search instead of
> >> complete string search.
> >> In general Qualcomm binary contains, section header name
> >> (e.g. .resource_table), amended with extra string to differentiate
> >> with other sections.
> >> So far Android adsp binaries are being authenticated using TZ,
> >> hence this mismatch hasn't created any problem.
> >> In recent developments, ADSP binary is being used in Chrome based
> >> platforms, which doesn't have TZ path, hence resource table is
> >> required for memory sandboxing.
> >>
> > Does this need a Fixes tag?
> I don't think so. I feel It's kind of enhancement.
> >
> >> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> >> ---
> >>   drivers/remoteproc/remoteproc_elf_loader.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
> >> index 5a412d7..0feb120 100644
> >> --- a/drivers/remoteproc/remoteproc_elf_loader.c
> >> +++ b/drivers/remoteproc/remoteproc_elf_loader.c
> >> @@ -272,7 +272,7 @@ find_table(struct device *dev, const struct firmware *fw)
> >>                  u64 offset = elf_shdr_get_sh_offset(class, shdr);
> >>                  u32 name = elf_shdr_get_sh_name(class, shdr);
> >>
> >> -               if (strcmp(name_table + name, ".resource_table"))
> >> +               if (!strstr(name_table + name, ".resource_table"))
> > Was the strcmp not working before because the 'name_table' has something
> > else in it? It really looks like your elf file is malformed.
>
> Actually, DSP binary is prepared by combining different elfs. So Section
> header names are appended with
>
> something else to distinguish same section name of different elfs, by
> using some Qualcomm specific QURT scripts.
> Hence final binary contains resource_table name appended with module
> specific name.
>
> So this patch is required to handle such modified name.
>

Can you clarify how the section header name looks? Probably you can
objdump the section here and provide that information to help us
understand.

I think remoteproc_elf_loader.c assumes the ELF file is properly formed.
There should be a section named '.resource_table', so the strcmp will
find it by looking at the section header names.
