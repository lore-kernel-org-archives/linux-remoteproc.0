Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8570CC3F6B0
	for <linux-remoteproc@archiver.kernel.org>; Tue, 23 Aug 2022 03:09:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239982AbiHWDJG (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 22 Aug 2022 23:09:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239845AbiHWDIZ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 22 Aug 2022 23:08:25 -0400
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com [IPv6:2001:4860:4864:20::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE9312BFB
        for <linux-remoteproc@vger.kernel.org>; Mon, 22 Aug 2022 20:06:27 -0700 (PDT)
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-11c896b879bso15294231fac.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 22 Aug 2022 20:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:from:to:cc;
        bh=ntnuN1Cbf4zs1wTSTN7LzLd8igQL/4ijLCx6okIoVxk=;
        b=Lh9cBLkVXyylxnaHrcvdYQsWQairdmSDoTPgCznyRmSjDMDiILp++/TGvKExXeo6O1
         85c08Zk9eT8u1vBA1/vCqt20YoTrWBS1gi1I+Zjb0EriSCQzU61mIi/SCMOiKJ0wzppI
         SCu9NGHHlhnXWqF2T/5TztWPz+ls/9dpdeHNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc;
        bh=ntnuN1Cbf4zs1wTSTN7LzLd8igQL/4ijLCx6okIoVxk=;
        b=SxcUybxTcE0Ddi0D4s26Dgp4efOQWgKJsog8KHqQK6X7C0l1vOuN8Qz/jABC52W7mg
         Ptx46E44ZuZHtC+Fp095Ga+XcXVXuxMhgM4n5VTMHcrx+iSmMb5ZQ10OGshc8HmpOpJn
         ddWVyYkeXFWIW2JZsG7vIvybcCUWPG/YmT9lDjxcaqQPjkrByOrWg6P5bN1r4WSamIPy
         8ZP9UiKafzAmeGFo3/foy8z7my2iutm5GAqjKbh6JiHtl9l8no3JklXBQMfa9esOjXVD
         DQ6KQaGjzqeQI/NaJrJDg0Q62HNb5PKHXql7k/hTfUYZ26wiJ2dkFvPFQDJWya9wSkm0
         H/IQ==
X-Gm-Message-State: ACgBeo1ZXG612CtALqOVC1qrUHfX5p9auhNFVtVMCt81r5lL+xDBKGLv
        TuwCr8Qf5MJdbArilCLIEJ8MiMNXCPSukvbyS/X2Rw==
X-Google-Smtp-Source: AA6agR5fL+F4upoZF82AsrgsRSYaDfJ86q9IfWZPbsEXsxBIolOFrRiht9F3qacrKx0bRyZhfJUdcElQgFukBVJ6feo=
X-Received: by 2002:a05:6870:e408:b0:11c:37ad:773a with SMTP id
 n8-20020a056870e40800b0011c37ad773amr564465oag.44.1661223987166; Mon, 22 Aug
 2022 20:06:27 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Aug 2022 22:06:26 -0500
MIME-Version: 1.0
In-Reply-To: <1661156523-22611-5-git-send-email-quic_srivasam@quicinc.com>
References: <1661156523-22611-1-git-send-email-quic_srivasam@quicinc.com> <1661156523-22611-5-git-send-email-quic_srivasam@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 22 Aug 2022 22:06:26 -0500
Message-ID: <CAE-0n52thpGPOZHtSx=P_ki1HApEKhK+2aerOKk5opY=Q9MSxw@mail.gmail.com>
Subject: Re: [RESEND v5 4/7] remoteproc: qcom: Replace hard coded values with macros
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

Quoting Srinivasa Rao Mandadapu (2022-08-22 01:22:00)
> Replace hard coded values of QDSP6 boot control reg params
> with appropriate macro names.
>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
