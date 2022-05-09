Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7AFAC433F5
	for <linux-remoteproc@archiver.kernel.org>; Mon,  9 May 2022 02:29:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229607AbiEICdH (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sun, 8 May 2022 22:33:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230522AbiEICb1 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 8 May 2022 22:31:27 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F6FF6832B
        for <linux-remoteproc@vger.kernel.org>; Sun,  8 May 2022 19:27:31 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id d25so11050864pfo.10
        for <linux-remoteproc@vger.kernel.org>; Sun, 08 May 2022 19:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=U3aNAbM8I+ZWALbCpblJglIHrWEFwVsku0LCm8q0TXw=;
        b=bWQ6elsRmVRougkRhVC48ZxYQz39s7b2EvoauAbMVhIhwRGiKUV9e78zuwsOlNivXM
         UqhfwasYgjW8ucV/oLyEA/o5giweA/xzQWl6YgOdR17YmQdIt8NOaaUhV0B1Fb2gPnnT
         uA7tFVfPKUdekS1Qz0/cDdwR4VE3qURe8IRd9WqlBsluLrOqnVvWP6VLTEco7FaPPLxP
         4txIuIE5BAXgoa18yOQkp77CqEi0/sOn5SzUSL6trzR5kEXtuNy4oZORjwJdzzCRfxB9
         ezCaZWPPi12+AhJxA2aam989TrZhmSwSgV3gMdG+tR9QRe1QUiUFZ5SuCgk9bhtZDH+1
         3N2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=U3aNAbM8I+ZWALbCpblJglIHrWEFwVsku0LCm8q0TXw=;
        b=w88xnLex6PackpZD2wIRrz3mhnIC6RFmjEeIYL7KcK73pw4RyG48CjX0lxpsWkbzS3
         JRSzqinvFLPZiW3xAxJ0OB8CINeSAWpvtqXwzsMpTuzJvzxwCNnd3WydglEt4JeyxW9j
         3qtDjJRyJkyxWgZGK3CyyOVdN/n9CNqSg9yYnfBEIUzDrut2j2pgWXI3v11pkfoGBIAM
         ImwoHWac5sRJvyqJio6FlhNjdpnWp23pU0PIoonsYBkDzC8BGzCWDSawR2w32LLVpyu9
         5lbLGE8Yzd6Th+qSfKZBNZfZZqyBc1yhDpB2MMvJuVik+43Pa8cb0aiP5HXrkihfgTYf
         uL9A==
X-Gm-Message-State: AOAM531DHRQBO9lxiuYF9rL+1qB1oOCiHUAjkYeaadfznBBobbICocS/
        J/WhEvWxvdmp3MESztsdCjXDZ4ntDggMyt8IiE+A4Q==
X-Google-Smtp-Source: ABdhPJxIvov+FYbYyJNoqxr/0XSGjEr4PbUkRCXh7qR7Q8mXkveolWuhN5u5sSFYomW0y+WRyG2Emg3YUroTFudGCdE=
X-Received: by 2002:a63:e416:0:b0:3c6:8d10:ea37 with SMTP id
 a22-20020a63e416000000b003c68d10ea37mr5778242pgi.319.1652063249915; Sun, 08
 May 2022 19:27:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220506213226.257859-1-nfraprado@collabora.com> <20220506213226.257859-2-nfraprado@collabora.com>
In-Reply-To: <20220506213226.257859-2-nfraprado@collabora.com>
From:   Tzung-Bi Shih <tzungbi@google.com>
Date:   Mon, 9 May 2022 10:27:18 +0800
Message-ID: <CA+Px+wXQjys8xvTSSJkLXoGp4yQnANbKWBtfuxiYi0UX6DH0jw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: remoteproc: mediatek: Make l1tcm reg
 exclusive to mt819x
To:     =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= 
        <nfraprado@collabora.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, kernel@collabora.com,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Tinghan Shen <tinghan.shen@mediatek.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Sat, May 7, 2022 at 5:32 AM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - mediatek,mt8192-scp
> +            - mediatek,mt8195-scp
> +    then:
> +      properties:
> +        reg:
> +          minItems: 3
> +          maxItems: 3
> +        reg-names:
> +          items:
> +            - const: sram
> +            - const: cfg
> +            - const: l1tcm

"l1tcm" should be optional.  Does it make more sense by using "minItems: 2"=
?
