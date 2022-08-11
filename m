Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9A35C25B07
	for <linux-remoteproc@archiver.kernel.org>; Thu, 11 Aug 2022 00:17:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233418AbiHKARf (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 10 Aug 2022 20:17:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233393AbiHKARe (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 10 Aug 2022 20:17:34 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35A108FD45
        for <linux-remoteproc@vger.kernel.org>; Wed, 10 Aug 2022 17:17:33 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id w197so6618890oie.5
        for <linux-remoteproc@vger.kernel.org>; Wed, 10 Aug 2022 17:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:from:to:cc;
        bh=EX3bVclIGOJBNN3kaIwMF8d9L76zR4WsXSoGU82tx4Q=;
        b=Qych/knHnNXGKR2RfvhnaH6NJcqX1D8kLFdg98P+Pc+BJgn3Xs1kGY1kcHUJVQZFNI
         ZQAaDnuSiZ+XNCRlpKRyNyJdG+q8qNVbspcFcidSTOC5vplZgYy4hmdJlkSEd9TR5BaO
         L+DNQhBv34hgmFEbEp/m0Z2+Dz8NSNwiWv8yU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc;
        bh=EX3bVclIGOJBNN3kaIwMF8d9L76zR4WsXSoGU82tx4Q=;
        b=oF8R95rJP+QQOR1fJtrPEag++qe0SExH9Aa86NxdWgihAhAfnHEgaOxq2byy44V0BN
         bOnY/OYVqwHmvejQ8mAWk1S7xv9GVfAqDHyKEk7/iN7MtIT2vw5nvfnmVyMGQbfRtV45
         ogD31YvvRSk0kcI5jZr9C6c53Tauh7lX/an4bJKbWFwqzasyUjcYy3cELjqXo6TZMoQx
         dReBEIFcmQ47Ef6SnoMAvnpCDaaObDDPXAV/5kBSFfTAyCdCB33e9bisDiEL/nWHDk5+
         zZ+QxTI7VqLjw7MLs644RyBlnxhYb4iBSfaTJ5wrDCIJmIymqeqjXHp3smsdez4kUEB9
         dsBQ==
X-Gm-Message-State: ACgBeo36B3lVBgdcaG+1koVLRUul+pvWfkYtRVYiTR0odLhphxKLbxfI
        q7TZCGkX3xS/blZr+ubm1pHZo61faQStIWuJLlCMiw==
X-Google-Smtp-Source: AA6agR7x6T+qgCbnVB685QHwpNlUcxE7GoxSGKeORrKeDT+eh0cnqawvcvvFAUbMZk3Wf2PjS4DnA58135CCQxKtjXw=
X-Received: by 2002:a05:6808:1389:b0:33a:bd16:c4e4 with SMTP id
 c9-20020a056808138900b0033abd16c4e4mr2323919oiw.0.1660177052568; Wed, 10 Aug
 2022 17:17:32 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 10 Aug 2022 19:17:32 -0500
MIME-Version: 1.0
In-Reply-To: <1660117558-21829-4-git-send-email-quic_srivasam@quicinc.com>
References: <1660117558-21829-1-git-send-email-quic_srivasam@quicinc.com> <1660117558-21829-4-git-send-email-quic_srivasam@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 10 Aug 2022 19:17:32 -0500
Message-ID: <CAE-0n51a1fUx-JnfgWeyx7JRMW0mWC0QquaA2ex=WhuR1H7esA@mail.gmail.com>
Subject: Re: [PATCH v3 3/8] remoteproc: qcom: Add flag in adsp private data structure
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

Quoting Srinivasa Rao Mandadapu (2022-08-10 00:45:53)
> Add flag in qcom_adsp private data structure and initialize
> it to distinguish ADSP and WPSS modules.
>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> ---
> Changes since V2:
>         -- Add is_adsp_sb_needed flag instead of is_wpss.
>
>  drivers/remoteproc/qcom_q6v5_adsp.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
> index 2f3b9f5..d18ec74 100644
> --- a/drivers/remoteproc/qcom_q6v5_adsp.c
> +++ b/drivers/remoteproc/qcom_q6v5_adsp.c
> @@ -62,6 +62,7 @@ struct adsp_pil_data {
>         const char *sysmon_name;
>         int ssctl_id;
>         bool is_wpss;
> +       bool is_adsp_sb_needed;

What does 'sb' mean? Self boot? Can you just write it out? And maybe
drop 'is_' prefix because if (is_*) and if (something_needed) reads the
same.
