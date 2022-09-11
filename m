Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 557A0C6FA86
	for <linux-remoteproc@archiver.kernel.org>; Sun, 11 Sep 2022 22:52:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229842AbiIKWw4 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sun, 11 Sep 2022 18:52:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229813AbiIKWwx (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 11 Sep 2022 18:52:53 -0400
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 196501FCC7
        for <linux-remoteproc@vger.kernel.org>; Sun, 11 Sep 2022 15:52:49 -0700 (PDT)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-1225219ee46so19033765fac.2
        for <linux-remoteproc@vger.kernel.org>; Sun, 11 Sep 2022 15:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date;
        bh=H7oMNplR0/sapgbTQ40U0Cn3+sk6O4LcF9QVNpOL2o8=;
        b=QeonR+svMWSQNpzNmzKsc4BKnv5NEK69QL/+ZID84pLU91reE1En30h4IcNE7NpNzD
         ZwnWebzEeccMNnRucE3LOSEm8GvTrBnXQWWoQuAApjGcQOp7riElOaeqMyORYWjCqtRo
         md8OZEHpOflu9aN470LAA58rYHXmT4Bzc8S7Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=H7oMNplR0/sapgbTQ40U0Cn3+sk6O4LcF9QVNpOL2o8=;
        b=llzQsNUSYRqSTW0j5hzAIZRlAcDtFCYOAi07TdFUQ8rSpZCh3g8mEddxLcPOV6CHRa
         RUdVxpqocPV7aXL17KgjZhjHQ/R2Hj7rpfdsuUnGZu2m60rqG9fn9hBmY2sHnLPQ/Syk
         P2q595uuzf+wJPxecrvqOghGsmqrcOn/oxr2S0S81psVcNxqicoYJt/u3Gn6yQ7RNlsu
         sdBKy53UIoBH4/J9mmyM6rozN4SUlwoUQlgjHuYNpFtG4iSrOsdxKwhn5iBmYAcVCAQ8
         +A8noZqWuaANOPlhRtFq/g5qN+qxdWviwr0XojxZVMzKlyhDaVoKIi1bBW7vQOZKHzB8
         q2YQ==
X-Gm-Message-State: ACgBeo09oUNmoEMlwPiP20C0viE+j5exajEj1rhMW6CT0yn1mZS55c/Y
        W2+idSDGh+A46NTF+EHBiYW2GhkONFgWs6bswsRqrw==
X-Google-Smtp-Source: AA6agR4ToSrTBZ3frIF1GrTKC3IhDO8U09cptKWPrbauOJKudE0gO0PvOR+To/mABijoLr6lZVAq4CM+NitMKsxvQUc=
X-Received: by 2002:a05:6870:e748:b0:127:dcb9:c59a with SMTP id
 t8-20020a056870e74800b00127dcb9c59amr9963928oak.0.1662936768620; Sun, 11 Sep
 2022 15:52:48 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 11 Sep 2022 17:52:48 -0500
MIME-Version: 1.0
In-Reply-To: <1662643422-14909-2-git-send-email-quic_srivasam@quicinc.com>
References: <1662643422-14909-1-git-send-email-quic_srivasam@quicinc.com> <1662643422-14909-2-git-send-email-quic_srivasam@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Sun, 11 Sep 2022 17:52:48 -0500
Message-ID: <CAE-0n504d-RnwNHBxZsDqEpwotnCUXOiGwuz+C9Gjj01Vz9b6A@mail.gmail.com>
Subject: Re: [PATCH v6 1/8] dt-bindings: remoteproc: qcom: Add SC7280 ADSP support
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

Quoting Srinivasa Rao Mandadapu (2022-09-08 06:23:35)
> Add ADSP PIL loading support for SC7280 SoCs.
>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
