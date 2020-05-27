Return-Path: <SRS0=yUw9=7J=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8A39C433E1
	for <linux-remoteproc@archiver.kernel.org>; Wed, 27 May 2020 06:31:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BED2A20C56
	for <linux-remoteproc@archiver.kernel.org>; Wed, 27 May 2020 06:31:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mgStlcTQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728483AbgE0GbN (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 27 May 2020 02:31:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728553AbgE0GbM (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 27 May 2020 02:31:12 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A66DC03E96F
        for <linux-remoteproc@vger.kernel.org>; Tue, 26 May 2020 23:31:11 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id ci21so1118832pjb.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 26 May 2020 23:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=GAeIH2kkVlgfDKNDvExkjEUjr7t+dLIV143r/wZ4ZCs=;
        b=mgStlcTQb+C7oOeBQLtpopl4rDpEglFL8WNYy4ZKxaew9vLvMRyQeiWwvv4K6diVMw
         RmJUO9lnsqfQiXz3gPyvtp11yp6ZgilsacHzxopa/QpbhHUWQ54qx+inj9qISvcrMqxl
         wQCfE4E5kBgBRyzkVnnyXcZ+QUuerB0c1M7WY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=GAeIH2kkVlgfDKNDvExkjEUjr7t+dLIV143r/wZ4ZCs=;
        b=Z9ZFxxioYEajBMqFZqVFgMdo8e3cA2MR/luurZbGUoCD0VjdAaQ6m0jF3rqTpBX+wb
         Ao1exSJLWx8gbrz3kNtSXSEhVe0AR5boqSOajSL7vhD77i/JuMYjAqfyJT3rDuCergUF
         XOhKv8FYpzq2blrdYraXr+NkqUMGYpIEugSbUFodr3o2mJZc+PGYMcSwT0wpphsYrnEA
         IAeILfC0LaNc5TbGUK0THHJdcDEwhQzxzIedzlOqWU2GXya2kERgLTvuFDby7IrMCod4
         JzIK9k+tkDXWjj5Oj58fZTBBlD0Hs17qP3cpi/EH0IaIDl/TyptN/8OM58MVMoKvagBj
         2r1A==
X-Gm-Message-State: AOAM531VLfhBnlr2RVRt/ITOpz6KaPmzlXiqBQJ/6OgwT8H+URN+nJ2/
        zczNqiwlBfTLcRuFJA61iPL5J5h7Lrs=
X-Google-Smtp-Source: ABdhPJworKi8wu5+vZmXaxlggXWpRcMSuQ5Qj06+Hg0Li/MDDPoRyyIhDaY2PmECBWrcKK3Cd2MvYQ==
X-Received: by 2002:a17:90a:23e7:: with SMTP id g94mr3424943pje.210.1590561070701;
        Tue, 26 May 2020 23:31:10 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id a7sm1193700pfa.187.2020.05.26.23.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 23:31:10 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200527054850.2067032-4-bjorn.andersson@linaro.org>
References: <20200527054850.2067032-1-bjorn.andersson@linaro.org> <20200527054850.2067032-4-bjorn.andersson@linaro.org>
Subject: Re: [PATCH v6 3/5] remoteproc: qcom: Update PIL relocation info on load
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
Date:   Tue, 26 May 2020 23:31:09 -0700
Message-ID: <159056106910.88029.925874171202462275@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Quoting Bjorn Andersson (2020-05-26 22:48:47)
> Update the PIL relocation information in IMEM with information about
> where the firmware for various remoteprocs are loaded.
>=20
> Reviewed-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
