Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB11FEC8758
	for <linux-remoteproc@archiver.kernel.org>; Thu,  7 Sep 2023 20:14:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240803AbjIGUO7 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 7 Sep 2023 16:14:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240680AbjIGUOz (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 7 Sep 2023 16:14:55 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40ABE1BE7
        for <linux-remoteproc@vger.kernel.org>; Thu,  7 Sep 2023 13:14:37 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-500a398cda5so2322851e87.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 07 Sep 2023 13:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694117676; x=1694722476; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C5TA5uE3Uk5A+of280Cw4ik4ScxEAKm82TieyZqTk6I=;
        b=g5M63ZrNHHUdpkbESOvznsRXmApMcNWLGdKYPxcr6KZhdIomeJLULYLWbU0DMFeZ9P
         XkU/kGd8BGBQweMnRG3aBZpBXmKBWgXNa+006/Us4yvdw15AJNY9QkHFmVDmOAZQxs1M
         8u5YF/5zX/2U1j5b+RvtI1NUw0lG5Ozkvr31I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694117676; x=1694722476;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C5TA5uE3Uk5A+of280Cw4ik4ScxEAKm82TieyZqTk6I=;
        b=ApmxUN24HI2SvgWrkqSfwBb1tvUvZCHRTOfmj0CwpAVkaMz740CbA7rXqHFqRcBJdx
         TNhJWl3wY9Pc43tif+rt6xXBFWfRQ2Kur3WsknpoYorQU8jxvSVwUvyDRRMmz03QNwnT
         vC0ta1KLZcrZC6dz2aTUGqsVDY4jQ8MrN6VnTGTaYuViZHY1ypz4t+v5OwTkB8/DeSzH
         TogpUyV6c4xhVQxMIIk2CbGCjjaQZKaMjIMu9ckCGNhXQp2QrAVlCi0nbceihI8zDufy
         Ff74ESsn4u4XUKzHcf83Q6B0SV0ghgZ9RdYGU2JcXxHSttKBQuGPzD6jgsYfXWke+C+B
         UJRw==
X-Gm-Message-State: AOJu0YzenEpoJaywPRpgs4SI5GXEHBkFZKWwCcJVCshl8/uYVsRbYdJ0
        8LoZxIyq/EhzPYlTAgGYdHW6VXxNotXBE/eaPgxHeQ==
X-Google-Smtp-Source: AGHT+IFDlLqLCI8T7zpy/pdPZ6eZpiApuUfi47QxbxEsrcYUVafEqNFM6iApLs5D0S7TkMsAG6R5z7eIJl8qz36MNl4=
X-Received: by 2002:ac2:5b4d:0:b0:4fd:fd97:a77b with SMTP id
 i13-20020ac25b4d000000b004fdfd97a77bmr308004lfp.50.1694117676286; Thu, 07 Sep
 2023 13:14:36 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 Sep 2023 13:14:35 -0700
MIME-Version: 1.0
In-Reply-To: <20230907-sc7180-adsp-rproc-v3-4-6515c3fbe0a3@trvn.ru>
References: <20230907-sc7180-adsp-rproc-v3-0-6515c3fbe0a3@trvn.ru> <20230907-sc7180-adsp-rproc-v3-4-6515c3fbe0a3@trvn.ru>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 7 Sep 2023 13:14:35 -0700
Message-ID: <CAE-0n53=aT9Ri6GwDYaTKKbapc3sk6dZEnTngKuziBD1FH0ypg@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: sc7180: Add ADSP
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Nikita Travkin <nikita@trvn.ru>,
        Rob Herring <robh+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc:     David Wronek <davidwronek@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Quoting 'Nikita Travkin' via cros-qcom-dts-watchers (2023-09-07 03:02:37)
> sc7180 has an ADSP remoteproc that exclusively controls the audio
> hardware on devices that use Qualcomm firmware.
>
> Add it along with the relevant audio services.
>
> Signed-off-by: Nikita Travkin <nikita@trvn.ru>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
