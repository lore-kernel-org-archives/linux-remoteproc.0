Return-Path: <SRS0=aZ5K=6N=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D680C83000
	for <linux-remoteproc@archiver.kernel.org>; Wed, 29 Apr 2020 17:25:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 02FA420B1F
	for <linux-remoteproc@archiver.kernel.org>; Wed, 29 Apr 2020 17:25:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="f/x12QLK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbgD2RZ4 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 29 Apr 2020 13:25:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726511AbgD2RZ4 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 29 Apr 2020 13:25:56 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C061C03C1AE
        for <linux-remoteproc@vger.kernel.org>; Wed, 29 Apr 2020 10:25:56 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id a21so3466634ljb.9
        for <linux-remoteproc@vger.kernel.org>; Wed, 29 Apr 2020 10:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aNxv6rQtebyNNMCF9fwKOf5NaXPv9WQ951LjP87jpV4=;
        b=f/x12QLKwjCA9Qqv2F6euWmFVtbkLRcbzdbfbb58NNpcby04ma9Im4Lz9zVf1t1Vzo
         FMCzTZ/0VZ1wqGyJ0saZCALw7AgylQXjKDGVrEToO5XadquQd4O1kTpnFkEE/f5WPPof
         IOukIKVPV25IHATOAAYECOOhpgj+pKHmFKSO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aNxv6rQtebyNNMCF9fwKOf5NaXPv9WQ951LjP87jpV4=;
        b=NJCePzHWX3/whidq1tI4T2GIdnwvi5GtkWhfOjAUTy5iU1linE3yRpjqrdmRfuc96r
         tjSv5Xg7ZxGCWNHBTFbRLeebu8K2Dki1v+WLhPbMVuW/+/nbtCDnoeLlOcAwrQ8rR7Ma
         CuQsEMZzpOMotH5q8pN/NAM1/KIBrlv6UyDG8BuU4JJQifU8fSgTBrfWGXNwHgqkl8dY
         ymnS+m9bcYUUJ4lXgQX+3yx5POsCB1npkXUBo/xCdyZpb0avufaUMt47wMaECzuGXGRp
         1c1ux7duAmGpvkHEuckKi10g4FNb8OGalazmZLuCEY/8QpYV/AUm6nGySZ5LWS2c17F9
         4CyQ==
X-Gm-Message-State: AGi0PualPvt9AsWwHDdRXleh059cfnH4Vi4nvgyASAII+xRK48pRfGx0
        tkUSsfkI1p0oqdY/c/z46eGdllNgHVs=
X-Google-Smtp-Source: APiQypIdWXP0OLqaFtxhb1emm8VZCdUTWyogIYdrG/oMLsoX/zB2I8EqmdV8tuvngvU7gHLd1Rl9aw==
X-Received: by 2002:a2e:731a:: with SMTP id o26mr22027134ljc.189.1588181154129;
        Wed, 29 Apr 2020 10:25:54 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id 6sm2992794lfy.97.2020.04.29.10.25.53
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2020 10:25:53 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id d25so2353298lfi.11
        for <linux-remoteproc@vger.kernel.org>; Wed, 29 Apr 2020 10:25:53 -0700 (PDT)
X-Received: by 2002:a19:7909:: with SMTP id u9mr7487789lfc.130.1588181152446;
 Wed, 29 Apr 2020 10:25:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200421143228.8981-1-sibis@codeaurora.org>
In-Reply-To: <20200421143228.8981-1-sibis@codeaurora.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Wed, 29 Apr 2020 10:25:15 -0700
X-Gmail-Original-Message-ID: <CAE=gft6BmZ2UNyrgs_c_O56rjvyA7D4w+T59Ze7q0ythD66eRw@mail.gmail.com>
Message-ID: <CAE=gft6BmZ2UNyrgs_c_O56rjvyA7D4w+T59Ze7q0ythD66eRw@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] Add PAS and MSA based Modem support
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-remoteproc@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        Ohad Ben Cohen <ohad@wizery.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Apr 21, 2020 at 7:32 AM Sibi Sankar <sibis@codeaurora.org> wrote:
>
> Add PAS based modem support on SC7180 SoCs and update the device node to
> support MSA based modem boot.
>
> V2:
>  * use memory-region to reference mba/mpss regions [Bjorn]
>  * move peripheral memory regions to the board dts [Bjorn]
>  * overload the base remoteproc_mpss node wherever possible [Bjorn]
>  * Pick up Bjorn's R-b
>
> Patch [1,2] - Add PAS based modem support
> Patch [3,4] - use memory-region to reference mba/mpss regions
> Patch [5] - Update reserved memory map
> Patch [6,7] - Add PAS/MSA modem nodes
>
> Sibi Sankar (7):
>   dt-bindings: remoteproc: qcom: Add SC7180 MPSS support
>   remoteproc: qcom: pas: Add SC7180 Modem support
>   dt-bindings: remoteproc: qcom: Use memory-region to reference memory
>   remoteproc: qcom_q6v5_mss: Extract mba/mpss from memory-region
>   arm64: dts: qcom: sc7180: Update reserved memory map
>   arm64: dts: qcom: sc7180: Add Q6V5 MSS node
>   arm64: dts: qcom: sc7180: Update Q6V5 MSS node

Tested-by: Evan Green <evgreen@chromium.org>
