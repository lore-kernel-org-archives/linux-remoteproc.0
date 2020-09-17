Return-Path: <SRS0=Or6o=C2=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 672FFC43464
	for <linux-remoteproc@archiver.kernel.org>; Thu, 17 Sep 2020 20:24:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 29D20206B7
	for <linux-remoteproc@archiver.kernel.org>; Thu, 17 Sep 2020 20:24:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VcFgg1EZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726445AbgIQUYE (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 17 Sep 2020 16:24:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726333AbgIQUYE (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 17 Sep 2020 16:24:04 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E31DC06174A
        for <linux-remoteproc@vger.kernel.org>; Thu, 17 Sep 2020 13:24:04 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id w7so1945215pfi.4
        for <linux-remoteproc@vger.kernel.org>; Thu, 17 Sep 2020 13:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=Y15QcIETYm6ngkpuByc2eOU1bHtS654RIW5hdF3Ee/Q=;
        b=VcFgg1EZvwsjCDOmhPiRhbVaiHwozPO7Kc9+hfI+MexSyGltOo3YIrHOozSeuPvW/O
         zjljE49v1xgevlIC0ZKE5gK43cXgqO0dWpNPBZxSq4xSvte0hBDZfwpMLV8/SRsWN7RG
         Noe3lWZLFjFAt5lC6J40ZJ+LVN717zPgdZ3iw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=Y15QcIETYm6ngkpuByc2eOU1bHtS654RIW5hdF3Ee/Q=;
        b=eDKiw5f1xT9LoCz0/G4ciWzTB5+Sm5b0qEKQ9k5yZsVnhEK1Zl/4ObD0u1PFDSXH7B
         rxlEdvocG/IyNgQxGtQAQw/1z/F2ummmrH23NQyQ/zaeDRIoYmkcsmhRtVGVrHn1AEBr
         rMF4uZqg8j6hSdi+hUyCawsCgz3x851bHqLBqPCz9YP3S3WZLcLvtkeQC+Td+vADU66q
         0/rDXY5LrazmddZkidc75lu0rhiWPsGiGsgEmw+zk2S3ZzlmaSJ40b3uD97phE1mZdkr
         pivFg/QXBbHEtL/GaRXA812wHncIfWIZ6dUu3Bm9b6rqWPW+pzN7k+BxSKJAWEozFrb5
         8A4g==
X-Gm-Message-State: AOAM530CMf1oQ2V1rpa1JXIf/ay8A5+sbOM5iARz6QC9txSS+an4X/E0
        9e8ejwKaK5UJdxiWZTZ6JiCjfg==
X-Google-Smtp-Source: ABdhPJymERk4+ShGKnpMeflbqL0wLv3UlHTFXqoq2y2SDZrXW5p/p0MvIYpcAYQWyfHadZWDgnickg==
X-Received: by 2002:a62:3802:0:b029:142:2501:397e with SMTP id f2-20020a6238020000b02901422501397emr12386540pfa.67.1600374244006;
        Thu, 17 Sep 2020 13:24:04 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id 63sm483468pfw.42.2020.09.17.13.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 13:24:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200917175840.18708-1-sibis@codeaurora.org>
References: <20200917175840.18708-1-sibis@codeaurora.org>
Subject: Re: [PATCH v3] remoteproc: qcom_q6v5: Assign mpss region to Q6 before MBA boot
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        ohad@wizery.com, evgreen@chromium.org,
        Sibi Sankar <sibis@codeaurora.org>
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org
Date:   Thu, 17 Sep 2020 13:24:02 -0700
Message-ID: <160037424219.4188128.6572428223281418741@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Quoting Sibi Sankar (2020-09-17 10:58:40)
> On secure devices which support warm reset, the MBA firmware requires
> access to the modem region to clear them out. Hence provide Q6 access
> to this region before MBA boot. This will be a nop during a modem SSR.
>=20
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
