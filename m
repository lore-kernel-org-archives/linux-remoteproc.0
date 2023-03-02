Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F532C678D4
	for <linux-remoteproc@archiver.kernel.org>; Thu,  2 Mar 2023 22:06:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229873AbjCBWGq (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 2 Mar 2023 17:06:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229849AbjCBWGp (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 2 Mar 2023 17:06:45 -0500
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9EF810FE
        for <linux-remoteproc@vger.kernel.org>; Thu,  2 Mar 2023 14:06:44 -0800 (PST)
Received: by mail-io1-xd34.google.com with SMTP id b5so268569iow.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 02 Mar 2023 14:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677794804;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4hKjpuFR3iRCin5nJ/ge/tzKffSShcSbKBCteHpDjHE=;
        b=GSCeTBnMjs9tFbJX0yGU+tkNmVzaplxgAMtHWPe5SvzBNTTr7DsJTz/dOGE5ui8z6B
         QVcknIh0zPyFxVtrvmclYewhA/yL9UIrsMDwT8NnEqg5HNAfz4t00il+6dgPTzseQlTi
         Hnezqhrtd0D8IHt45NUGWDwF0+OBY8tu002C8p2F3hkDgC3GZQJln9T2Kq9MkV3ruWYD
         YIDXk+X6ZB1mNicEvCCjAJuVoony3N3hat51vf6o0VWwlFxY+Fyd5GQdp1KexbRkaBqW
         02jlisy0xIsDFr6zWMGicbiwqGsp4WSr+GPoh0CruFUopm/2W4oQXz8gTMz5vH9KsY07
         znyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677794804;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4hKjpuFR3iRCin5nJ/ge/tzKffSShcSbKBCteHpDjHE=;
        b=GaUZajfcMBloUroct3QaOXGy8xs0CZtBoxTTjaNxOW7Lt3lCIZIjpD49VJS5H/DtOX
         gktIZbjAXHtqI9dhcpbh9/qxTqP6vDHNteGOcwchFOZIeDOVIU5lyjLQdG+XxvlaKY8W
         T/fe5aVfXVFMP/G7IOClEQCWPuDgjyTkp9O9ydcmwFcLc2hh2LE5mYjbz6MSGyQXKRkA
         6KWKfCEbN6qWUFEs7IsSLZA8k63s0oRY3ENIXgrMjKJ99c45nMkH0J1kHRcQej3QYk8E
         gYYViRH/uWsy1inSxLQvlcziLo4974BeZBnbXu0dQ1CQ9B3QVmd7kzQx44T6bdnm1XO4
         jiHQ==
X-Gm-Message-State: AO0yUKX1mzbkQMOmzuFFlPN7gbnzGDECiHl4Nzf5JB0vmQACL1IzEn2D
        0GN+OEHFs4iHJ6kTt9ZA4klMnY1IH0qRsnHT
X-Google-Smtp-Source: AK7set+mTm4NPHyROYJg48O0RxzUHoTIPQZgUVA9bEcd/SQWBLPAHOa77XgKIhyauj8Zm3UJDl6w5g==
X-Received: by 2002:a17:902:e542:b0:19c:b7a9:d4a4 with SMTP id n2-20020a170902e54200b0019cb7a9d4a4mr14082873plf.37.1677794258858;
        Thu, 02 Mar 2023 13:57:38 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:f233:886c:8482:e0ce])
        by smtp.gmail.com with ESMTPSA id kn13-20020a170903078d00b00189e7cb8b89sm151118plb.127.2023.03.02.13.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 13:57:38 -0800 (PST)
Date:   Thu, 2 Mar 2023 14:57:35 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Cc:     linux-remoteproc@vger.kernel.org, agross@kernel.org,
        andersson@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        robh+dt@kernel.org, quic_plai@quicinc.com, bgoswami@quicinc.com,
        perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org,
        quic_rohkumar@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        judyhsiao@chromium.org, devicetree@vger.kernel.org,
        krzysztof.kozlowski@linaro.org, corbet@lwn.net,
        quic_visr@quicinc.com
Subject: Re: [PATCH v5 0/2] Update section header name check
Message-ID: <20230302215735.GA1401708@p14s>
References: <20230223150559.2429562-1-quic_mohs@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230223150559.2429562-1-quic_mohs@quicinc.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Feb 23, 2023 at 08:35:57PM +0530, Mohammad Rafi Shaik wrote:
> Update section header name check and corresponding documentation.
> Changes since v4:
>     -- Rephrase commit message.

Asked for clarifications on V4 that were never given to me.  This patchset will
not move forward until those have been resolved.

> Changes since v3:
>     -- Rephrase commit message.
> Changes since v2:
>     -- Update the commit message with example.
>     -- Update the documentation text appropriately.
> Changes since v1:
>     -- Update the commit message.
>     -- Use strstarts instead of strstr.
>     -- Update documentation file.
> 
> Srinivasa Rao Mandadapu (2):
>   remoteproc: elf_loader: Update resource table name check
>   docs: remoteproc: Update section header name requirement
> 
>  Documentation/staging/remoteproc.rst       | 5 ++++-
>  drivers/remoteproc/remoteproc_elf_loader.c | 2 +-
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> -- 
> 2.25.1
> 
