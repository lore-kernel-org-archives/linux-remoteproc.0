Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B5B5C433B4
	for <linux-remoteproc@archiver.kernel.org>; Sun, 18 Apr 2021 02:03:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 556CC6120C
	for <linux-remoteproc@archiver.kernel.org>; Sun, 18 Apr 2021 02:03:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237200AbhDRCDq (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 17 Apr 2021 22:03:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237205AbhDRCDo (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 17 Apr 2021 22:03:44 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CDD9C061760
        for <linux-remoteproc@vger.kernel.org>; Sat, 17 Apr 2021 19:03:17 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id b8-20020a17090a5508b029014d0fbe9b64so18426996pji.5
        for <linux-remoteproc@vger.kernel.org>; Sat, 17 Apr 2021 19:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=f1vUS3Ze5rMYzhNmACo58zrebNguGquHyqBrPheUTBg=;
        b=VBWYmT8yvYUBS1tAUJPSf0RlTkrLPAHztDZl3/w6fFWXOag1I5um3pUtJWzqB2t7v/
         Eqoblslde/SkHUYf87Gmca5fUPfDdI8FzhIAxoQgGn8G2rWzTRkqQZiZxBFukRPlAdRa
         zWN0gKf4iYWjil27m3/XOVxDMNwCoY9YtbBgg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=f1vUS3Ze5rMYzhNmACo58zrebNguGquHyqBrPheUTBg=;
        b=G/NIYLu7dKEN/fPimEiyYGh3B3NqoIe2yrj7Z7olIgTLeyEf2zWGKwsCOJj//alySr
         VTS5OoemfDRGskwUoElZLFNTI5snOUBUhdSUz2+ueFaKNJLMd96nf2zBS9Ao5hSvyzqt
         65cBKGPQhy/3uMUeuC/mWMaou1j3RbzrXAXnLmqx59dgVbNWEL4wg4sARmCsElHV8HZr
         fcrhodeJ+zAeF8fG7REnNmF1ksTtMCmSCSTXqBZMh5H0Bb6n5xyhzFri3rWlDNWkYtHf
         FJVvmy+ZFv9fiiI7SYkyCgC0VVSaXUUsX/Q51YnwA0IS/POnHGW1ztSkLQC1HlnZxypR
         FuRw==
X-Gm-Message-State: AOAM530IKITMyNzEcccXxE5JxwG+FBfeu3oQdqYuh/bmyIvrYxzNu3Xi
        W/sX3PTT0qLogeAld3W5WI9a9Q==
X-Google-Smtp-Source: ABdhPJw0TP+s+3N7xH1vp/d/mCzedautJESNhv7jJC/R0yjGnT6rJ77fGt1EMUPwWSZjbZhD6rfleQ==
X-Received: by 2002:a17:90b:ed8:: with SMTP id gz24mr16894325pjb.98.1618711397068;
        Sat, 17 Apr 2021 19:03:17 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:e47c:5232:82d9:6d3f])
        by smtp.gmail.com with ESMTPSA id t23sm9783227pju.15.2021.04.17.19.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 19:03:16 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1618574638-5117-11-git-send-email-sibis@codeaurora.org>
References: <1618574638-5117-1-git-send-email-sibis@codeaurora.org> <1618574638-5117-11-git-send-email-sibis@codeaurora.org>
Subject: Re: [PATCH 10/12] arm64: dts: qcom: sm8250: Use QMP binding to control load state
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     rjw@rjwysocki.net, agross@kernel.org, ohad@wizery.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, rishabhb@codeaurora.org,
        sidgup@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, robh+dt@kernel.org,
        ulf.hansson@linaro.org
Date:   Sat, 17 Apr 2021 19:03:15 -0700
Message-ID: <161871139524.46595.11454827955816557316@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Quoting Sibi Sankar (2021-04-16 05:03:56)
> Use the Qualcomm Mailbox Protocol (QMP) binding to control the load
> state resources on SM8250 SoCs and drop deprecated power-domains exposed
> by AOSS QMP node.
>=20
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
