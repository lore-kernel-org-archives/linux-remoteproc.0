Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB635ECAAD3
	for <linux-remoteproc@archiver.kernel.org>; Sun, 11 Sep 2022 22:53:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229764AbiIKWxz (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sun, 11 Sep 2022 18:53:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbiIKWxy (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 11 Sep 2022 18:53:54 -0400
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4940E205F4
        for <linux-remoteproc@vger.kernel.org>; Sun, 11 Sep 2022 15:53:53 -0700 (PDT)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-127f5411b9cso19012313fac.4
        for <linux-remoteproc@vger.kernel.org>; Sun, 11 Sep 2022 15:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date;
        bh=R0Xe62CKqg1FjucP7NunxjUjOTqqu84A+guaTpi+kNo=;
        b=FTd2AeTvIBSI1/fx7Ds0M+6SFsq4MZyXzV5o39QxPabwSFCeGLUkTTGfYkAsz9NBKT
         79xQYhfFhoxww/uFE7H/V7zpZbQQzLocezZu43dt4Dz9VU4E0/+30oFIXIz7+ja8cw1Q
         PVYCgERF2VAGgBYgtRN5VBOjxtiqQZOVh1fA8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=R0Xe62CKqg1FjucP7NunxjUjOTqqu84A+guaTpi+kNo=;
        b=Xynj6EZu2Bot376q5dnrvNdC/oYFlvnOmhUR9z0QpSFtJvL6IAvT2MS8r1KYie6VKp
         ZbMQCQMfQKmemCrsPw7Zlr128gImRpzG26pRg9bAW13HqhswHFmcYk+KVl8jhyDer9qt
         xOsPjCPw83zAFxSBFuxN88zpM4Z69EkTTCPb4k9hi5nHnxpkw8p6ToTTKjd8FNVrukqg
         Q4y1QCzZGcj//fm+16MzmkaqDpStGeomx4c8iLorEn7SbcYoH+XIbwx60dT+X4h9eS+u
         ZR7yt9WoLWfIPrZSJWHFPfl3hj8FBk7Z4ub6HO8MjOuTKeUQZY4pe8Omh6OeGksNofSn
         4J5Q==
X-Gm-Message-State: ACgBeo0Bd3nYT3NCBeKEvNBJb1epijoX/SViFoW1L+9/7yz1Ke3yfiM6
        hvYGgu6oPJyDnK+gjzXh7K6LzY28aNwjmkv1m9Oaqg==
X-Google-Smtp-Source: AA6agR7p7DOQVvWBuWdS4FNFDI/yWu78jAI8Lol3RU4hpSvR1XPiDf+9BNXPpiLd43jKteUzzh7vh3kywdcpj1xfsZo=
X-Received: by 2002:a05:6871:6a1:b0:127:3a21:7e00 with SMTP id
 l33-20020a05687106a100b001273a217e00mr10575784oao.44.1662936832620; Sun, 11
 Sep 2022 15:53:52 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 11 Sep 2022 17:53:52 -0500
MIME-Version: 1.0
In-Reply-To: <1662643422-14909-4-git-send-email-quic_srivasam@quicinc.com>
References: <1662643422-14909-1-git-send-email-quic_srivasam@quicinc.com> <1662643422-14909-4-git-send-email-quic_srivasam@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Sun, 11 Sep 2022 17:53:52 -0500
Message-ID: <CAE-0n53_i89jvcUwFUDgnfx28sFt8+7r3_jWBWYvDf6MMhAnvQ@mail.gmail.com>
Subject: Re: [PATCH v6 3/8] remoteproc: qcom: Add compatible name for SC7280 ADSP
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        agross@kernel.org, bgoswami@quicinc.com,
        bjorn.andersson@linaro.org, broonie@kernel.org,
        devicetree@vger.kernel.org, judyhsiao@chromium.org,
        lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        perex@perex.cz, quic_plai@quicinc.com, quic_rohkumar@quicinc.com,
        robh+dt@kernel.org, srinivas.kandagatla@linaro.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2022-09-08 06:23:37)
> Update adsp pil data and compatible name for loading ADSP
> binary on SC7280 based platforms.
>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
