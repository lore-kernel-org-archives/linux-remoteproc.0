Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69044C32789
	for <linux-remoteproc@archiver.kernel.org>; Tue, 23 Aug 2022 03:07:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239823AbiHWDHJ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 22 Aug 2022 23:07:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239837AbiHWDGg (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 22 Aug 2022 23:06:36 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30C515D0FF
        for <linux-remoteproc@vger.kernel.org>; Mon, 22 Aug 2022 20:04:50 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id w197so14587621oie.5
        for <linux-remoteproc@vger.kernel.org>; Mon, 22 Aug 2022 20:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:from:to:cc;
        bh=doCnz3mK/KgHhiqTgOfwVqyPj1Tu8ONlGH5tzYPy3Ow=;
        b=Qbcl9tEgnwRwsCN1KmXwy/9BeOu11x2a2YxwpY0ZctnNDMjynXiH55grW9tw+fhgy7
         OXQumDj82CLJ89V5sj2rrBhdFNMk6B/7OoegkZeM3rQypjDwIoWFvtbu3zvOYRaf1ce2
         rIA5ZkSe0JPoxfRKK1HCoKYd9C022O7jdDou0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc;
        bh=doCnz3mK/KgHhiqTgOfwVqyPj1Tu8ONlGH5tzYPy3Ow=;
        b=dulIGldEhZ5cKyZqBkNE0s2mIB4Qp6cLC3noKmMPCQ7txKU5hU1tCkJKt/L94VqTNd
         nkC34cBOP/ZD49k6k7PYWcY87IT1JAAJUQEKDzJewgtQXw9WjClNwze2MPxTu1Tz0qw4
         //cXGw25mo/Dm1D4ReE0YuP6dnpK0jI4lRiBAUBZEHUwoZ+MxPUocJmgf2l1GMe/F7ZA
         wOb+SUiA2lDNekOdY4nOXTs04CpQsbI8Sezv7szYsUvhMEApBfdvj0DUZQmkOCLKxcUK
         NeMHAUGgBx6wfuya6Q9Ew+TmD6bdQpV7FNTMWI6yAslzCYvb3kfb08MRAIfUURbRw99p
         WzYQ==
X-Gm-Message-State: ACgBeo0ux919RHf+NZ2mscKOglpiZERJcO4vT55vwR5qKkGdQIKYN5V+
        PaAzy9Cthq83iMqZ+OTnqD8NwqoGDnWVvwumJN9CSA==
X-Google-Smtp-Source: AA6agR490YPWAOawL+dH9dPTDJ7lM+NN/g/KmpiKhw3atii2HBvw1JKAsUUPhafyjqOeYpqxeu0Pkb/jkUeZJ+zsjxo=
X-Received: by 2002:a05:6808:1142:b0:343:86a0:dedc with SMTP id
 u2-20020a056808114200b0034386a0dedcmr522134oiu.44.1661223889399; Mon, 22 Aug
 2022 20:04:49 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Aug 2022 22:04:49 -0500
MIME-Version: 1.0
In-Reply-To: <1661156523-22611-3-git-send-email-quic_srivasam@quicinc.com>
References: <1661156523-22611-1-git-send-email-quic_srivasam@quicinc.com> <1661156523-22611-3-git-send-email-quic_srivasam@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 22 Aug 2022 22:04:48 -0500
Message-ID: <CAE-0n51BLuTVa6yBn+rfpoomFDsvFzO0ovm-rRZGmonDvFAVLg@mail.gmail.com>
Subject: Re: [RESEND v5 2/7] remoteproc: qcom: Add flag in adsp private data structure
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

Quoting Srinivasa Rao Mandadapu (2022-08-22 01:21:58)
> Add flag in qcom_adsp private data structure and initialize
> it to distinguish ADSP and WPSS modules.
>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
